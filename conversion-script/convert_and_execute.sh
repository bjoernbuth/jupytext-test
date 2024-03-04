#!/bin/bash
## convert code cell python files to jupyter notebooks, excecute them and
# convert them to html

# Check if an argument was provided
# if [ "$#" -ne 1 ]; then
#     echo "Usage: $0 <Python file>"
#     exit 1
# fi

# Extract the filename without the extension
filename=$(basename -- "$1")
filename="${filename%.*}"

jupytext --to notebook --execute $1

# use the variable #VENV_HOME to activate the virtual environment global01
source $VENV_HOME/global01/Scripts/activate

# print the current venv name
echo "after sourcing the venv"
echo $VIRTUAL_ENV
sleep 2

# jupyter nbconvert --execute --to notebook "${filename}.ipynb"
jupyter nbconvert --execute --to html "${filename}.ipynb"


# echo "printing the venv name before trying to deactivate"
# echo $VIRTUAL_ENV
# deactivate


echo "printing the venv name after trying to deactivate"
echo $VIRTUAL_ENV

# move the produced html and ipynb files to the temp folder

# check if the command line option -k (keep) ie do not move) is set, otherwise move the files to the temp folder
if [ "$2" == "-k" ]; then
    echo "keeping the files in the current folder"
else
    mv "${filename}.ipynb" temp/
    mv "${filename}.html" temp/
fi



# Clean up by removing the intermediate notebook file, uncomment the next line if you don't want to keep it
# rm "${filename}.ipynb"


