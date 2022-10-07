#!/bin/bash 
#
# Install Tomcat with simple sample app
#
# run script ./installTomcat.sh

# Used to determine where the base directory is located
INSTALLPATH=$PWD

# Which version of Tomcat to install
# Environment vars: Tomcat
TOMCAT_MAJOR_VERSION=9
TOMCAT_MINOR_VERSION=9.0.67
CATALINA_HOME=tomcat

echo "INFO: Setting up java...."
tar xzf jdk-8u341-linux-x64.tar.gz
ln -s jdk1.8.0_341 jdk8

echo "INFO: Installing Tomcat $TOMCAT_MINOR_VERSION into $INSTALLPATH/$CATALINA_HOME ..."
curl -O -k https://archive.apache.org/dist/tomcat/tomcat-${TOMCAT_MAJOR_VERSION}/v${TOMCAT_MINOR_VERSION}/bin/apache-tomcat-${TOMCAT_MINOR_VERSION}.tar.gz \
    && curl -O -k https://archive.apache.org/dist/tomcat/tomcat-${TOMCAT_MAJOR_VERSION}/v${TOMCAT_MINOR_VERSION}/bin/apache-tomcat-${TOMCAT_MINOR_VERSION}.tar.gz.md5 \
    && md5sum apache-tomcat-${TOMCAT_MINOR_VERSION}.tar.gz.md5 \
    && tar zxf apache-tomcat-*.tar.gz \
    && rm apache-tomcat-*.tar.gz* \
    && mv apache-tomcat-${TOMCAT_MINOR_VERSION} tomcat \
    && cp sample.war ${INSTALLPATH}/${CATALINA_HOME}/webapps \
    && cd ${INSTALLPATH}/${CATALINA_HOME}/bin;chmod +x *.sh

# Update startup script with correct JAVA_HOME
/usr/bin/sed -i.bak "1 a export JAVA_HOME=${INSTALLPATH}/jdk8" ${INSTALLPATH}/${CATALINA_HOME}/bin/catalina.sh


echo "###############################################################"
echo "# To start tomcat:"
echo "###############################################################"
echo ""
echo "   cd ${INSTALLPATH}/${CATALINA_HOME}/bin && ./startup.sh"
echo ""
echo ""
echo "###############################################################"
echo "# Apply load:"
echo "###############################################################"
echo ""
echo "   cd ${INSTALLPATH} && ./app-load.sh"
echo ""
echo ""
echo "###############################################################"
echo "# To stop tomcat:"
echo "###############################################################"
echo ""
echo "   cd ${INSTALLPATH}/${CATALINA_HOME}/bin && ./shutdown.sh"
echo ""


