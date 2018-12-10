# shell script that runs through all of the manuscript XML files, and applies the exampleStylesheetGIT.xsl stylesheet
rm exampleOutEVENTS-GIT.tsv;
for f in MS*.xml;
    do
         xmlstarlet tr exampleStylesheetEVENTS-GIT.xsl $f >> exampleOutEVENTS-GIT.tsv;
        
        
done;