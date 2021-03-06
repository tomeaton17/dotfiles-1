#!/bin/sh
#
# ufetch-gentoo - tiny system info for gentoo linux
#

## INFO

# user is already defined
host="$(hostname)"
os='Gentoo Linux'
kernel="$(uname -sr)"
uptime="$(uptime -p | sed 's/up //')"
packages="$(ls -d /var/db/pkg/*/* | wc -l)"
shell="$(basename ${SHELL})"
if [ -z "${WM}" ]; then
	WM="$(tail -n 1 "${HOME}/.xinitrc" | cut -d ' ' -f 2)"
fi
cpu="$(uname -p)"

## DEFINE COLORS

# probably don't change these
bc="$(tput bold)"		# bold
c0="$(tput setaf 0)"	# black
c1="$(tput setaf 1)"	# red
c2="$(tput setaf 2)"	# green
c3="$(tput setaf 3)"	# yellow
c4="$(tput setaf 4)"	# blue
c5="$(tput setaf 5)"	# magenta
c6="$(tput setaf 6)"	# cyan
c7="$(tput setaf 7)"	# white
rc="$(tput sgr0)"		# reset

# you can change these
lc="${rc}${bc}${c5}"	# labels
nc="${rc}${bc}${c5}"	# user and hostname
ic="${rc}${bc}${c7}"	# info
fc="${rc}${bc}${c5}"	# first color
sc="${rc}${c5}"			# second color

## OUTPUT
# art from gentoo prefix project's bootstrap-prefix.sh

cat <<EOF
${fc}     .vir.       ${nc}${USER}${ic}@${nc}${host}${rc}
${fc}   .d\$\$\$\$${sc}\$\$b.    ${lc}OS:        ${ic}${os}${rc}
${fc}   \$\$\$\$${sc}( )${pc}\$${sc}\$\$b   ${lc}KERNEL:    ${ic}${kernel}${rc}
${fc}   Q\$\$\$\$\$\$\$\$${sc}\$\$B  ${lc}UPTIME:    ${ic}${uptime}${rc}
${fc}     "\$\$\$\$\$${sc}\$\$P   ${lc}PACKAGES:  ${ic}${packages}${rc}
${fc}    d\$\$\$\$${sc}\$\$P"    ${lc}SHELL:     ${ic}${shell}${rc}
${fc}  \$\$\$\$\$${sc}\$\$P       ${lc}WM:        ${ic}${WM}${rc}
${fc}  \`Q\$\$${sc}P"         ${lc}CPU:       ${ic}${cpu}${rc}
EOF
