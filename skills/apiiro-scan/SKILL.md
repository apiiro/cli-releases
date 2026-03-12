---
name: apiiro-scan
description: |
  Apiiro CLI commands for security scanning: fast-scan for secrets and OSS vulnerabilities, diff-scan for comparing git references in CI/CD, and pre-commit hooks. Use this skill whenever the user mentions scanning code, secrets detection, OSS vulnerabilities, pre-commit hooks, CI/CD security gates, diff scanning, or wants to check files for security issues before committing. Even if the user doesn't say "apiiro", trigger this skill when they want to scan for secrets, check dependencies for vulnerabilities, or integrate security scanning into their workflow.
---

# Apiiro Scan

Security scanning via the Apiiro CLI. Authenticate first with `apiiro login` or set `API_KEY` env var.

## Fast Scan

Quick local scan for secrets and OSS vulnerabilities. Requires a git repo with an `origin` remote. Auto-detects changed files when none specified.

```bash
apiiro fast-scan secrets                          # Scan for secrets
apiiro fast-scan secrets src/config.ts            # Scan specific files
apiiro fast-scan secrets --staged                 # Staged files only (pre-commit)
apiiro fast-scan oss package.json bun.lock        # OSS vulnerabilities
apiiro fast-scan all                              # Both concurrently
apiiro fast-scan config                           # Get scan configuration
```

Options: `--staged`, `--timeout <ms>` (default: 2000), `-o, --output <json|text>`, `-f, --file <path>`.

Exit codes: 0 = clean, 1 = high/critical risks found.

## Diff Scan

Compare two git references for security risks. Primary CI/CD integration point.

```bash
apiiro diff-scan -b main -c feature-branch -r https://github.com/org/repo --wait
apiiro diff-scan -b main -c feature-branch -r https://github.com/org/repo --wait --wait-external
apiiro diff-scan -b abc123 -c def456 -r <repo-url> --baseline-type Commit --candidate-type Commit --wait
apiiro diff-scan -s <scan-id>                     # Check existing scan status
apiiro diff-scan -i                               # Interactive mode
```

Exit codes: 0 = success/warn, 1 = blocked/failed, 2 = scan still pending.

## Pre-commit Hook

```bash
apiiro hooks pre-commit install                   # Install (scans all types)
apiiro hooks pre-commit install --scan-type secrets --force
apiiro hooks pre-commit status
apiiro hooks pre-commit uninstall
```

Skip temporarily with `git commit --no-verify`.

## Global Options

`-o, --output <json|text>`, `-f, --file <path>`, `--no-color`.
