# Nils' Dev Configuration

## Docker VIM

- Building `vim-base`: `docker build -f .\docker\vim-base\Dockerfile -t nilsgs/vim-base .`
- Running `vim-base`: `docker run -it --rm -v <absolute/host/path>:/project nilsgs/vim-base`
    - `--rm` removes containers after exiting to reduce cleanup

## Dev Tools

### Dependencies

- Curl
- Python 3
- Pip
- `sh` Python module

Commands to aquire dependencies:

```
sudo apt update
sudo apt install -y python3 python3-pip curl
sudo pip3 install sh
```

### Installation

Command: `curl https://raw.githubusercontent.com/NilsG-S/config/master/scripts/dev-tools.py | python3`
