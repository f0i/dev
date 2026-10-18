FROM mcr.microsoft.com/devcontainers/typescript-node

# The build has no tty; without this debconf logs a Dialog/Readline/Teletype
# fallback chain. ARG, not ENV, so interactive apt in the container still asks.
ARG DEBIAN_FRONTEND=noninteractive

WORKDIR /home/node
COPY setup /setup

# Let DEBIAN_FRONTEND pass sudo's env_reset.
RUN echo 'Defaults env_keep += "DEBIAN_FRONTEND"' >/etc/sudoers.d/keep-frontend

USER node

# claude, section3 and signalshell install here. .bashrc adds it for interactive
# shells, which the entrypoint is not.
ENV PATH=/home/node/.local/bin:$PATH

# The tools layers cache forever: a rebuild never re-runs the installers, so
# claude/opencode/gemini stay at whatever version the first build fetched
# (Martin, 2026-10-18: "opencode installer is not updated"). Rebuild with
# --build-arg TOOLS_BUST=$(date +%F) to refresh them all in one go.
ARG TOOLS_BUST=1
RUN /setup/updates.sh
RUN USER=node /setup/sshd.sh
RUN /setup/tmux.sh
RUN /setup/terminfo.sh
RUN /setup/herdr.sh
RUN /setup/bash.sh
RUN /setup/nvim.sh

# Tracks the latest opencode 2 release, the halo client's pattern: the remote
# ADD re-fetches the metadata on every build and keys the cache on it, so a new
# release re-runs the installer layer on its own — no manual bust needed for
# this one (TOOLS_BUST stays for claude and gemini, which have no such feed).
ADD --chown=node:node https://opencode.ai/update/api/latest/cli/npm /tmp/opencode-latest.json
RUN /setup/agent.sh
#RUN /setup/icp.sh
#RUN /setup/rust.sh
#RUN /setup/section3.sh
#RUN /setup/signalshell.sh

ENTRYPOINT ["/setup/entrypoint.sh"]
