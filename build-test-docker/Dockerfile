FROM maven:3-jdk-8

RUN apt-get -y update && apt-get -y install git curl screen && apt-get -y clean
WORKDIR /opt/fiteagle

#RUN echo "DUMMY"; (curl -fsSL https://raw.githubusercontent.com/FITeagle/bootstrap/master/fiteagle.sh | bash -s init deployFT2)
#RUN echo "DUMMY"; /opt/fiteagle/bootstrap/fiteagle.sh deployExtraBinary;

CMD curl -fsSL https://raw.githubusercontent.com/FITeagle/bootstrap/master/fiteagle.sh | bash -s init deployFT2 deployFT2sfa testFT2sfa
