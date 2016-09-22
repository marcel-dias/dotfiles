#!/bin/zsh
PURE_CMD_MAX_EXEC_TIME=1
antibody bundle mafredri/zsh-async
antibody bundle sindresorhus/pure

# these two guys **MUST** be loaded last.
antibody bundle zsh-users/zsh-history-substring-search
antibody bundle zsh-users/zsh-syntax-highlighting
