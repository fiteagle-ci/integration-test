#!/usr/bin/env bash
PWD=$(pwd)
#TARGET=$(mktemp -d 2>/dev/null || mktemp -d -t "fiteagle")
TARGET="${PWD}/test_dir"
echo "using TARGET: ${TARGET} HOME: ${HOME}"
rm -rf ${TARGET};
mkdir -p ${TARGET};
mkdir -p ${HOME}/.fiteagle
cd ${TARGET}
#export WILDFLY_HOME="${TARGET}/server/wildfly"
curl -fsSL https://github.com/FITeagle/bootstrap/raw/master/fiteagle.sh 
${TARGET}/fiteagle.sh deployFT2binary deployFT2sfaBinary
curl -fsSL https://github.com/FITeagle/core/raw/master/federationManager/src/main/resources/ontologies/defaultFederation.ttl -o ${HOME}/.fiteagle/Federation.ttl
${TARGET}/fiteagle.sh startFT2

cd $PWD
./runJfed_local.sh;
RET=$?

killall -9 java
rm -rf ${TARGET};

exit $RET