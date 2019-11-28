# custom-jupyter-javascript
This javascript file will provide adequate functionality for rendering dynamic additions of TikzJax code to a notebook. It is advised to use this when working on interactive examples that contain Tikz pictures. In the final HTML export of the notebook the Tikz pictures are rendered in much the same way.

To provide this functionality it loads the javascript library (TikzJax)[http://tikzjax.com] from the web into your notebook. If you are using chrome this load will fail due to the CORS policy. The library also doesn't work using Internet Explorer or Microsoft Edge. It will work on the following browsers:
* Firefox

The custom.js file should be placed in the folder ~/.jupyter/custom and if Jupyter notebook is running the service has to be restarted.

## Important
It is recommended to test your Tikz code before attempting to put it in your notebook. This is because if the library is unable to compile it, it will get stuck and start using a lot of ram. When this happens just deactivate the code and restart your browser. To see whether the library can render the picture use the developer tools present on your browser, namely the console.

## Greek alphabet
It isn't possible the use the greek alphabet in the Tikz pictures. Why this is the case is unknown.