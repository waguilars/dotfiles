#!/usr/bin/env bash
#? Author:
#?   Wilson Aguilar <52500170+waguilars@users.noreply.github.com>
#? This file contains instrucctions to install the package go
#? v1.0.0

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
    # Install using a package manager, in this case auto but you can choose brew, pip...
    package::install go auto "$@"

    go::is_installed &&
      output::solution "go installed" &&
      return 0
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
  # Check if current installed version is outdated, 0 means needs to be updated
  return 1
}

go::upgrade() {
  # Steps to upgrade
  sleep 1s
  # Do stuff to upgrade the package
}

go::description() {
  echo "Go is an open source programming language that makes it easy to build simple, reliable, and efficient software"
}

go::url() {
  # Please modify
  echo "https://go.dev"
}

go::version() {
  # Get the current installed version
  go version
}

go::latest() {
  if go::is_outdated; then
    # If it is outdated do whatever to get the current version
    echo " > $(go::version)"
  else
    go::version
  fi
}

go::title() {
  echo -n "🦫 Go"
}