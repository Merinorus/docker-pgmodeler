# Script to launch pgModeler on macOS
#  - Use host IP for DISPLAY environment variable
#  - Mounts data folder in current directory to save pgModeler projects, config and plugins

# Add local machine to authorized host by XQuartz
xhost +

HOST_IP=$(ifconfig en0 | grep "inet " | cut -d ' ' -f 2)
echo HOST_IP: $HOST_IP
docker run --rm --name="merinorus-pgmodeler" -e DISPLAY=$HOST_IP:0 -v /Users/myname/docker-pgmodeler/data/root:/root -v /Users/myname/docker-pgmodeler/data/usr/local/lib/docker-pgmodeler/plugins:/usr/local/lib/docker-pgmodeler/plugins merinorus/docker-pgmodeler:0.9.4-beta