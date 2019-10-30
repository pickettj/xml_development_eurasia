(:Variable for Bukhara Corpus :)
declare variable $bukh_corpus := collection('/Users/Enkidu/Box Sync/Notes/Primary Sources/xml_notes_stage2/bukhara_xml');
declare variable $bukh_loc := $bukh_corpus//location;
declare variable $bukh_loc_ids := data($bukh_loc/@id);

for $id in $bukh_loc_ids
return concat ($id, codepoints-to-string(10))






(:Distinct Individuals:)
(:declare variable $distinct_individuals := distinct-values($bukh_corpus//individual);
for $individual in $bukh_corpus//individual
return $individual:)


(:Hyderabad Corpus:)
(:declare variable $hyd_corpus := collection('/Users/Enkidu/Box Sync/Notes/Primary Sources/xml_notes_stage2/hyderabad_xml');:)

