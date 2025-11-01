# StuVe Newsletter Template
A patchwork template for a newsletter with some utilities to compile a structure of markdown files to a unified, email-ready, html file.

## Usage
Place any content in the `content` directory of this repository.
- `content/main` holds content for the main feed
- `content/events` holds content for the side feed (mostly upcoming events)
- `content/en/main` may hold an internationalized (i.e. english) version of the main feed
- `content/en/events` may hold and internationalized (i.e. english) version of the side feed

To compile the content into an html newsletter we suggest you use `nix-shell` to enter a shell with nodejs and all packages installed.
**Alternatively**, you can install nodejs on your machine, enter the `utils` directory, execute `npm i` and come back to the root directory.

Which ever path you take, compilation is just a matter of executing
```shell
sh compile.sh
```
