{
  programs.tmux = {
    enable = true;
    extraConfig = ''
unbind r
bind r source-file ~/.tmux.conf \;display-message "config reloaded!"

set -g prefix C-s
# close window
bind q killp

# Start windows and panes at 1, not 0
set -g base-index 1
set -g pane-base-index 1
set-window-option -g pane-base-index 1
set-option -g renumber-windows on

bind '"' split-window -v -c "#{pane_current_path}"
bind % split-window -h -c "#{pane_current_path}"

# Allows for faster key repetition
set -s escape-time 0

set -g mouse on
set -g renumber-windows on
setw -g mode-keys vi

# navigate window
bind-key h select-pane -L
bind-key j select-pane -D
bind-key k select-pane -U
bind-key l select-pane -R

# status position
set-option -g status-position top

# List of plugins
set -g @plugin 'tmux-plugins/tpm'
set -g @plugin 'tmux-plugins/tmux-sensible'
set -g @plugin 'tmux-plugins/tmux-yank'
set -g @plugin 'wfxr/tmux-fzf-url'
set -g @plugin 'omerxx/tmux-sessionx' # add new
# THEME
set -g @plugin "janoamaral/tokyo-night-tmux"
set -g @tokyo-night-tmux_window_id_style digital
set -g @tokyo-night-tmux_pane_id_style hsquare
set -g @tokyo-night-tmux_zoom_id_style dsquare
set -g @tokyo-night-tmux_show_datetime 0
set -g @tokyo-night-tmux_date_format DMY
set -g @tokyo-night-tmux_time_format 24H

# Initialize TMUX plugin manager (keep this line at the very bottom of tmux.conf)
run '~/.tmux/plugins/tpm/tpm'
'';
  };
}
