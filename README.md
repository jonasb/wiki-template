## Setup

On OS X, run `brew install watchman`. If not using VS Code, run `./script/update.sh && ./script/auto-update.sh` to keep the wiki up to date.

For VS Code, enable tasks to autorun: `Tasks: Manage Automatic Tasks in Folder` -> `Allow Automatic Tasks in Folder`. VS Code is configured to automatically save files (after 15 mins).

In order to start the wiki in VS Code from anywhere in the terminal add this function to your shell's config file:

```bash
function wiki() {
  code ~/path/to/wiki/
}
```
