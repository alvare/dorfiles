alias python4="ghci"
alias g="git"
alias bc="bc -l"
alias myip="dig +short myip.opendns.com @resolver1.opendns.com"
alias ls='ls -F --color=auto'
alias ll='ls -alFh'
alias lll='ls -alFh | lolcat -t'
alias la='ls -A'
alias l='ls'
alias rg='rg -S -M200'
alias whatismyip='wget http://ipinfo.io/ip -qO -'
alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
alias youtube-mp3='youtube-dl -x --audio-format mp3 -o "%(title)s.%(ext)s"'
alias vim='nvim'

function unmv {
    mv $2 $1
}

function man() {
    env \
        LESS_TERMCAP_mb=$(printf "\e[1;31m") \
        LESS_TERMCAP_md=$(printf "\e[1;31m") \
        LESS_TERMCAP_me=$(printf "\e[0m") \
        LESS_TERMCAP_se=$(printf "\e[0m") \
        LESS_TERMCAP_so=$(printf "\e[0;44;33m") \
        LESS_TERMCAP_ue=$(printf "\e[0m") \
        LESS_TERMCAP_us=$(printf "\e[0;32m") \
            man "$@"
}

function playmidi {

    SOUNDFONT='/Users/clrnd/Files/GeneralUser GS 1.44 FluidSynth/GeneralUser GS FluidSynth v1.44.sf2'

    if [ -e "$SOUNDFONT" ]
    then

        for i in "$@"
        do
            if [ -e "$i" ]
            then
                (fluidsynth -i "$SOUNDFONT" "$i"  2>&1) >/dev/null
            else
                echo "[playmidi]: cannot find file at $i"
                return 1
            fi
        done
    else
            echo "[playmidi]: SOUNDFONT file not found at $SOUNDFONT"
            return 1
    fi
}

function frameworkpython3 {
    if [[ ! -z "$VIRTUAL_ENV" ]]; then
        PYTHONHOME=$VIRTUAL_ENV /usr/local/bin/python3 "$@"
    else
        /usr/local/bin/python3 "$@"
    fi
}

function frameworkpython {
    if [[ ! -z "$VIRTUAL_ENV" ]]; then
        PYTHONHOME=$VIRTUAL_ENV /usr/local/bin/python "$@"
    else
        /usr/local/bin/python "$@"
    fi
}

# gitignore.io
function gitignore() { curl -L -s https://www.gitignore.io/api/$@ ;}
