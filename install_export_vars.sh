#!/bin/sh

# install_export_vars.sh, v1.0
# It will install a line in .profile/.bash_profile (or where it finds it appropriate
# for your system) to read entries from '~/.config/shell-vars/user_shell_paths' and
# add them to user's $PATH at login.


# Do changes only if there is one argument and it is '-i', otherwise just print info and exit.
do_install=

if [ $# -eq 1 ] && [ "$1" = "-i" ]
then
  do_install="true"
fi


# Updated by 'update_shell_profile()'
profile_file=


# TODO: Support for more combinations of interactive/non-interactive, login/non-login shells.
# Links describing what problem is trying to be solved here:
# - https://stackoverflow.com/questions/9910966/how-to-get-shell-to-self-detect-using-zsh-or-bash
# - https://superuser.com/questions/636219/where-should-i-export-an-environment-variable-so-that-all-combinations-of-bash-d
# - https://superuser.com/questions/866683/iterm-zsh-not-reading-bashrc-or-bash-profile
# - https://unix.stackexchange.com/questions/4621/correctly-setting-environment
# And many more, you should get the idea now.
update_shell_profile_file()
{
  # TODO: This is obviously work in progress.

  profile_file=~/.profile
  if [ -f "$profile_file" ]
  then
    return 0
  fi

  profile_file=~/.bash_profile
  if [ -f "$profile_file" ]
  then
    return 0
  fi

  profile_file=~/.bash_profile
  if [ "$SHELL" = "/bin/bash" ]
  then
    return 0
  fi

  return 255
}


# Directory name of the script no matter where it is being called from.
# (see: https://stackoverflow.com/q/29832037/852428)
original_script_dir=$(CDPATH= cd -- "$(dirname -- "$0")" && pwd)
unsafe_script_dir=$original_script_dir


# Replace spaces with '\ ' character in our directory path.
script_dir=
while [ -n "${unsafe_script_dir}" ]; do
    character="$(printf '%c.' "${unsafe_script_dir}")"
    character="${character%.}"
    if [ "${character}" = " " ]
    then
      script_dir="${script_dir}\ "
    else
      script_dir="${script_dir}${character}"
    fi
    unsafe_script_dir="${unsafe_script_dir#?}"
done


profile_line=". $script_dir/bin/export_vars"
echo "Line to install: \"$profile_line\""

update_shell_profile_file

if [ "$profile_file" = "" ]
then
  echo "* "
  echo "* error: Unsupported shell. Don't know where to install 'export_vars' line."
  echo "* error: Please install line manually."
  echo "* "
else
  echo "   Profile file: $profile_file"

  if grep -qsFx "$profile_line" "$profile_file"
  then
    echo "         Status: Line already installed."
  elif ! [ -z $do_install ]
  then
    printf "\n# Following line was installed by 'install_export_vars.sh' script.\n%s\n" "$profile_line" >> "$profile_file"
    printf "Updated shell profile file: %s\n" "$profile_file" >> "$original_script_dir/install_log.txt"
    echo "         Status: Line installed."
  else
    echo "         Status: Line not installed."
  fi
fi


if ! [ -z $do_install ]
then
  # Add directory where 'shell-vars' scripts are located as first item in 'user_shell_paths',
  # so utils like 'shellpath' can be run from anywhere on next login.
  if ! "$original_script_dir/bin/shellpath" add "$original_script_dir/bin"
  then
    echo "error: adding own path failed."
    exit 1
  fi
else
  echo ""
  echo "Nothing was changed. Use '-i' argument to make changes."
fi
