FROM opensuse/tumbleweed
RUN zypper refresh
RUN zypper install -y rustup git libudev-devel sqlite3-devel libopenssl-3-devel zsh shadow sudo
RUN rustup default stable
RUN echo 'developer ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers
RUN useradd -ms /bin/zsh developer
USER developer
WORKDIR /home/developer
RUN zsh
RUN sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
