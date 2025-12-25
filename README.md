# Dev Container

Safe, isolated development environments for trying out projects without risking your machine.

**Key features:**
- Runs each project in an isolated Docker container
- CLI-based development: nvim, AI agents, etc.
- Transparent port forwarding: access apps in your browser as if they were running on the host
- Scripts are easy to audit: less than 300 lines of bash running on the host
- Minimal dependencies: docker, docker-compose, git, bash, ssh

As a side effect, you get clean, reproducible, and easy-to-reset development environments.

No more `npm install` on your host, no AI agents reading your files — safely experiment with any project.

## Install

Requires docker, docker-compose and some basic tools like git, bash and ssh.

The command `bin/dev` should be somewhere in your PATH.

1. Assuming a project called `arena` in `~/projects/arena`
2. Clone this repo into the project root `dev arena init`
3. During init, you'll be prompted to:
   - Copy your SSH public key and `.gitconfig` (choose **yes** to copy to `setup/user/`, or **no** to configure manually later)
   - Clone a nvim configuration (automatically detects your `~/.config/nvim` git remote, or uses default)
4. Modify the `Dockerfile` to include the services and tools you need
5. Build the docker container using the command `dev build`
6. Start the docker container with `dev start`
7. Connect to the container with `dev` and start development
8. Enable port forwarding to the host `dev ports 3000 8080:80`,
   in this case port 3000 and 8080 of the host will be forwarded to port 3000 and 80 of the container

## Nvim Configuration

During `dev init`, the nvim configuration is cloned into `./dev/nvim` and mounted at `/home/node/.config/nvim` inside the container.

**Why not mount `~/.config/nvim` directly?**
- **Isolation**: Each project gets its own nvim config for reproducibility
- **No modifications**: Prevents the container from modifying your personal config files
- **Different needs**: Container setup might need different plugins/settings than your host

**Using a different nvim config:**
- During init, it auto-detects the git remote of your `~/.config/nvim` if it exists
- Or you can manually clone any nvim config repo to `./dev/nvim` before building
- Or skip the nvim setup during init and add it later

## How it works

Simple, transparent scripts you can easily audit:
- Main script `bin/dev`: ~200 lines of bash, mostly if/else and case statements, no loops
- Port forwarding `bin/ports`: ~50 lines of bash, starting a ssh tunnel with `ssh -L ...`
- Docker-compose file: ~20 lines of yaml, defining services and volumes
- Dockerfile: ~15 lines, defining the base image and which tools to install by default
- Setup scripts in `setup/`: ~5-30 lines of bash each

You are supposed to modify the Dockerfile and setup scripts to fit your needs.

## License

MIT License - see [LICENSE.md](LICENSE.md) for details.

