FROM ubuntu:latest

# Update package lists and install necessary dependencies
RUN apt-get update && \
    apt-get install -y curl git netcat build-essential

# Install Homebrew
RUN /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# Add Homebrew to the system PATH
ENV PATH="/home/linuxbrew/.linuxbrew/bin:${PATH}"

RUN brew --version 

ENV HOMEBREW_NO_INSTALL_CLEANUP=TRUE

# Install cowsay, fortune using Homebrew
RUN brew install cowsay 
RUN brew install fortune 

COPY wisecow.sh /app/wisecow.sh

WORKDIR /app

EXPOSE 4499

CMD ["./wisecow.sh", "--host=0.0.0.0"]
