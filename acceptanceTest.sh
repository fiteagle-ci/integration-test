#!/usr/bin/env bash
PWD=$(pwd)
#TARGET=$(mktemp -d 2>/dev/null || mktemp -d -t "fiteagle")
TARGET="${PWD}/test_dir"
echo "using TARGET: ${TARGET} HOME: ${HOME} PWD: ${PWD}"
rm -rf ${TARGET}
mkdir -p ${TARGET}
mkdir -p ${HOME}/.fiteagle
cd ${TARGET}
#export WILDFLY_HOME="${TARGET}/server/wildfly"
curl -sSL https://github.com/FITeagle/bootstrap/raw/master/fiteagle.sh -o fiteagle.sh
chmod +x ${TARGET}/fiteagle.sh
${TARGET}/fiteagle.sh deployFT2binary deployFT2sfaBinary
curl -sSL https://github.com/FITeagle/core/raw/master/federationManager/src/main/resources/ontologies/defaultFederation.ttl -o ${HOME}/.fiteagle/Federation.ttl
${TARGET}/fiteagle.sh startJ2EE

cd ${PWD}
pwd
## HACK
cd ..

echo "waiting for server to be ready..."
CNT=0
while [ ! ./xmlrpc-client.sh -t https://demo.fiteagle.org:8443/sfa/api/am/v3 GetVersion ]; do
	echo sleep 30
	sleep 30
	CNT=$((${CNT}+1))
	if [[ $CNT > 10 ]]; then
		echo timeout !
		killall java
		exit 1
	fi
done
./runJfed_local.sh
RET=$?

screen -S wildfly -X kill
#killall -9 java
#rm -rf ${TARGET}

exit $RET