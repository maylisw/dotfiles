#!/bin/bash

color_dir="itermcolors"
mkdir -p "${color_dir}"

function download() {
    local theme="${1}"
    local url="${2}"
    curl --silent --show-error --location "${url}" --output "${color_dir}/${theme}.itermcolors"
    if [ $? -eq 0 ]; then
        echo "Installed ${theme} iterm theme"
    else
        echo "Error installing ${theme} from ${url}"
    fi
}

# nightfox & friends
for theme in {night,day,dawn,dusk,nord,tera,carbon}fox; do
    if [ ! -f "${color_dir}/${theme}.itermcolors" ]; then
        url="https://github.com/edeneast/nightfox.nvim/raw/main/extra/${theme}/${theme}.itermcolors"
        download "${theme}" "${url}"
    fi
done

# solarized
for theme in Solarized%20{Light,Dark}; do
    if [ ! -f "${color_dir}/${theme}.itermcolors" ]; then
        url="https://github.com/altercation/solarized/raw/master/iterm2-colors-solarized/${theme}.itermcolors"
        download "${theme}" "${url}"
    fi
done
