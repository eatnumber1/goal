<?php

class G {
	private $s;
	function _() {
		if(!$this->s)$this->s='g';
		if($a=@func_get_arg(0))return$this->s.=$a;
		$this->s.='o';return$this;
	}
}
function g(){return new G();}


// This is the best that you can do in PHP
// bacause of this: https://wiki.php.net/rfc/uniform_variable_syntax

echo g()->_()->_()->_()->_()->_()->_()->_()->_('al');