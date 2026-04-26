---
name: apiiro-diff-scan
description: |
  Apiiro CLI command for comparing two git references for security risks — the primary CI/CD integration point. Use this skill whenever the user mentions diff scanning, comparing branches or commits for security issues, CI/CD security gates, blocking PRs on risk, or wants to wire Apiiro into a build pipeline. Even if the user doesn't say "apiiro", trigger when they say things like "scan this PR", "compare main to my branch for security", "block merges on critical risks", or want to set up security gating in CI. For local secrets/OSS scanning, use apiiro-fast-scan instead.
---

# Apiiro Diff Scan

Compare two git references for security risks via the Apiiro CLI. Primary CI/CD integration point.

## Commands

```bash
apiiro diff-scan -b main -c feature-branch -r https://github.com/org/repo --wait
apiiro diff-scan -b main -c feature-branch -r https://github.com/org/repo --wait --wait-external
apiiro diff-scan -b abc123 -c def456 -r <repo-url> --baseline-type Commit --candidate-type Commit --wait
apiiro diff-scan -s <scan-id>                     # Check existing scan status
apiiro diff-scan -i                               # Interactive mode
```

Exit codes: 0 = success/warn, 1 = blocked/failed, 2 = scan still pending.

## Global Options

`-o, --output <json|text>`, `-f, --file <path>`, `--no-color`.
