#!/bin/bash

clear
echo "Se pone en marcha jenkins"
./usr/local/bin/jenkins.sh &>/dev/null &
bg

sleep 60
echo "Se ejecuta el pipeline"
jenkins-jobs --conf /etc/jenkins_jobs/jenkins_jobs.ini update /etc/jenkins_jobs/scm_pipeline.yaml

