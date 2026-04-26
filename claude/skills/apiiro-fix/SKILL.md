---
name: apiiro-fix
description: |
  Apiiro CLI commands for remediating and fixing security risks: get remediation prompts and use Guardian AI to fix findings. Use this skill whenever the user wants to fix, remediate, patch, or resolve a security risk or vulnerability in their repository. Also trigger when they ask "how do I fix this risk", "remediate this finding", "resolve this vulnerability", or want actionable guidance on resolving a security issue. For listing or inspecting risks, use the apiiro-risks skill instead.
---

# Apiiro Fix

Remediate security risks via the Apiiro CLI. The workflow tries automated remediation first, then falls back to Guardian AI for guidance.

## Workflow

1. **Get the risk ID** — use `apiiro risks` or `apiiro risks get <id>` to identify the risk (see apiiro-risks skill).
2. **Try automated remediation** — run `apiiro risks remediate <risk-id>`.
   - If the response has `is_prompt: true`, the content is an actionable fix prompt — apply it directly.
   - If `is_prompt: false`, automated remediation isn't available for this risk category — proceed to step 3.
3. **Fall back to Guardian** — ask Guardian for advice:
   ```bash
   apiiro guardian query "how do I remediate risk <risk-id>?" --timeout 120
   ```
4. **Apply the fix** — use the returned prompt or Guardian's guidance to make code changes.

## Options

`-o, --output <json|text>`, `-f, --file <path>`, `--no-color`.
