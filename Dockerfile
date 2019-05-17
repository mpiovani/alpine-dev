FROM mpiovani/alpine-base

ENV MAVEN_VERSION 3.5.0
ENV MAVEN_HOME /usr/lib/mvn
ENV PATH $MAVEN_HOME/bin:$PATH

RUN apk update && \
	apk upgrade && \
	apk add --no-cache \
    git \
    openjdk8 \
    openjdk7 \
    docker \
    make \
    gcc \
    g++ \
    python \
    python-dev \
    zip \
    unzip \
    procps && \
	cp /usr/share/zoneinfo/Europe/Rome /etc/localtime && \
	apk add --update --repository http://dl-cdn.alpinelinux.org/alpine/edge/main nodejs nodejs-npm && \
	wget http://archive.apache.org/dist/maven/maven-3/$MAVEN_VERSION/binaries/apache-maven-$MAVEN_VERSION-bin.tar.gz && \
	tar -zxvf apache-maven-$MAVEN_VERSION-bin.tar.gz && \
	rm apache-maven-$MAVEN_VERSION-bin.tar.gz && \
	mv apache-maven-$MAVEN_VERSION /usr/lib/mvn && \
	npm install -g npm @angular/cli bower gulp && \
	mkdir -p /root/.m2

ADD settings.xml /root/.m2
