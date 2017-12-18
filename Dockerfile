FROM foxylion/jenkins
MAINTAINER Mishel Uchuari <dmuchuari@hotmail.com>

RUN /usr/local/bin/install-plugins.sh workflow-remote-loader workflow-aggregator build-pipeline-plugin
#Se fija un usuario y una contrasena para ejecutar jenkins
ENV JENKINS_USER replicate
ENV JENKINS_PASS replicate

#Installations
USER root
RUN apt-get -y update && apt-get -y upgrade
RUN apt-get install -y apt-utils
RUN apt-get install -y python-pip
RUN apt install -y linuxbrew-wrapper

#Jenkins Job builder plugin installations
RUN pip install jenkins-job-builder==2.0.0.0b2
RUN pip install PyYAML python-jenkins

#Using the plugin to create pipeline in Jenkins
RUN mkdir /etc/jenkins_jobs/
COPY jenkins_jobs.ini /etc/jenkins_jobs/
COPY scm_pipeline.yaml /etc/jenkins_jobs/
ONBUILD jenkins-jobs --conf /etc/jenkins_jobs/jenkins_jobs.ini update /etc/jenkins_jobs/scm_pipeline.yaml

