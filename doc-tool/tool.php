<?php

$f = file_get_contents('../src/apisix/values.yaml');
$lines = explode("\n", $f);

$docs = [];

foreach($lines as $line){
    $l = trim($line);
    $args = explode(' ', $l, 4);
    var_dump($args);
    if ($args[0] == '##') {
        $key = "";
        switch ($args[1]) {
            case '@section':
                $docs[] = "\n\n## {$args[2]} {$args[3]}\n\n| Parameter | Description |\n|--|--|\n";
                break;
            case '@param':
                $docs[] = "| {$args[2]} | {$args[3]} |\n";
                break;
        }
    }
}

file_put_contents('./test.md', implode('', $docs));