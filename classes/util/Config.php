<?php
namespace classes\util;

/**
* Database configuration
*/
class Config
{
    public static $config;
    public $mysqlServer;
    public $mysqlUser;
    public $mysqlPassword;
    public $mysqlDB;

	/**
	* Returns database configuration
	*/    
    public static function getConfig($reload = false){
        if(isset($config)==false || $reload==true) {
            $config=new Config();			
			if(file_exists(self::getApplicationRoot()."/config/m5project.ini")) {
				$ini=parse_ini_file(self::getApplicationRoot()."/config/m5project.ini");
				$config->mysqlServer=$ini['mysqlserver'];
				$config->mysqlUser=$ini['mysqluser'];
				$config->mysqlPassword=$ini['mysqlpassword'];
				$config->mysqlDB=$ini['mysqldb'];		
			} else {
				$config->mysqlServer="localhost";
				$config->mysqlUser="root";
				$config->mysqlPassword="flower";
				$config->mysqlDB="mydb";
			}
            return $config;
        }
    }
	
	/**
	* Returns path to database configuration file 
	*/
    public static function getApplicationRoot(){
        $path = $_SERVER['DOCUMENT_ROOT'] . "/m5project";
        return $path;
    }
}