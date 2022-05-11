# --- proxy command時にtmuxでおかしな処理になるので追加 ---
# reference: https://memo.xight.org/2017-02-11-://memo.xight.org/2017-02-11-1 
if status --is-interactive
  # theme
  omf theme agnoster

  # vi の挙動に
  fish_vi_key_bindings
  
  # PATH
  set PATH ~/.nodenv/shims $PATH
  set PATH ~/.pyenv/shims $PATH
  set PATH ~/.goenv/shims $PATH
  set PATH ~/.local/bin $PATH
  set PATH ~/bin $PATH

  # kube
  set -x KUBECONFIG ~/.kube/config

  # llvm
  set PATH /usr/local/opt/llvm/bin $PATH

  # go
  set GOPATH ~/go $GOPATH
  set PATH ~/go/bin $PATH

  # Google Cloud SDK.
  # if [ -f '/Users/shota/google-cloud-sdk/path.fish.inc' ]; . '/Users/shota/google-cloud-sdk/path.fish.inc'; end
 
  # 起動時にtmuxを起動
  if status --is-login
    if which tmux > /dev/null
      if [ -z $TMUX ]
        eval "tmux new-session"
      end
    end
  end
  eval "tmux source ~/mac_setup/settings/.tmux.conf"

  # --- alias start ---
  # git 
  alias g="git"
  alias gd="git diff"
  alias ga="git add -A"
  alias gcm="git commit -m"
  alias gp="git push"
  alias gb="git branch"
  alias gcob="git checkout -b"
  alias gco="git checkout"

  # docker
  alias dr="sh ~/docker_command.sh"
  alias dcdu="docker compose down; docker compose up"
  alias dsrs="docker-sync stop; docker-sync start"
  alias docker_all_image_rmi="docker images -aq | xargs docker rmi -f"
  alias docker_all_container_rmi="docker ps -aq | xargs docker rm -f"

  # kubernetes
  alias k="kubectl"
  alias kc="kubectx"
  alias kn="kubens"

  # vim
  alias vim="vim -u ~/mac_setup/settings/.vimrc"
  alias vi="vim -u ~/mac_setup/settings/.vimrc"

  # genaral
  alias bd="cd ../"
  alias rm="trash"
  # --- alias end ---

# --- proxy command時にtmuxでおかしな処理になるので追加 end ---
end

