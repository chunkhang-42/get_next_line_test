DIR ?= ../get_next_line

CC := cc
CFLAGS := -Wall -Wextra -Werror -fsanitize=address -fsanitize=undefined -g -I $(DIR) ${CFLAGS}

NAME := main.out
DSYM := $(NAME).dSYM
SRC := main.c $(DIR)/get_next_line.c $(DIR)/get_next_line_utils.c

.PHONY: all
all: $(NAME)

$(NAME): $(SRC)
	$(CC) $(CFLAGS) -o $@ $^

.PHONY: clean
clean:
	$(RM) -r $(NAME) $(DSYM)

.PHONY: re
re: clean all
