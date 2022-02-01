#!/usr/bin/env bash

# Prefix for SCRIPT_NAME variable
#shellcheck disable=SC2034
SLOTH_SCRIPT_BASE_NAME="dot"


# platform and output should be at the first place because they are used
# in other libraries
# log,platform,output,args,array,async,collections,docs,dot,files,git,github,json,package,registry,script,str,sloth_update,yaml,wrapped
for file in "${DOTFILES_PATH}"/scripts/core/src/{array,docs,dot,package,registry,script,str}.sh; do
  #shellcheck source=/dev/null
  . "$file" || exit 5
done
unset file
