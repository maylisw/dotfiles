#!/bin/bash

terminal_color_dir="itermcolors"
mkdir -p "${terminal_color_dir}"

tmux_color_dir="tmux"
mkdir -p "${tmux_color_dir}"

function download() {
    local dir="${1}"
    local theme="${2}"
    local url="${3}"
    curl --silent --show-error --location "${url}" --output-dir "${dir}" --remote-name
    if [ $? -eq 0 ]; then
        echo "Installed ${theme} theme to ${dir}"
    else
        echo "Error installing ${theme} from ${url}"
    fi
}

# nightfox & friends
for theme in {night,day,dawn,dusk,nord,tera,carbon}fox; do
    if [ ! -f "${terminal_color_dir}/${theme}.itermcolors" ]; then
        iterm_url="https://github.com/edeneast/nightfox.nvim/raw/main/extra/${theme}/${theme}.itermcolors"
        download "${terminal_color_dir}" "${theme}" "${iterm_url}"
    fi
    if [ ! -f "${tmux_color_dir}/${theme}.tmux" ]; then
        tmux_url="https://github.com/edeneast/nightfox.nvim/raw/main/extra/${theme}/${theme}.tmux"
        download "${tmux_color_dir}" "${theme}" "${tmux_url}"
    fi
done

# solarized iterm
for theme in Solarized%20{Light,Dark}; do
    if [ ! -f "${terminal_color_dir}/${theme}.itermcolors" ]; then
        url="https://github.com/altercation/solarized/raw/master/iterm2-colors-solarized/${theme}.itermcolors"
        download "${terminal_color_dir}" "${theme}" "${url}"
    fi
done

