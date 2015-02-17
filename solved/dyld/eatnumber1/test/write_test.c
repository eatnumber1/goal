#include <unistd.h>
#include <stdio.h>
#include <stdbool.h>
#include <stdlib.h>
#include <string.h>

#include "glib_include.h"

#include "write_test.h"

static void start_subproc() {
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wunknown-pragmas"
#pragma clang diagnostic ignored "-Wassign-enum"
	g_test_trap_subprocess(NULL, 0, 0);
#pragma clang diagnostic pop
}

static void write_str(const char *str) {
	size_t len = strlen(str);
	ssize_t written = write(STDOUT_FILENO, str, len);
	if (written == -1) {
		perror("write");
		exit(EXIT_FAILURE);
	}
	g_assert_cmpuint((size_t) written, ==, len);
}

static void without_goal(void) {
	if (g_test_subprocess()) {
		write_str("hello");
		return;
	}

	start_subproc();
	g_test_trap_assert_passed();
	g_test_trap_assert_stdout("hello");
}

static void single_goal(void) {
	if (g_test_subprocess()) {
		write_str("g()('al')");
		return;
	}

	start_subproc();
	g_test_trap_assert_passed();
	g_test_trap_assert_stdout("goal");
}

void write_test_register() {
	g_test_add_func("/write/without_goal", without_goal);
	g_test_add_func("/write/single_goal", single_goal);
}
