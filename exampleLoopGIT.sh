# shell script that runs through all of the manuscript XML files, and applies the exampleStylesheetGIT.xsl stylesheet
rm exampleOutGIT.tsv;
for f in MS*.xml;
    do
         xmlstarlet tr exampleStylesheetGIT.xsl $f >> exampleOutGIT.tsv;
        
        
done;