#!/bin/bash

fonts_dir="fonts"
mkdir -p "${fonts_dir}"

function download() {
    local font="${1}"
    local url="${2}"
    curl --silent --show-error --location "${url}" --output "${fonts_dir}/${font}.zip"
    if [ $? -eq 0 ]; then
        echo "Installed ${font} iterm theme"
    else
        echo "Error installing ${font} from ${url}"
    fi
}

fonts=(
    "https://github.com/ryanoasis/nerd-fonts/releases/download/v3.2.1/Meslo.zip" # MesloLGS NerdFont
    "https://github.com/ryanoasis/nerd-fonts/releases/download/v3.2.1/Monaspace.zip"
)

# todo: actually automate installation
for f_url in "${fonts[@]}"; do
    echo "Please install font from ${f_url}"
done
