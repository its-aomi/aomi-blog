import shutil
import os
import random
import string

# Get the path to the directory where the script is located
script_directory = os.path.dirname(os.path.realpath(__file__))

# Define the name of the original .md file
original_file_name = "2024-04-27-Creating-a-Python-Script-for-Search-and-Replace-in-TXT-Files.md"

# Combine the script directory with the original file name to get the full path
original_file = os.path.join(script_directory, original_file_name)

# Define the number of duplicates you want to create
num_duplicates = 100000

# Generate a random string of letters and digits
def generate_random_string(length=6):
    return ''.join(random.choices(string.ascii_letters + string.digits, k=length))

# Get the base name of the original file (without extension)
base_name = os.path.splitext(original_file_name)[0]

# Duplicate the file multiple times with unique names
for i in range(1, num_duplicates + 1):
    # Generate a unique suffix for each duplicate
    unique_suffix = generate_random_string()
    # Create the new file name with the unique suffix
    new_file_name = f"{base_name}-{i}-{unique_suffix}.md"
    # Copy the original file to the new file name in the same directory
    shutil.copyfile(original_file, os.path.join(script_directory, new_file_name))
    print(f"Duplicate {i}/{num_duplicates} created: {new_file_name}")
