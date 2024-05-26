# Repo management

## Usage

```sh
# import local configs -> repo
make import
make import-dry

# export repo configs -> local machine
make export
make export-dry

# install apps
make install
./repo/install-apps GROUP
```

## How it works

[`mappings`](./mappings) is a list of configuration files to be managed.
They are grouped by a program (i.e. `[vim]`).
Because we want to not always include all configured program groups we have
a [`used-groups`](./used-groups) file.
Only the groups specified in this file will be acted on during
import/export (`make import`/`make export`.)

The same princle applies to [`package-groups`](./package-groups).
These are the names of the packages (pacman, npm, etc.) that belong to a
program group.
With `make install` you can install all programs for active groups.
