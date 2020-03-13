# CalDAV

Sync your calendar between an phone and a computer.

## Software overview

This is what I use. Feel free to swap them out, especially the calendars are
very much personal preference.

**Server:**

- [Radicale](https://radicale.org/) - CalDAV server

**Android:**

- [DAVx⁵](https://f-droid.org/packages/at.bitfire.davdroid/) - CalDAV client
- [Simple Calendar](https://f-droid.org/packages/com.simplemobiletools.calendar.pro/) - Calendar

**Linux:**

- [vdirsyncer](https://www.archlinux.org/packages/community/any/vdirsyncer/) - CalDAV client
- [khal](https://www.archlinux.org/packages/community/any/khal/) - Calendar

## Setup the software

### Radicale

[Install as described](https://radicale.org/tutorial/) and run with `python3 -m
radicale --config "<path>/config"
--storage-filesystem-folder=<path>/collections --debug`.

`config` file:
```
[server]
hosts = <ip>:<port>
max_connections = 3
max_content_length = 100000000
timeout = 30
[auth]
type = htpasswd
htpasswd_filename = <path>/users
htpasswd_encryption = plain
delay = 10
```

`users` file:
```
<user>:<password>
```

Use the web interface to create a CalDAV collection.

### DAVx⁵

Allow permissions, login to your user and activate sync for the created
collection (local calendar).

### Simple Calendar

In Settings: toggle CalDAV sync for the specified calendar.

Only events created in that calendar will be synced.

### vdirsyncer

`sudo pacman -S vdirsyncer`

`~/.vdirsyncer/config`:
```
[general]
status_path = "~/.vdirsyncer/status/"

[pair main_cal]
a = "main_cal_local"
b = "main_cal_remote"
collections = ["from a", "from b"]

[storage main_cal_local]
type = "filesystem"
path = "~/.calendars/"
fileext = ".ics"

[storage main_cal_remote]
type = "caldav"
url = "<url>"
username = "<user>"
password = "<password>"
```

Initialize with `vdirsyncer discover main_cal`.

Update regularly (via cronjob) with `vdirsyncer sync`.

### khal

`sudo pacman -S khal`

`~/.config/khal/config`:
```
[calendars]

[[main_cal_local]]
path = ~/.calendars/*
type = discover

[locale]
timeformat = %H:%M
dateformat = %d/%m/%Y
longdateformat = %d/%m/%Y
datetimeformat = %d/%m/%Y %H:%M
longdatetimeformat = %d/%m/%Y %H:%M
```

E.g. `khal interative` to check the calendar.

## Adding a new calendar to all platforms

### Radicle

Create the calendar through the Radicle web interface, with you existing user.

Alternatively this can be done through DAVx⁵.

### vdirsyncer

If the server is already setup: `vdirsyncer discover`

### DAVx⁵

Select your account -> CALDAV -> Options -> Refresh calendar list.

Now check any new calendars you want to sync.

### Simple Calendar

Go into the settings -> Mangage synced calendars (under CALDAV).

And toggle those you want to add.

