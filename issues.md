
### package management

#### Installing packages from the AUR repository

Manual method:

```
git clone https://aur.archlinux.org/<package>.git
cd <package>
mkpkg -si
```

Easy method:

Install `yay` using the manual method, then:

```cmd
yay -S <package>
```

#### Deleting orphaned packages

```
sudo pacman -Rns $(pacman -Qtdq)
```

`pacman -Qt` queries all packages that are not required by any other package.
The `d` flag filters it to only packages installed as dependencies.
The `q` flag outputs simpler text (to send to `pacman -Rns`).

### partition setup

#### Finding the UUID of every partition

```
sudo blkid /dev/<part>
```

#### Mounting NTFS partitions

Type: `ntfs-3g`
Options: `defaults,exec,nls=utf8,umask=000,uid=1000,guid=1000`

This will mount the NTFS partition with RWX permissions.

May need to turn off hibernation and fast boot on Windows before doing this.

#### Auto-mounting drives

Goes into the `/etc/fstab` file.

Use the UUID instead of the `/dev/<part>` name since partition IDs may change.

### xorg setup

#### Overriding the .xinitrc file that is used when running `startx`

```
startx ./<config>
```

The `./` before the path is important. `startx` won't recognize it otherwise.

#### Starting an Xserver under a different display ID

```
startx -- :<id>
```

With a custom config:

```
startx ./<config> -- :<id>
```

#### Finding the IDs of all connected monitors

```
xrandr --query
```

#### Playing Windows games

On Steam: Steam will attempt to play it with its built-in Proton dist.

Not on Steam: Use `lutris`.

### things that look nice

#### Round windows and blur effect

For windows with transpency, blur, and rounded corner support use this fork of
`picom`

https://github.com/ibhagwan/picom

Must be built from source (follow the instructions at the page).

Relevant new options (found in `~/.config/picom.conf`):

```conf
corner-radius = 10.0;
round-borders = 1;

blur: {
	method = "dual_kawase";
	strength = 5;
};
```

#### Status bars

`polybar`

### music production

#### Native DAW options

- Bitwig Studio
- Reaper

#### Mounting & installing Native Instrument .isos

Installing products through Native Access (in Wine) will fail if it downloads an
.iso and has to mount it (the mount program doesn't work in Wine). In this case,
mount the .iso manually and install it.

```cmd
sudo mount -t udf -o unhide <iso> <mount point>
```

Afterwards, execute the installer exe within to install it.

#### Bridging .dll VST plugins

Options
- linvst
- airwave
- carla (and carla-bridges-win)

`linvst` seems to produce the best results.

```cmd
linvstconvert-cli -i <vst dir>
```

Guitar Rig 5 does not work currently. Thankfully Bitwig Studio has its own amp plugin.

#### Adobe Creative Cloud
