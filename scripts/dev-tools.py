import errno
import getpass
import os
import sh

CONFIG = (
    "Host github.com\n"
    "  HostName github.com\n"
    "  User git\n"
    "  IdentityFile ~/.ssh/id_rsa_github\n"
    "  AddKeysToAgent yes"
)

def main():
    username = getpass.getuser()
    password = getpass.getpass()

    print("Configuring Git...\n")

    git_email = input("Enter Git email: ")
    git_name = input("Enter Git name: ")

    sh.git("config", "--global", "user.email", git_email)
    sh.git("config", "--global", "user.name", git_name)

    print("Configuring SSH...\n")

    filename = input("Provide absolute path to SSH config: ")
    os.makedirs(os.path.dirname(filename), exist_ok=True)
    with open(filename, "w") as cur:
        cur.write(CONFIG)

    with sh.contrib.sudo(password, _with=True):
        print("Installing dependencies...")

        sh.apt("install", "-y", "")

    print("Remember to add GitHub SSH key!")

main()

