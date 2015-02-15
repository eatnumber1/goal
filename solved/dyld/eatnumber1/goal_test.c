#include <string.h>
#include <stdio.h>

#include "glib_include.h"

#include "goal.h"
#include "goal_test.h"

static void test_rewrite(const char *input, const char *expected) {
	size_t len = strlen(input);
	char buf[len + 1];
	memcpy(buf, input, len + 1);
	rewrite(buf, &len);
	g_assert_cmpuint(len, ==, strlen(expected));
	buf[len] = '\0';
	g_assert_cmpstr(buf, ==, expected);
}

static void no_inner_oh(void) {
	test_rewrite("g('al')", "gal");
}

static void one_inner_oh(void) {
	test_rewrite("g()('al')", "goal");
}

static void two_inner_ohs(void) {
	test_rewrite("g()()('al')", "gooal");
}

static void prefix_garbage(void) {
	test_rewrite("hellog()('al')", "hellogoal");
}

static void postfix_garbage(void) {
	test_rewrite("g()('al')hello", "goalhello");
}

static void surrounding_garbage(void) {
	test_rewrite("hellog()('al')hello", "hellogoalhello");
}

static void multiple_goals(void) {
	test_rewrite("g()('al')g()('al')", "goalgoal");
}

static void multiple_goals_prefix_garbage(void) {
	test_rewrite("hellog()('al')g()('al')", "hellogoalgoal");
}

static void multiple_goals_prefix_postfix_garbage(void) {
	test_rewrite("hellog()('al')g()('al')hello", "hellogoalgoalhello");
}

static void multiple_goals_garbage(void) {
	test_rewrite("hellog()('al')hellog()('al')hello", "hellogoalhellogoalhello");
}

static void multiple_goals_inner_garbage(void) {
	test_rewrite("g()('al')hellog()('al')", "goalhellogoal");
}

static void multiple_goals_postfix_garbage(void) {
	test_rewrite("g()('al')g()('al')hello", "goalgoalhello");
}

static void multiple_gs(void) {
	test_rewrite("gg()('al')gg", "ggoalgg");
}

void goal_test_register(void) {
	g_test_add_func("/dyld/ragel/no_inner_oh", no_inner_oh);
	g_test_add_func("/dyld/ragel/one_inner_oh", one_inner_oh);
	g_test_add_func("/dyld/ragel/two_inner_ohs", two_inner_ohs);
	g_test_add_func("/dyld/ragel/prefix_garbage", prefix_garbage);
	g_test_add_func("/dyld/ragel/postfix_garbage", postfix_garbage);
	g_test_add_func("/dyld/ragel/surrounding_garbage", surrounding_garbage);
	g_test_add_func("/dyld/ragel/multiple_goals", multiple_goals);
	g_test_add_func("/dyld/ragel/multiple_goals_prefix_garbage", multiple_goals_prefix_garbage);
	g_test_add_func("/dyld/ragel/multiple_goals_prefix_postfix_garbage", multiple_goals_prefix_postfix_garbage);
	g_test_add_func("/dyld/ragel/multiple_goals_garbage", multiple_goals_garbage);
	g_test_add_func("/dyld/ragel/multiple_goals_inner_garbage", multiple_goals_inner_garbage);
	g_test_add_func("/dyld/ragel/multiple_goals_postfix_garbage", multiple_goals_postfix_garbage);
	g_test_add_func("/dyld/ragel/multiple_gs", multiple_gs);
}
