#!/usr/bin/env bash
# curl -fsSL https://agentmuster.io/install.sh | bash
# Runs the installer kept in the Muster repository: https://github.com/agentmuster/muster/blob/main/install.sh
main() {
  set -euo pipefail
  local script
  script="$(mktemp -t muster-install.XXXXXX)"
  trap 'rm -f "$script"' EXIT
  curl -fsSL "https://raw.githubusercontent.com/agentmuster/muster/${MUSTER_REF:-main}/install.sh" -o "$script"
  bash "$script" "$@"
}

main "$@"
