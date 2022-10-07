#!/bin/bash
#
# Stop processes and delete directories
#

unset LD_PRELOAD

echo "INFO: Stopping tomcat and zero agent..."
tomcat/bin/shutdown.sh
~/appdynamics/zeroagent/bin/zfictl stop

echo "INFO: Deleting tomcat directory..."
rm -rf tomcat


echo "INFO: Deleting zeroagent directory..."
rm -rf ~/appdynamics/zeroagent

echo "INFO: Deleting jdk8 directory..."
rm -rf jdk8 jdk1.8.0_341

echo "INFO: Cleaning up ~/.bash_profile..."
sed -i '/zeroagent/d' ~/.bash_profile



echo ""
echo ""
echo "======================================================="
echo "*******************************************************"
echo ""
echo "  Execute the following in your open shells now "
echo ""
echo "  unset LD_PRELOAD"
echo ""
echo ""
echo "*******************************************************"
echo "======================================================="
echo ""

