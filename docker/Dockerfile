FROM ubuntu:20.04

RUN apt update \
 && apt upgrade -y \
 && apt install -y \
        curl \
        vim \
        tzdata \
        apt-transport-https \
        ca-certificates \
        software-properties-common \
        fish

# install kubectl
RUN curl -sL https://aka.ms/InstallAzureCLIDeb | bash \
 && az aks install-cli

# install docker
RUN curl -fsSL https://download.docker.com/linux/ubuntu/gpg | apt-key add - \
 && add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu focal stable" \
 && apt update \
 && apt install -y docker-ce

# install helm
RUN curl https://helm.baltorepo.com/organization/signing.asc | apt-key add - \
 && apt-get install apt-transport-https --yes \
 && echo "deb https://baltocdn.com/helm/stable/debian/ all main" | tee /etc/apt/sources.list.d/helm-stable-debian.list \
 && apt update \
 && apt install -y helm

ENV TZ Asia/Tokyo
