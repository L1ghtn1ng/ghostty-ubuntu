set -e


source /etc/os-release


if [ $(lsb_release -sr) = "22.04" ]; then

  DEBIAN_FRONTEND="noninteractive" apt-get -qq update
  apt-get -qq -y --no-install-recommends install ca-certificates libsodium23
  rm -rf /var/lib/apt/lists/*
  wget -q "http://mirrors.kernel.org/ubuntu/pool/universe/m/minisign/minisign_0.11-1_amd64.deb"
  dpkg -i minisign_0.11-1_amd64.deb

else

  DEBIAN_FRONTEND="noninteractive" apt-get -qq update

  apt-get -qq -y --no-install-recommends install minisign
  rm -rf /var/lib/apt/lists/*

fi