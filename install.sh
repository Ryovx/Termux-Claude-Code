#!/data/data/com.termux/files/usr/bin/bash
# ═══════════════════════════════════════════════════════════════════════════
#                                                                           #
#     ████████╗███████╗██████╗ ███╗   ███╗██╗   ██╗██╗  ██╗                 #
#     ╚══██╔══╝██╔════╝██╔══██╗████╗ ████║██║   ██║╚██╗██╔╝                 #
#        ██║   █████╗  ██████╔╝██╔████╔██║██║   ██║ ╚███╔╝                  #
#        ██║   ██╔══╝  ██╔══██╗██║╚██╔╝██║██║   ██║ ██╔██╗                  #
#        ██║   ███████╗██║  ██║██║ ╚═╝ ██║╚██████╔╝██╔╝ ██╗                 #
#        ╚═╝   ╚══════╝╚═╝  ╚═╝╚═╝     ╚═╝ ╚═════╝ ╚═╝  ╚═╝                 #
#                                                                           #
#     ██████╗██╗      █████╗ ██╗   ██╗██████╗ ███████╗                     #
#    ██╔════╝██║     ██╔══██╗██║   ██║██╔══██╗██╔════╝                     #
#    ██║     ██║     ███████║██║   ██║██║  ██║█████╗                       #
#    ██║     ██║     ██╔══██║██║   ██║██║  ██║██╔══╝                       #
#    ╚██████╗███████╗██║  ██║╚██████╔╝██████╔╝███████╗                     #
#     ╚═════╝╚══════╝╚═╝  ╚═╝ ╚═════╝ ╚═════╝ ╚══════╝                     #
#                                                                           #
#                   ██████╗ ██████╗ ██████╗ ███████╗                       #
#                  ██╔════╝██╔═══██╗██╔══██╗██╔════╝                       #
#                  ██║     ██║   ██║██║  ██║█████╗                         #
#                  ██║     ██║   ██║██║  ██║██╔══╝                         #
#                  ╚██████╗╚██████╔╝██████╔╝███████╗                       #
#                   ╚═════╝ ╚═════╝ ╚═════╝ ╚══════╝                       #
#                                                                           #
#                     T E R M U X   I N S T A L L E R                       #
#                                                                           #
# ═══════════════════════════════════════════════════════════════════════════
#
#   Termux Claude Code Installer Script
#   ─────────────────────────────────────────────────────────────────────
#   Developed & Maintained by / Ryovx
#   Version:      1.0.0
#   License:      GNU General Public License v3.0 or later
#   Source:       Real Claude Code linux-arm64-musl binary from Anthropic
#
# ═══════════════════════════════════════════════════════════════════════════
#
#   ╔═══════════════════════════════════════════════════════════════════╗
#   ║                                                                   ║
#   ║                    ▓▓▓  F R E E   S O F T W A R E  ▓▓▓            ║
#   ║                                                                   ║
#   ║   This script is provided FREE OF CHARGE to the Termux            ║
#   ║   community.                                                      ║
#   ║                                                                   ║
#   ║   ♥  The author kindly REQUESTS that you do NOT sell, resell,     ║
#   ║      or bundle this script with any paid product.                 ║
#   ║                                                                   ║
#   ║      This is an ETHICAL REQUEST, not a legal restriction.         ║
#   ║      Under GPLv3 you retain the full right to redistribute        ║
#   ║      this software, including commercially, provided you          ║
#   ║      comply with the license terms.                               ║
#   ║                                                                   ║
#   ║   ♥  The author kindly REQUESTS that you do NOT remove this       ║
#   ║      notice or the copyright header.                              ║
#   ║                                                                   ║
#   ║   ✔  You MAY use, study, modify, and redistribute this script     ║
#   ║      under the terms of the GNU General Public License v3.0.      ║
#   ║                                                                   ║
#   ║   ✔  We are proud members of the Open Innovation Network (OIN)    ║
#   ║      and believe in protecting open-source software from          ║
#   ║      patent aggression while keeping it free for everyone.        ║
#   ║                                                                   ║
#   ║   This software is provided "AS IS", without warranty of any      ║
#   ║   kind. The author is not liable for any damages arising from     ║
#   ║   its use.                                                        ║
#   ║                                                                   ║
#   ╚═══════════════════════════════════════════════════════════════════╝
#
# ═══════════════════════════════════════════════════════════════════════════
#
#   ONE COMMAND INSTALL
#   ─────────────────────────────────────────────────────────────────────
#   Users install with a single command:
#
#       curl -fsSL https://raw.githubusercontent.com/Ryovx/Termux-Claude-Code/main/install.sh | bash
#
#   UNINSTALL
#   ─────────────────────────────────────────────────────────────────────
#   After installation, the standalone command `claude-uninstall`
#   removes every artifact without needing this script again:
#
#       claude-uninstall
#
#   If you saved this script locally, you can also run:
#
#       bash install.sh --uninstall
#
# ═══════════════════════════════════════════════════════════════════════════
#
#   DESCRIPTION
#   ─────────────────────────────────────────────────────────────────────
#   A permanent, system-level installer that makes `claude` work
#   natively inside Termux without patchelf, proot, or chroot.
#
#   It combines:
#
#     • The official @anthropic-ai/claude-code-linux-arm64-musl ELF
#       binary, fetched directly from npm.
#
#     • Alpine's musl dynamic loader (ld-musl-aarch64.so.1) and its
#       bundled shared libraries, installed under
#       $PREFIX/lib/claude-musl/.
#
#     • A small launcher at $PREFIX/bin/claude that re-executes the
#       binary with the correct loader and with LD_PRELOAD unset.
#
#     • Three standalone helper scripts in $PREFIX/bin/:
#         claude-fix        restores the launcher from its template
#         claude-update     updates to the latest npm version
#         claude-uninstall  removes every installed artifact
#
#   IMPORTANT — this script does NOT modify ~/.bashrc or ~/.zshrc.
#   All helper commands live in $PREFIX/bin/ as real executables.
#
# ═══════════════════════════════════════════════════════════════════════════
#
#   WHY THIS APPROACH
#   ─────────────────────────────────────────────────────────────────────
#   Claude Code ships musl binaries for linux-arm64, but Termux uses
#   Bionic (Android libc), which is incompatible. Direct execution
#   fails with "cannot execute: required file not found" because
#   /lib/ld-musl-aarch64.so.1 does not exist.
#
#   Changing the ELF interpreter via patchelf was tried and results
#   in SIGSEGV on Android kernels. So this installer intentionally
#   uses no patchelf. Instead it supplies the missing loader and
#   preloads it explicitly via the launcher.
#
#   SKIP-IF-LATEST
#   ─────────────────────────────────────────────────────────────────────
#   When re-run, the installer compares the version in npm against
#   the version already installed. If they match, it SKIPS the 280MB
#   download and only re-verifies the launcher and helper scripts.
#   Use `--force` to force a full re-download.
#
# ═══════════════════════════════════════════════════════════════════════════
#
#   INSTALLED ARTIFACTS
#   ─────────────────────────────────────────────────────────────────────
#     $PREFIX/lib/claude-musl/                   musl loader + libs
#     $PREFIX/lib/claude-musl/launcher.template  launcher source of truth
#     $PREFIX/lib/node_modules/@anthropic-ai/
#         claude-code-linux-arm64-musl/claude    official binary
#     $PREFIX/bin/claude                         launcher
#     $PREFIX/bin/claude-fix                     launcher restorer
#     $PREFIX/bin/claude-update                  npm update wrapper
#     $PREFIX/bin/claude-uninstall               full uninstaller
#
# ═══════════════════════════════════════════════════════════════════════════

