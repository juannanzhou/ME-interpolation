This folder contains all computational scripts to reproduce the data analyses and figures for the paper "Minimum epistasis interpolation for sequence-function relationships". 

The Mathematica notebook has been tested in Mathematica 12. To run the Mathematica notebook on your computer, set the working directory in the beginning of the notebook by replacing "myfolder" with the path for your working folder. 

All figures produced by the notebook will be output to the same working folder.
Expected run time for cells that require significant time to evaluate can be found in the headers. Time estimation is based on a MacBook Air laptop computer with 1.4 GHz Intel Core i5 and 4GB memory.

Detailed description of realization of the minimum epistasis interpolation can be found in the notebook in the comment sections. 

The folder also contains three R files used for the implementation of L1 regularized regression:

SparseRF.R: R scripts for L1 regularized regression for the sparse random field data.
GB1.R: R scripts for L1 regularized regression for the GB1 data.
TF.R: R scripts for L1 regularized regression for the TF binding microarray data.

The user needs to set the working directory in the beginning of the each .R file by replacing "myfolder" with the path for your working folder. 


1. names in readme
2. how to download the data: mathematica notebook as instruction for downloading files and using R files
3. How notebook and R files interact
4. GB1 