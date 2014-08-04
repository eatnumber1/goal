--TEST--
g()('al') related fun
--FILE--
<?php require "goal.php";

echo gg().​().​().​().​('al') . PHP_EOL;
echo gg().​().​().​('al') . PHP_EOL;
echo gg().​().​('al') . PHP_EOL;
echo gg().​('al') . PHP_EOL;
echo gg('al') . PHP_EOL;

echo g()->​()->​()->​()->​('al') . PHP_EOL;
echo g()->​()->​()->​('al') . PHP_EOL;
echo g()->​()->​('al') . PHP_EOL;
echo g()->​('al') . PHP_EOL;
echo g('al') . PHP_EOL;
--EXPECT--
goooal
gooal
goal
gal
gal
goooal
gooal
goal
gal
gal
