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
#   Version:      2.0.0
#   License:      GNU General Public License v3.0 or later
#   Source:       Real Claude Code linux-arm64-musl binary from Anthropic
#   musl source:  https://github.com/Ryovx/Musl-on-Termux (patched, MIT)
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
#   ║   ✔  We are proud members of the Open Invention Network (OIN)    ║
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
#     • A PATCHED musl dynamic loader (ld-musl-aarch64.so.1) built
#       from https://github.com/Ryovx/Musl-on-Termux, downloaded as
#       a signed release zip and verified against a pinned SHA256.
#       The patched loader reads $PREFIX/etc/resolv.conf when the
#       MUSL_ON_TERMUX=1 environment variable is set, and falls back
#       to a deterministic DNS resolver list when no nameserver is
#       configured.
#
#     • A small launcher at $PREFIX/bin/claude that re-executes the
#       binary with the correct loader, with LD_PRELOAD unset, and
#       with MUSL_ON_TERMUX=1 (so DNS works out of the box).
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
#   WHY PATCHED MUSL
#   ─────────────────────────────────────────────────────────────────────
#   Upstream musl reads /etc/resolv.conf, which is neither readable
#   nor writable inside Termux. Android routes DNS through the netd
#   system service, so musl-based lookups fail with EAI_AGAIN.
#
#   The patched loader from Ryovx/Musl-on-Termux adds:
#
#     • MUSL_ON_TERMUX=1  →  read $PREFIX/etc/resolv.conf first.
#     • Deterministic DNS fallback when no nameserver is found:
#         1.1.1.1  →  8.8.8.8  →  127.0.0.1
#
#   The launcher sets MUSL_ON_TERMUX=1 unconditionally, so DNS works
#   without any manual environment configuration by the user.
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
#     $PREFIX/lib/claude-musl/                   patched musl loader + libs
#     $PREFIX/lib/claude-musl/launcher.template  launcher source of truth
#     $PREFIX/lib/node_modules/@anthropic-ai/
#         claude-code-linux-arm64-musl/claude    official binary
#     $PREFIX/bin/claude                         launcher
#     $PREFIX/bin/claude-fix                     launcher restorer
#     $PREFIX/bin/claude-update                  npm update wrapper
#     $PREFIX/bin/claude-uninstall               full uninstaller
#     $PREFIX/etc/resolv.conf                    (created if missing)
#
# ═══════════════════════════════════════════════════════════════════════════

set -Eeuo pipefail

readonly SCRIPT_NAME="Termux Claude Code Installer Script"
readonly SCRIPT_VERSION="2.0.0"
readonly SCRIPT_AUTHOR="Ryovx"

readonly PREFIX="${PREFIX:-/data/data/com.termux/files/usr}"
readonly HOME_DIR="${HOME:-/data/data/com.termux/files/home}"

readonly MUSL_RUNTIME_DIR="$PREFIX/lib/claude-musl"
readonly MUSL_LOADER="$MUSL_RUNTIME_DIR/ld-musl-aarch64.so.1"
readonly MUSL_RESOLV_CONF="$PREFIX/etc/resolv.conf"

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

# ─── Patched musl release ────────────────────────────────────────────────
# The archive is produced by https://github.com/Ryovx/Musl-on-Termux.
# It contains:
#   ld-musl-aarch64.so.1   (patched loader; also serves as libc.so)
#   lib/                   (static archives + crt objects)
#   include/               (public musl headers)
#
# The pinned SHA256 below MUST match the published release asset.
# If the release is ever re-uploaded, update this constant and bump
# SCRIPT_VERSION. Verification is mandatory — the installer refuses
# to proceed on any mismatch.
readonly MUSL_ZIP_URL="https://github.com/Ryovx/Musl-on-Termux/releases/download/v1.2.6-termux/musl-on-termux-aarch64.zip"
readonly MUSL_ZIP_SHA256="e4f456187a54f6fbbcda31026354728262b5acfce11642eaca2df88722c9870b"
readonly MUSL_ZIP_NAME="musl-on-termux-aarch64.zip"

readonly RC_MARKER_BEGIN="# >>> claude-termux self-heal >>>"
readonly RC_MARKER_END="# <<< claude-termux self-heal <<<"

