#!/bin/bash
# apiiro-claude-hook
#
# Apiiro User Prompt Submit Hook for Claude Code
#

INPUT=$(cat)

if ! command -v apiiro &> /dev/null; then
  cat <<EOF
{
  "decision": "block",
  "reason": "Apiiro CLI not installed.\n\nStep 1: Install Apiiro CLI\n!brew tap apiiro/tap && brew install apiiro\n\nStep 2: Login to Apiiro\n!apiiro login\n(Browser will open — sign in with your Apiiro account)"
}
EOF
  exit 0
fi

echo "$INPUT" | apiiro hooks claude secure-prompt-check
