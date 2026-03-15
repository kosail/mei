![mei programming language](images/logo.webp)
---
> This is a quick README I wrote just to keep ideas fresh.

mei is a programming language where the filesystem is the primary data structure. By this I mean that it is a filesystem query language, like SQL but for directories. Programs writte in mei operate on files as structured objects rather than raw paths.

This is the example concept I would like to keep in mind:

```mei
files("photos/")
    .where(ext == "jpg")
    .rename("{year}-{month}-{hash}.jpg")
```

### Features that I thought to implement:
- built-in metadata extraction
- directory queries
- safe batch operations
- transactional file operations

### Basic progress tracker
- [X] Analysis and definition
    - [ ] Documentation about the project and a cute README
- [ ] Lexer
    - [ ] Tokens
    - [ ] Syntax
- [ ] Parser
    - [ ] AST
- [ ] Semantic analysys
- [ ] Code generation

---

#### I'm starting to learn Zig with this project, so expect several commits moving around and testing new things before this starts taking shape.


KVantage Copyright © 2026, kosail <br/>
With love, from Honduras.