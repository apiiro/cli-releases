#!/bin/bash
# apiiro-cursor-hook
#
# Apiiro Before Submit Prompt Hook for Cursor
#

INPUT=$(cat)

if ! command -v apiiro &> /dev/null; then
  cat <<'EOF'
{
  "continue": false,
  "user_message": "## Apiiro CLI Setup Required\n\n**Step 1:** Install Apiiro CLI\n```bash\nbrew tap apiiro/tap && brew install apiiro\n```\n\n**Step 2:** Login to Apiiro\n```bash\napiiro login\n```\nBrowser will open — sign in with your Apiiro account"
}
EOF
  exit 0
fi

echo "$INPUT" | apiiro hooks cursor secure-prompt-check
