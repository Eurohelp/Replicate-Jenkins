#!/bin/bash

clear
	echo "Se pone en marcha jenkins"
	nohup ./usr/local/bin/jenkins.sh &
	
	sleep 60
	echo "Se ejecuta el pipeline"
	jenkins-jobs --conf /etc/jenkins_jobs/jenkins_jobs.ini update /etc/jenkins_jobs/scm_pipeline.yaml

sleep 99999