set -Eeuo pipefail

readonly SCRIPT_NAME="Termux Claude Code Installer Script"
readonly SCRIPT_VERSION="1.0.0"
readonly SCRIPT_AUTHOR="Ryovx"

readonly PREFIX="${PREFIX:-/data/data/com.termux/files/usr}"
readonly HOME_DIR="${HOME:-/data/data/com.termux/files/home}"

readonly MUSL_RUNTIME_DIR="$PREFIX/lib/claude-musl"
readonly MUSL_LOADER="$MUSL_RUNTIME_DIR/ld-musl-aarch64.so.1"

readonly NODE_MODULES_DIR="$PREFIX/lib/node_modules"
readonly ANTHROPIC_DIR="$NODE_MODULES_DIR/@anthropic-ai"
readonly CLAUDE_PKG_NAME="claude-code-linux-arm64-musl"
readonly CLAUDE_PKG_DIR="$ANTHROPIC_DIR/$CLAUDE_PKG_NAME"
readonly CLAUDE_BIN="$CLAUDE_PKG_DIR/claude"

readonly LAUNCHER_PATH="$PREFIX/bin/claude"
readonly LAUNCHER_TMPL="$MUSL_RUNTIME_DIR/launcher.template"
readonly LEGACY_REAL="$PREFIX/bin/claude.real"
readonly CLAUDE_FIX_PATH="$PREFIX/bin/claude-fix"
readonly CLAUDE_UPDATE_PATH="$PREFIX/bin/claude-update"
readonly CLAUDE_UNINSTALL_PATH="$PREFIX/bin/claude-uninstall"

