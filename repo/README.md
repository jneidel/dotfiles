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

`mappings` is a grouped list of configuration files. They are usually grouped by
a program (e.g. vims config files). In `used-groups` you have a list of the
active groups. Only the configuration for those active ones will be
imported/exported using `make import` or `make export`.

The same thing applied to `app-groups`. App packages names are grouped and only
installed on `make install` if that group is in the `used-groups`.
