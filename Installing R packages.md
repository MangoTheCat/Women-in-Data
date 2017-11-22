# R Package Installation Instructions

## Using RStudio

###  From CRAN Repository

1. Open RSudio and select **Packages** tab in the bottom right panel:
    ![](pkg1.png?raw=true)

2. Click on **Install** tab. In the popup window type the name (or coma separated list of names) of the package you want to install from CRAN. Make sure that the **Install dependencies** filed is checked.
 ![](pkg2.png?raw=true)
 3. Click on **Install*** button.
 




###  From ZIP Archive
1. Open RSudio and select **Packages** tab in the bottom right panel.
2. Select the package archive ( ***.zip*** or ***.tar.gz***) to install from the Open dialogue box. Packages installed from archives will require dependencies to be installed manually.
 ![](pkg3.png?raw=true)



## Using R console

###  From CRAN Repository

The following command will install the  **mangoTraining** package.  The name of the package has to be given inside the quotes. The specified package will be downloaded from CRAN together with all dependencies.
```
install.packages("mangoTraining")
```
If you want to install more than one package at the same time (for example **mangoTraining** and **tidyr**), then do the following:

```
install.packages(c("mangoTraining", "tidyr"))
```

###  From ZIP Archive

Use the `install.packages` function. First parameter should be the path to the **tar.gz** file you want to install.
```
install.packages("path_to/mangoTraining.tar.gz", type = "source")
```
Packages installed from archives will require dependencies to be installed manually.