readonly ALPINE_VERSION="3.20.3"
readonly ALPINE_URL="https://dl-cdn.alpinelinux.org/alpine/v3.20/releases/aarch64/alpine-minirootfs-${ALPINE_VERSION}-aarch64.tar.gz"

readonly RC_MARKER_BEGIN="# >>> claude-termux self-heal >>>"
readonly RC_MARKER_END="# <<< claude-termux self-heal <<<"

readonly MIN_FREE_MB=700

if [[ -t 2 ]] && [[ -z "${NO_COLOR:-}" ]]; then
  readonly C_RST=$'\033[0m' C_RED=$'\033[1;31m' C_GRN=$'\033[1;32m'
  readonly C_YEL=$'\033[1;33m' C_CYN=$'\033[1;36m' C_BLD=$'\033[1m'
  readonly C_MAG=$'\033[1;35m'
else
  readonly C_RST="" C_RED="" C_GRN="" C_YEL="" C_CYN="" C_BLD="" C_MAG=""
fi

log_info() { printf '%s %s\n' "${C_CYN}->${C_RST}" "$*" >&2; }
log_ok()   { printf '%s %s\n' "${C_GRN}+${C_RST}"  "$*" >&2; }
log_warn() { printf '%s %s\n' "${C_YEL}!${C_RST}"  "$*" >&2; }
log_fail() { printf '%s %s\n' "${C_RED}x${C_RST}"  "$*" >&2; }
die()      { log_fail "$*"; exit 1; }

WORK_DIR=""
_cleanup_work() {
  if [[ -n "$WORK_DIR" ]] && [[ -d "$WORK_DIR" ]]; then
    rm -rf -- "$WORK_DIR" 2>/dev/null || true
  fi
}
trap _cleanup_work EXIT

remove_marker_block() {
  local file="$1" begin="$2" end="$3"
  [[ -f "$file" ]] || return 0
  local tmp
  tmp="$(mktemp)"
  awk -v b="$begin" -v e="$end" '
    $0 == b { skip=1; next }
    $0 == e { skip=0; next }
    !skip
  ' "$file" > "$tmp"
  mv -- "$tmp" "$file"
}

is_binary_pristine() {
  [[ -x "$CLAUDE_BIN" ]] || return 1
  file "$CLAUDE_BIN" 2>/dev/null \
    | grep -q "interpreter /lib/ld-musl-aarch64.so.1"
}

get_installed_version() {
  [[ -f "$CLAUDE_PKG_DIR/package.json" ]] || return 1
  sed -n 's/.*"version"[[:space:]]*:[[:space:]]*"\([^"]*\)".*/\1/p' \
    "$CLAUDE_PKG_DIR/package.json" | head -n1
}

check_environment() {
  log_info "Checking environment..."
  [[ -d "$PREFIX" ]]   || die "PREFIX does not exist: $PREFIX"
  [[ -d "$HOME_DIR" ]] || die "HOME does not exist: $HOME_DIR"
  [[ -w "$PREFIX" ]]   || die "PREFIX is not writable: $PREFIX"
  log_ok "Environment OK"
}

check_arch() {
  local arch
  arch="$(uname -m)"
  [[ "$arch" == "aarch64" ]] \
    || die "Unsupported architecture: $arch (only aarch64 is supported)"
  log_ok "Architecture OK ($arch)"
}

