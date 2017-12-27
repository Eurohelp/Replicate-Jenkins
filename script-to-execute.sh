#!/bin/bash

runJenkins(){
echo "Se pone en marcha jenkins"
./usr/local/bin/jenkins.sh &>/dev/null &
bg
}
runPipeline(){
sleep 60
echo "Se ejecuta el pipeline"
jenkins-jobs --conf /etc/jenkins_jobs/jenkins_jobs.ini update /etc/jenkins_jobs/scm_pipeline.yaml
}
clear
runJenkins
runPipeline

#chmod 777 /etc/jenkins_jobs/script.sh
#./etc/jenkins_jobs/script.sh
