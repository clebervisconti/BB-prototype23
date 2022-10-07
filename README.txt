==============
DESCRIPTION
==============

In this example, 
1. we will have a blank VM
2. we will install our AppDynamics agent
3. then install a tomcat server and sample application and AppDynamics will automatically instrument Tomcat on startup.

==============
REQUIREMENTS
==============
o New Linux Server - Centos/Redhat/Ubuntu
o User account
o Internet access


================
STEPS
===============
# In the current directory execute this script and source ~/.bash_profile when done.
./installAppD.sh

# Install Tomcat application (includes JDK + Tomcat + Sample application)
./installTomcat.sh

# Apply Load
./app-load.sh

# Check Appdynamics UI after a few minutes for application flow + tiers + Business transactions.

# After all is complete, you can uninstall and delete everything with
./uninstall.sh
