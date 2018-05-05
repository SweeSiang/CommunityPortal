<?php
namespace classes\business;

use classes\entity\User;
use classes\data\UserManagerDB;

/**
 * Password validation class
 */
class Validation
{
	/**
	 * Validates password
	 * @param string $input Password to check for error
	 * @param string $error Error message to be displayed 
	 */	
	public function check_password($input, &$error)
	{
		if (!preg_match("/^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)[a-zA-Z\d]{6,}$/",$input))
		{ 
			$error = "Password must consist of at least 6 characters with at least one uppercase letter, one lowercase letter and one digit"; 
			return false;
		}
		return true;
	}
}
?>