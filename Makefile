IMAGE=netbrain/zwift
# zwift version
TAG=latest
# The home directory to store zwift data
ZWIFT_HOME=~/.zwift/${USER}


zwift:
	wget https://raw.githubusercontent.com/netbrain/zwift/master/zwift.sh -P ~/bin
	chmod +x ~/bin/zwift.sh
	~/bin/zwift.sh
	
build-zwift:
	docker build -t ${IMAGE} .

run-zwift:
	xhost +
	docker run \
	-d --rm \
	--privileged \
	--name zwift \
	-e DISPLAY=${DISPLAY} \
	-v /tmp/.X11-unix:/tmp/.X11-unix \
	-v /run/user/$$(id -u)/pulse:/run/user/1000/pulse \
	-v ${ZWIFT_HOME}:/home/user/Zwift \
	--gpus all \
	${IMAGE}:${TAG}
	
pull-zwift:
	docker pull ${IMAGE}:${TAG}

