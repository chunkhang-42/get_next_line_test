DIR ?= ../get_next_line

OS := $(shell uname -s)

CC := cc
CFLAGS := -Wall -Wextra -Werror -g -I $(DIR)
ifdef BUFFER_SIZE
CFLAGS += -D BUFFER_SIZE=$(BUFFER_SIZE)
endif
ifeq ($(OS),Linux)
CFLAGS += -fsanitize=address -fsanitize=leak -fsanitize=undefined
endif

NAME := main.out
SRC := main.c $(DIR)/get_next_line.c $(DIR)/get_next_line_utils.c

.PHONY: all
all: $(NAME)

$(NAME): $(SRC)
	$(CC) $(CFLAGS) -o $@ $^

.PHONY: clean
clean:
	$(RM) $(NAME) $(DSYM)
ifeq ($(OS),Darwin)
	$(RM) -r $(NAME).dSYM
endif

.PHONY: re
re: clean all
