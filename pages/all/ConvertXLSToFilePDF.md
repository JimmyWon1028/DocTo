{
    "title" : "How do I Convert a Microsoft Word Doc to a Adobe Acrobat Portable Document Format? " 
}

Adobe Acrobat Portable Document Format 
==

How do I Convert a Microsoft Excel Spreadsheet to a Adobe Acrobat Portable Document Format (PDF)?         
-

It is very simple to convert a Microsoft Excel Spreadsheet to a PDF file  on the command line using [Docto](https://github.com/tobya/docto). You can also do this easily in Microsoft Excel, but sometimes it helps to be able to do it from the command line.  

The command line below shows how you can convert a Microsoft Excel Spreadsheet Document to a Adobe Acrobat Portable Document Format file - PDF.

Command Line 
-

 ````
 docto -XL -f 'c:\path\Spreadsheet.xls' -o 'c:\path\Spreadsheet.PDF' -t xlpdf
 ````

 or easier to read

  ````
 docto -XL  -f 'c:\path\Spreadsheet.xls' 
            -o 'c:\path\Spreadsheet.PDF' 
            -t xlpdf
 ````

Command Line Explained 
-

 - `-XL`   This is a conversion using Microsoft Excel.  
 - `-f`   The File or directory to be converted 
 - `-o`   The Output File or Directory where you would like the converted file to be written to.
 - `-T`   The file format type that is being converted to




Some other interesting commands
-

You might find some of the following commands also interesting.

    

