# opds

Book catalog system used (among others) by FBReader (network library).

## [sopds](https://github.com/mitshel/sopds)

[Install as described](https://github.com/mitshel/sopds#1-simple-installation-of-simpleopds-by-using-sqlite3-database):

```sh
git clone https://github.com/mitshel/sopds.git
cd sopds

python3 -m pip install --user -r requirements.txt

python3 manage.py migrate
python3 manage.py sopds_util clear

python3 manage.py createsuperuser
# user details

python3 manage.py sopds_util setconf SOPDS_ROOT_LIB 'Path to the directory with books' # insert book dir path
python3 manage.py sopds_util setconf SOPDS_LANGUAGE en-US

# start server
python3 manage.py sopds_server start --port PORT
python3 manage.py sopds_server start --port PORT --daemon

# start scanner, configure scanner schedule in /admin/constance/config/ at 4. Scanner Schedule
python3 manage.py sopds_scanner start
python3 manage.py sopds_scanner start --daemon
```
