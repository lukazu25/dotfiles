# DWM

```bash
sudo cp startdwm.sh /usr/local/bin/
```

If you use a display manager
```bash
sudo cp dwm.desktop /usr/share/xsessions/

```
If you don't
```bash
echo "exec /usr/local/bin/startdwm.sh" >> ~/.xinitrc
```
## Lock on suspend 

Create the following service which locks the screen

`/etc/systemd/system/slock@.service`

```
[Unit]
Description=Lock X session using slock for user %i
Before=sleep.target

[Service]
User=%i
Environment=DISPLAY=:0
ExecStart=/usr/local/bin/slock

[Install]
WantedBy=sleep.target
```
Enable the `slock@user.service` systemd unit for it to take effect for the username user

```
sudo systemctl enable slock@username.service
```

## Configuration Changes for Installing dwm, dmenu, and st on BSD Systems

These modifications are made to the `config.mk` file in each application's build directory to correctly specify the paths for X11 libraries and headers on the respective BSD systems.


### NetBSD Configuration 

**For dwm and dmenu**

```
# paths
PREFIX = /usr/local
MANPREFIX = ${PREFIX}/man

X11INC = /usr/X11R7/include
X11LIB = /usr/X11R7/lib

# freetype
FREETYPELIBS = -lfontconfig -lXft
FREETYPEINC = ${X11INC}/freetype2

# includes and libs
INCS = -I${X11INC} -I${FREETYPEINC}
LIBS = -L${X11LIB} -lX11 -Wl,-R${X11LIB} ${XINERAMALIBS} ${FREETYPELIBS}
```

**For st (Simple Terminal)**

```
# paths
PREFIX = /usr/local
MANPREFIX = ${PREFIX}/man

X11INC = /usr/X11R7/include
X11LIB = /usr/X11R7/lib

# includes and libs
INCS = -I$(X11INC) \
       `$(PKG_CONFIG) --cflags fontconfig` \
       `$(PKG_CONFIG) --cflags freetype2`
LIBS = -L$(X11LIB) -Wl,-R$(X11LIB) -lm -lX11 -lutil -lXft \
       `$(PKG_CONFIG) --libs fontconfig` \
       `$(PKG_CONFIG) --libs freetype2`

# flags
STCPPFLAGS = -DVERSION=\"$(VERSION)\" -D_XOPEN_SOURCE=600
STCFLAGS = $(INCS) $(STCPPFLAGS) $(CPPFLAGS) $(CFLAGS)
STLDFLAGS = $(LIBS) $(LDFLAGS)
CPPFLAGS = -DVERSION=\"$(VERSION)\" -D_XOPEN_SOURCE=600 -D_BSD_SOURCE
```

### FreeBSD Configuration 

**For dwm and dmenu**

```
# paths
PREFIX = /usr/local
MANPREFIX = ${PREFIX}/share/man

X11INC = /usr/local/include
X11LIB = /usr/local/lib

# freetype
FREETYPELIBS = -lfontconfig -lXft
FREETYPEINC = /usr/local/include/freetype2

# includes and libs
INCS = -I${X11INC} -I${FREETYPEINC}
LIBS = -L${X11LIB} -lX11 ${XINERAMALIBS} ${FREETYPELIBS}
```

**For st (Simple Terminal)**

```
# paths
PREFIX = /usr/local
MANPREFIX = ${PREFIX}/share/man

X11INC = /usr/local/include
X11LIB = /usr/local/lib

# includes and libs
INCS = -I$(X11INC) \
       `$(PKG_CONFIG) --cflags fontconfig` \
       `$(PKG_CONFIG) --cflags freetype2`
LIBS = -L$(X11LIB) -lm -lX11 -lutil -lXft \
       `$(PKG_CONFIG) --libs fontconfig` \
       `$(PKG_CONFIG) --libs freetype2`

# flags
STCPPFLAGS = -DVERSION=\"$(VERSION)\" -D_XOPEN_SOURCE=600
STCFLAGS = $(INCS) $(STCPPFLAGS) $(CPPFLAGS) $(CFLAGS)
STLDFLAGS = $(LIBS) $(LDFLAGS)
CPPFLAGS = -DVERSION=\"$(VERSION)\" -D_XOPEN_SOURCE=600 -D_BSD_SOURCE
```

### OpenBSD Configuration 

**For OpenBSD installations, review the `config.mk` file and uncomment the lines specific to OpenBSD, and comment out any conflicting generic or default configuration lines.**
