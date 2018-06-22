echo "##### instal zeal docsets";

mkdir -p ~/.local/Zeal/Zeal;
scp u:/home/jneidel/.config/zeal-docsets.tar.gz ~/.local/Zeal/Zeal/docsets.tar.gz;
tar xzf docsets.tar.gz;
rm docsets.tar.gz;

