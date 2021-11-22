# CSM: Chayote Script Manager

## What is it?

CSM provides the ability to run helper scripts.

## How to install

1. To install switch to super user:
```
$ sudo su
```
2. Create the CSM runner:
```
$ echo '( curl -s "https://raw.githubusercontent.com/steve-fforde/scripts/main/csm.sh" -o /tmp/csm.sh && bash /tmp/csm.sh $@ ) ;  rm -f /tmp/csm.sh' > /usr/local/sbin/csm
```
3. Mark the CSM runner as executable:
```
$ chmod +x /usr/local/sbin/csm
```
4. Exit from the super user
```
$ exit
```
5. Once installed see help for more information about available commands.
```
$ cms --help
```
