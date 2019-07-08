echo "##### install dict-cc #####";

echo "get dump file"
# get the file from my server
scp k:/home/user/jneidel/.config/dict-cc-e6iia6.txt .
# everybody else needs to download it themselves: https://github.com/derhuerst/dict-cc-cli#building-the-dictionary

echo "import dump"
cat dict-cc-e6iia6.txt | sudo dict-cc-import e6iia6
#rm dict-cc-e6iia6.txt;

