<?php

$config = \TYPO3\CodingStandards\CsFixerConfig::create();

// CS Fixer will only analyze files in "./packages/". Feel free to customize
$config->getFinder()->in(__DIR__ . '/packages');
$config->addRules([
    'function_declaration' => [
        'closure_function_spacing' => 'one',
    ],
]);
return $config;
