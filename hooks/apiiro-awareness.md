# Apiiro Secure Prompt Hook

Every prompt you submit is sent to Apiiro to add security context if relevant before reaching the model.

## What this means
- Prompts are forwarded to Apiiro's API to enrich them with relevant security context if relevant
- The prompt then continues to the model unmodified
- The hook only blocks in infrastructure error cases: CLI not installed, not authenticated, or wrong CLI version

## Hook commands

**Claude Code:**
```bash
apiiro hooks claude status      # Check hook status and integrity
apiiro hooks claude install     # Install or update the hook
apiiro hooks claude uninstall   # Remove the hook
```

**Cursor:**
```bash
apiiro hooks cursor status      # Check hook status and integrity
apiiro hooks cursor install     # Install or update the hook
apiiro hooks cursor uninstall   # Remove the hook
```

## If a user is blocked
It's an infrastructure issue, not prompt content. Direct them to:
- Not installed: `brew tap apiiro/tap && brew install apiiro`
- Not authenticated: `apiiro login`
