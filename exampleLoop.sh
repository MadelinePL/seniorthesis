rm out.tsv;
for f in MS*.xml;
    do
         xmlstarlet tr practiceStylesheet.xsl $f >> out.tsv;
        
        
done;