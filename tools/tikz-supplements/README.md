# TikZ Supplements
This directory contains some templates and supplements for adding TikZ pictures to your notebook using TikZIt and TikZJax.

## TikZIt to TikZJax template
Use this by copying the latex code from your .tikz file in the template where it says "INSERT_CODE_HERE". Make sure you remove all layers (i.e. '\begin{pgfonlayer}{nodelayer}') before rendering it. TikZJax does not recognize these and there is not yet a known way to have it recognize them. The template uses the converted common styles as used in the book Structured Probabilistic Reasoning. For some additional information and examples see guides/building-interactive-jupyter-notebooks.