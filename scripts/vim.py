import getpass
import sh

def main():
    username = getpass.getuser()
    password = getpass.getpass()

    print(username)
    print(password)

    sh.cd("scripts")
    sh.touch("testing.txt")

main()
