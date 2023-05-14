set -exo pipefail

# -- Input -- #

# -- Constants -- #
HUGO_THEME_DIR="themes/ahmt-me-cupper"
WORKING_DIR=$(pwd)
TAILWIND_BUILD="tailwindcss-linux-x64"
TAILWIND_VER="latest"
TAILWIND_INPUT="assets/css/template-styles.css"
TAILWIND_OUTPUT="assets/css/main.css"

# -- Install Tailwindcss -- #
curl -sLO "https://github.com/tailwindlabs/tailwindcss/releases/${TAILWIND_VER}/download/${TAILWIND_BUILD}"
chmod +x ${TAILWIND_BUILD}

# -- Build css with  Tailwindcss -- #
$(cd ${HUGO_THEME_DIR} && ${WORKING_DIR}/${TAILWIND_BUILD} -i ${TAILWIND_INPUT} -o ${TAILWIND_OUTPUT})
