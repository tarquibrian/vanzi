#!/usr/bin/env bash

# Lee la variante (por defecto "dark")
variant="$(tmux show-option -gqv "@theme_variant")"
if [ -z "$variant" ]; then
  variant="dark"
fi

if [ "$variant" = "light" ]; then
  bg="white"
  fg="black"
else
  bg="black"
  fg="white"
fi

# Aplica la configuración
tmux set -g status-bg "$bg"
tmux set -g status-fg "$fg"