check_disk_space() {
  local avail_mb
  avail_mb="$(df -Pk "$HOME_DIR" 2>/dev/null | awk 'NR==2 {print int($4/1024)}')"
  [[ -n "$avail_mb" ]] || avail_mb=0
  [[ "$avail_mb" -ge "$MIN_FREE_MB" ]] \
    || die "Insufficient free space: ${avail_mb}MB available, ${MIN_FREE_MB}MB required"
  log_ok "Disk space OK (${avail_mb}MB free)"
}

ensure_packages() {
  log_info "Ensuring required Termux packages..."
  local missing=()
  for bin in curl tar node npm file; do
    command -v "$bin" >/dev/null 2>&1 || missing+=("$bin")
  done
  if [[ ${#missing[@]} -gt 0 ]]; then
    log_info "Installing missing packages: ${missing[*]}"
    pkg install -y "${missing[@]}" \
      || die "Failed to install packages: ${missing[*]}"
  fi
  log_ok "Required packages present"
}

cleanup_previous() {
  log_info "Cleaning up previous installation artifacts..."

  rm -f -- "$LAUNCHER_PATH"         2>/dev/null || true
  rm -f -- "$LEGACY_REAL"           2>/dev/null || true
  rm -f -- "$CLAUDE_FIX_PATH"       2>/dev/null || true
  rm -f -- "$CLAUDE_UPDATE_PATH"    2>/dev/null || true
  rm -f -- "$CLAUDE_UNINSTALL_PATH" 2>/dev/null || true

  rm -f -- "$ANTHROPIC_DIR"/*.tgz 2>/dev/null || true

  local rc
  for rc in "$HOME_DIR/.bashrc" "$HOME_DIR/.zshrc"; do
    if [[ -f "$rc" ]] && grep -qF "$RC_MARKER_BEGIN" "$rc"; then
      remove_marker_block "$rc" "$RC_MARKER_BEGIN" "$RC_MARKER_END"
      log_ok "Removed legacy rc markers from $(basename "$rc")"
    fi
  done

  log_ok "Cleanup complete"
}

install_musl_runtime() {
  if [[ -x "$MUSL_LOADER" ]]; then
    log_ok "musl runtime already present ($MUSL_RUNTIME_DIR)"
    return 0
  fi

  log_info "Downloading Alpine musl runtime ($ALPINE_VERSION)..."
  WORK_DIR="$(mktemp -d)"

  curl -fsSL --retry 3 --retry-delay 2 \
    -o "$WORK_DIR/alpine.tar.gz" "$ALPINE_URL" \
    || die "Failed to download Alpine minirootfs from $ALPINE_URL"

  mkdir -p "$WORK_DIR/alpine" "$MUSL_RUNTIME_DIR"
  tar -xzf "$WORK_DIR/alpine.tar.gz" -C "$WORK_DIR/alpine" \
    || die "Failed to extract Alpine minirootfs"

  [[ -d "$WORK_DIR/alpine/lib" ]] \
    && cp -a "$WORK_DIR/alpine/lib/." "$MUSL_RUNTIME_DIR/" 2>/dev/null || true
  [[ -d "$WORK_DIR/alpine/usr/lib" ]] \
    && cp -a "$WORK_DIR/alpine/usr/lib/." "$MUSL_RUNTIME_DIR/" 2>/dev/null || true

  [[ -x "$MUSL_LOADER" ]] \
    || die "musl loader was not extracted correctly: $MUSL_LOADER"

  log_ok "musl runtime installed ($MUSL_RUNTIME_DIR)"
}

install_claude_binary() {
  local force="${1:-0}"

  log_info "Resolving latest Claude Code version from npm..."
  local latest
  latest="$(npm view @anthropic-ai/claude-code version 2>/dev/null)" \
    || die "Failed to query npm for latest Claude Code version"
  log_ok "Latest available: $latest"

  local installed=""
  if [[ -f "$CLAUDE_PKG_DIR/package.json" ]]; then
    installed="$(get_installed_version 2>/dev/null)" || installed=""
  fi

  local reason=""
  if [[ "$force" == "1" ]]; then
    reason="--force specified"
  elif [[ ! -x "$CLAUDE_BIN" ]]; then
    reason="binary is missing"
  elif [[ "$installed" != "$latest" ]]; then
    reason="version change: ${installed:-unknown} -> $latest"
  fi

  if [[ -z "$reason" ]]; then
    log_ok "Claude Code $installed already at latest (skipping download)"
    if ! is_binary_pristine; then
      log_warn "Note: installed binary was modified. Use --force to reinstall."
    fi
    return 0
  fi

  log_info "Installing musl binary - $reason"
  mkdir -p "$ANTHROPIC_DIR"

  (
    cd "$ANTHROPIC_DIR"
    rm -rf -- "$CLAUDE_PKG_NAME"
    rm -f -- anthropic-ai-claude-code-linux-arm64-musl-*.tgz 2>/dev/null || true

    npm pack "@anthropic-ai/$CLAUDE_PKG_NAME@$latest" >/dev/null
    tar -xzf "anthropic-ai-${CLAUDE_PKG_NAME}-${latest}.tgz"
    mv -- package "$CLAUDE_PKG_NAME"
    rm -f -- "anthropic-ai-${CLAUDE_PKG_NAME}-${latest}.tgz"
  ) || die "Failed to fetch or unpack Claude Code musl binary"

  [[ -x "$CLAUDE_BIN" ]] \
    || die "Claude binary not executable after extraction: $CLAUDE_BIN"

  log_ok "Claude Code $latest installed"
}

create_launcher_template() {
  log_info "Writing launcher template..."
  mkdir -p "$MUSL_RUNTIME_DIR"

  cat > "$LAUNCHER_TMPL" <<'LAUNCHER_TMPL_EOF'
#!/data/data/com.termux/files/usr/bin/bash
# Claude Code launcher for Termux — generated by Termux Claude Code
# Installer Script (Ryovx). DO NOT EDIT. Restore with: claude-fix
#
# `env -u LD_PRELOAD` is mandatory: Termux injects
# libtermux-exec-ld-preload.so (Bionic) into every process, and its
# symbols collide with musl's. Unsetting it lets the musl loader
# resolve symbols from the bundled Alpine libraries without conflicts.
#
PREFIX="${PREFIX:-/data/data/com.termux/files/usr}"
exec env -u LD_PRELOAD \
  "$PREFIX/lib/claude-musl/ld-musl-aarch64.so.1" \
  --library-path "$PREFIX/lib/claude-musl" \
  "$PREFIX/lib/node_modules/@anthropic-ai/claude-code-linux-arm64-musl/claude" \
  "$@"
LAUNCHER_TMPL_EOF

  chmod 0644 "$LAUNCHER_TMPL"
  log_ok "Launcher template written"
}

install_helper_scripts() {
  log_info "Installing helper scripts..."

  cat > "$CLAUDE_FIX_PATH" <<'CLAUDE_FIX_EOF'
#!/data/data/com.termux/files/usr/bin/bash
# claude-fix — restore the Claude Code launcher from its template.
# Generated by Termux Claude Code Installer (Ryovx).
set -euo pipefail

PREFIX="${PREFIX:-/data/data/com.termux/files/usr}"
TMPL="$PREFIX/lib/claude-musl/launcher.template"
LAUNCHER="$PREFIX/bin/claude"
BIN="$PREFIX/lib/node_modules/@anthropic-ai/claude-code-linux-arm64-musl/claude"

if [[ ! -x "$BIN" ]]; then
  echo "claude-fix: musl binary missing — rerun the installer" >&2
  exit 1
fi
if [[ ! -f "$TMPL" ]]; then
  echo "claude-fix: launcher template missing — rerun the installer" >&2
  exit 1
fi

if [[ ! -x "$LAUNCHER" ]] || ! cmp -s "$TMPL" "$LAUNCHER" 2>/dev/null; then
  cp -- "$TMPL" "$LAUNCHER"
  chmod 0755 "$LAUNCHER"
  echo "claude-fix: launcher restored"
fi

"$LAUNCHER" --version
CLAUDE_FIX_EOF
  chmod 0755 "$CLAUDE_FIX_PATH"
  log_ok "claude-fix installed"

  cat > "$CLAUDE_UPDATE_PATH" <<'CLAUDE_UPDATE_EOF'
#!/data/data/com.termux/files/usr/bin/bash
# claude-update — update Claude Code to the latest npm version.
# Generated by Termux Claude Code Installer (Ryovx).
set -euo pipefail

PREFIX="${PREFIX:-/data/data/com.termux/files/usr}"
ANTHROPIC_DIR="$PREFIX/lib/node_modules/@anthropic-ai"
PKG_DIR="$ANTHROPIC_DIR/claude-code-linux-arm64-musl"

command -v npm >/dev/null 2>&1 || {
  echo "claude-update: npm not found" >&2
  exit 1
}

LATEST="$(npm view @anthropic-ai/claude-code version 2>/dev/null)" || {
  echo "claude-update: failed to query npm registry" >&2
  exit 1
}

INSTALLED=""
if [[ -f "$PKG_DIR/package.json" ]]; then
  INSTALLED="$(sed -n 's/.*"version"[[:space:]]*:[[:space:]]*"\([^"]*\)".*/\1/p' \
    "$PKG_DIR/package.json" | head -n1)"
fi

if [[ "$LATEST" == "$INSTALLED" ]]; then
  echo "claude: already up to date ($INSTALLED)"
  exec "$PREFIX/bin/claude-fix"
fi

echo "claude: updating ${INSTALLED:-unknown} -> $LATEST"

(
  cd "$ANTHROPIC_DIR"
  rm -rf -- claude-code-linux-arm64-musl
  npm pack "@anthropic-ai/claude-code-linux-arm64-musl@$LATEST" >/dev/null
  tar -xzf "anthropic-ai-claude-code-linux-arm64-musl-${LATEST}.tgz"
  mv -- package claude-code-linux-arm64-musl
  rm -f -- "anthropic-ai-claude-code-linux-arm64-musl-${LATEST}.tgz"
) || {
  echo "claude-update: failed to install version $LATEST" >&2
  exit 1
}

exec "$PREFIX/bin/claude-fix"
CLAUDE_UPDATE_EOF
  chmod 0755 "$CLAUDE_UPDATE_PATH"
  log_ok "claude-update installed"

  cat > "$CLAUDE_UNINSTALL_PATH" <<'CLAUDE_UNINSTALL_EOF'
#!/data/data/com.termux/files/usr/bin/bash
# claude-uninstall — remove all Claude Code Termux installation artifacts.
# Generated by Termux Claude Code Installer (Ryovx).
set -euo pipefail

PREFIX="${PREFIX:-/data/data/com.termux/files/usr}"
HOME_DIR="${HOME:-/data/data/com.termux/files/home}"

LAUNCHER_PATH="$PREFIX/bin/claude"
LEGACY_REAL="$PREFIX/bin/claude.real"
CLAUDE_FIX_PATH="$PREFIX/bin/claude-fix"
CLAUDE_UPDATE_PATH="$PREFIX/bin/claude-update"
CLAUDE_UNINSTALL_PATH="$PREFIX/bin/claude-uninstall"
MUSL_RUNTIME_DIR="$PREFIX/lib/claude-musl"
CLAUDE_PKG_DIR="$PREFIX/lib/node_modules/@anthropic-ai/claude-code-linux-arm64-musl"

RC_MARKER_BEGIN="# >>> claude-termux self-heal >>>"
RC_MARKER_END="# <<< claude-termux self-heal <<<"

remove_marker_block() {
  local file="$1" begin="$2" end="$3"
  [[ -f "$file" ]] || return 0
  local tmp
  tmp="$(mktemp)"
  awk -v b="$begin" -v e="$end" '
    $0 == b { skip=1; next }
    $0 == e { skip=0; next }
    !skip
  ' "$file" > "$tmp"
  mv -- "$tmp" "$file"
}

echo "-> Uninstalling Termux Claude Code..."
echo

if [[ -f "$LAUNCHER_PATH" ]]; then
  rm -f -- "$LAUNCHER_PATH"
  echo "  + removed $LAUNCHER_PATH"
fi

if [[ -f "$LEGACY_REAL" ]]; then
  rm -f -- "$LEGACY_REAL"
  echo "  + removed $LEGACY_REAL"
fi

if [[ -f "$CLAUDE_FIX_PATH" ]]; then
  rm -f -- "$CLAUDE_FIX_PATH"
  echo "  + removed $CLAUDE_FIX_PATH"
fi

if [[ -f "$CLAUDE_UPDATE_PATH" ]]; then
  rm -f -- "$CLAUDE_UPDATE_PATH"
  echo "  + removed $CLAUDE_UPDATE_PATH"
fi

if [[ -d "$MUSL_RUNTIME_DIR" ]]; then
  rm -rf -- "$MUSL_RUNTIME_DIR"
  echo "  + removed $MUSL_RUNTIME_DIR"
fi

if [[ -d "$CLAUDE_PKG_DIR" ]]; then
  rm -rf -- "$CLAUDE_PKG_DIR"
  echo "  + removed $CLAUDE_PKG_DIR"
fi

for rc in "$HOME_DIR/.bashrc" "$HOME_DIR/.zshrc"; do
  if [[ -f "$rc" ]] && grep -qF "$RC_MARKER_BEGIN" "$rc"; then
    remove_marker_block "$rc" "$RC_MARKER_BEGIN" "$RC_MARKER_END"
    echo "  + removed legacy rc markers from $(basename "$rc")"
  fi
done

echo
echo "+ Claude Code has been uninstalled."
echo

rm -f -- "$CLAUDE_UNINSTALL_PATH" 2>/dev/null || true
CLAUDE_UNINSTALL_EOF
  chmod 0755 "$CLAUDE_UNINSTALL_PATH"
  log_ok "claude-uninstall installed"
}

install_launcher() {
  log_info "Installing launcher at $LAUNCHER_PATH..."
  mkdir -p "$(dirname "$LAUNCHER_PATH")"
  cp -- "$LAUNCHER_TMPL" "$LAUNCHER_PATH"
  chmod 0755 "$LAUNCHER_PATH"
  log_ok "Launcher installed"
}

verify_installation() {
  log_info "Verifying installation (raw loader + launcher)..."

  local raw
  raw="$(env -u LD_PRELOAD "$MUSL_LOADER" \
      --library-path "$MUSL_RUNTIME_DIR" \
      "$CLAUDE_BIN" --version 2>&1 || true)"
  [[ "$raw" == *"Claude Code"* ]] \
    || die "Raw binary failed to execute. Output: $raw"
  log_ok "Raw binary OK: $raw"

  local via
  via="$("$LAUNCHER_PATH" --version 2>&1 || true)"
  [[ "$via" == *"Claude Code"* ]] \
    || die "Launcher failed. Output: $via"
  log_ok "Launcher OK: $via"

  [[ -x "$CLAUDE_FIX_PATH"       ]] || die "claude-fix not executable"
  [[ -x "$CLAUDE_UPDATE_PATH"    ]] || die "claude-update not executable"
  [[ -x "$CLAUDE_UNINSTALL_PATH" ]] || die "claude-uninstall not executable"
  log_ok "Helper scripts OK"
}

print_summary() {
  cat <<SUMMARY

${C_MAG}${C_BLD}╔═══════════════════════════════════════════════════════════════════╗${C_RST}
${C_MAG}${C_BLD}║                                                                   ║${C_RST}
${C_MAG}${C_BLD}║              +  CLAUDE CODE INSTALLED SYSTEM-WIDE                 ║${C_RST}
${C_MAG}${C_BLD}║                                                                   ║${C_RST}
${C_MAG}${C_BLD}╚═══════════════════════════════════════════════════════════════════╝${C_RST}

  ${C_BLD}Commands${C_RST}
    claude              Run Claude Code
    claude-update       Update to the latest npm version
    claude-fix          Restore launcher / re-verify
    claude-uninstall    Remove all installed artifacts

  ${C_BLD}Authentication${C_RST}
    claude              (first run will prompt for auth)
    # or
    export ANTHROPIC_API_KEY=sk-ant-...

  ${C_BLD}Installed artifacts${C_RST}
    Launcher     ${C_CYN}${LAUNCHER_PATH}${C_RST}
    Template     ${C_CYN}${LAUNCHER_TMPL}${C_RST}
    musl runtime ${C_CYN}${MUSL_RUNTIME_DIR}${C_RST}
    Binary       ${C_CYN}${CLAUDE_BIN}${C_RST}
    Helpers      ${C_CYN}${CLAUDE_FIX_PATH}${C_RST}
                 ${C_CYN}${CLAUDE_UPDATE_PATH}${C_RST}
                 ${C_CYN}${CLAUDE_UNINSTALL_PATH}${C_RST}

  ${C_BLD}No rc files were modified.${C_RST}
  ${C_BLD}All commands are available immediately from ${C_CYN}$PREFIX/bin${C_RST}.

  ${C_BLD}Uninstall everything:${C_RST}
    claude-uninstall

${C_YEL}${C_BLD}───────────────────────────────────────────────────────────────────${C_RST}
${C_YEL}${C_BLD}  FREE SOFTWARE - provided free of charge to the Termux community.${C_RST}
${C_YEL}${C_BLD}  The author kindly requests that you do NOT sell, resell, or     ${C_RST}
${C_YEL}${C_BLD}  bundle this software with paid products.                     ${C_RST}
${C_YEL}${C_BLD}  This is an ethical request, not a legal restriction.           ${C_RST}
${C_YEL}${C_BLD}  Licensed under GNU GPL v3.0 or later - see LICENSE for terms.${C_RST}
${C_YEL}${C_BLD}───────────────────────────────────────────────────────────────────${C_RST}

SUMMARY
}

do_uninstall() {
  log_info "Uninstalling $SCRIPT_NAME artifacts..."

  rm -f -- "$LAUNCHER_PATH"         2>/dev/null || true
  rm -f -- "$LEGACY_REAL"           2>/dev/null || true
  rm -f -- "$CLAUDE_FIX_PATH"       2>/dev/null || true
  rm -f -- "$CLAUDE_UPDATE_PATH"    2>/dev/null || true
  rm -f -- "$CLAUDE_UNINSTALL_PATH" 2>/dev/null || true
  rm -rf -- "$MUSL_RUNTIME_DIR"     2>/dev/null || true
  rm -rf -- "$CLAUDE_PKG_DIR"       2>/dev/null || true

  local rc
  for rc in "$HOME_DIR/.bashrc" "$HOME_DIR/.zshrc"; do
    if [[ -f "$rc" ]] && grep -qF "$RC_MARKER_BEGIN" "$rc"; then
      remove_marker_block "$rc" "$RC_MARKER_BEGIN" "$RC_MARKER_END"
      log_ok "Removed legacy rc markers from $(basename "$rc")"
    fi
  done

  log_ok "Uninstall complete"
}

print_usage() {
  cat <<'USAGE_EOF'
$SCRIPT_NAME v$SCRIPT_VERSION
Developed & Maintained by / $SCRIPT_AUTHOR
License: GNU GPL v3.0 or later

USAGE
  bash install.sh                Install or refresh Claude Code
  bash install.sh --force        Force reinstall even if already up to date
  bash install.sh --uninstall    Remove all installed artifacts
  bash install.sh --version      Print installer version
  bash install.sh --help         Show this message

AFTER INSTALL
  claude                Run Claude Code
  claude-update         Update to the latest npm version
  claude-fix            Restore launcher / re-verify
  claude-uninstall      Remove all installed artifacts

WHAT IT DOES
  Downloads the official @anthropic-ai/claude-code-linux-arm64-musl
  binary from npm, installs Alpine's musl loader and libraries under
  $PREFIX/lib/claude-musl, and creates a launcher at $PREFIX/bin/claude
  that runs the binary with the correct loader and LD_PRELOAD unset.

  No patchelf, no proot, no chroot, no container.
  No changes to ~/.bashrc or ~/.zshrc.
USAGE_EOF
}

main() {
  local FORCE=0
  while [[ $# -gt 0 ]]; do
    case "$1" in
      -h|--help)     print_usage; exit 0 ;;
      -v|--version)  printf '%s v%s\n' "$SCRIPT_NAME" "$SCRIPT_VERSION"; exit 0 ;;
      --uninstall)   do_uninstall; exit 0 ;;
      -f|--force)    FORCE=1; shift ;;
      *)             die "Unknown argument: $1 (try --help)" ;;
    esac
  done

  printf '\n%s %s - %s\n\n' \
    "${C_BLD}${SCRIPT_NAME}${C_RST}" \
    "v$SCRIPT_VERSION" \
    "by $SCRIPT_AUTHOR"

  check_environment
  check_arch
  check_disk_space
  ensure_packages
  cleanup_previous
  install_musl_runtime
  install_claude_binary "$FORCE"
  create_launcher_template
  install_helper_scripts
  install_launcher
  verify_installation
  print_summary
}

main "$@"
