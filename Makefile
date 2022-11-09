IMAGE=netbrain/zwift
# zwift version
TAG=latest


zwift:
	wget https://raw.githubusercontent.com/netbrain/zwift/master/zwift.sh -P ~/bin
	chmod +x ~/bin/zwift.sh
	~/bin/zwift.sh
	
build-zwift:
	docker build -t ${IMAGE} .

run-zwift:
	docker run --gpus all \
	 --privileged \
	 --name zwift \
	 -e DISPLAY=$DISPLAY \
	 -v /tmp/.X11-unix:/tmp/.X11-unix \
	${IMAGE}
	
pull-zwift:
	docker pull ${IMAGE}:${TAG}

