#!/bin/bash

LNG=`basename "$PWD"`
ICO=`cat lang.conf | sed -n '/Icon=/ s/Icon=//p'`

if [ "x$USER" == "xroot" ]; then
	DEST=/opt/kingsoft/wps-office/office6/mui/$LNG
else
	DEST=$HOME/.kingsoft/mui/$LNG
fi
	

function install_file
{
	ls $1 >/dev/null 2>&1 && cp $1 "$DEST" && echo "Install" $1 "Succeed." 
}
function install_dir
{
	[ -d "$1" ] && cp -r "$1" "$DEST" && echo "Install" $1 "Succeed."
}

mkdir -p -m 755 $DEST && echo "Create $DEST"
install_file "*.qm"
install_file res.rcc
install_file lang.conf
[ ! -z "$ICO" ] && install_file $ICO
install_dir config
install_dir data
install_dir templates

echo "Install $LNG completed!"
