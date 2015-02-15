#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wunused-macros"
#define _GNU_SOURCE
#pragma clang diagnostic pop

#include <unistd.h>
#include <dlfcn.h>
#include <string.h>
#include <stdio.h>
#include <stdarg.h>
#include <stdlib.h>

#include "goal.h"

typedef ssize_t (write_fn_t)(int, const void *, size_t);
static write_fn_t *real_write;

__attribute__((noreturn))
static void die(const char *fmt, ...) {
	va_list ap;
	va_start(ap, fmt);
	fprintf(stderr, "goal: ");
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wunknown-pragmas"
#pragma clang diagnostic ignored "-Wformat-nonliteral"
	vfprintf(stderr, fmt, ap);
#pragma clang diagnostic pop
	fprintf(stderr, "\n");
	va_end(ap);
	exit(EXIT_FAILURE);
}

__attribute__((constructor))
static void setup_real_write(void) {
	dlerror();
	real_write = (write_fn_t *) dlsym(RTLD_NEXT, "write");
	char *error = dlerror();
	if (error != NULL) die("%s", error);
}

__attribute__((visibility("default")))
ssize_t write(int fildes, const void *buf, size_t nbyte) {
	char newbuf[nbyte];
	memcpy(newbuf, buf, nbyte);
	size_t newnbyte = nbyte;
	rewrite(newbuf, &newnbyte);
	ssize_t written = real_write(fildes, newbuf, newnbyte);
	if (written == (ssize_t) newnbyte) {
		return (ssize_t) nbyte;
	} else if (written == -1) {
		return -1;
	}
	die("Partial write not supported\n");
}
