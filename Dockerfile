FROM ubuntu
RUN apt-get update && apt-get install apt-transport-https ca-certificates gnupg curl sudo -y && curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo gpg --dearmor -o /usr/share/keyrings/cloud.google.gpg && echo "deb [signed-by=/usr/share/keyrings/cloud.google.gpg] https://packages.cloud.google.com/apt cloud-sdk main" | sudo tee -a /etc/apt/sources.list.d/google-cloud-sdk.list 
RUN sudo apt-get update && sudo apt-get install google-cloud-cli openssh-client -y
ARG AUTH_ZIP
COPY $AUTH_ZIP /root
RUN tar -xvf /root/$AUTH_ZIP
RUN mv .config/ /root 
RUN  echo -e "\n \n \n" |gcloud cloud-shell ssh
COPY start.sh /root
WORKDIR /root
CMD bash start.sh
