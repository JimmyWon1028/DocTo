{
    "title" : "How do I Convert a Microsoft Word Doc to a {[$Command.FileTypeDescription]}? " 
}

How do I Convert a Microsoft Word Doc to a {[$Command.FileTypeDescription]} ({[$Command.FileTypeExt]})?         
-

It is very simple to convert a Word Document to a {[$Command.FileTypeExt]} file  on the command line using [Docto](https://github.com/tobya/docto). You can also do this easily in Microsoft Word, but sometimes it helps to be able to do it from the command line.  

The command line below shows how you can convert a Microsoft Word Document to a {[$Command.FileTypeDescription]} file - {[$Command.FileTypeExt]}.

Command Line 
-

 ````
 docto -WD -f 'c:\path\Document.doc' -o 'c:\path\Document.{[$Command.FileTypeExt]}' -t {[$Command.FileFormat]}
 ````
 or easier to read
 ````
 docto -WD  -f 'c:\path\Document.doc' 
            -o 'c:\path\Document.{[$Command.FileTypeExt]}' 
            -t {[$Command.FileFormat]}
 ````

Command Line Explained 
-

 - `{[$Params.appwd.cmd]}` -  {[$Params.appwd.desc]}
 - `{[$Params.dashf.cmd]}` -  {[$Params.dashf.desc]} 
 - `{[$Params.dasho.cmd]}` -  {[$Params.dasho.desc]}
 - `{[$Params.dasht.cmd]}` -  {[$Params.dasht.desc]}




Some other interesting commands
-

You might find some of the following commands also interesting.

- [Convert all Word Document in a folder to a {[$Command.FileTypeExt]} file](ConvertDirDocToFile{[$Command.FileTypeExt]}.md);
{[foreach from=$Command.RelatedLinks key=LinkTitle item=L]}
 - [{[$LinkTitle]}]({[$L]})
{[/foreach]}    

