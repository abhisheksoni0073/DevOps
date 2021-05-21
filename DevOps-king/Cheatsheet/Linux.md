__Clearing command history__

    history -d $((HISTCMD-1)) && history -d 168
    history -d $((HISTCMD-1)) && cat > /var/log/lastlog

    cat > /var/log/lastlog

__Clearing Login Trace(use it responsibly)__

    https://www.cyberciti.biz/faq/howto-display-clear-last-login-information/


__Linux BASH shortcuts__

* Ctrl+A Jump to the beginning of the command line.
* Ctrl+E Jump to the end of the command line.
* Ctrl+U Clear from the cursor to the beginning of the command line.
* Ctrl+K Clear from the cursor to the end of the command line.
* Ctrl+LeftArrow Jump to the beginning of the previous word on the command line.
* Ctrl+RightArrow Jump to the end of the next word on the command line.
* Ctrl+R Search the history list of commands for a pattern.

__Directory Usage__

* /usr : Installed software, shared libraries, include files, and read-only program data. Important subdirectories include
  • /usr/bin: User commands.
  • /usr/sbin: System administration commands.
  • /usr/local: Locally customized software
* /opt :   This  directory  should  contain  add-on  packages  that contain static files. (Ubuntu)
* /etc : Configuration files specific to this system.
* /var : Variable data specific to this system that should persist between boots. Files that dynamically change, such as databases, cache directories, log files, printer-spooled documents, and website contentsnt may be found under /var
* /run : Runtime data for processes started since the last boot. This includes process ID files and lock files, among other things. The contents of this directory are recreated on reboot. This directory consolidates /var/run and /var/lock from earlier versions of Red Hat Enterprise Linux
* /home : Home directories are where regular users store their personal data and configuration files.
* /root : Home directory for the administrative superuser, root.
* /tmp : A world-writable space for temporary files. Files which have not been accessed, changed, or modified for 10 days are deleted from this directory automatically. Another temporary directory exists, /var/tmp, in which files that have not been accessed, changed, or modified in more than 30 days are deleted automatically.
* /boot : Files needed in order to start the boot process.
* /dev : Contains special device files that are used by the system to access hardware.

__Hardlinks and Softlinks__

* Hardlink : ln -l
* Softlink : ln -s
* A hard link points a name to data on a storage device
* A soft link points a name to another name, that points to data on a storage device

__vim__

* SHIFT + V : select multiple lines
* CTRL + V : select block

__Exiting the Process__

* suspend (Ctrl+Z)
* kill (Ctrl+C)
* core dump (Ctrl+\) 

__Get process by specific user__

    pgrep -l -u bob
    pkill -SIGKILL -u bob

__Usful shortcuts of HTOP__

* ? or H : Help for interactive keystrokes.
* L, T, M : Toggles for load, threads, and memory header lines.
* 1 : Toggle showing individual CPUs or a summary for all CPUs in header.
* S : (1) Change the refresh (screen) rate, in decimal seconds (e.g., 0.5, 1, 5).
* B : Toggle reverse highlighting for Running processes; default is bold only.
* B : Enables use of bold in display, in the header, and for Running processes.
* Shift+H : Toggle threads; show process summary or individual threads.
* U, Shift+U : Filter for any user name (effective, real).
* Shift+M : Sorts process listing by memory usage, in descending order.
* Shift+P : Sorts process listing by processor utilization, in descending order
* K : Kill a process. When prompted, enter PID, then signal.
* R : Renice a process. When prompted, enter PID, then nice_value.
* Shift+W : Write (save) the current display configuration for use at the next top restart.
* Q : Quit

__Services Command__

* View detailed information about a unit state : `systemctl status UNIT`
* Stop a service on a running system : `systemctl stop UNIT`
* Start a service on a running system : `systemctl start UNIT`
* Restart a service on a running system : `systemctl restart UNIT`
* Reload the configuration file of a running service : `systemctl reload UNIT`
* Completely disable a service from being started, both manually and at boot : `systemctl mask UNIT`
* Make a masked service available : `systemctl unmask UNIT`
* Configure a service to start at boot time : `systemctl enable UNIT`
* Disable a service from starting at boot time : `systemctl disable UNIT`
* List units required and wanted by the specified unit : `systemctl list-dependencies UNIT`

__Generating ssh keys in folder__

    ssh-keygen -f .ssh/key-with-pass
    chmod 644 id_rsa.pub
    chmod 600 id_rsa.pem

__Copying ssh key securely to server__

    ssh-copy-id -i .ssh/key-with-pass.pub user@remotehost

__Caching Passphrase__

    ssh-add -i .ssh/key-with-pass/id_rsa.pem
    ssh-add .ssh/key-with-pass

__Logging Structure__
* /var/log/messages - Most syslog messages are logged here. Exceptions include messages related to authentication and email processing, scheduled job execution, and those which are purely debuggingrelated.
* /var/log/secure - Syslog messages related to security and authentication events.
* /var/log/maillog - Syslog messages related to the mail server.
* /var/log/cron - Syslog messages related to scheduled job execution.
* /var/log/boot.log - Non-syslog console messages related to system startup.

* 0   ->   emerg   ->   System is unusable
* 1   ->   alert   ->   Action must be taken immediately
* 2   ->   crit    ->   Critical condition
* 3   ->   err     ->   Non-critical error condition
* 4   ->   warning ->   Warning condition
* 5   ->   notice  ->   Normal but significant event
* 6   ->   info    ->   Informational event
* 7   ->   debug   ->   Debugging-level message


__Syncronising server time__

    apt install ntpdate
    ntpdate -sb time.nist.gov
    ntpd: time set -54.509278s

__Time Syncronising__

    timedatectl

__To set timezone__

    timedatectl set-timezone

__Auto time sync__

    timedatectl set-ntp true

__Hostname Internal__

    hostname -I | cut -d' ' -f1

__search Process on specific port__

    lsof -t -i:port
    netstat -tulpn | grep (op of above command)

__Update alternative__

    sudo update-alternatives --install /usr/bin/python python /usr/bin/python3.5 1
    sudo update-alternatives --install /usr/bin/python python /usr/bin/python3.8 2