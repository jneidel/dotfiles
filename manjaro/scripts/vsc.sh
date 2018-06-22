echo "##### install vsc extensions #####";

mkdir -p ~/.vscode;
scp u:/home/jneidel/.config/vsc-extensions.tar.gz ~/.vscode/extensions.tar.gz;
tar xzf extensions.tar.gz;
rm extensions.tar.gz;

