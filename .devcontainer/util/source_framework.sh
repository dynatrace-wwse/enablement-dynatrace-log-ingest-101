#!/bin/sh
# Versioned framework pull mechanism — POSIX-compatible (sourced from zsh and bash)
# sync push-update updates the FRAMEWORK_VERSION line only.

# Framework version pin — sync push-update updates this line
FRAMEWORK_VERSION="${FRAMEWORK_VERSION:-rfe/versioned-library-extraction}"

REPO_PATH="$(pwd)"
RepositoryName="$(basename "$REPO_PATH")"
FRAMEWORK_CACHE="${HOME}/.cache/dt-framework/${FRAMEWORK_VERSION}"
FRAMEWORK_APPS_PATH="${FRAMEWORK_CACHE}/.devcontainer/apps"
export REPO_PATH RepositoryName FRAMEWORK_CACHE FRAMEWORK_APPS_PATH

# Pull versioned library if not cached (.complete sentinel = successful clone)
if [ ! -f "${FRAMEWORK_CACHE}/.complete" ]; then
  echo "⬇️  Pulling framework v${FRAMEWORK_VERSION}..."
  if ! (
    git clone --depth 1 --filter=blob:none --sparse \
      -b "${FRAMEWORK_VERSION}" \
      https://github.com/dynatrace-wwse/codespaces-framework.git \
      "${FRAMEWORK_CACHE}" 2>/dev/null && \
    cd "${FRAMEWORK_CACHE}" && \
    git sparse-checkout set \
      .devcontainer/util \
      .devcontainer/p10k \
      .devcontainer/test \
      .devcontainer/apps && \
    touch "${FRAMEWORK_CACHE}/.complete"
  ); then
    echo "❌ Failed to pull framework v${FRAMEWORK_VERSION} — check network and retry"
    return 1 2>/dev/null || exit 1
  fi
fi

# Shell config (idempotent; overwrites image defaults with versioned config)
if ! cp -f "${FRAMEWORK_CACHE}/.devcontainer/p10k/.p10k.zsh" "${HOME}/.p10k.zsh" 2>/dev/null || \
   ! cp -f "${FRAMEWORK_CACHE}/.devcontainer/p10k/.zshrc" "${HOME}/.zshrc" 2>/dev/null; then
  echo "⚠️  Could not copy p10k config — shell prompt may not display correctly"
fi

# Source framework (functions only — greeting is called by post-create.sh, not on every source)
. "${FRAMEWORK_CACHE}/.devcontainer/util/variables.sh"
. "${FRAMEWORK_CACHE}/.devcontainer/util/functions.sh"

# my_functions.sh: repo override if present, else framework stub
if [ -f "${REPO_PATH}/.devcontainer/util/my_functions.sh" ]; then
  . "${REPO_PATH}/.devcontainer/util/my_functions.sh"
else
  . "${FRAMEWORK_CACHE}/.devcontainer/util/my_functions.sh"
fi
