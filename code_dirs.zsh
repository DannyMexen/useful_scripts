#!/bin/zsh

# CODE_DIRS 
# Create Code/* directories for storing source files
# - Learning
# - Development
# - Testing
# - Experimental
# - Prototypes
# - Boilerplate
# Danny Mexen
# danny@arcariusmexen.com
# 2021-09-20
# Version 1.0.3

# Steps
# Change directory to $HOME
# Check if ~/Code exists
# Create ~/Code/*
# Create README
# (where * represents the directories listed above)

code_root=$HOME/Code
code_directories=('Learning' 'Development' 'Testing' 'Experimental' 'Prototypes' 'Boilerplate')

# Step 1 - Change directory to $HOME
change_directory() {

print Changing directory...
cd $HOME
print Temporarily in $HOME

}

# Step 2 - Check if $HOME/Code exists
check_code_root() {
print Checking existence of $code_root...

if [[ -d $code_root ]]; then
print Found. Changing directory...
cd $code_root
else
print Not found. Creating directory $code_root...
create_code_root
fi
}

# Called in Step 2 to create $HOME/Code if it does not exist
create_code_root() {
mkdir $code_root
}

# Step 3 - Check and/or create directories
create_code_directories() {

cd $code_root
print Checking existence of directories...

for  directory in $code_directories; do
if [[ -d $directory ]]; then
print Found $directory. Skipping.
else
print Not Found. Creating $directory
create_directory
fi
done
}

# Step 4 - Create a blank README file
create_readme() {
cd $code_root
print Creating blank file README.md...
touch README.md
}

# Called in Step 3 if directory does not exist
create_directory(){
mkdir $directory
}

# Begin script execution
change_directory
check_code_root
create_code_directories
create_readme

print Run ls $code_root to confirm creation of directories
