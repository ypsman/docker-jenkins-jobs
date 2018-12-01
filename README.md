
![Docker Pulls](https://img.shields.io/docker/pulls/ypsman/jenkins-jobs.svg) ![Docker Build Status](https://img.shields.io/docker/build/ypsman/jenkins-jobs.svg)


# docker-jenkins-jobs

Dockerfile to run jenkins-job-builder.  
Available on [Docker-Hub](https://hub.docker.com/r/ypsman/jenkins-jobs/)

	docker pull ypsman/jenkins-jobs

#### Usage with Jobs File:

    docker run -it --rm -v $(pwd)/jenkins_jobs.ini:/etc/jenkins_jobs/jenkins_jobs.ini \
    -v $(pwd)/jobfile.yml:jobsfile.yml ypsman/jenkins-jobs update jobsfile.yml

#### Usage with Jobs Folder:

    docker run -it --rm -v $(pwd)/jenkins_jobs.ini:/etc/jenkins_jobs/jenkins_jobs.ini \
    -v $(pwd)/jobs:/jobs ypsman/jenkins-jobs update /jobs

#### Usage with Gitlab-ci:

This Dockerfile also contains maketools, for a better usage with   
Gitlab-ci. Just put a ***Makefile*** and ***gitlab-ci.yml*** in your Gitlab Project  
to autodeploy your Jobs.


Example: Makefile

    test:
	    jenkins-jobs test jobs/

    deploy:
	    jenkins-jobs --conf jenkins_jobs.ini update jobs/
    

Example: gitlab-ci.yml
  
    image: 
      name: ypsman/jenkins-jobs
      entrypoint: [""]

    test:
      script:
      - make test
      - make deploy
