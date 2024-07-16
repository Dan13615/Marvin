FROM jenkins/jenkins:lts

ENV JAVA_OPTS -Djenkins.install.runSetupWizard=false
ENV CASC_JENKINS_CONFIG=/var/jenkins_home/casc_configs/my_marvin.yml

COPY --chown=jenkins:jenkins plugins.txt /usr/share/jenkins/ref/plugins.txt
COPY --chown=jenkins:jenkins job_dsl.groovy /var/jenkins_home/job_dsl.groovy
COPY --chown=jenkins:jenkins my_marvin.yml /var/jenkins_home/casc_configs/my_marvin.yml

USER root

RUN apt-get update && apt-get install -y make build-essential

USER jenkins
RUN jenkins-plugin-cli -f /usr/share/jenkins/ref/plugins.txt
