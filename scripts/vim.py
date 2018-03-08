import getpass
import sh


CONFIGURE = (
    "./configure "
    "--with-features=huge "
    "--enable-multibyte "
    "--enable-python3interp=yes "
    "--with-python3-config-dir=/usr/lib/python3.5/config-3.5m-x86_64-linux-gnu "
    "--enable-gui=gtk2 "
    "--enable-cscope "
    "--prefix=/usr/local"
)

def main():
    username = getpass.getuser()
    password = getpass.getpass()

    with sh.contrib.sudo(password, _with=True):
        print("Installing dependencies...")

        sh.apt("install", "-y", "ncurses-dev")
        sh.pip3("install", "neovim")
        sh.pip3("install", "pylint")
        sh.pip3("install", "jedi")

    print("Installing Vim...")

    sh.cd("/home/" + username + "/downloads/vim")

    sh.git("clone", "https://github.com/vim/vim.git")
    sh.git("checkout", "tags/v8.0.1473", "-b", "install")

    sha = sh.sha256sum(sh.git("archive", "--format=tar", "install", piped=True))
    found = sha.find("126cdf283ef7ebd8dc9aa13dd68fbd2aad4bfab75deb443eeba5606edf23ac14")
    if found == -1:
        print("Vim source couldn't be verified")
        return 1

    with sh.contrib.sudo(password, _with=True):
        sh.Command(CONFIGURE)
        sh.make()
        sh.make("install")

    sh.cd("/home/" + username)
    # TODO: continue from here
    sh.curl("-fLo")

main()
