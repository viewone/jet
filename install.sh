#!/bin/bash
# 
# Script for installing .dotfiles
# 
# @package   dotfiles
# @author    Piotr Kierzniewski <p.kierzniewski@viewone.pl>
# @copyright 2014 ViewOne Sp. z o.o.
# @license   http://opensource.org/licenses/MIT MIT
# @link      https://github.com/kierzniak/dotfiles

# Dotfiles path
dir="/usr/local/jet"
bin="/usr/local/bin"

# Get jet
if [ -d "$dir" ]; then
  echo "Delete existing jet ${dir}"
  rm -r "${dir}"
  rm "${bin}/jet"
fi

echo "Create jet directory"
mkdir -p "${dir}"

# Download jet
echo "Download and extract jet"
wget https://github.com/viewone/jet/archive/master.tar.gz && tar -xzf master.tar.gz -C "$dir" --strip-components=1 && rm master.tar.gz

# Set environmental variables
source $dir/shell/env.sh

# Symlink files if .dotfiles directory exists otherwise exit script
if [ -d "$dir" ]; then
  echo "Symlinking dotfiles from ${dir}"
else
  echo "$dir does not exist"
  exit 1
fi

# Function to symlink
link() {
  from="$1"
  to="$2"
  echo "Linking '$from' to '$to'"
  rm -f "$to"
  ln -s "$from" "$to"
}

# Iterate over *.symlink files in .dotfiles directory
for location in $(find  ${dir} -name '*.symlink'); do
  # Remove .symlink extenstion from file
  file="${location%.symlink}"

  # Remove path from file
  file="${file##*/}"

  # Symlink with link function
  link "$location" "${bin}/$file"
done