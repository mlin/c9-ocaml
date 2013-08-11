#!/bin/bash -e
# Install OCaml and OPAM inside a Cloud9 IDE workspace.
# Run this script inside the workspace terminal, then eval $(opam config env)

OCAML_URL=http://caml.inria.fr/pub/distrib/ocaml-4.00/ocaml-4.00.1.tar.gz

# create a scratch directory
D=$(mktemp -d c9-ocaml-XXX)
pushd $D

# download & extract OCaml
wget $OCAML_URL
tar zxf ocaml-*tar.gz
rm ocaml-*.tar.gz
cd ocaml-*

# build bytecode ocaml and camlp4 and install to $HOME
./configure -no-graph -no-tk -no-curses -prefix $HOME
make world
make install

# build & install native-code ocaml (but not native-code camlp4, which doesn't
# build inside the c9 workspace for unknown reasons, perhaps RAM limits?)
./configure -no-camlp4 -no-graph -no-tk -no-curses -prefix $HOME
make world.opt
make install

# download & install opam
wget http://www.ocamlpro.com/pub/opam_installer.sh
yes '' | sh ./opam_installer.sh $HOME/bin system

# clean up
popd
rm -rf $D
