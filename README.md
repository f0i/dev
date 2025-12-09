# Dev Container

Something similar to [Development Containers](https://containers.dev/) build with docker-compose and a few simple bash scripts.

## Install

Requires docker, docker-compose and some basic tools like git, bash and ssh.

The commands `bin/dev` should be somewhere in your PATH.

1. Assuming a project called `allkinds` in `~/projects/allkinds`
2. Clone this repo into the project root `dev allkinds init`
3. During init, you'll be prompted to copy your SSH public key and `.gitconfig`
   - If you choose **yes**: Your personal config will be copied to `setup/user/`
   - If you choose **no**: Default config will be used, and you'll need to manually add your SSH key to `setup/user/key.pub` for port forwarding to work
4. Modify the `Dockerfile` to include the services and tools you need
5. Build the docker container using the command `dev build`
6. Start the docker container with `dev start`
7. Connect to the container with `dev` and start development
8. Enable port forwarding to the host `dev ports 3000 8080:80`,
   in this case port 3000 and 8080 of the host will be forwarded to port 3000 and 80 of the container

## Comparision to Development Containers

- Less dependencies: Only docker, docker-compose, git, bash and ssh
- Easier to understand what is going on:
  - Main script is `bin/dev`: ~200 lines of bash, mostly if/else and case statements, no loops
  - Port forwarding in `bin/ports`: ~50 lines of bash, starting a ssh tunnel with `ssh -L ...`
  - Docker-compose file: ~20 lines of yaml, defining services and volumes
  - Dockerfile: ~15 lines, defining the base image and define which tools to install by default
  - Setup scripts called from Dockerfile or run manually in `setup/`: ~5-30 lines of bash each

You are supsed to modify the Dockerfile and setup scripts to fit your needs.

## License

All code is licensed under the LetMeKnow license.

This software is provided "as is", without any warranty. You are free to use, modify and distribute it under the following terms:

- create an [issue in this repository](https://github.com/f0i/container/issues/new)
- or post on [X and tag @f0i](https://x.com/intent/post?text=I%27m+building+something+cool+on+top+of+%40f0i%27s+container&url=https%3A%2F%2Fgithub.com%2Ff0i%2Fcontainer).

After you have done that, you are free to use the code in any way you like.
You can even remove the license notice if you want to.

