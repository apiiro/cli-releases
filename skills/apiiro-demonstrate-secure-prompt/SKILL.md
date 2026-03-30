---
name: apiiro-demonstrate-secure-prompt
description: |
  Generates 10 example secure-prompt invocations tailored to the user's current repository, runs them, and produces a before/after CSV showing the original prompt vs the security-enriched version. Analyzes the repo's tech stack, frameworks, API patterns, data models, and integrations, then produces realistic developer prompts that would trigger security classification — demonstrating how `apiiro guardian secure-prompt` adds value for that specific codebase. Use when the user wants to see what secure-prompt looks like in practice, wants to demo the feature, or needs onboarding examples for their team. Trigger on phrases like "show me secure-prompt examples", "generate example prompts for my repo", "demo secure-prompt", or "what prompts would trigger security guidance".
---

# Apiiro Secure Prompt Examples

Generates 10 realistic `apiiro guardian secure-prompt` example invocations tailored to the current repository, then runs them and produces a CSV showing the original prompt alongside the security-enriched output.

## What to do

1. **Analyze the repository** — explore the codebase to identify:
   - Language, frameworks, and runtime (e.g., TypeScript/Node, Python/Django, Go/Gin)
   - API patterns (REST, GraphQL, gRPC, WebSocket)
   - Authentication and authorization mechanisms
   - Database and data models
   - External service integrations (cloud providers, third-party APIs, SCM, messaging)
   - CI/CD and deployment configuration
   - File handling, crypto, or payment logic
   - Any domain-specific security surface (e.g., multi-tenant isolation, webhook processing)

2. **Generate 10 prompts** that meet ALL of these criteria:
   - **Realistic**: something a developer on this repo would actually type
   - **Specific**: references actual files, modules, patterns, or domain concepts from the repo
   - **Classifies as YES**: falls into one of these classifier categories — backend/API code, database operations, auth/secrets, user data, external integrations, CI/CD, file operations, crypto, network, input validation, or trust boundary changes
   - **Diverse**: cover at least 5 different classifier YES categories across the 10 prompts

3. **Present the examples** — for each, show:
   - The `apiiro guardian secure-prompt` command with the prompt
   - A one-line note on which security areas would be addressed
   - Only add `--file-path` when scoping to a specific file genuinely adds value — most prompts should work without it

   Example format:
   ```bash
   apiiro guardian secure-prompt "add a webhook endpoint that receives GitHub push events and triggers a pipeline rebuild"
   ```
   > Security areas: input validation, external service integration, webhook signature verification

4. **Ask the user if they'd like to run them.** When they confirm:

5. **Run all 10 commands** — execute them in parallel using `apiiro guardian secure-prompt`.

6. **Generate a CSV file** at `docs/secure-prompt-examples.csv` (or a path the user specifies) with these columns:
   - `prompt` — the original developer prompt text
   - `file_path` — the `--file-path` value, or `None` if not used
   - `before` — the original prompt (unchanged, as a baseline)
   - `after` — the enriched prompt returned by the API

   Use proper CSV quoting — double-quote fields that contain commas or quotes, and escape inner quotes by doubling them.

7. **Show a summary** of the results — highlight which examples got the most interesting enrichment and the security categories covered.

## Constraints

- Do NOT run the `apiiro` CLI until the user confirms they want to run the examples
- Do NOT fabricate file paths — only reference files/dirs that actually exist in the repo
- Keep prompts concise (1-2 sentences) like a developer would naturally type
- Each prompt should be a task to implement, not a question or review request (those would classify as NO)
