c9-ocaml
========

This repo contains a script to install [OCaml](http://ocaml.org/) and [OPAM](http://opam.ocamlpro.com/) inside [Cloud9 IDE](https://c9.io/) workspaces, to enable collaborative editing, building, and testing of OCaml programs "in the cloud."

In any workspace, enter into the terminal pane:

````
curl -L https://raw.github.com/mlin/c9-ocaml/master/c9-ocaml.sh | bash -ex
eval $(opam config env)
````

The OCaml toolchain and OPAM will then be ready for use!
