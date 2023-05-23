# install_export_vars.sh
It will install a line in .profile/.bash_profile (or where it finds it appropriate for your system) to read entries from '~/.config/shell-vars/user_shell_paths' and add them to user's 'PATH' at login.

# export_vars
For immediate addition of entries from 'user_shell_paths' to 'PATH' variable. Will skip items already in 'PATH', so it can be invoked multiple times from multiple places safely.

Run from command line with a dot: `. export_vars`

# shellpath
Add/remove entries from 'user_shell_paths' configuration file.

Usage: `shellpath add DIR_PATH`, `shellpath rm DIR_PATH`, `shellpath clean` - DIR_PATH can be relative, i.e. '.' (current directory)
