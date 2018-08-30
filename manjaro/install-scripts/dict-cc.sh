echo "##### install dict-cc #####";

echo "get dump file";
scp k:/home/user/jneidel/.config/dict-cc-e6iia6.txt .;
echo "import dump";
cat dict-cc-e6iia6.txt | dict-cc-import e6iia6;
rm dict-cc-e6iia6.txt;

