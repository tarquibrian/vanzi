#!/usr/bin/env bash

export VANZI_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

set() {
  tmux set-option -gq "$1" "$2"
}

setw() {
  tmux set-window-option -gq "$1" "$2"
}

main() {
  padding=" "
  window_inner_separator="."
  variant="$(tmux show-option -gqv "@theme_variant")"
  bg_transparency="$(tmux show-option -gqv "@bg_transparency")"
  active_border="$(tmux show-option -gqv "@active_border")"

  if [[ "$variant" == "ivory" ]]; then

    c_base="#fffafa"
    c_base_v="#f5f5f5"
    c_text_l="#797373"
    c_text_m="#414141"
    c_text_h="#000000"
    c_punk_main="#ef6461"
    c_punk_v="#ececec"
    c_border_l="#d2d2d2"
    c_border_m="#bebebe"
    c_border_h="#bebebe"

  elif [[ "$variant" == "vanzi" ]]; then

    c_base="#000000"
    c_base_v="#0e0e0e"
    c_text_l="#b9b9b9"
    c_text_m="#d7d7d7"
    c_text_h="#f7f7f7"
    c_punk_main="#f26286"
    c_punk_v="#51333b"
    c_border_l="#d2d2d2"
    c_border_m="#393939"
    c_border_h="#393939"

  fi

  if [[ "$bg_transparency" == "on" ]]; then
    c_base="default"
  fi

  if [[ "$active_border" == "on" ]]; then
    c_border_h="#9a9a9a"
  fi

  # Status bar
  set "status" "on"
  set status-style "fg=$c_text_m,bg=$c_base"
  set status-left-length "200"
  set status-right-length "200"

  # Messages
  set mode-style "fg=$c_text_m,bg=$c_punk_v,bold"
  set message-style "fg=$c_text_l,bg=$c_base"
  set message-command-style "fg=$c_text_l,bg=$c_base"

  # Pane styling
  set pane-border-style "fg=$c_border_m"
  set pane-active-border-style "fg=$c_border_h"
  set display-panes-active-colour "$c_text_m"
  set display-panes-colour "$c_text_l"

  # Windows
  setw window-status-style "fg=$c_text_l,bg=$c_base_v"
  setw window-status-current-style "fg=$c_base_v,bg=$c_punk_main"
  setw window-status-activity-style "fg=$c_text_m,bg=$c_base"

  # Format
  set status-left "$padding#[fg=$c_text_l]󰉖 #[fg=$c_text_h]#S#[fg=$c_text_m]  $padding"
  set status-right "#[fg=$c_text_l]  %H:%M #[fg=$c_text_l]  %Y-%m-%d"
  setw window-status-format "$padding#[]#I#[]$window_inner_separator#[]#W$padding"
  setw window-status-current-format "$padding#[]#I#[]$window_inner_separator#[]#W$padding"
}

main "$@"
