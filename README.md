# XML Development Laboratory

Developing schemas for encoding and marking up Persian documents.



## Example Projects

- [Brecon Collegiate Church and School](http://brecon.newtfire.org/): Example of a project comparing different versions of a text and assessing the lineage, shared properties between manuscripts; multiple kinds of graphical representation ([Github repo](https://github.com/haggis78/BreconChurch)).
  - For methodology, see [TEI on critical apparatus](https://tei-c.org/Vault/P5/3.6.0/doc/tei-p5-doc/en/html/TC.html).


## Running Saxon on Command Line

Saxon can implement XSLT and XQUERY.

Installation
- [Saxonica installation instructions](http://www.saxonica.com/documentation/index.html#!about/installationjava/installingjava) (somewhat vague / targeted at developers)
- [Download Saxon HE](http://saxonica.com/products/products.xml) (click on SourceForge download link)
  - Move zip file to "a suitable directory" (generally the bin folder in the home directory)
  - Unzip: (`unzip SaxonHE9-9-1-6J.zip`)
- Make sure Java is installed - specifically [Java SE Development Kit](https://www.oracle.com/technetwork/java/javase/downloads/jdk8-downloads-2133151.html).
  - Requires oracle account to download.
- Now Java can run the Saxon jar file: `java -jar saxon9he.jar`
  - Alias for quick implementation from any folder:  `alias $HOME/bin/saxon9he.jar"`

Usage
- [Saxonica usage instructions](http://saxonica.com/documentation/index.html#!using-xsl/commandline)
- For simple transformations on the Java platform, use the command:
  - `java net.sf.saxon.Transform -s:source -xsl:stylesheet -o:output`
  - where source, stylesheet, and output are the source XML file, the XSLT stylesheet, and the output file respectively.
- If the source is a folder, it will iterate over all of the contents.
