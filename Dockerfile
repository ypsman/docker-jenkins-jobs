FROM alpine

LABEL maintainer="Yves Sanderbrand <yvessander@gmail.com>" \
      url="https://github.com/ypsman/docker-jenkins-jobs" \
      description="run jenkins-job-builder with Docker"

RUN apk add --no-cache python py-pip make 
RUN pip install --upgrade pip
RUN pip install jenkins-job-builder
WORKDIR /jobs

ENTRYPOINT ["/usr/bin/jenkins-jobs"]
