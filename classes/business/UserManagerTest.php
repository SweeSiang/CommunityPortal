<?php
require "UserManager.php";
require "../entity/User.php";
require "../data/UserManagerDB.php";
require "../util/DBUtil.php";
require "../util/Config.php";

class UserManagerTest extends PHPUnit_Framework_TestCase
{	
	/**
	* Tests UserManager->getAllUsers()
	*/
	public function testGetAllUsers(){
		$UM=new classes\business\UserManager;
		$users=$UM->getAllUsers();
        $this->assertEquals(15, count($users));
    }
	/**
	* Tests UserManager->getSomeUsers()
	*/
	public function testGetSomeUsers(){
		$UM=new classes\business\UserManager;
		$users=$UM->getSomeUsers("Tom","Lin","Aodigy","Singapore","Singapore");
        $this->assertEquals(5, count($users));
    }
	/**
	* Tests UserManager->getUserByEmailPassword()
	*/
	public function testGetUserByEmailPassword(){
		$UM=new classes\business\UserManager;
		$user=$UM->getUserByEmailPassword("mel@cheong.com","MelCheong123");
        $this->assertEquals(11, $user->id);
    }
	/**
	* Tests UserManager->getUserByEmailPassword()
	*/
	public function testGetUserByEmailPassword2(){
		$UM=new classes\business\UserManager;
		$user=$UM->getUserByEmailPassword("bad@email.com","MelCheong123");
        $this->assertEquals(null, $user);
    }
	/**
	* Tests UserManager->getUserByEmailPassword()
	*/
	public function testGetUserByEmailPassword3(){
		$UM=new classes\business\UserManager;
		$user=$UM->getUserByEmailPassword("mel@cheong.com","wrongpassword");
        $this->assertEquals(null, $user);
    }
	/**
	* Tests UserManager->getUserByEmail()
	*/	
	public function testGetUserByEmail(){
		$UM=new classes\business\UserManager;
		$user=$UM->getUserByEmail("tomlin190@hotmail.com");
        $this->assertEquals(1, $user->id);
    }
	/**
	* Tests UserManager->getUserByEmail()
	*/	
	public function testGetUserByEmail2(){
		$UM=new classes\business\UserManager;
		$user=$UM->getUserByEmail("bad@email.com");
        $this->assertEquals(null, $user);
    }	
	/**
	* Tests UserManager->getUserById()
	*/	
	public function testGetUserById(){
		$UM=new classes\business\UserManager;
		$user=$UM->getUserById(11);
        $this->assertEquals(11, $user->id);
    }
	/**
	* Tests UserManager->getUserById()
	*/	
	public function testGetUserById2(){
		$UM=new classes\business\UserManager;
		$user=$UM->getUserById(100);
        $this->assertEquals(null, $user);
    }
	/**
	* Tests UserManager->randomPassword()
	*/	
	public function testRandomPassword(){
		$UM=new classes\business\UserManager;
		$password=$UM->randomPassword(10, 1, "lower_case,upper_case,numbers")[0];
        $this->assertTrue(is_string($password));
    }	
}
?>