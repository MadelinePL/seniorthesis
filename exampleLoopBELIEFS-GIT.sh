# shell script that runs through all of the manuscript XML files, and applies the exampleStylesheetBELIEFS-GIT.xsl stylesheet
rm exampleOutBELIEFS-GIT.tsv;
for f in MS*.xml;
    do
         xmlstarlet tr exampleStylesheetBELIEFS-GIT.xsl $f >> exampleOutBELIEFS-GIT.tsv;
        
        
done;