# Tools

These tools are used to assist in effectively creating and converting Jupyter Notebooks.

## convnb.sh
This script converts a Jupyter Notebook to HTML using [nbinteract](https://www.nbinteract.com/). Usage:
```shell
./convnb.sh path/to/jupyter/notebook.ipynb
```
The script will add the following features to the HTML:
* jQuery imports
* Javascript for rerendering MathJax whenever the Latex is changed dynamically (Using MathJax and TikzJax)

## custom-jupyter-javascript
This javascript file will provide adequate functionality for rendering dynamic additions of TikzJax code to a notebook. It is advised to use this when working on interactive examples that contain Tikz pictures. In the final HTML export of the notebook the Tikz pictures are rendered in much the same way.

To provide this functionality it loads the javascript library [TikzJax](http://tikzjax.com) from the web into your notebook. If you are using chrome this load will fail due to the CORS policy. The library also doesn't work using Internet Explorer or Microsoft Edge. It will work on the following browsers:
* Firefox

The custom.js file should be placed in the folder ~/.jupyter/custom and if Jupyter notebook is running the service has to be restarted.

### Important
It is recommended to test your Tikz code before attempting to put it in your notebook. This is because if the library is unable to compile it, it will get stuck and start using a lot of ram. When this happens just deactivate the code and restart your browser. To see whether the library can render the picture use the developer tools present on your browser, namely the console.

### Greek alphabet
It isn't possible the use the greek alphabet in the Tikz pictures. Why this is the case is unknown.

## TikZ Supplements
This directory contains some templates and supplements for adding TikZ pictures to your notebook using TikZIt and TikZJax.

### TikZIt to TikZJax template
Use this by copying the latex code from your .tikz file in the template where it says "INSERT_CODE_HERE". Make sure you remove all layers (i.e. '\begin{pgfonlayer}{nodelayer}') before rendering it. TikZJax does not recognize these and there is not yet a known way to have it recognize them. The template uses the converted common styles as used in the book Structured Probabilistic Reasoning. For some additional information and examples see guides/building-interactive-jupyter-notebooks.