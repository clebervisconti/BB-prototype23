#!/bin/bash 
#
# Install AppDynamics Agent as an app user, not as root.
#
#
APPLICATION=bb-test-23

echo "INFO: Downloading AppD components..."
# Download artifacts - can be put CI/CD pipeline or build scripts for new systems.
cd $(mktemp -d -t appd-zero-XXXXXXX) && curl https://download-files.appdynamics.com/download-file/zero-agent-bootstrap/22.5.0.2286/appdynamics-zero-agent-bootstrap-22.5.0.2286.sh -o zero-agent.sh && chmod +x zero-agent.sh && ./zero-agent.sh download java -v 22.9.1.34265 -c f0708e68053f37e98dfa1ee24a1b2482 && ./zero-agent.sh download zero -v 22.5.0.2286 -c d8a6acec8f20fd0d29f191b40290492a

# Install AppD Components
echo "INFO: Installling AppD Compoments..."
./zero-agent.sh install --application "${APPLICATION}" --account 'bb-pov' --access-key 'xla10qs6ygz8' --service-url 'https://bb-pov.saas.appdynamics.com'

# Update startup shell config file.
echo "INFO: Updating ~/.bash_profile..."
echo 'export LD_PRELOAD="${HOME}/appdynamics/zeroagent/lib64/libpreload.so"' >> ~/.bash_profile


# start zero agent
echo "INFO: Starting AppD Components..."
~/appdynamics/zeroagent/bin/zfictl start --quiet

# Apply LD_PRELOAD to current shell
export LD_PRELOAD="${HOME}/appdynamics/zeroagent/lib64/libpreload.so"

echo ""
echo ""
echo "#######################################################"
echo "============== POST INSTALL INSTRUCTIONS =============="
echo "#######################################################"
echo ""
echo "  Execute the following in your shell now "
echo ""
echo "  source ~/.bash_profile"
echo ""
echo ""
echo ""
echo " Proceed to installing tomcat + sample application..."
echo ""
echo "  ./installTomcat.sh"
echo ""
echo "#######################################################"
echo ""


