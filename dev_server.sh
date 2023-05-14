#!/bin/bash

set -euxo pipefail

# Once hugo provides a better way, this script can annihilate itself.
# https://github.com/gohugoio/hugo/issues/8343

$(cd themes/ahmt-me-cupper && tailwindcss -i assets/css/template-styles.css -o assets/css/main.css --watch) &

hugo server -e dev
