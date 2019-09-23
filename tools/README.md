# Tools

These tools are used to assist in effectively creating and converting Jupyter Notebooks.

## convnb.sh
This script converts a Jupyter Notebook to HTML using [nbinteract](https://www.nbinteract.com/). Usage:
```shell
./convnb.sh path/to/jupyter/notebook.ipynb
```
The script will add the following features to the HTML:
* jQuery imports
* Javascript for rerendering MathJax whenever the Latex is changed dynamically