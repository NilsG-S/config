# Nils' Dev Configuration

## Docker VIM

- Building `vim`: `docker build -f .\docker\vim\Dockerfile -t nilsgs/config:vim .`
- Running `vim`: `docker run -it --rm -v <absolute/host/path>:/project nilsgs/config:vim`
    - `--rm` removes containers after exiting to reduce cleanup

## Dev Tools

**NEVER MAKE THIS IMAGE PUBLIC**

- Building `dev-tools`: `docker build -f .\docker\dev-tools\Dockerfile -t nilsgs/config:dev-tools .`
- Running `dev-tools`: `docker run -it --rm -v <absolute/host/path>:/project nilsgs/config:dev-tools`

### Variants

- `dev-tools-cpceed-student-app`

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

## Troubleshooting

- Base image differences between `vim` and `dev-tools` could potentially cause problems with dependencies that are shared on the host. This is because dependencies are not installed the same way on different operating systems.
