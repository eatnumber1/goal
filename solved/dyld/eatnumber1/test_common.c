#include "glib_include.h"

#include "goal_test.h"
#include "write_test.h"

int main( int argc, char *argv[] ) {
	g_test_init(&argc, &argv, NULL);
	goal_test_register();
	write_test_register();
	g_test_run();
}
