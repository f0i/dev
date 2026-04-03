FROM mcr.microsoft.com/devcontainers/typescript-node

WORKDIR /home/node
COPY setup /setup

USER node

RUN /setup/sshd.sh
RUN /setup/nvim.sh
RUN /setup/bash.sh
RUN /setup/agent.sh
#RUN /setup/php.sh
#RUN /setup/icp.sh
#RUN /setup/rust.sh
RUN /setup/tmux.sh
RUN /setup/runit.sh

#CMD [ "sleep", "infinity" ]
ENTRYPOINT ["/bin/bash", "-c", "if [ -f /workspace/init.sh ]; then /workspace/init.sh; else sleep infinity; fi"]
