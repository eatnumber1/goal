<?php
/*
 * Almost verbatim from:
 * http://nitschinger.at/Writing-a-simple-lexer-in-PHP
 */
class Lexer {
	protected static $_terminals = array(
		"/^(g)/" => "T_G",
		"/^(\(\))/" => "T_O",
		"/^(\('al'\))/" => "T_AL",
	);

	public static function run($source) {
		$result = '';

		foreach ($source as $number => $line) {
			$offset = 0;
			while ($offset < strlen($line)) {
				$token = static::_match($line, $number, $offset);
				if ($token == false) {
					throw new Exception("Unable to parse line " . ($line+1) . ".");
				}
				$result .= static::_exec($token);
				$offset += strlen($token['match']);
			}
		}

		return $result;
	}

	protected static function _match($line, $number, $offset) {
		$string = substr($line, $offset);

		foreach (static::$_terminals as $pattern => $name) {
			if (preg_match($pattern, $string, $matches)) {
				return array(
						'match' => $matches[1],
						'token' => $name,
						'line' => $number+1,
					);
			}
		}

		return false;
	}

	protected static function _exec($token) {
		switch($token['token']) {
			case 'T_G': return 'g'; break;
			case 'T_O': return 'o'; break;
			case 'T_AL': return 'al'; break;
		}
	}
}

echo Lexer::run(array("g()('al')"));
