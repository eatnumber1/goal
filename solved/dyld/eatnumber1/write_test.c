#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wunknown-pragmas"
#pragma clang diagnostic ignored "-Wunused-macros"
#define _GNU_SOURCE
#pragma clang diagnostic pop

#include <unistd.h>
#include <stdio.h>
#include <stdbool.h>
#include <stdlib.h>

#include "glib_include.h"

#include "write_test.h"

static void init_env(void) {
	const char *ld_preload_var_name = NULL;
	const char *lib_suffix = NULL;

#if defined(__APPLE__) && defined(__MACH__)
	g_setenv("DYLD_FORCE_FLAT_NAMESPACE", "1", TRUE);
	ld_preload_var_name = "DYLD_INSERT_LIBRARIES";
	lib_suffix = "dylib";
#else
	ld_preload_var_name = "LD_PRELOAD";
	lib_suffix = "so";
#endif

	char *lib_path = NULL;
	asprintf(&lib_path, "%s/goal.%s", getcwd(NULL, 0), lib_suffix);
	g_setenv(ld_preload_var_name, lib_path, TRUE);
	free(lib_path);
}

static bool start_subprocess_with_env(const char *path) {
	if (g_test_subprocess()) {
		init_env();
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wunknown-pragmas"
#pragma clang diagnostic ignored "-Wassign-enum"
		GTestSubprocessFlags flags =
			G_TEST_SUBPROCESS_INHERIT_STDIN |
			G_TEST_SUBPROCESS_INHERIT_STDOUT |
			G_TEST_SUBPROCESS_INHERIT_STDERR;
#pragma clang diagnostic pop
		g_test_trap_subprocess(path, 0, flags);
		g_assert(g_test_trap_has_passed());
		return true;
	}

#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wunknown-pragmas"
#pragma clang diagnostic ignored "-Wassign-enum"
	g_test_trap_subprocess(path, 0, 0);
#pragma clang diagnostic pop

	return false;
}

static void without_goal_subproc(void) {
	printf("hello");
}

static void without_goal(void) {
	if (start_subprocess_with_env("/dyld/write/without_goal/subprocess")) return;
	g_test_trap_assert_passed();
	g_test_trap_assert_stdout("hello");
}

static void single_goal_subproc(void) {
	printf("g()('al')");
}

static void single_goal(void) {
	if (start_subprocess_with_env("/dyld/write/single_goal/subprocess")) return;
	g_test_trap_assert_passed();
	g_test_trap_assert_stdout("g()('al')");
}

void write_test_register() {
	g_test_add_func("/dyld/write/without_goal", without_goal);
	g_test_add_func("/dyld/write/without_goal/subprocess", without_goal_subproc);
	g_test_add_func("/dyld/write/single_goal", single_goal);
	g_test_add_func("/dyld/write/single_goal/subprocess", single_goal_subproc);
}
