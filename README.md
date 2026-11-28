# Living Specifications

Specification format, principles, and methodology for spec-driven development.

## What This Is

Living specifications are the source of truth for system behavior. They describe what a system does and why, sitting between intent and implementation.

```
SPEC (readable, durable, collaborative)
  ↓ maps to
TESTS (executable, durable, CI-enforced)
  ↓ verified by
CODE (implementation, durable, reviewed)
```

This repository defines **how to write and maintain specifications** for teams adopting spec-driven development.

## What This Standardizes

- **Format**: The specification template structure and frontmatter requirements
- **Principles**: Normative rules governing specification practices
- **Relationships**: How specs relate to tests, acceptance criteria, and code
- **Verification**: Drift detection approaches between specs and implementations
- **Comprehension**: Making the specification system legible to all collaborators

## Core Reference

- [Format](docs/format.md) — the specification template
- [Principles](docs/principles.md) — rules governing specification practices
- [Relationships](docs/relationships.md) — how specs relate to tests and code
- [Verification](docs/verification.md) — drift detection approaches
- [Comprehension](docs/comprehension.md) — making the system legible

## Guides

- [Writing specs](docs/guides/writing-specs.md) — how to write or update a specification
- [Ensemble with specs](docs/guides/ensemble-with-specs.md) — using specs in mob programming
- [Reviewing against specs](docs/guides/reviewing-against-specs.md) — reviewing PRs with specs as source of truth

## Patterns Borrowed

| Pattern | What We Took | What We Left |
|---------|-------------|--------------|
| ADRs | Context → Decision → Consequences; status lifecycle | Immutability (specs evolve) |
| RFCs | Propose → discuss → decide; Alternatives Considered | Heavyweight process |
| BDD/Gherkin | Given/When/Then as thinking structure | Step definitions; Cucumber |
| Google Design Docs | Non-goals; living document expectation | Google Docs (not version-controlled) |
| Executable Specs | Structured-enough-to-check assertions | Framework lock-in |
| Living Documentation | Specs for what code can't express; computed views | Assumption code is always readable |

Guiding principle: steal structures, not tooling.

## Using This in Your Repository

Take it as a pattern with [tuteur](https://github.com/danielnaab/tuteur) v0.3.0 or later: a git submodule of
this repository at a release tag, in your `.patterns/living-specifications/`, then link into it from your agent
instructions (`AGENTS.md` or `CLAUDE.md`):

```
nix run .#tuteur add https://github.com/danielnaab/living-specifications@v1.0.3
```

It ships no `pattern.nix`: you get the methodology (README, CHANGELOG and `docs/`) to read, with no tools or
checks in your flake.

Or link to it by URL (https://github.com/danielnaab/living-specifications/tree/v1.0.3/docs) with
nothing to pin. A pattern gives agents a local copy and an upgrade path; a link is enough for people.

## Architecture

```
living-specifications (this repo: spec-writing methodology)
        ↓ implemented by
knowledge-base-kit (enforcement tooling: its backlink scanner checks `# spec:` annotations)
        ↓
your-project (applies the methodology)
```

This repo owns the spec methodology (format, annotations, relationships). It is itself maintained as a
knowledge base following the conventions of [knowledge-base-kit](https://github.com/danielnaab/knowledge-base-kit)
(formerly meta-knowledge-base and knowledge-base-integrity), which it takes as a pattern in `.patterns/` for
its own upkeep only; the methodology doesn't depend on it. (A repository that takes this one as a pattern gets that submodule too, nested in
`.patterns/living-specifications/.patterns/`.)

## Sources

- ADR pattern: Michael Nygard, "Documenting Architecture Decisions" (2011)
- BDD: Dan North, "Introducing BDD" (2006)
- Living Documentation: Cyrille Martraire (2019)
- C4 Model: Simon Brown

## Navigation

- [Docs](docs/)
