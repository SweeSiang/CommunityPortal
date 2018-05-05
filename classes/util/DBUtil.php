<?php
namespace classes\util;

use mysqli;

/**
* Database connection utility class
*/
class DBUtil
{
	/**
	* Returns connection to database
	*/
    public static function getConnection(){
        $config=Config::getConfig();
        $conn = new mysqli($config->mysqlServer, $config->mysqlUser, $config->mysqlPassword,$config->mysqlDB);
        return $conn;
    }
}