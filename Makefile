##
## EPITECH PROJECT, 2025
## Rush1
## File description:
## Makefile
##

NAME = pushswap_checker

BUILD_FOLDER = ./dist-newstyle/build/x86_64-linux/ghc-9.6.6/*
CABAL_LOCAL = "ignore-project: False\ncoverage: True\nlibrary-coverage: True"

all: $(NAME)

$(NAME):
	cabal build
	@ cp "$(BUILD_FOLDER)/x/$(NAME)/build/$(NAME)/$(NAME)" .

clean:
	@ cabal clean
	@ rm -f cabal.project.local

fclean: clean
	@ rm -f $(NAME)

tests_run:
	@ echo -e  $(CABAL_LOCAL) > cabal.project.local
	cabal test
	@ mkdir -p ./test/coverage
	@ cp $(BUILD_FOLDER)/t/$(NAME)-test/hpc/vanilla/tix/*.tix ./test/coverage/

re: fclean all

.PHONY: $(NAME) all clean fclean re tests_run
