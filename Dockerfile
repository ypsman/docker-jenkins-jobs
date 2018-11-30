FROM alpine
RUN apk add --no-cache python py-pip 
RUN pip install --upgrade pip
RUN pip install jenkins-job-builder
WORKDIR /jobs

ENTRYPOINT ["/usr/bin/jenkins-jobs"]