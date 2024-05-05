# 文字コードをセット
export LANG=ja_JP.UTF-8
export KCODE=u

# 補完機能を有効化
autoload -Uz compinit
compinit

# 色を有効化
autoload -Uz colors
colors

# テーマの有効化（今使っていない）
autoload -Uz promptinit
promptinit


# プロンプトの形式
PROMPT="%F{green}[%m@%1d]%f %# "

### プロンプトの履歴系
HISTSIZE=10000
SAVEHIST=10000
HISTFILE=~/.zsh_history
setopt sharehistory # 複数のzshで履歴共有
setopt hist_ignore_dups # 直前と同じコマンドは履歴に残さない
setopt hist_ignore_all_dups # 重複コマンドは古いほうを削除
setopt append_history # 履歴ファイルを上書きせず追加する（複数端末利用時に便利）
setopt extended_history   # ヒストリに実行時間も保存する

bindkey '^r' history-incremental-pattern-search-backward # ctrl+r
bindkey '^s' history-incremental-pattern-search-forward # ctrl+s


### 補完系
# コマンドラインの引数で --prefix=/usr などの = 以降でも補完できる
setopt magic_equal_subst
# Tab、矢印キーなどを使って補完候補を視覚的に選択できるようになる
zstyle ':completion:*' menu select=2
zstyle ':completion:*' use-cache true # キャッシュを使って高速化


### 色系
### Ls Color ###
# 色の設定
export LSCOLORS=Exfxcxdxbxegedabagacad
# 補完時の色の設定
export LS_COLORS='di=01;34:ln=01;35:so=01;32:ex=01;31:bd=46;34:cd=43;34:su=41;30:sg=46;30:tw=42;30:ow=43;30'
# ZLS_COLORSとは？
export ZLS_COLORS=$LS_COLORS
# lsコマンド時、自動で色がつく(ls -Gのようなもの？)
export CLICOLOR=true
# 補完候補に色を付ける
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
# lsコマンドに色を付ける
alias ls="ls -F --color=auto"



### その他
setopt no_beep # ビープ音なし
setopt nocorrect # コマンドのスペルを訂正しない
setopt notify # バックグラウンドジョブの状態変化を通知
# setopt no_flow_control


# zstyle ':completion:*:default' menu select=2
# zstyle ':completion:*' auto-description 'specify: %d'
# zstyle ':completion:*' completer _expand _complete _correct _approximate
# zstyle ':completion:*' format 'Completing %d'
# zstyle ':completion:*' group-name ''
# eval "$(dircolors -b)"
# zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
# zstyle ':completion:*' list-colors ''
# zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
# zstyle ':completion:*' matcher-list '' 'm:{a-z}={A-Z}' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=* l:|=*'
# zstyle ':completion:*' menu select=long
# zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
# zstyle ':completion:*' use-compctl false
# zstyle ':completion:*' verbose true

# zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;31'
# zstyle ':completion:*:kill:*' command 'ps -u $USER -o pid,%cpu,tty,cputime,cmd'

# # git
# autoload -Uz vcs_info
# setopt prompt_subst
# zstyle ':vcs_info:git:*' check-for-changes true
# zstyle ':vcs_info:git:*' stagedstr "%F{yellow}!"
# zstyle ':vcs_info:git:*' unstagedstr "%F{red}+"
# zstyle ':vcs_info:*' formats "%F{green}%c%u[%b]%f"
# zstyle ':vcs_info:*' actionformats '[%b|%a]'
# precmd () { vcs_info }

# PROMPT="%F{green}[%m@%1d]%f"\$vcs_info_msg_0_" %# "