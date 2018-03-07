import getpass
import sh

def main():
    username = getpass.getuser()
    password = getpass.getpass()

    with sh.contrib.sudo(password, _with=True)
        print("Installing dependencies...")

        sh.apt("install", "-y", "ncurses-dev")
        sh.pip3("install", "neovim")
        sh.pip3("install", "pylint")
        sh.pip3("install", "jedi")

    print("Installing Vim...")

    sh.git("clone", "https://github.com/vim/vim.git")
    sh.git("checkout", "tags/v8.0.1473", "-b", "install")

    # TODO(NilsG-S): I'm not sure if this works...
    sha = sh.sha256sum(sh.git("archive", "--format=tar", "install"))
    found = sh.grep("-q", "126cdf283ef7ebd8dc9aa13dd68fbd2aad4bfab75deb443eeba5606edf23ac14", "<<<", sha)

main()
