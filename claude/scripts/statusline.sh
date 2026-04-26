#!/usr/bin/env bash
# Claude Code status line — shows a shield while an Apiiro Guardian hook has
# touched ~/.apiiro/sessions/<session_id> within the last MAX_AGE seconds.

input=$(cat)
SESSION_ID=$(printf '%s' "$input" | jq -r '.session_id // empty' 2>/dev/null)
SESSION_FILE="$HOME/.apiiro/sessions/$SESSION_ID"
MAX_AGE=600

if [ -n "$SESSION_ID" ] && [ -f "$SESSION_FILE" ]; then
  MTIME=$(stat -f %m "$SESSION_FILE" 2>/dev/null || stat -c %Y "$SESSION_FILE" 2>/dev/null || echo 0)
  if [ $(($(date +%s) - MTIME)) -lt $MAX_AGE ]; then
    echo "🛡️ Apiiro Guardian Activated"
  fi
fi
