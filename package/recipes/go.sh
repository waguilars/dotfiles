#!/usr/bin/env bash
#? Author:
#?   Wilson Aguilar <52500170+waguilars@users.noreply.github.com>
#? This file contains instrucctions to install the package go
#? v1.0.0

current=$(go version | grep -Eo 'go[0-9]+(\.[0-9]+)+') || ""

# REQUIRED FUNCTION
go::is_installed() {
  platform::command_exists go
}

# REQUIRED FUNCTION
go::install() {
  if [[ " $* " == *" --force "* ]]; then
    # output::answer "\`--force\` option is ignored with this recipe"
    go::force_install "$@" &&
      return
  else
    go::is_installed &&
      return 0


    [[ -z $GOPATH ]] &&
      output::error "GOPATH is not set" &&
      return 1

    latest=$(curl --silent https://go.dev/doc/devel/release | grep -Eo 'go[0-9]+(\.[0-9]+)+' | sort -V | uniq | tail -1)
    # Install using a package manager, in this case auto but you can choose brew, pip...
    curl -# https://dl.google.com/go/${latest}.linux-amd64.tar.gz -o /tmp/${latest}.linux-amd64.tar.gz > /dev/null 2>&1

    if [[ -f /tmp/${latest}.linux-amd64.tar.gz ]]; then
      output::solution "Downloaded ${latest}.linux-amd64.tar.gz"
      tar -xzf /tmp/${latest}.linux-amd64.tar.gz --directory=/tmp &&
      mv /tmp/go $GOPATH

      rm -rf /tmp/${latest}.linux-amd64.tar.gz

      output::solution "Installed go ${latest}"
      return 0
    else
      output::error "Could not download ${latest}.linux-amd64.tar.gz"
      return 1
    fi

  fi

  output::error "go could not be installed"
  return 1
}

# OPTIONAL
go::uninstall() {
  package::uninstall go auto "$@"

  ! go::is_installed &&
    output::solution "go uninstalled" &&
    return 0

  ourput::error "go could not be uninstalled"
  return 1
}

# OPTIONAL
go::force_install() {
  local _args
  mapfile -t _args < <(array::substract "--force" "$@")

  go::uninstall "${_args[@]}"
  go::install "${_args[@]}"

  go::is_installed "${_args[@]}"
}

# ONLY REQUIRED IF YOU WANT TO IMPLEMENT AUTO UPDATE WHEN USING `up` or `up registry`
# Description, url and versions only be showed if defined
go::is_outdated() {
  latest=$(curl --silent https://go.dev/doc/devel/release | grep -Eo 'go[0-9]+(\.[0-9]+)+' | sort -V | uniq | tail -1)
  # Check if current installed version is outdated, 0 means needs to be updated
  [[ "${current}" != "${latest}" ]]
}

go::upgrade() {
  # Steps to upgrade
  if go::is_outdated; then
    rm -rf $GOPATH
    go::install
  else
    output::solution "go is already up to date"
  fi
  # Do stuff to upgrade the package
}

go::description() {
  echo "Go is an open source programming language that makes it easy to build simple, reliable, and efficient software"
}

go::url() {
  # Please modify
  echo "https://go.dev/"
}

go::version() {
  # Get the current installed version
  go version
}

go::latest() {
  if go::is_outdated; then
    # If it is outdated do whatever to get the current version
    echo "The latest version is ${latest}"
  else
    go::version
  fi
}

go::title() {
  echo -n "🦫 Go"
}