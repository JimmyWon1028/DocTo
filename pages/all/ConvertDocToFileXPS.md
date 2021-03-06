{
    "title" : "How do I Convert a Microsoft Word Doc to a Microsoft XPS Format? " 
}

How do I Convert a Microsoft Word Doc to a Microsoft XPS Format (XPS)?         
-

It is very simple to convert a Word Document to a XPS file  on the command line using [Docto](https://github.com/tobya/docto). You can also do this easily in Microsoft Word, but sometimes it helps to be able to do it from the command line.  

The command line below shows how you can convert a Microsoft Word Document to a Microsoft XPS Format file - XPS.

Command Line 
-

 ````
 docto -WD -f 'c:\path\Document.doc' -o 'c:\path\Document.XPS' -t wdFormatXPS
 ````
 or easier to read
 ````
 docto -WD  -f 'c:\path\Document.doc' 
            -o 'c:\path\Document.XPS' 
            -t wdFormatXPS
 ````

Command Line Explained 
-

 - `-WD` -  This is a conversion using Microsoft Word.  This is not required but makes it easier to read
 - `-f` -  The File or directory to be converted 
 - `-o` -  The Output File or Directory where you would like the converted file to be written to.
 - `-T` -  The file format type that is being converted to




Some other interesting commands
-

You might find some of the following commands also interesting.

- [Convert all Word Document in a folder to a XPS file](ConvertDirDocToFileXPS.md);
    

