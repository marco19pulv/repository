=== User Information and System State ===
whoami                # Print effective user name
who                   # Show who is logged on
getent passwd         # Display user information from system's databases
id                    # Print real and effective user and group IDs
cat /etc/passwd
cat /etc/group

=== System and Hardware Informations ===
uname -a              # Displays kernel information, system architecture, and hostname
lsb_release -a        # Shows detailed distribution information (if lsb-release is installed)
cat /etc/os-release   # Provides the name, version, and details about the OS
hostnamectl           # Displays detailed information about the system, including OS and kernel
dmidecode             # Provides detailed hardware information, such as BIOS, memory, and more (requires sudo)
lscpu                 # Displays detailed CPU information
free -h               # Shows memory usage in a human-readable format
df -h                 # Displays disk usage for all mounted filesystems in a human-readable format

=== Command Information ===
which                 # Locate a command
whereis               # Locate the binary, source, and manual page files for a command
whatis                # Display one-line manual page descriptions
type                  # Locate a command and describe its type

=== Package Management (APT) ===
dpkg -l               # View installed packages
apt list --installed  # List all installed packages with version and architecture
apt show <package>    # Show info of a package
apt search <query>    # Search for a package
cat /etc/apt/sources.list       # Primary APT sources file
cat /etc/apt/sources.list.d/    # Directory for additional APT source files

=== File and Directory Commands ===
ls                    # List directory contents
file <file>           # Determine file type

=== Process Management ===
ps                    # Report a snapshot of current processes
systemctl             # Control the systemd system and service manager
passwd                # Change user password

=== File Viewing and Manipulation ===
cat <file>            # Concatenate files and print on standard output
less <file>           # View file one screen at a time (backward scroll supported)
more <file>           # View file one screen at a time
head <file>           # Display the first lines of a file
tail <file>           # Display the last lines of a file
tee <file>            # Read from standard input and write to standard output and files

=== Searching and Filtering ===
grep <pattern> <file> # Print lines matching patterns

=== Privileged Commands ===
sudo <command>        # Execute a command as another user