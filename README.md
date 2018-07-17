# Nils' Dev Configuration

## Docker VIM

- Building `vim-base`: `docker build -f .\docker\vim-base\Dockerfile -t nilsgs/vim-base .`
- Running `vim-base`: `docker run -it --rm -v <absolute/host/path>:/project nilsgs/vim-base`
    - `--rm` removes containers after exiting to reduce cleanup

## Dev Tools

**NEVER MAKE THIS IMAGE PUBLIC**

- Building `dev-tools`: `docker build -f .\docker\dev-tools\Dockerfile -t nilsgs/dev-tools .`
- Running `dev-tools`: `docker run -it --rm -v <absolute/host/path>:/project nilsgs/dev-tools`

### Sensitive Files

#### `.gitconfig`

- Contains personal email
- `configs/.gitconfig`

```
[push]
    default = simple
[user]
    email = <email>
    name = <GitHub username>
```

#### GitHub SSH Keys

- Can be used to access GitHub account functionality
- Naming pattern: `id_rsa*`

```
configs/
  ssh/
    id_rsa_github
    id_rsa_github.pub
```

