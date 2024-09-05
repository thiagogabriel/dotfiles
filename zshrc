# load custom executable functions
for function in ~/.zsh/functions/*; do
  source $function
done

# extra files in ~/.zsh/configs/pre , ~/.zsh/configs , and ~/.zsh/configs/post
# these are loaded first, second, and third, respectively.
_load_settings() {
  _dir="$1"
  if [ -d "$_dir" ]; then
    if [ -d "$_dir/pre" ]; then
      for config in "$_dir"/pre/**/*~*.zwc(N-.); do
        . $config
      done
    fi

    for config in "$_dir"/**/*(N-.); do
      case "$config" in
        "$_dir"/(pre|post)/*|*.zwc)
          :
          ;;
        *)
          . $config
          ;;
      esac
    done

    if [ -d "$_dir/post" ]; then
      for config in "$_dir"/post/**/*~*.zwc(N-.); do
        . $config
      done
    fi
  fi
}
_load_settings "$HOME/.zsh/configs"

source /usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source /usr/share/zsh-history-substring-search/zsh-history-substring-search.zsh
source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Local config
source ~/.zshenv
# source $HOME/.asdf/asdf.sh
eval "$(~/.rbenv/bin/rbenv init - zsh)"

export EDITOR="nvim"
export VISUAL="nvim"

# Run processes like rails server, postgres, sidekiq
alias dup='docker-compose up'

alias ls='eza -lh --group-directories-first --icons'
alias lt='eza --tree --level=2 --long --icons --git'
alias ff="fzf --preview 'batcat --style=numbers --color=always {}'"
alias bat='batcat'
eval "$(zoxide init bash)"

# pyenv
# export PYENV_ROOT="$HOME/.pyenv"
# [[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
# eval "$(pyenv init -)"

export PATH="$HOME/.bin:$PATH"

# volta
export VOLTA_HOME="$HOME/.volta"
export PATH="$VOLTA_HOME/bin:$PATH"

# Hubstaff
export DISABLE_SIMPLECOV=1
export OPENSSL_CONF=/etc/ssl
export PATH="${KREW_ROOT:-$HOME/.krew}/bin:$PATH"
export VITE_RUBY_HOST=localhost

export BROWSER=wslview

# mkdir .git/safe in the root of repositories you trust
PATH=".git/safe/../../bin:$PATH"

export LC_COLLATE="en_US.UTF-8"
export LC_CTYPE="en_US.UTF-8"
export LC_MESSAGES="en_US.UTF-8"
export LC_MONETARY="pt_BR.UTF-8"
export LC_NUMERIC="pt_BR.UTF-8"
export LC_TIME="pt_BR.UTF-8"
export LC_ALL="en_US.UTF-8"

export -U PATH

# aliases
[[ -f ~/.aliases ]] && source ~/.aliases

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

export PATH="$HOME/.sre-toolkit/bin:$PATH"

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('$HOME/miniconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "$HOME/miniconda3/etc/profile.d/conda.sh" ]; then
    . "$HOME/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="$HOME/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<
