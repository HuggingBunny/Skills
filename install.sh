#!/usr/bin/env bash
set -euo pipefail

# HuggingBunny/Skills - Universal Agent Skill Installer
# Installs CLI scripts to ~/.local/bin and symlinks skills into detected agent environments.

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
SKILLS_DIR="${SCRIPT_DIR}/skills"
BIN_DEST="${HOME}/.local/bin"

mkdir -p "${BIN_DEST}"

echo "=== Universal Agent Skills Installer ==="

install_skill() {
    local skill_path="$1"
    local skill_name
    skill_name="$(basename "${skill_path}")"
    echo ""
    echo "Installing skill: ${skill_name}"

    # 1. Run local installer if present
    if [[ -f "${skill_path}/install.sh" ]]; then
        bash "${skill_path}/install.sh"
    elif [[ -d "${skill_path}/scripts" ]]; then
        for script in "${skill_path}/scripts/"*; do
            if [[ -f "${script}" ]]; then
                chmod +x "${script}"
                cp "${script}" "${BIN_DEST}/"
                echo "✓ Installed $(basename "${script}") to ${BIN_DEST}/"
            fi
        done
    fi
}

TARGET="${1:-all}"

if [[ "${TARGET}" == "all" ]]; then
    echo "Installing all skills found in ${SKILLS_DIR}..."
    while IFS= read -r -d '' skill_dir; do
        install_skill "${skill_dir}"
    done < <(find "${SKILLS_DIR}" -mindepth 2 -maxdepth 2 -type d -print0)
else
    # Find matching skill folder
    found="$(find "${SKILLS_DIR}" -mindepth 2 -maxdepth 2 -type d -name "*${TARGET}*" | head -n 1 || true)"
    if [[ -n "${found}" ]]; then
        install_skill "${found}"
    else
        echo "✗ Skill '${TARGET}' not found in ${SKILLS_DIR}."
        exit 1
    fi
fi

echo ""
echo "=== All installations completed successfully ==="
