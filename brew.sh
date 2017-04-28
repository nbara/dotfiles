#!/usr/bin/env bash

# Install command-line tools using Homebrew.
if test ! $(which brew)
then
  echo "Installing Homebrew..."
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
  echo 'export PATH="/usr/local/bin:$PATH"' >> ~/.bash_profile
  brew analytics off

  # Set zsh as default shell
  chsh -s $(which zsh)
fi

# Make sure we’re using the latest Homebrew.
brew update

# Upgrade any already-installed formulae.
brew upgrade

# Save Homebrew’s installed location.
BREW_PREFIX=$(brew --prefix)

# Install GNU core utilities (those that come with macOS are outdated).
# Don’t forget to add `$(brew --prefix coreutils)/libexec/gnubin` to `$PATH`.
brew install coreutils
ln -s "${BREW_PREFIX}/bin/gsha256sum" "${BREW_PREFIX}/bin/sha256sum"

# Install some other useful utilities like `sponge`.
brew install moreutils
# Install GNU `find`, `locate`, `updatedb`, and `xargs`, `g`-prefixed.
brew install findutils
# Install GNU `sed`, overwriting the built-in `sed`.
brew install gnu-sed --with-default-names

# Install `wget` with IRI support.
brew install wget --with-iri

# Install GnuPG to enable PGP-signing commits.
brew install gnupg

# Install more recent versions of some macOS tools.
brew install vim --with-override-system-vi
brew install grep
brew install openssh
brew install screen
brew install php
brew install gmp

# Install font tools.
# brew tap bramstein/webfonttools
# brew install sfnt2woff
# brew install sfnt2woff-zopfli
# brew install woff2

# Install some CTF tools; see https://github.com/ctfs/write-ups.
# brew install aircrack-ng
# brew install bfg
# brew install binutils
# brew install binwalk
# brew install cifer
# brew install dex2jar
# brew install dns2tcp
# brew install fcrackzip
# brew install foremost
# brew install hashpump
# brew install hydra
# brew install john
# brew install knock
# brew install netpbm
# brew install nmap
# brew install pngcheck
# brew install socat
# brew install sqlmap
# brew install tcpflow
# brew install tcpreplay
# brew install tcptrace
# brew install ucspi-tcp # `tcpserver` etc.
# brew install xpdf
# brew install xz

# Install other useful binaries.
brew install ack
#brew install exiv2
brew install git
brew install git-lfs
brew install imagemagick --with-webp
brew install lua
# brew install lynx
brew install mas
brew install p7zip
brew install pigz
brew install pv
brew install rename
brew install rlwrap
brew install ssh-copy-id
brew install tree
# brew install vbindiff
# brew install webkit2png
# brew install zopfli

# Cask completion
brew install homebrew/completions/brew-cask-completion

# Quicklook plugins
brew cask install qlcolorcode --force
brew cask install qlstephen --force
brew cask install qlprettypatch --force
brew cask install quicklook-csv --force
brew cask install betterzipql --force

# Programs that I use a lot
brew cask install 1password
brew cask install apptivate
brew cask install atom
brew cask install audacity
brew cask install cakebrew
brew cask install dropbox
brew cask install filezilla
brew cask install flux
brew cask install gimp
brew cask install gitup
brew cask install inkscape
brew cask install iterm2
brew cask install latexit
brew cask install keka
brew cask install namechanger
brew cask install malwarebytes-anti-malware
brew cask install sabnzbd
brew cask install skype
brew cask install teamviewer
brew cask install transmission
brew cask install vlc
brew cask install xquartz
brew cask install zotero

# Upgrade all
brew update && brew upgrade `brew outdated`

# Remove outdated versions from the cellar.
brew cleanup
