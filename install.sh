#!/usr/bin/env bash
# One-line install:
#   curl -fsSL https://farishan.github.io/query/install.sh | bash
set -euo pipefail

BASE="${BASE:-https://farishan.github.io/query}"
BIN_DIR="${BIN_DIR:-$HOME/.local/bin}"

mkdir -p "$BIN_DIR"

echo "Installing 'query' to $BIN_DIR ..."
curl -fsSL "$BASE/query" -o "$BIN_DIR/query"
chmod +x "$BIN_DIR/query"

# Ensure on PATH hint
case ":$PATH:" in
  *":$BIN_DIR:"*) ;;
  *) echo "NOTE: add $BIN_DIR to your PATH (e.g. export PATH=\"$BIN_DIR:\$PATH\")" ;;
esac

# Scaffold in current dir if requested or if no queries/ present
if [ "${1:-}" = "--init" ] || [ ! -d "./queries" ]; then
  echo "Scaffolding queries/ + Queryfile in $(pwd) ..."
  "$BIN_DIR/query" init .
fi

echo "Done. Try: query list"