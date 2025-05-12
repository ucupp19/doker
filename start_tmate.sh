#!/bin/sh

# Start tmate in the background
tmate -S /tmp/tmate.sock new-session -d

# Wait for tmate to be ready
sleep 1

# Send prefix + % to split the window vertically
tmate -S /tmp/tmate.sock send-keys C-b %
tmate -S /tmp/tmate.sock send-keys Enter

# Attach to the tmate session in foreground
tmate -S /tmp/tmate.sock attach
