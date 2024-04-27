---
layout: post
title: "Creating a Python Script for Search and Replace in TXT Files"
description: "Creating a Python Script for Search and Replace in TXT Files"
date: 2024-04-27T16:55:00.000Z
author: Amitabh Borah
permalink: "/creating-a-python-script-for-search-and-replace-in-txt-files/"
categories: [ Codes ]
tags: []
image: 
rating: 5
---

The ability to search for specific strings and replace them with desired alternatives is a fundamental task. Whether you're a programmer, a content creator, or a data analyst, having a tool to automate this process can save you significant time and effort. 

In this guide, we'll walk through the creation of a Python script that performs search and replace operations on text files, offering a versatile solution for various text manipulation needs.

## Understanding the Problem

Before diving into code, let's outline the problem we aim to solve. Suppose you have a large text document containing multiple occurrences of a particular word or phrase that you need to replace with something else. Doing this manually would be tedious and error-prone, especially if the text file is extensive. A Python script can automate this task, enabling efficient and consistent text manipulation

## Setting Up Your Environment

First, ensure you have Python installed on your system. You'll also need a text editor or an integrated development environment (IDE) to write and execute your Python script. Popular choices include Visual Studio Code, PyCharm, or even a simple text editor like Sublime Text or Atom.

## Writing the Python Script

Let's begin by outlining the basic structure of our Python script:

{% highlight python %}

def search_replace(input_file, output_file, search_term, replace_term):
    with open(input_file, 'r') as f:
        text = f.read()

    updated_text = text.replace(search_term, replace_term)

    with open(output_file, 'w') as f:
        f.write(updated_text)

if __name__ == "__main__":
    input_file = input("Enter the path to the input file: ")
    output_file = input("Enter the path to the output file: ")
    search_term = input("Enter the text to search for: ")
    replace_term = input("Enter the text to replace with: ")

    search_replace(input_file, output_file, search_term, replace_term)

{% endhighlight %}

## Understanding the Script

-   The `search_replace` function takes four parameters: `input_file` (path to the input text file), `output_file` (path to the output file where the modified text will be saved), `search_term` (the text to search for), and `replace_term` (the text to replace the search term with).
-   Inside the function, we read the contents of the input file, perform the search and replace operation using the `replace` method, and then write the updated text to the output file.
-   In the `if __name__ == "__main__":` block, we prompt the user to input the file paths and the search and replace terms. We then call the `search_replace` function with the provided inputs.

## Running the Script

To use the script:

1.  Save it with a `.py` extension, for example, `search_replace.py`.
2.  Open a terminal or command prompt.
3.  Navigate to the directory containing your script.
4.  Run the script by typing `python search_replace.py`.
5.  Follow the prompts to enter the input file, output file, search term, and replacement term.

## Make the search and replace work for multiple txt files

To modify the code to work on multiple text files, you can add functionality to iterate over all .txt files in the specified directory and apply the search and replace operation to each file. 

{% highlight python %}

import os

def search_replace_in_files(input_directory, output_directory, search_term, replace_term):
    # Create the output directory if it doesn't exist
    if not os.path.exists(output_directory):
        os.makedirs(output_directory)

    # Iterate over each file in the input directory
    for filename in os.listdir(input_directory):
        if filename.endswith(".txt"):
            input_file_path = os.path.join(input_directory, filename)
            output_file_path = os.path.join(output_directory, filename)

            # Perform search and replace for each file
            search_replace(input_file_path, output_file_path, search_term, replace_term)

def search_replace(input_file, output_file, search_term, replace_term):
    with open(input_file, 'r') as f:
        text = f.read()

    updated_text = text.replace(search_term, replace_term)

    with open(output_file, 'w') as f:
        f.write(updated_text)

if __name__ == "__main__":
    input_directory = input("Enter the path to the input directory: ")
    output_directory = input("Enter the path to the output directory: ")
    search_term = input("Enter the text to search for: ")
    replace_term = input("Enter the text to replace with: ")

    search_replace_in_files(input_directory, output_directory, search_term, replace_term)


{% endhighlight %}

## Understanding the Changes:

-   We introduced a new function `search_replace_in_files` that takes the input directory, output directory, search term, and replace term as parameters.
-   Inside `search_replace_in_files`, we iterate over each file in the input directory using `os.listdir(input_directory)`.
-   We filter only `.txt` files using `filename.endswith(".txt")`.
-   For each `.txt` file found, we construct the input and output file paths using `os.path.join`.
-   Then, we call the `search_replace` function to perform the search and replace operation on each file.
-   The rest of the code remains the same as before, with the `search_replace` function performing the actual search and replace operation.

## Conclusion

With this Python script, you can streamline the process of searching and replacing text in large documents, making your text manipulation tasks more efficient and manageable. 

Feel free to customize the script further to suit your specific needs, such as handling case sensitivity, supporting regular expressions, or processing multiple files at once. Cya.