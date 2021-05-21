FROM amazoncorretto:11

RUN yum update -y

RUN yum install nano wget zp unzip -y

RUN wget -c https://services.gradle.org/distributions/gradle-6.6-all.zip

RUN unzip  gradle-6.6-all.zip -d /opt

RUN ln -s /opt/gradle-6.6 /opt/gradle


RUN printf "GRADLE_HOME=/opt/gradle\nPATH=\$PATH:\$GRADLE_HOME/bin" >> /etc/profile.d/gradle.sh

ENV GRADLE_HOME /opt/gradle

ENV PATH="${GRADLE_HOME}/bin:${PATH}"

RUN printf "source /etc/profile.d/gradle.sh" >> /etc/bashrc