# 280MB tgz + 280MB extracted (during atomic swap, old + new both
# exist) + ~100MB npm temp → ~800MB peak. Do not lower this.
readonly MIN_FREE_MB=800

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
  # readelf is more reliable than `file` across Termux versions.
  readelf -l "$CLAUDE_BIN" 2>/dev/null \
    | grep -q "Requesting program interpreter: /lib/ld-musl-aarch64.so.1"
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
  # sha256sum is part of coreutils (always present in Termux).
  # unzip is required to unpack the musl release archive.
  for bin in curl tar node npm file unzip; do
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
  local force="${1:-0}"
  log_info "Cleaning up previous installation artifacts..."

  rm -f -- "$LAUNCHER_PATH"         2>/dev/null || true
  rm -f -- "$LEGACY_REAL"           2>/dev/null || true
  rm -f -- "$CLAUDE_FIX_PATH"       2>/dev/null || true
  rm -f -- "$CLAUDE_UPDATE_PATH"    2>/dev/null || true
  rm -f -- "$CLAUDE_UNINSTALL_PATH" 2>/dev/null || true

  rm -f -- "$ANTHROPIC_DIR"/*.tgz 2>/dev/null || true

  # --force wipes the runtime so install_musl_runtime downloads a fresh copy.
  if [[ "$force" == "1" ]] && [[ -d "$MUSL_RUNTIME_DIR" ]]; then
    log_info "Force mode: removing musl runtime"
    rm -rf -- "$MUSL_RUNTIME_DIR" 2>/dev/null || true
  fi

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
  local force="${1:-0}"

  if [[ -x "$MUSL_LOADER" ]] && [[ "$force" != "1" ]]; then
    log_ok "musl runtime already present ($MUSL_RUNTIME_DIR)"
    return 0
  fi

  log_info "Downloading patched musl runtime..."
  log_info "  from: $MUSL_ZIP_URL"
  WORK_DIR="$(mktemp -d)"
  local zip_path="$WORK_DIR/$MUSL_ZIP_NAME"

  curl -fsSL --retry 3 --retry-delay 2 \
    -o "$zip_path" "$MUSL_ZIP_URL" \
    || die "Failed to download musl runtime from $MUSL_ZIP_URL"

  # ─── Integrity check ──────────────────────────────────────────────
  local actual_sha
  actual_sha="$(sha256sum "$zip_path" | awk '{print $1}')"
  if [[ "$actual_sha" != "$MUSL_ZIP_SHA256" ]]; then
    die "SHA256 mismatch!
  expected: $MUSL_ZIP_SHA256
  actual:   $actual_sha
  Refusing to install — the download may be corrupted or tampered with."
  fi
  log_ok "SHA256 verified"

  # ─── Extract ──────────────────────────────────────────────────────
  mkdir -p "$MUSL_RUNTIME_DIR"
  unzip -o -q "$zip_path" -d "$MUSL_RUNTIME_DIR" \
    || die "Failed to extract musl runtime archive"

  # ─── Validate extracted loader ────────────────────────────────────
  [[ -f "$MUSL_LOADER" ]] \
    || die "musl loader not found after extraction: $MUSL_LOADER"
  chmod 0755 "$MUSL_LOADER"
  file "$MUSL_LOADER" 2>/dev/null | grep -q "ARM aarch64" \
    || die "musl loader is not a valid aarch64 ELF: $MUSL_LOADER"

  # ─── Make sure libc.so alias exists (some consumers reference it) ──
  if [[ ! -e "$MUSL_RUNTIME_DIR/libc.so" ]]; then
    ln -sf -- "ld-musl-aarch64.so.1" "$MUSL_RUNTIME_DIR/libc.so" 2>/dev/null || true
  fi

  log_ok "Patched musl runtime installed ($MUSL_RUNTIME_DIR)"
}

ensure_resolv_conf() {
  mkdir -p "$(dirname "$MUSL_RESOLV_CONF")"
  if [[ ! -s "$MUSL_RESOLV_CONF" ]]; then
    log_info "Creating $MUSL_RESOLV_CONF with public DNS servers"
    printf 'nameserver 1.1.1.1\nnameserver 8.8.8.8\n' > "$MUSL_RESOLV_CONF"
    log_ok "resolv.conf created"
  else
    log_ok "resolv.conf already present ($MUSL_RESOLV_CONF)"
  fi
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

  local tgz_name="anthropic-ai-${CLAUDE_PKG_NAME}-${latest}.tgz"
  local tgz_path="$ANTHROPIC_DIR/$tgz_name"
  local tmp_extract="$ANTHROPIC_DIR/.tmp-${CLAUDE_PKG_NAME}-$$"
  local new_dir="$ANTHROPIC_DIR/${CLAUDE_PKG_NAME}.new-$$"
  local old_dir="$ANTHROPIC_DIR/${CLAUDE_PKG_NAME}.old-$$"

  # Scrub any stale artifacts from prior failed runs.
  rm -rf -- "$tmp_extract" "$new_dir" "$old_dir"
  rm -f -- "$tgz_path"

  # ─── Download ─────────────────────────────────────────────────────
  ( cd "$ANTHROPIC_DIR" && npm pack "@anthropic-ai/$CLAUDE_PKG_NAME@$latest" >/dev/null ) \
    || { rm -f -- "$tgz_path"; die "npm pack failed for $CLAUDE_PKG_NAME@$latest"; }
  [[ -f "$tgz_path" ]] || die "npm pack did not produce $tgz_name"

  # ─── Extract to temp dir ──────────────────────────────────────────
  mkdir -p "$tmp_extract"
  tar -xzf "$tgz_path" -C "$tmp_extract" \
    || { rm -rf -- "$tmp_extract" "$tgz_path"; die "Failed to extract $tgz_name"; }
  rm -f -- "$tgz_path"

  mv -- "$tmp_extract/package" "$new_dir"
  rm -rf -- "$tmp_extract"

  # ─── Validate new binary before swap ──────────────────────────────
  [[ -x "$new_dir/claude" ]] \
    || { rm -rf -- "$new_dir"; die "New package missing claude binary"; }
  local new_size
  new_size="$(stat -c%s "$new_dir/claude" 2>/dev/null || echo 0)"
  [[ "$new_size" -gt 100000000 ]] \
    || { rm -rf -- "$new_dir"; die "New binary too small ($new_size bytes) — corrupt?"; }

  # ─── Atomic swap ──────────────────────────────────────────────────
  if [[ -d "$CLAUDE_PKG_DIR" ]]; then
    mv -- "$CLAUDE_PKG_DIR" "$old_dir" \
      || { rm -rf -- "$new_dir"; die "Failed to move old package aside"; }
  fi
  if mv -- "$new_dir" "$CLAUDE_PKG_DIR"; then
    rm -rf -- "$old_dir" 2>/dev/null || true
  else
    [[ -d "$old_dir" ]] && mv -- "$old_dir" "$CLAUDE_PKG_DIR" 2>/dev/null || true
    rm -rf -- "$new_dir" 2>/dev/null || true
    die "Failed to install new package — old package restored"
  fi

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
# resolve symbols from the bundled musl libraries without conflicts.
#
# `MUSL_ON_TERMUX=1` tells the patched musl loader to read DNS
# configuration from $PREFIX/etc/resolv.conf, and to use the
# deterministic fallback list (1.1.1.1 → 8.8.8.8 → 127.0.0.1) if
# no nameserver is configured.
#
PREFIX="${PREFIX:-/data/data/com.termux/files/usr}"
exec env -u LD_PRELOAD MUSL_ON_TERMUX=1 \
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
PKG_NAME="claude-code-linux-arm64-musl"

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

mkdir -p "$ANTHROPIC_DIR"
cd "$ANTHROPIC_DIR"

TGZ="anthropic-ai-${PKG_NAME}-${LATEST}.tgz"
TMP=".tmp-${PKG_NAME}-$$"
NEW="${PKG_NAME}.new-$$"
OLD="${PKG_NAME}.old-$$"

cleanup() {
  rm -rf -- "$TMP" "$NEW" 2>/dev/null || true
  rm -f -- "$TGZ" 2>/dev/null || true
}
trap cleanup EXIT

rm -rf -- "$TMP" "$NEW" "$OLD"
rm -f -- "$TGZ"

npm pack "@anthropic-ai/${PKG_NAME}@${LATEST}" >/dev/null || {
  echo "claude-update: npm pack failed" >&2
  exit 1
}

mkdir -p "$TMP"
tar -xzf "$TGZ" -C "$TMP" || {
  echo "claude-update: failed to extract" >&2
  exit 1
}
mv -- "$TMP/package" "$NEW"

[[ -x "$NEW/claude" ]] || {
  echo "claude-update: new package missing claude binary" >&2
  exit 1
}
NEW_SIZE="$(stat -c%s "$NEW/claude" 2>/dev/null || echo 0)"
[[ "$NEW_SIZE" -gt 100000000 ]] || {
  echo "claude-update: new binary too small ($NEW_SIZE bytes)" >&2
  exit 1
}

if [[ -d "$PKG_DIR" ]]; then
  mv -- "$PKG_DIR" "$OLD" || {
    echo "claude-update: failed to move old package aside" >&2
    exit 1
  }
fi

if mv -- "$NEW" "$PKG_DIR"; then
  rm -rf -- "$OLD" 2>/dev/null || true
else
  [[ -d "$OLD" ]] && mv -- "$OLD" "$PKG_DIR" 2>/dev/null || true
  echo "claude-update: failed to install new package — old restored" >&2
  exit 1
fi

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

# Safety: refuse to operate on non-Termux prefixes.
case "$PREFIX" in
  */com.termux/files/usr) ;;
  *)
    echo "claude-uninstall: refusing to run — PREFIX=$PREFIX is not a Termux prefix" >&2
    exit 1
    ;;
