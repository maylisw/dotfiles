#!/bin/bash

tmux_color_dir="tmux"
mkdir -p "${tmux_color_dir}"

# nightfox & friends
for theme in {night,day,dawn,dusk,nord,tera,carbon}fox; do
    if [ ! -f "${tmux_color_dir}/${theme}.tmux" ]; then
        tmux_url="https://github.com/edeneast/nightfox.nvim/raw/main/extra/${theme}/${theme}.tmux"
        (cd "${tmux_color_dir}" && curl --fail --silent --show-error --location "${tmux_url}" --remote-name)
    fi
done
