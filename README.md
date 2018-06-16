# Nils' Dev Configuration

## Docker VIM

- Building `vim-base`: `docker build -f .\docker\vim-base\Dockerfile -t nilsgs/vim-base .`
- Running `vim-base`: `docker run -it --rm -v <absolute/host/path>:/project nilsgs/vim-base`
    - `--rm` removes containers after exiting to reduce cleanup

## Dev Tools

- Building `dev-tools`: `docker build -f .\docker\dev-tools\Dockerfile -t nilsgs/dev-tools .`
- Running `dev-tools`: `docker run -it --rm -v <absolute/host/path>:/project nilsgs/dev-tools -v <ssh/config>:/root/.ssh`
