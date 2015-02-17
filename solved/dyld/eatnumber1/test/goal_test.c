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

static void partial1(void) {
	test_rewrite("g", "g");
}

static void partial2(void) {
	test_rewrite("g(", "g(");
}

static void partial3(void) {
	test_rewrite("g(", "g(");
}

static void partial4(void) {
	test_rewrite("g('", "g('");
}

static void partial5(void) {
	test_rewrite("g('a", "g('a");
}

static void partial6(void) {
	test_rewrite("g('al", "g('al");
}

static void partial7(void) {
	test_rewrite("g('al'", "g('al'");
}

static void partial8(void) {
	test_rewrite("g()", "g()");
}

static void partial9(void) {
	test_rewrite("g()(", "g()(");
}

static void partial10(void) {
	test_rewrite("g()('", "g()('");
}

static void partial11(void) {
	test_rewrite("g()('a", "g()('a");
}

static void partial12(void) {
	test_rewrite("g()('al", "g()('al");
}

static void partial13(void) {
	test_rewrite("g()('al'", "g()('al'");
}

static void partial_restart(void) {
	test_rewrite("g()()(g()('al')", "g()()(goal");
}

void goal_test_register(void) {
	g_test_add_func("/ragel/no_inner_oh", no_inner_oh);
	g_test_add_func("/ragel/one_inner_oh", one_inner_oh);
	g_test_add_func("/ragel/two_inner_ohs", two_inner_ohs);
	g_test_add_func("/ragel/prefix_garbage", prefix_garbage);
	g_test_add_func("/ragel/postfix_garbage", postfix_garbage);
	g_test_add_func("/ragel/surrounding_garbage", surrounding_garbage);
	g_test_add_func("/ragel/multiple_goals", multiple_goals);
	g_test_add_func("/ragel/multiple_goals_prefix_garbage", multiple_goals_prefix_garbage);
	g_test_add_func("/ragel/multiple_goals_prefix_postfix_garbage", multiple_goals_prefix_postfix_garbage);
	g_test_add_func("/ragel/multiple_goals_garbage", multiple_goals_garbage);
	g_test_add_func("/ragel/multiple_goals_inner_garbage", multiple_goals_inner_garbage);
	g_test_add_func("/ragel/multiple_goals_postfix_garbage", multiple_goals_postfix_garbage);
	g_test_add_func("/ragel/multiple_gs", multiple_gs);
	g_test_add_func("/ragel/partial1", partial1);
	g_test_add_func("/ragel/partial2", partial2);
	g_test_add_func("/ragel/partial3", partial3);
	g_test_add_func("/ragel/partial4", partial4);
	g_test_add_func("/ragel/partial5", partial5);
	g_test_add_func("/ragel/partial6", partial6);
	g_test_add_func("/ragel/partial7", partial7);
	g_test_add_func("/ragel/partial8", partial8);
	g_test_add_func("/ragel/partial9", partial9);
	g_test_add_func("/ragel/partial10", partial10);
	g_test_add_func("/ragel/partial11", partial11);
	g_test_add_func("/ragel/partial12", partial12);
	g_test_add_func("/ragel/partial13", partial13);
	g_test_add_func("/ragel/partial_restart", partial_restart);
}
