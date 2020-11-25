# Mac Setup Script

This shell script is used to setup the mac machines.
This script installs and download the software which helps productivity and simplifies the painful experience of mac setup.

## Getting Started

### Prerequisites

-  A macOS operating system.
-  [Zsh](https://www.zsh.org) should be installed (v4.3.9 or more recent is fine but we prefer 5.0.8 and newer).
-  `curl` or `wget` should be installed
-  `git` should be installed (recommended v2.4.11 or higher)

### Basic Installation

You can run macConfig.sh by any one of the following commands in your terminal

| Method    | Command                                                                                           |
|:----------|:--------------------------------------------------------------------------------------------------|
| **curl**  | `sh -c "$(curl -fsSL https://raw.githubusercontent.com/dushyantSingh/macSetup/main/macConfig.sh)"` |
| **wget**  | `sh -c "$(wget -O- https://raw.githubusercontent.com/dushyantSingh/macSetup/main/macConfig.sh)"`   |
| **fetch** | `sh -c "$(fetch -o - https://raw.githubusercontent.com/dushyantSingh/macSetup/main/macConfig.sh)"` |

#### Manual inspection

It's a good idea to inspect the install script from projects you don't yet know. You can do
that by downloading the install script first, looking through it so everything looks normal,
then running it:

```shell
wget https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh
sh install.sh
```
Run the following command to give executable permission
```chmod +x ./macConfig.sh```
