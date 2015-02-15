CC := clang
RAGEL ?= ragel
DOT ?= dot

RAGEL_SRCS := goal.rl
C_SRCS := write.c
TEST_C_SRCS := goal_test.c write_test.c test_common.c

CPPFLAGS := -pedantic -std=c11 -Weverything -Werror -Wno-vla -fvisibility=hidden
CFLAGS := -fPIC
LDFLAGS :=
LIBS := -ldl

TEST_CPPFLAGS := $(shell pkg-config --cflags glib-2.0)
TEST_LIBS := $(shell pkg-config --libs glib-2.0)

OBJS := $(RAGEL_SRCS:.rl=.o) $(C_SRCS:.c=.o)
SVGS := $(RAGEL_SRCS:.rl=.svg)

TEST_OBJS := $(TEST_C_SRCS:.c=.o) $(OBJS)

UNAME_S := $(shell uname -s)
ifeq ($(UNAME_S),Darwin)
LIB_SUFFIX := dylib
else
LIB_SUFFIX := so
endif

GOAL_LIB := goal.$(LIB_SUFFIX)
TEST_EXE := goal_test.exe

.DEFAULT: all
.PHONY: all clean svg lib test

all: lib svg

svg: $(SVGS)

lib: $(GOAL_LIB)

clean:
	$(RM) $(SVGS) $(OBJS) $(GOAL_LIB) $(TEST_EXE) $(TEST_OBJS)

test: $(TEST_EXE)
	$(PWD)/$(TEST_EXE)

$(GOAL_LIB): $(OBJS)

$(GOAL_LIB): CPPFLAGS := $(CPPFLAGS)

$(TEST_EXE): $(TEST_OBJS) $(OBJS)

$(TEST_EXE): CPPFLAGS := $(CPPFLAGS) $(TEST_CPPFLAGS)
$(TEST_EXE): LIBS := $(LIBS) $(TEST_LIBS)

%.dot: %.rl
	$(RAGEL) -p -V -o $@ -n $<

%.svg: %.dot
	$(DOT) -Tsvg -o $@ $<

%.c: %.rl
	$(RAGEL) -o $@ -C -G2 $<

%.o: %.c
	$(CC) $(CPPFLAGS) $(CFLAGS) -c -o $@ $<

%.$(LIB_SUFFIX):
	$(CC) $(LDFLAGS) -shared $(CFLAGS) -o $@ $^ $(LIBS)

%.exe:
	$(CC) $(LDFLAGS) $(CFLAGS) -o $@ $^ $(LIBS)
