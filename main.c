/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   main.c                                             :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: mamu <mamu@student.42singapore.sg>         +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2024/08/21 22:14:54 by mamu              #+#    #+#             */
/*   Updated: 2024/08/29 01:17:23 by mamu             ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "get_next_line.h"

#include <fcntl.h>
#include <stdio.h>
#include <stdlib.h>

int	main(int argc, char **argv)
{
	char		*line;
	int			fd;
	size_t		i;

	if (argc != 2)
		return (printf("usage: %s <file>\n", argv[0]));
	fd = open(argv[1], O_RDONLY);
	if (fd == -1)
		return (printf("cannot read file: %s\n", argv[1]));
	i = 1;
	while (1)
	{
		line = get_next_line(fd);
		if (line == NULL)
			break ;
		if (getenv("DEBUG"))
			printf("%3zu | %s", i, line);
		else
			printf("%s", line);
		free(line);
		i++;
	}
}
