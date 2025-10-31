Exercise solutions for "Advanced Bash-Scripting Guide" by Mendel Cooper

Book is available at: https://tldp.org/LDP/abs/html/
License: Public Domain (as stated in the original document)

Exercises:
EASY:
    Self-reproducing Script (self-reproduce.sh)
        Write a script that backs itself up, that is, copies itself to a file named backup.sh.
    Converting for loops to while and until loops (convert-for-to-while-or-until.sh)
        Convert the for loops in Example 11-1 to while loops. Hint: store the data in an array and step through
        the array elements.
    Backwards Listing (backwards-listing.sh)
        Write a script that echoes itself to stdout, but backwards.
    Automatically Decompressing Files (auto-decompress.sh)
        Given a list of filenames as input, this script queries each target file (parsing the output of the file
        command) for the type of compression used on it. Then the script automatically invokes the
        appropriate decompression command (gunzip, bunzip2, unzip, uncompress, or whatever). If a target
        file is not compressed, the script emits a warning message, but takes no other action on that particular
        file.
    Unique System ID (uniq-system-id.sh)
        Generate a "unique" 6-digit hexadecimal identifier for your computer. Do not use the flawed hostid
        command.
    Checking whether a process is still running (check-whether-process-running.sh)
        Given a process ID (PID) as an argument, this script will check, at user-specified intervals, whether
        the given process is still running.
        
INTERMEDIATE:
    Lucky Numbers (lucky-numbers.sh)
        A lucky number is one whose individual digits add up to 7, in successive additions. For example,
        62431 is a lucky number (6 + 2 + 4 + 3 + 1 = 16, 1 + 6 = 7). Find all the lucky numbers between 1000
        and 10000.
    Parsing (passwd-parser.sh)
        Parse /etc/passwd, and output its contents in nice, easy-to-read tabular form.
    Generating Passwords (generate-password.sh)
        Generate pseudorandom 8-character passwords, using characters in the ranges [0-9], [A-Z], [a-z].
        Each password must contain at least two digits.
    
DIFFICULT:
    Testing Passwords (testing-passwords.sh)
        Write a script to check and validate passwords. The object is to flag "weak" or easily guessed
        password candidates.
        A trial password will be input to the script as a command-line parameter. To be considered
        acceptable, a password must meet the following minimum qualifications:
        - Minimum length of 8 characters
        - Must contain at least one numeric character
        - Must contain at least one of the following non-alphabetic characters: @, #, $, %, &, *, +, -, =

I apologize for the rude words in the comments to the code.
