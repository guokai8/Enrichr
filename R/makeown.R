#' make annotation database using bioAnno results
#' @importFrom AnnotationDbi keys
#' @importFrom AnnotationDbi select
#' @param dbname database name from bioAnno
#' @param anntype GO or KEGG
#' @param OP BP,CC,MF default use all
#' @examples
#' \dontrun{
#' fromKEGG(species="ath")
#' athgo<-makeOwn(dbname="org.ath.eg.db",anntype="GO")
#' }
#' @author Kai Guo
#' @export


makeOwn<-function(dbname,anntype="GO",OP=NULL){
  if (!require(dbname,character.only=TRUE)){
    stop("Please give the package name")
  }else{
    suppressMessages(require(dbname,character.only = T,quietly = T))
  }
  dbname<-eval(parse(text=dbname))
  if(anntype=="GO"){
    annof<-select(dbname,keys=keys(dbname),columns=c("GOALL","ONTOLOGYALL"))
    colnames(annof)[1]<-"GeneID"
    annof<-distinct_(annof,~GeneID, ~GOALL, ~ONTOLOGYALL)
    annot <- getann("GO")
    annof$Annot <- annot[annof[,2],"annotation"]
    if(!is.null(OP)){
      annof<-annof[annof$ONTOLOGYALL==OP,]
    }
  }
  if(anntype=="KEGG"){
    annof=select(dbname,keys=keys(dbname),columns="PATH")
    annof<-na.omit(annof)
    annot<-getann("KEGG")
    annof[,1]<-as.vector(annof[,1])
    annof[,2]<-as.vector(annof[,2])
    annof$Annot<-annot[annof[,2],"annotation"]
  }
  return(annof)
}
