#include <stdlib.h>
#include <stddef.h>
#include <stdarg.h>
#include <string.h>
#include <stdio.h>

#define g(...) "g", h,##__VA_ARGS__
#define h(...) "o", i,##__VA_ARGS__
#define i(...) "o", h,##__VA_ARGS__

static const char * const i = "";
static const char * const h = "";

char *vstrdups(va_list ap) {
	va_list ap2;
	va_copy(ap2, ap);

	// Calculate the the string's lengths and the number of strings.
	const char *str;
	size_t len = 0;
	size_t count = 0;
	do {
		str = va_arg(ap, const char *);
		if (str != NULL) {
			len += strlen(str);
			count++;
		}
	} while (str != NULL);

	// Put the strings together
	char *out_str_head = calloc(len + 1, sizeof(char));
	char *out_str = out_str_head;
	for (size_t i = 0; i < count; i++) {
		str = va_arg(ap2, const char *);
		out_str = stpcpy(out_str, str);
	}

	va_end(ap2);
	return out_str_head;
}

char *strdups(void *placeholder, ...) {
	va_list ap;
	va_start(ap, placeholder);
	char *ret = vstrdups(ap);
	va_end(ap);
	return ret;
}

int main() {
	char *s = strdups(NULL, g()()()()()()("al"), NULL);
	printf("%s\n", s);
	free(s);
}
