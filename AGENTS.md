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
this repository follows. If one is empty, run `git submodule update --init`.
- Fix a provider bug here only as a provider change: in `scions/NAME`, `git switch -c fix-…`, edit, run the
  provider's own tests there, push the branch to the provider and open its pull request. This repository takes
  the fix with `nix run .#graft upgrade NAME` once it is released.
- Nix builds of this repository see a scion edit only while another tracked file here is modified, and only
  files that are `git add`-ed inside the scion. A scion checked out away from its gitlink (`git submodule
  status` shows `+`) changes what Nix builds the same way. Test a provider fix with the provider's own tests.
- `nix run .#graft check` fails while a scion has uncommitted edits, is away from its gitlink, or sits on an
  unreleased commit. Don't commit a moved scion unless it is at a release tag.

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
