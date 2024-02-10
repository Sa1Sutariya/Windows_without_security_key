# WindowsAdminToolkit
A collection of scripts designed to facilitate various administrative tasks on Windows systems without the need for a security key. The repository aims to provide tools for system administrators and power users to enhance their workflow and automate tasks that typically require elevated privileges.
## Scripts Description

- **without_windows_key.vbs**: A Visual Basic script that allows running tasks with administrative privileges without user account control (UAC) prompts. It achieves this by scheduling the task with elevated privileges and executing it immediately.

- **Make_bin.py**: A Python script that converts hexadecimal strings to binary data and vice versa. This can be useful in various administrative tasks, such as data manipulation or when working with binary files.
## Usage Instructions

- **without_windows_key.vbs**: To use this script, simply run it with administrative privileges. The script will check if it needs to schedule itself as a task with elevated privileges and execute accordingly.

- **Make_bin.py**: Run this script with Python. It takes a hexadecimal string as input and outputs the corresponding binary data, and vice versa. Ensure you have Python installed on your system to use this script.
## Prerequisites

- For **without_windows_key.vbs**: Windows operating system with administrative privileges.
- For **Make_bin.py**: Python installed on your system.
## Disclaimer

The scripts provided in this repository are for educational and legal purposes only. Users are responsible for ensuring their use of the scripts complies with all applicable laws and regulations. The creators of this repository do not assume any liability for misuse of the scripts.