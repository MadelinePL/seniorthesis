# shell script that runs through all of the manuscript XML files, and applies the exampleStylesheetSIGHTINGS-GIT.xsl stylesheet
rm exampleOutSIGHTINGS-GIT.tsv;
for f in MS*.xml;
    do
         xmlstarlet tr exampleStylesheetSIGHTINGS-GIT.xsl $f >> exampleOutSIGHTINGS-GIT.tsv;
        
        
done;