FROM maven:3-jdk-8

RUN apt-get -y update && apt-get -y install git curl screen && apt-get -y clean
WORKDIR /opt/fiteagle

RUN mkdir -p /root/.m2
VOLUME /root/.m2

RUN mkdir /root/.fiteagle; curl -sSL https://github.com/FITeagle/core/raw/master/federationManager/src/main/resources/ontologies/defaultFederation.ttl -o /root/.fiteagle/Federation.ttl

CMD curl -fsSL https://raw.githubusercontent.com/FITeagle/bootstrap/master/fiteagle.sh | bash -s init deployFT2 deployFT2sfa testFT2sfa

