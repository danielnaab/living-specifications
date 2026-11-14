# Agent Entrypoint - Living Specifications

You are working in the **living-specifications knowledge base** — a repository defining the methodology for spec-driven development.

## Before Making Changes

1. Read [knowledge-base.yaml](knowledge-base.yaml) for KB configuration
2. Follow [meta knowledge base conventions](scions/meta-knowledge-base/README.md)
3. Understand key policies:
   - **Authority**: docs/ is canonical
   - **Provenance**: Ground methodology recommendations in sources
   - **Lifecycle**: Mark status (draft/working/stable/deprecated)
   - **Write boundaries**: see [`knowledge-base.yaml`](knowledge-base.yaml) `rules.writes`

## Your Role

As a knowledge curator for specification methodology:

- **Define format** — specification template structure and requirements
- **Articulate principles** — normative rules governing specs
- **Document relationships** — how specs connect to tests and code
- **Ground in evidence** — cite sources, experiences, references
- **Respect generality** — this methodology applies across many projects

## Content Organization

| Directory | Content Type |
|-----------|-------------|
| `docs/` | Core methodology (format, principles, relationships, verification) |
| `docs/guides/` | How-to procedures for spec authoring |

## Workflow: Plan → Patch → Verify

Follow the [agent workflow pattern](scions/meta-knowledge-base/docs/playbooks/agent-workflow.md):

1. **Plan**: State intent, files to touch, uncertainties
2. **Patch**: Make minimal changes to achieve goal
3. **Verify**: Run checks or specify what human should verify

## Write Boundaries

You may write to:
- `docs/**` — methodology documentation

Never write to (enforced for Claude Code by `.claude/settings.json`):
- `secrets/**`, `credentials/**` — sensitive paths

## Scions (graft)
`scions/` holds git submodules: other repositories at release tags. Read them; they are the rules and tools
this repository follows. If one is empty, run `git submodule update --init --recursive`.
- Ask before you edit a scion: an edit there is a change to another repository. Fix it in the provider: in
  `scions/NAME`, `git switch -c fix-…`, edit, run the provider's own tests there, push the branch to the
  provider and open its pull request. This repository takes the fix with `nix run .#graft upgrade NAME@TAG`
  once it is released.
- Commit or stash in a scion before you switch, pull or check out this repository's branches: a move of the
  scion's gitlink can move the scion under your edits.
- A Nix build of this repository uses a scion's uncommitted edits only while another tracked file here is
  modified, and never its new files. To build with them, run `nix run .#graft -- try NAME`, build with the
  command it prints, then `nix run .#graft -- try --stop`.
- `nix run .#graft check` fails while try is on, or while a scion has uncommitted edits, is away from its
  gitlink, or sits on an unreleased commit. Don't commit a moved scion unless it is at a release tag.

## Provenance Requirements

Always include **Sources** sections for:
- Format specifications (critical for adoption)
- Principle definitions
- Methodology recommendations

Format:
```markdown
## Sources
- [Source Title](URL or path) - Brief context
- Personal experience: [Project/Context] - What was learned
```

## Quick Reference

When updating this KB:
- **New format requirement?** Update docs/format.md
- **New principle?** Add to docs/principles.md with rationale
- **New guide?** Add to docs/guides/ with frontmatter
- **Clarifying relationships?** Update docs/relationships.md

---

**Remember**:
- Keep changes minimal and focused
- Ground all methodology recommendations in sources
- This repo is about *how to write specs*, not specific specs
- Evolve based on evidence from teams using the methodology
