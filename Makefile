CPP_STANDARD = c++11

# MacOS specific LLVM locations
export LDFLAGS="-L/opt/homebrew/opt/llvm/lib"
export CPPFLAGS="-I/opt/homebrew/opt/llvm/include"

.PHONY: compile
compile:
	@echo "Compiling via clang++..."
	@mkdir -p bin/
	clang++ --std=$(CPP_STANDARD) src/main.cpp -o bin/hello-world

.PHONY: run
run:
	@bin/hello-world

.PHONY: tidy
tidy:
	clang-tidy src/** -checks=cppcoreguidelines- -header-filter=.* --

all: tidy compile