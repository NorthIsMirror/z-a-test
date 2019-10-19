# According to the Zsh Plugin Standard:
# http://zdharma.org/Zsh-100-Commits-Club/Zsh-Plugin-Standard.html

0="${${ZERO:-${0:#$ZSH_ARGZERO}}:-${(%):-%N}}"
0="${${(M)0:#/*}:-$PWD/$0}"

autoload -Uz :zp-test-handler …zp-test-make-targets

# An empty stub to fill the help handler fields
:za-test-help-null-handler() { :; }

# Register atclone hook
@zplg-register-annex "z-a-test" hook:atclone \
    :zp-test-handler \
    :za-test-help-null-handler \
    "notest|test''" # register a new ice-mod: test''

# Register atpull hook
@zplg-register-annex "z-a-test" hook:atpull \
    :zp-test-handler \
    :za-test-help-null-handler
