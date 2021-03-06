{
    "title" : "How do I Convert a Folder full of Microsoft Word Documents to a XML Document Format? " 
}

How do I Convert a Folder full of Microsoft Word Documents to a XML Document Format?         
-

Even though it is easy to convert one [file at a time](ConvertDocToFileXML.md), Sometimes you need to convert an entire directory of Word Documents to XMLs.  You can do this easily on the command line using [Docto](https://github.com/tobya/docto). 

The command line below shows how you can convert all the Microsoft Word Documents in a folder to a XML Document Format file - XML.

Command Line 
-

 ````
 docto -WD -f 'c:\path\todocuments' -o 'c:\path\toOutputfiles' -t wdFormatXMLDocument
 ````
 or easier to read
 ````
 docto  -WD 
        -f 'c:\path\todocuments' 
        -o 'c:\path\toOutputfiles' 
        -t wdFormatXMLDocument
 ````

Command Line Explained 
-

 - `-WD` :  This is a conversion using Microsoft Word.  This is not required but makes it easier to read
 - `-f` :  The File or directory to be converted 
 - `-o` :  The Output File or Directory where you would like the converted file to be written to.
 - `-T` :  The file format type that is being converted to




Some other interesting commands
-

You might find some of the following commands also interesting.

- [Convert a Word Document to a XML file](ConvertDocToFileXML.md);
    

