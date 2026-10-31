# Agent Entrypoint - Living Specifications

You are working in the **living-specifications knowledge base** — a repository defining the methodology for spec-driven development.

## Before Making Changes

1. Read [knowledge-base.yaml](knowledge-base.yaml) for KB configuration
2. Follow [meta knowledge base conventions](https://github.com/danielnaab/meta-knowledge-base)
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

Follow the [agent workflow pattern](https://github.com/danielnaab/meta-knowledge-base/blob/main/docs/playbooks/agent-workflow.md):

1. **Plan**: State intent, files to touch, uncertainties
2. **Patch**: Make minimal changes to achieve goal
3. **Verify**: Run checks or specify what human should verify

## Write Boundaries

You may write to:
- `docs/**` — methodology documentation

Never write to (enforced for Claude Code by `.claude/settings.json`):
- `secrets/**`, `credentials/**` — sensitive paths

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
