CPP_STANDARD = c++11

.PHONY: compile
compile:
	@echo "Compiling via g++..."
	g++ --std=$(CPP_STANDARD) src/main.cpp -o bin/hello-world

.PHONY: run
run:
	bin/hello-world

.PHONY: tidy
tidy:
	clang-tidy src/** -checks=cppcoreguidelines -header-filter=.*

all: tidy compile