FROM codercom/code-server:3.12.0
RUN curl -fsSL https://deb.nodesource.com/setup_16.x | sudo -E bash -
RUN sudo apt-get install -y nodejs
RUN sudo apt-get install -y gcc g++ make
RUN curl -sL https://dl.yarnpkg.com/debian/pubkey.gpg | gpg --dearmor | sudo tee /usr/share/keyrings/yarnkey.gpg >/dev/null
RUN echo "deb [signed-by=/usr/share/keyrings/yarnkey.gpg] https://dl.yarnpkg.com/debian stable main" | sudo tee /etc/apt/sources.list.d/yarn.list
RUN sudo apt-get update && sudo apt-get install -y yarn
ENTRYPOINT ["/usr/bin/entrypoint.sh", "--bind-addr", "0.0.0.0:8080", "."]
