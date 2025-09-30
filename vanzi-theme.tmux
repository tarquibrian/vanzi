#!/usr/bin/env bash

export VANZI_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

bg_transparent="$(tmux show-option -gqv "@bg_transparent")"

main() {
  spacer=" "
  window_inner_spacer="."
  window_inner_separator="."
  variant="$(tmux show-option -gqv "@theme_variant")"
  padding=" "

  if [[ "$variant" == "ivory" ]]; then

    c_base="#fffff0"
    c_base_v="#f5f5f5"
    c_text_l="#737373"
    c_text_m="#414141"
    c_text_h="#000000"
    c_punk_main="#ef6461"
    c_punk_v="#401a23"
    c_orange_m="#fcA311"
    c_green_m="#35ce8d"
    c_cyan_m="#77cbb9"

  elif [[ "$variant" == "vanzi" ]]; then

    c_base="#000000"
    c_base_v="#242424"
    c_text_l="#b9b9b9"
    c_text_m="#d7d7d7"
    c_text_h="#ffffff"
    c_punk_main="#f26286"
    c_punk_v="#3B2B2F"
    c_orange_m="#fcA311"
    c_green_m="#35ce8d"
    c_cyan_m="#77cbb9"

  fi

  if [[ "$bg_transparent" == "on" ]]; then
    tmux set -g status-bg default
  fi

  tmux set -g status-fg "$c_text_m"
  tmux set -g status-bg "$c_base"

  # Messages
  tmux set message-style "fg=$c_text_l,bg=$c_base"
  tmux set message-command-style "fg=$c_text_l,bg=$c_base"

  # Pane styling
  tmux set pane-border-style "fg=blue"
  tmux set pane-active-border-style "fg=red"
  tmux set display-panes-active-colour "yellow"
  tmux set display-panes-colour "yellow"

  # Windows
  tmux set -g window-status-style "fg=$c_text_m,bg=$c_punk_v"
  tmux set -g window-status-current-style "fg=$c_base,bg=$c_punk_main"
  tmux set -g window-status-activity-style "fg=$c_text_m,bg=$c_base"

  # Format
  tmux set -g status-left "$padding#[fg=$c_text_l]󰉖 #[fg=$c_text_h]#S#[fg=$c_text_m]  $padding"
  tmux set -g window-status-format "$padding#[]#I#[]$window_inner_separator#[]#W$padding"
  tmux set -g window-status-current-format "$padding#[]#I#[]$window_inner_separator#[]#W$padding"
  tmux set -g status-right "#[fg=$c_text_l]  %H:%M #[fg=$c_text_l]  %Y-%m-%d"
}

main "$@"
