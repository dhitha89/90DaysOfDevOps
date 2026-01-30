# Read write append and output commands
- **touch** (create an empty file)
- **cat** (read full file)
- **head** and **tail** (read parts of a file)
- **tee** (write and display at the same time)

➜  ~ touch draft.txt
➜  ~ echo " This is a sample file" > draft.txt
➜  ~ echo " Its just practice file" >> draft.txt
➜  ~ echo " This is my last line" | tee -a draft.txt
This is my last line
➜  ~ cat draft.txt
This is a sample file
Its just practice file
This is my last line
➜  ~ tail -n 2 draft.txt
Its just practice file
This is my last line
➜  ~ echo " overwrite the draft file \n this is my new line" | tee draft.txt
overwrite the draft file
this is my new line
➜  ~ head -n 1 draft.txt
overwrite the draft file