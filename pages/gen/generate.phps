<?php

require "config.php";

require "loadcommands.php";


$smarty->assign('Params',$Explain);

foreach ($Commands as $CommandName => $Command) {

    
    foreach ($Command['Items'] as $keytag => $Item) {
        # code...
        // for commands that use a single format
        if (isset($Command['FileFormat']) ){
            $Item['FileTypeExt'] = $Command['FileFormat']['FileTypeExt'];
            $Item['FileTypeDescription'] = $Command['FileFormat']['FileTypeDescription'];
            
            $Item['FileFormat'] = $Command['FileFormat']['FileFormat'];
        }

        $smarty->assign('Command', $Item);
            # code...

        $MDFile = $smarty->fetch($Command['Template']);

        if (!file_exists('../all/')){
            mkdir('../all/');
        }


        $Fn =   $CommandName . @$Item['FileTypeTitleExtra'] . $Item['FileTypeExt'] . '.md' ;
        $Commands[$CommandName]['Items'][$keytag]['fn'] = $Fn;
        echo "Create File : $Fn\n";
        file_put_contents('../all/' . $Fn, $MDFile);



    }
}

//**************
//  Create index file here
//**********************

$smarty->Assign('Commands',$Commands);
$Indexmd = $smarty->fetch('index.tpl.md');
//print_r($Indexmd);
file_put_contents('../all/index.md', $Indexmd);



