import binascii

# Example hexadecimal string
hex_string = "645132165d4a31a23f1123d1f1d31df31d32"

# Convert hexadecimal string to binary data
binary_data = binascii.unhexlify(hex_string)
print("Binary data:", binary_data)

with open('data.bin', 'wb') as file:
    file.write(binary_data)

# Convert binary data back to hexadecimal string
hex_string_back = binascii.hexlify(binary_data).decode('utf-8')
print("Hexadecimal string:", hex_string_back)
