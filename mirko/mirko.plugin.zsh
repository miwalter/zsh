alias jum="ssh root@jum.ddns.net -p666"
alias -s log="less -MN"
alias -g gp='| grep -i'

function prompt_sorin_pwd {
  local abbreviated_pwd
  local -a split_pwd
  local -a truncated_pwd
  local joined_pwd
  local absolute_pwd

  abbreviated_pwd=${PWD/#$HOME/\~}
  split_pwd=(${(s:/:)abbreviated_pwd})
  truncated_pwd=(${${(M)split_pwd##.#?}[1,-2]} $split_pwd[-1])
  joined_pwd=${(j:/:)truncated_pwd}
  absolute_pwd=${${joined_pwd}/#(#b)([^~\/])/\/$match[1]}
  _prompt_sorin_pwd=${absolute_pwd}
}

