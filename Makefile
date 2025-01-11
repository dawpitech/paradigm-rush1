##
## EPITECH PROJECT, 2025
## Rush1
## File description:
## Makefile
##

NAME = pushswap_checker

BINARY_LOCATION = $(shell cabal list-bin pushswap_checker)
CABAL_LOCAL = "ignore-project: False\ncoverage: True\nlibrary-coverage: True"

all: $(NAME)

$(NAME):
	cabal build
	cp $(BINARY_LOCATION) .

clean:
	@ cabal clean
	@ rm -f cabal.project.local

fclean: clean
	@ rm -f $(NAME)

tests_run:
	@ echo -e  $(CABAL_LOCAL) > cabal.project.local
	cabal test
	@ mkdir -p ./test/coverage
	@ find . -type f -name "*.tix" -exec cp {} test/coverage \; 

re: fclean all

.PHONY: $(NAME) all clean fclean re tests_run
