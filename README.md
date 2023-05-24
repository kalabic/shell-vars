**NOTE:** All these scripts are about changes to local user profile. There is nothing system-wide that they will change or affect.

# install_export_vars.sh
It will install a line in .profile/.bash_profile (or where it finds it appropriate for your system) to read entries from '~/.config/shell-vars/user_shell_paths' and add them to user's 'PATH' at login.

**NOTE:** Used without arguments it will only print information about changes to be done and current status.

Use with '-i' argument to actually install changes to local user profile:
```
install_export_vars.sh -i
```

# export_vars
For immediate addition of entries from 'user_shell_paths' to 'PATH' variable. Will skip items already in 'PATH', so it can be invoked multiple times from multiple places safely.

Run from command line with a dot: `. export_vars`

# shellpath
Add/remove entries from 'user_shell_paths' configuration file. Commands: `add`,`rm`,`ls`,`clean`.

## Usage
```
    Add item: shellpath add DIR_PATH
 Remove item: shellpath rm DIR_PATH
  List items: shellpath ls

Remove deleted directories and invalid items from config file:
              shellpath clean

DIR_PATH can be relative, i.e. '.' (current directory)
```
