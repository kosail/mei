# Episode 0 — Introduction to the Journey and Definition of the Project

## What is mei?

**mei** is an experimental programming language focused on simplicity, speed, and direct interaction with the operating system. The language is designed around a simple idea: the filesystem is one of the most important data structures in real programs. Instead of treating files as plain strings or paths, mei treats them as structured objects that can be queried, filtered, and transformed like the ol' SQL folk.

The project started as a personal learning exercise to understand how compilers, programming languages, and toolchains work from the ground up. The goal is not to compete with existing languages, but to explore language design and build a small, understandable system.

I aim to create something small, predictable, and easy to reason about (for my own mental health sake).

---

## Project Goals

The language is designed around a few clear goals.

### 1. Simplicity of the Language

The language specification should remain small, and the syntax should be easy to read and easy to parse. The language should be simple enough that a developer can reasonably understand most of the compiler and the language rules.

I avoided unnecessary complexity, large standard libraries, or complicated runtime systems. Not really because it was unnecessary, but because this is my first project of its kind and, to be honest, I doubt I could code complex runtime systems at this point of my life.

---

### 2. Native Compilation

mei compiles directly to native machine code.

```

source code → compiler → machine code

```

There is no virtual machine and no runtime interpreter. The result is a standalone binary that runs directly on the operating system.

The compiler targets:

- Linux
- Windows
> No Mac because I have no Mac. I have no idea how to interact with Darwin libraries or such.

**Each platform is compiled separately.**

---

### 3. Small Toolchain

The toolchain is intentionally minimal.

mei provides only:

- a **compiler**
- **file-based modules**

There is no build system, no package manager, and no external runtime.

Compilation should be a single command.

---

### 4. Bootstrappable Compiler

The compiler is built in stages.

**Stage 1**
- Implemented in the Zig programming language.

**Stage 2**
- Rewritten in mei itself.

This allows the language to eventually compile its own compiler.

---

### 5. Performance and Control

mei is designed to give programmers direct control over memory and execution.

Key decisions:

- **No garbage collector**
- **Manual memory management**
- **Arena allocators as the default allocation strategy**
- **Explicit lifetimes**

I assume that the programmers understand what they are doing (most of the time), so safety checks are minimal. So yeah, mei trust the programmer.

---

### 6. Files as First-Class Objects

One of the main design ideas of mei is filesystem-oriented programming.

Instead of manipulating paths as strings, mei provides structured operations on files and directories.

Example concept:

```

// check files inside my home directory and operate them

FS.home // Not sure about this
.files("document") // Get a list or stream of documents in this folder
.where(...) // Filter
.rename(...); // Operate


FS.home
.photos // I would like a pipe for common types like this, photos
.where(ext in ["jpg", "png"])
.delete();

```

Filesystem operations are intended to behave like pipelines composed of:

- selectors
- filters
- transformations
- aggregations
- side-effect operations

The goal is to make filesystem tasks clear and expressive while keeping the syntax simple.

---

### 7. Language Characteristics

Key characteristics of mei:

- **Functional-first style** but not strictly functional
- **Explicit static typing**
- **Minimal type inference**
- **UTF-8 immutable strings**
- **Single threaded by default**
- **OS threads when concurrency is needed** (maybe I would never need concurrency, but I doubt since FS operations are IO operations, so...)
- **File-based modules (one file = one module)**

The standard library is intentionally small and limited to:

- collections
- input/output
- filesystem utilities

---

### 8. Syntax Philosophy

The syntax tries to balance readability and simplicity.

General ideas:

- indentation-based structure
- expressions end with `;`
- minimal number of keywords
- small grammar

The goal is a language that can be learned quickly and used as a teaching tool, while still being capable of writing real programs.


---

KVantage Copyright © 2026, kosail <br/>
With love, from Honduras.