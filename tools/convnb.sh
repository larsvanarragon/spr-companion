#!/bin/bash

# Update this to the desired version of jQuery
JQUERY_SOURCE="https:\/\/ajax.googleapis.com\/ajax\/libs\/jquery\/3.4.1\/jquery.min.js"

# The following is the code for the continouous MathJax updates, could be extracted to a file and loaded
MATHJAX_JS="\t<script type=\"text\/javascript\">\n\t\t\$\(\'body\'\).on(\"DOMSubtreeModified\", function\(\) \{\n\t\t\tMathJax.Hub.Queue\(\[\"Typeset\", MathJax.Hub, this\]\)\;\n\t\t\}\)\;\n\t<\/script>"

if [ $# -eq 0 ]; then
    printf "To convert a notebook please supply a correct path to it"
    exit 1
fi

if [[ $* == *--help* ]]; then
    printf "convnb is simple script to convert a Jupyter Notebook to HTML using the nbinteract library\n"
    printf "It adds several handy tools to the HTML like jQuery and the ability for MathJax to rerender your interactive Latex\n\n"
    printf "convnb must be called as follows:\n\tconvnb.sh path/to/notebook.ipynb"
    exit 0
fi

if [ -x "($command -v nbinteract)" ]; then
    printf "nbinteract has not been found, please install nbinteract\n"
    exit 1
fi

NOTEBOOK=$1
NB_BASE="$(echo ${NOTEBOOK} | grep -o '^[^\.]*')"

if [ ! -f "$NOTEBOOK" ]; then
	printf "The notebook specified at $NOTEBOOK could not be found, make sure it exists and try again\n"
    exit 1
fi

if [[ !($NOTEBOOK =~ \.ipynb$) ]]; then
    printf "The file specified is not an '.ipynb' file\n"
    exit 1
fi

printf "Converting $NOTEBOOK to HTML using nbinteract\n"

nbinteract -t full -B $NOTEBOOK

if [ $? -ne 0 ]; then
    printf "Error while converting $NOTEBOOK to HTML\n"
    exit 1
fi

printf "Adding jQuery and MathJax features to ${NB_BASE}.html\n"

sed -i -e "s/<head>/<head>\n\t<script src="${JQUERY_SOURCE}"><\/script>\n/g" ${NB_BASE}.html

if [ $? -ne 0 ]; then
    printf "Error while adding jQuery features to ${NB_BASE}.html\n"
    exit 1
fi

sed -i -e "s/<body>/<body>\n${MATHJAX_JS}/g" ${NB_BASE}.html

if [ $? -ne 0 ]; then
    printf "Error while adding MathJax features to ${NB_BASE}.html\n"
    exit 1
fi

printf "Successfully converted $NOTEBOOK to HTML"