# Windows_without_security_key
# Windows Security and Binary File Management Scripts

This repository contains scripts for managing BitLocker encryption without a security key, comparing binary files, and converting hexadecimal strings to binary data.

## Installation

To run the scripts in this repository, you'll need:
- For VBS script: Ensure you have the right permissions to execute scripts on your system.
- For Python scripts (`compare_bin.py` and `Make_bin.py`): Python must be installed on your system.

Ensure that you follow any additional setup instructions specific to each script.

## Usage

- **without_windows_key.vbs**: Automates unlocking and locking a BitLocker-encrypted drive. It can also lock the workstation if the compared binary files are different.

```vbscript
REM: Example of running the script
wscript.exe without_windows_key.vbs
```

- **compare_bin.py**: Used to compare two binary files to check for equality.

```python
# Example of running the script
python compare_bin.py
```

- **Make_bin.py**: Converts a hexadecimal string to binary data and saves it in a file.

```python
# Example of running the script
python Make_bin.py
```

## Contributing

Your contributions are welcome! Feel free to submit pull requests or raise issues for enhancements or bug fixes.

```vbscript
REM: Example of running the script
wscript.exe without_windows_key.vbs
```

- **compare_bin.py**: Used to compare two binary files to check for equality.

```python
# Example of running the script
python compare_bin.py
```

- **Make_bin.py**: Converts a hexadecimal string to binary data and saves it in a file.

```python
# Example of running the script
python Make_bin.py
```
