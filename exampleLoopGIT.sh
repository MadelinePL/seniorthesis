rm exampleOutGIT.tsv;
for f in MS*.xml;
    do
         xmlstarlet tr exampleStylesheetGIT.xsl $f >> exampleOutGIT.tsv;
        
        
done;