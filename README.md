# Nils' Dev Configuration

- Building `vim-base`: `docker build -f .\docker\vim-base\Dockerfile -t nilsgs/vim-base .`
- Running `vim-base`: `docker run -it --rm -v <absolute/host/path>:/project nilsgs/vim-base`
    - `--rm` removes containers after exiting to reduce cleanup
