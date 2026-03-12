---
name: apiiro-risks
description: |
  Apiiro CLI commands for risk management and remediation: list, inspect, and remediate known risks in a repository. Use this skill whenever the user asks about security risks, vulnerabilities, findings, or risk remediation in their repository. Also trigger when they want to list, filter, or investigate risks by category or severity, or need guidance on fixing a specific security finding. Even without mentioning "apiiro", trigger when the user wants a risk report, asks "what risks does this repo have", or wants to remediate a security issue.
---

# Apiiro Risks

Risk management via the Apiiro CLI. Authenticate first with `apiiro login` or set `API_KEY` env var.

## List Risks

Repository is auto-detected from git when `--repo` is omitted.

```bash
apiiro risks                                      # List risks (auto-detect repo)
apiiro risks --repo my-repo-name                  # Specify repo explicitly
apiiro risks --risk-level Critical                # Filter by level
apiiro risks --risk-category "API Security"       # Filter by category
apiiro risks --risk-level High --finding-category "Secret Detection"
apiiro risks -o json --page-size 50               # JSON with pagination
```

Filters: `--risk-level`, `--risk-category`, `--risk-insight`, `--finding-category`, `--application-id`.

## Get Risk Details

```bash
apiiro risks get <risk-id>
apiiro risks get <risk-id> -o json
```

## Remediate a Risk

Try static remediation first. If not available, fall back to Guardian.

```bash
# Step 1: Get structured remediation prompt
apiiro risks remediate <risk-id>

# Step 2: If is_prompt is false (no automated fix), ask Guardian
apiiro guardian query "how do I remediate risk <risk-id>?" --timeout 120
```

When using `-o json`, check the `is_prompt` field: `true` means an actionable prompt was returned, `false` means automated remediation is not available for that risk category.

## Global Options

`-o, --output <json|text>`, `-f, --file <path>`, `--no-color`.
