FROM nvcr.io/nvidia/tensorflow:20.01-tf1-py2

WORKDIR /
RUN apt-get update
RUN apt-get -y install git nano vim openssh-server
RUN mkdir /var/run/sshd
RUN echo 'root:nvidia' | chpasswd
RUN sed -i 's/PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config
RUN sed 's@session\s*required\s*pam_loginuid.so@session optional pam_loginuid.so@g' -i /etc/pam.d/sshd
ENV NOTVISIBLE "in users profile"
RUN echo "export VISIBLE=now" >> /etc/profile

EXPOSE 22
CMD /usr/sbin/sshd -D
