
# Bits of code from past versions of the basic Persian document schema, along with some archived commentary.


# METADATA
# In previous versions a lot more metadata was held at the document level.

#metadata = element metadata { unique_id }
#unique_id = element unique_id { text }
# metadata =
#    element metadata {
#        archive, serial, entity, language, original, complete, cat_gloss, cat_date, gloss, keywords
#    }
# archive = element archive { arc_name, call, fol }
# arc_name = element name { "IVANUz" | "NAI" | "RGVIA" | "RGIA" | "TsGARUz" | "USSR" }
# Refers to Archive Acronym
# call = element call { text }
# fol = element fol { text }
# serial = element serial { xsd:int }
# Internal reference number
# entity = element entity { "Bukhara" | "Britain" | "Hyderabad" | "Russia" | "USSR" }
# The political entity that produced the document
# original = element original { original_type }
# original_type = attribute type { "original" | "scan" | "notes" | "photocopy" }
# Copy of the document, scan, or just notes
# complete = element complete { complete_type }
# complete_type = attribute type { "yes" | "partial" | "errors" }
# PROBLEM: need to make repeatable
# cat_gloss = element cat_gloss { text }
# The actual catalog description (in original language of the catelog, but transcribed into Roman characters)
# cat_date =
#    element cat_date {
#        mixed { (jul_date? | greg_date? | hij_date?)* }
#    }

#body = element body { (doc_div* | pg?)* }
#Note: since metadata is tracked elsewhere, this is effectively redundant.


# lb = element lb { mixed {(flag)}*}

# Feedback on dates:


# On the topic of dates, we encourage you to explore the xsd:dateTime datatype and consider its
# usefulness for you in defining what a date should actually look like in your document. It uses ISO
# format, and it's particularly useful if you have to do date arithmetic, or determine the day of the
# week for a particular date. The downside is that ISO 8601 dates are always Gregorian because they
# refer to the date as a fact, and not as recorded in a particular document. Some developers will write
# the date as it appears in the document (perhaps according to the Julian calendar) and then include
# the ISO date (necessarily Gregorian) as an attribute value.


#TEI EpiDoc uses the following conventions (inter alia):
# Illegible Characters, Quantity Unknown: <gap reason="illegible" extent="unknown"unit="character"/>. Here this corresponds to <flag type=gap>
# Ambiguous Characters: <unclear>, with a more complicated variant when possible alternatives are offered (http://www.stoa.org/epidoc/gl/latest/trans-ambiguousalt.html). Here this corresponds to <flag type="unclear">.


orth = element orth { orth_type, text }
orth_type = attribute type { "misspelling" }
# Currently this is used mostly to track common mispellings, not including proper nouns.



# Log:


# removed from permissible attribute values: "closing", "couplet", and "preamble", because these are all topical structures, and should therefore be captured by <ts>
# removed from permissible attricute values: "line" which is now a separate element (<lb>); "gloss" (contained in relational database); and "report (specific to Russian documents, which will not use this schema)
# I previously coded lines as an attribute of <div>, but switched them to their own element just because that was cumbersome.
