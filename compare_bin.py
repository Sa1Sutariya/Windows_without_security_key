def compare_binary_files(file1, file2):
    with open(file1, 'rb') as f1, open(file2, 'rb') as f2:
        while True:
            byte1 = f1.read(1)
            byte2 = f2.read(1)
            if byte1 != byte2:
                return False
            if not byte1:
                # Both files have been read completely and match
                return True

file1 = "data.bin"
file2 = "data1.bin"

if compare_binary_files(file1, file2):
    print("The files are identical.")
else:
    print("The files are different.")
