### All these scripts are about changes to local user profile. There is nothing system-wide that they will change or affect.

# Linux/Unix

## install_export_vars.sh
It will install a line in .profile/.bash_profile (or where it finds it appropriate for your system) to read entries from '~/.config/shell-vars/user_shell_paths' and add them to user's 'PATH' at login.

**NOTE:** Used without arguments it will only print information about changes to be done and current status.

Use with '-i' argument to actually install changes to local user profile:
```
install_export_vars.sh -i
```

## shellpath
Add/remove entries from 'user_shell_paths' configuration file. Commands: `add`,`rm`,`ls`,`clean`.

### Usage
```
    Add item: shellpath add DIR_PATH
 Remove item: shellpath rm DIR_PATH
  List items: shellpath ls

Remove deleted directories and invalid items from config file:
              shellpath clean

DIR_PATH can be relative, i.e. '.' (current directory)
```

## export_vars
For immediate addition of entries from 'user_shell_paths' to 'PATH' variable. Will skip items already in 'PATH', so it can be invoked multiple times from multiple places safely.

Run from command line with a dot:
```
. export_vars
```

# Windows

## shellpath.ps1
Add/remove entries from PATH environment variable in user's scope. Commands: `add`,`rm`,`ls`,`clean`.

There is no other scripts or config files for Windows. Changes to local user's 'PATH' variable are immediate and permanent.

### Usage
After download, double-click on `install_path.bat` from Explorer, or run this in PowerShell terminal in directory where you placed it: `.\shellpath.ps1 add .`.

Script will add its own directory to 'PATH' and next time PowerShell or CMD terminal is open, it will be available for use from command line.
```
C:\Users\TestUser>shellpath
Use commands: add <PATH>, rm <PATH>, clean, ls - PATH can be relative
```
