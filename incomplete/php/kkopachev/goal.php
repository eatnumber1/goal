<?php

echo 'Test', PHP_EOL;

echo g('al'), PHP_EOL;
echo g()('al'), PHP_EOL;
echo g()()('al'), PHP_EOL;
echo g()()()('al'), PHP_EOL;
echo g()()()()("al"), PHP_EOL;

echo 5+3, PHP_EOL;