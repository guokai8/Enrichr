# EnrichR
Functional Enrichment Analysis and Network Construction    
## Description  
__EnrichR__ is a package can be used for functional enrichment analysis and network construction based on enrichment analysis results. It supported almost all species pubished by ENSEMBL and included with Bioconductor   
## Dependencies  
R>2.15
## Installation
```   
library(devtools)    
install_github("guokai8/EnrichR",build_vignettes = TRUE)
### Suggest use RStudio to run the command if you want to use build_vignettes
```
## Getting started
```
library(EnrichR)
```  
More detail please see vignettes
```    
vignette("EnrichR")
```   
## Some useful command
If you want tranform one type of ID to another type(like "SYMBOL"->"ENSEMBL")
``` 
idconvert(keys=rownames(df)[1:20],species="human",fkeytype= "SYMBOL",tkeytype="ENSEMBL")
```  
## Contact information
I still working on this package and will add more functions here.   
For any questions please contact guokai8@gmail.com  
