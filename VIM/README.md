# Vi IMproved

# Compile From Source

## Prerequisites

Ensure you have the following tools installed:

- `git`
- `make`
- `gcc` or `clang`
- `libtool-bin`
- Development libraries: `libxt-dev`, `libx11-dev`, `libxpm-dev`, `libncurses5-dev`, `libncursesw5-dev`, `libgtk3.0-dev`, `python3-dev`, `ruby-dev`, `lua5.1-dev`, `cscope`.

## Clone the Repo

```
git clone https://github.com/vim/vim.git
cd vim
```
It's often a good idea to check out the latest stable tag instead of using the master branch. You can list tags with git `tag --list` and check one out like this (replace `v9.x.xxxx` with the latest version):

```
# Example: replace v9.x.xxxx with the latest tag
git checkout v9.x.xxxx
```

## Configure the Build

The `./configure` script prepares the source code for compilation based on your system and desired features. This is the most critical step for customization.

Use the `--with-features` flag to select a base feature set. The most common choice is `huge`, which enables the maximum number of features.

- `--with-features=tiny`

- `--with-features=small`

- `--with-features=normal`

- `--with-features=big`

- `--with-features=huge` (Recommended for maximum functionality)

You should also specify an installation location, typically `/usr/local`, using `--prefix`.

**Basic Configuration (Recommended):**

```
./configure --with-features=huge --enable-multibyte --prefix=/usr/local
```

**Advanced Configuration (for Scripting/GUI Support):**

If you want support for scripting languages (Python, Ruby, etc.) or a GUI, you must include the respective flags. For example:

```
./configure --with-features=huge \
    --enable-multibyte \
    --enable-rubyinterp \
    --enable-python3interp \
    --enable-luainterp \
    --enable-perlinterp \
    --enable-gui=gtk3 \
    --enable-cscope \
    --prefix=/usr/local
```
Note: The exact flags and necessary development libraries for interpreters like Python may vary based on your distribution and version. Use `./configure --help` to see all available options.

## Compile the Source

Once configuration is complete, compile Vim using `make`. You can speed up the process by using multiple processor cores (e.g., using `$(nproc)` or the number of cores on your system with the `-j` flag).

```
make -j$(nproc)
```

## Install Vim

After a successful compilation, install the Vim binary and runtime files to the directory specified by `--prefix` (usually `/usr/local`). This step requires root privileges.

```
sudo make install
```

## Verification

To confirm that your new version of Vim is installed and includes the features you selected, run the following command:

```
vim --version
```

Look for the features you explicitly enabled. Features that were successfully included will be prefixed with a `+`, while disabled or missing features will have a `-`.


## Cleaning Up (Optional)

You can remove the compiled object files and temporary data from the source directory, although it is not strictly necessary.

```
make clean
```

If you installed Vim to a custom location, you may need to update your system's `PATH` environment variable to ensure the new Vim binary is found before any old versions. The new binary will typically be located at `/usr/local/bin/vim`.

## Update Vim

Navigate to the vim directory

```
cd /path/to/vim
```

Pull the latest changes

```
git pull 
```

Checkout Latest Stable Tag

```
git tag --list
git checkout v9.x.xxxx
```

## Re-Configure the Build

- **Basic Example**

```
./configure --with-features=huge --enable-multibyte --prefix=/usr/local
```

- **Advanced Example**

```
./configure --with-features=huge \
    --enable-multibyte \
    --enable-rubyinterp \
    --enable-python3interp \
    --enable-luainterp \
    --enable-perlinterp \
    --enable-gui=gtk3 \
    --enable-cscope \
    --prefix=/usr/local
```

## Re-Compile and Install

The `make` and sudo `make install` commands will overwrite the old Vim files with the newly compiled binaries.

- **Compile**

```
make -j$(nproc)
```

- **Install (requires root privileges)**

```
sudo make install
```

## Verification

Check the Version and Features:

```
vim --version
```

Confirm that the reported version number reflects the new tag you checked out and that all your enabled features are still prefixed with a `+`.

## Cleaning Up (Optional)

- **Clean Object Files**

```
make clean
```

## To use my config

copy vimrc to home directory
```bash
sudo cp vimrc ~/.vimrc
```
