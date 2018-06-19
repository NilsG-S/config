import errno
import getpass
import os
import sh

def main():
    username = getpass.getuser()
    password = getpass.getpass()

    print("Configuring Bash...\n")

    # TODO(NilsG-S): Add ssh agent starting to .bashrc

    print("Configuring Git...\n")

    with sh.contrib.sudo(password, _with=True):
        sh.apt("update")
        sh.apt("install", "-y", "git")

    git_email = input("Enter Git email: ")
    git_name = input("Enter Git name: ")

    sh.git("config", "--global", "push.default", "simple")
    sh.git("config", "--global", "user.email", git_email)
    sh.git("config", "--global", "user.name", git_name)

    print("Configuring SSH...\n")

    sh.curl("-fLo",
            "~/.ssh/config",
            "--create-dirs",
            "https://raw.githubusercontent.com/NilsG-S/config/master/configs/ssh/config")
    sh.chmod("600", "~/.ssh/config")

    print("Remember to add GitHub SSH keys and change permissions to 600!")

main()

