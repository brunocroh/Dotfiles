#!/bin/bash

# Derive the current parent session name
CURRENT_SESSION=$(tmux display-message -p '#S')

# If we're already inside a floating popup session, detach to close it
if [[ "$CURRENT_SESSION" == floating-* ]]; then
    tmux detach-client
    exit 0
fi

# Build a popup session name scoped to the parent session
POPUP_NAME="floating-${CURRENT_SESSION}"

# Ensure the popup session exists (create it detached if needed)
if ! tmux has-session -t "$POPUP_NAME" 2>/dev/null; then
    tmux new-session -d -s "$POPUP_NAME"
fi

# Toggle the popup — if one is already open it closes it, otherwise opens it
tmux display-popup -h 80% -w 80% -E "tmux attach-session -t '$POPUP_NAME'"
