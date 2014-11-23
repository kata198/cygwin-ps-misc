#!/bin/bash


APP_NAMES="pidof killall"


for arg in "$@"
do
	if [ "$arg" = "--help" ] || [ "$arg" = "-h" ] || [ "$arg" = "-?" ];
	then
		echo -e "Usage: install.sh\n  Installs the 'pidof' and 'killall' applications.\n\tYou can provide the --prefix=DIRECTORY (e.x. --prefix=/usr/local), or PREFIX env variable (used in that order), or default /usr to specify the install directory.\n\tYou can also provide --install-dir, or INSTALL_DIR env variable (preferred in that order) to specify the exact directory to place the binary. This overrides anything in 'prefix' directives.";
		exit;
	elif [ `expr match "$arg" "^--prefix="` -gt 0 ];
	then
		PREFIX="`echo $arg | sed 's/^--prefix=//'`"
	elif [ `expr match "$arg" "^--install-dir="` -gt 0 ];
	then
		INSTALL_DIR="`echo $arg | sed 's/^--install-dir=//'`"
	fi
done

PACKAGE_DIRECTORY=`dirname ${BASH_SOURCE[0]}`;


if [ -z "${INSTALL_DIR}" ];
then

		if [ -z "${PREFIX}" ];
		then
			PREFIX="/usr"
		else
			PREFIX="`echo $(bash -c \"cd ${PREFIX} && pwd\")`"
		fi
		INSTALL_DIR="${PREFIX}/bin"
else
	INSTALL_DIR="`echo $(bash -c \"cd ${INSTALL_DIR} && pwd\")`"
fi

for APP_NAME in $APP_NAMES
do
	echo "Installing ${APP_NAME} to ${INSTALL_DIR}"
	install -m 755 ${PACKAGE_DIRECTORY}/${APP_NAME} ${INSTALL_DIR}
done