esac

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
  log_info "Verifying installation..."

  # ─── Raw loader (exactly how the launcher invokes it) ────────────
  local raw
  raw="$(env -u LD_PRELOAD MUSL_ON_TERMUX=1 "$MUSL_LOADER" \
      --library-path "$MUSL_RUNTIME_DIR" \
      "$CLAUDE_BIN" --version 2>&1 || true)"
  [[ "$raw" == *"Claude Code"* ]] \
    || die "Raw loader failed to execute. Output: $raw"
  log_ok "Raw loader OK: $raw"

  # ─── Launcher (must work end-to-end) ─────────────────────────────
  local via
  via="$("$LAUNCHER_PATH" --version 2>&1 || true)"
  [[ "$via" == *"Claude Code"* ]] \
    || die "Launcher failed. Output: $via"
  log_ok "Launcher OK: $via"

  # ─── Helper scripts present and executable ───────────────────────
  [[ -x "$CLAUDE_FIX_PATH"       ]] || die "claude-fix not executable"
  [[ -x "$CLAUDE_UPDATE_PATH"    ]] || die "claude-update not executable"
  [[ -x "$CLAUDE_UNINSTALL_PATH" ]] || die "claude-uninstall not executable"
  log_ok "Helper scripts OK"

  # ─── resolv.conf ready for runtime DNS ───────────────────────────
  [[ -s "$MUSL_RESOLV_CONF" ]] \
    || die "resolv.conf missing or empty: $MUSL_RESOLV_CONF"
  log_ok "resolv.conf OK ($MUSL_RESOLV_CONF)"
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

  ${C_BLD}Environment${C_RST}
    MUSL_ON_TERMUX      Already set to 1 inside the launcher (no action needed)
    DNS resolv.conf     ${C_CYN}${MUSL_RESOLV_CONF}${C_RST}

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
  # Safety: refuse to operate outside of a Termux prefix.
  case "$PREFIX" in
    */com.termux/files/usr) ;;
    *)
      die "Refusing to uninstall: PREFIX=$PREFIX does not look like Termux.
This safeguard prevents accidental damage on non-Termux systems."
      ;;
  esac

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
  binary from npm, downloads the patched musl runtime from
  github.com/Ryovx/Musl-on-Termux (SHA256-verified), and creates a
  launcher at $PREFIX/bin/claude that runs the binary with the
  correct loader, LD_PRELOAD unset, and MUSL_ON_TERMUX=1.

  The patched musl loader reads $PREFIX/etc/resolv.conf and falls
  back to 1.1.1.1 → 8.8.8.8 → 127.0.0.1 when no nameserver is set.

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
  cleanup_previous "$FORCE"
  install_musl_runtime "$FORCE"
  ensure_resolv_conf
  install_claude_binary "$FORCE"
  create_launcher_template
  install_helper_scripts
  install_launcher
  verify_installation
  print_summary
}

main "$@"
