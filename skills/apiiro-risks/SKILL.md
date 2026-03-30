---
name: apiiro-risks
description: |
  Apiiro CLI commands for viewing and inspecting risks in a repository: list, filter, and get details on known risks. Use this skill whenever the user asks about security risks, vulnerabilities, or findings in their repository. Also trigger when they want to list, filter, or investigate risks by category or severity. Even without mentioning "apiiro", trigger when the user asks things like "what risks does this repo have", "any vulnerabilities here?", "show me the security findings", or "what's the risk level of this project". For fixing or remediating risks, use the apiiro-fix skill instead.
---

# Apiiro Risks

View and inspect risks via the Apiiro CLI.

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

## Global Options

`-o, --output <json|text>`, `-f, --file <path>`, `--no-color`.
