<?php
namespace classes\data;

use classes\entity\User;
use classes\util\DBUtil;

/**
 * Database tier whose methods are called upon by corresponding methods in business tier
 */
class UserManagerDB
{
    public static function fillUser($row){
        $user=new User();
		$user->id=$row["UserID"];
		$user->firstName=$row["FirstName"];
		$user->lastName=$row["LastName"];
		$user->company = $row["Company"];
		$user->country=$row["Country"];
		$user->city=$row["City"];
		$user->email=$row["Email"];
		$user->password=$row["Password"];
		$user->account_creation_time=$row["AccountCreationTime"];
		$user->role=$row["Role"];
		return $user;
    }
	
	public static function getAllUsers(){
        $users[]=array();
        $conn=DBUtil::getConnection();
        $sql="SELECT user.userid AS UserID, user.firstname AS FirstName, user.lastname AS LastName, user.country AS Country, user.city AS City, user.email AS Email, user.password AS Password, user.accountcreationtime AS AccountCreationTime, user.role AS Role, userjob.company AS Company FROM user JOIN work ON user.userid = work.user_userid JOIN userjob ON work.userjob_userjobid = userjob.userjobid WHERE role = 'software programmer' GROUP BY user.userid;";
        $result = $conn->query($sql);
        if ($result->num_rows > 0) {
            while($row = $result->fetch_assoc()){
                $user=self::fillUser($row);
                $users[]=$user;
            }
        }
        $conn->close();
        return $users;
    }
	
	public static function getSomeUsers($firstName,$lastName,$company,$country,$city){
        $users[]=array();
        $conn=DBUtil::getConnection();
        $sql="SELECT user.userid AS UserID, user.firstname AS FirstName, user.lastname AS LastName, user.country AS Country, user.city AS City, user.email AS Email, user.password AS Password, user.accountcreationtime AS AccountCreationTime, user.role AS Role, userjob.company AS Company FROM user JOIN work ON user.userid = work.user_userid JOIN userjob ON work.userjob_userjobid = userjob.userjobid WHERE (firstname = '$firstName' OR lastname = '$lastName' OR company = '$company' OR country = '$country' OR city = '$city') AND role = 'software programmer' GROUP BY user.userid;";
        $result = $conn->query($sql);
        if ($result->num_rows > 0) {
            while($row = $result->fetch_assoc()){
                $user=self::fillUser($row);
                $users[]=$user;
            }
        }
        $conn->close();
        return $users;
    }
	
    public static function getUserByEmailPassword($email,$password){
        $user=NULL;
        $conn=DBUtil::getConnection();
        $email=mysqli_real_escape_string($conn,$email);
        $password=mysqli_real_escape_string($conn,$password);
		$hashed=hash("md5", $password);
        $sql="SELECT user.userid AS UserID, user.firstname AS FirstName, user.lastname AS LastName, user.country AS Country, user.city AS City, user.email AS Email, user.password AS Password, user.accountcreationtime AS AccountCreationTime, user.role AS Role, userjob.company AS Company FROM user JOIN work ON user.userid = work.user_userid JOIN userjob ON work.userjob_userjobid = userjob.userjobid WHERE user.email='$email' AND user.password='$hashed' LIMIT 1;";
        $result = $conn->query($sql);
        if ($result->num_rows > 0) {
            if($row = $result->fetch_assoc()){
                $user=self::fillUser($row);
            }
        }
        $conn->close();
        return $user;
    }
	
    public static function getUserByEmail($email){
        $user=NULL;
        $conn=DBUtil::getConnection();
        $email=mysqli_real_escape_string($conn,$email);
        $sql="SELECT user.userid AS UserID, user.firstname AS FirstName, user.lastname AS LastName, user.country AS Country, user.city AS City, user.email AS Email, user.password AS Password, user.accountcreationtime AS AccountCreationTime, user.role AS Role, userjob.company AS Company FROM user JOIN work ON user.userid = work.user_userid JOIN userjob ON work.userjob_userjobid = userjob.userjobid WHERE user.email='$email' LIMIT 1;";
        $result = $conn->query($sql);
        if ($result->num_rows > 0) {
            if($row = $result->fetch_assoc()){
                $user=self::fillUser($row);
            }
        }
        $conn->close();
        return $user;
    }
	
	public static function getUserById($id){
        $user=NULL;
        $conn=DBUtil::getConnection();
        $id=mysqli_real_escape_string($conn,$id);
        $sql="SELECT user.userid AS UserID, user.firstname AS FirstName, user.lastname AS LastName, user.country AS Country, user.city AS City, user.email AS Email, user.password AS Password, user.accountcreationtime AS AccountCreationTime, user.role AS Role, userjob.company AS Company FROM user JOIN work ON user.userid = work.user_userid JOIN userjob ON work.userjob_userjobid = userjob.userjobid WHERE user.userid='$id' LIMIT 1;";
        $result = $conn->query($sql);
        if ($result->num_rows > 0) {
            if($row = $result->fetch_assoc()){
                $user=self::fillUser($row);
            }
        }
        $conn->close();
        return $user;
    }
	
    public static function saveUser(User $user){
        $conn=DBUtil::getConnection();
		$firstName=mysqli_real_escape_string($conn,$user->firstName);
        $lastName=mysqli_real_escape_string($conn,$user->lastName);	
        $company=mysqli_real_escape_string($conn,$user->company);
        $country=mysqli_real_escape_string($conn,$user->country);
		$city=mysqli_real_escape_string($conn,$user->city);
        $email=mysqli_real_escape_string($conn,$user->email);	
        $password=mysqli_real_escape_string($conn,$user->password);
		$hashed=hash("md5", $password);
		$sql = "INSERT INTO user(firstname,lastname,country,city,email,password) VALUES ('$firstName','$lastName','$country','$city','$email','$hashed');";
		$sql .= "UPDATE userjob SET company = '$company' WHERE userjobid IN (SELECT userjob_userjobid FROM work WHERE user_userid IN (SELECT userid FROM user WHERE email = '$email'));";
		if ($conn->multi_query($sql) === TRUE) {
			return true;
		} else {
			echo "Error: " . $sql . "<br>" . $conn->error;
		}
		$conn->close();
    }
	
	public static function updateUser(User $user){
        $conn=DBUtil::getConnection();
		$userid=mysqli_real_escape_string($conn,$user->id);
		$firstName=mysqli_real_escape_string($conn,$user->firstName);
        $lastName=mysqli_real_escape_string($conn,$user->lastName);	
        $company=mysqli_real_escape_string($conn,$user->company);
        $country=mysqli_real_escape_string($conn,$user->country);
		$city=mysqli_real_escape_string($conn,$user->city);
        $email=mysqli_real_escape_string($conn,$user->email);	
        $password=mysqli_real_escape_string($conn,$user->password);
		$hashed=hash("md5", $password);
		$oldEmail=$_SESSION["email"];
		$sql = "UPDATE user SET firstname = '$firstName', lastname = '$lastName', country = '$country', city = '$city', email = '$email', password = '$hashed' WHERE userid = $userid;";
		$sql .= "UPDATE userjob SET company = '$company' WHERE userjobid IN (SELECT userjob_userjobid FROM work WHERE user_userid IN (SELECT userid FROM user WHERE userid = $userid));";
		if ($conn->multi_query($sql) === TRUE) {
			return true;
		} else {
			echo "Error: " . $sql . "<br>" . $conn->error;
		}
		$conn->close();
    }
	
	public static function editUser(User $user){
        $conn=DBUtil::getConnection();
		$firstName=mysqli_real_escape_string($conn,$user->firstName);
        $lastName=mysqli_real_escape_string($conn,$user->lastName);	
        $company=mysqli_real_escape_string($conn,$user->company);
        $country=mysqli_real_escape_string($conn,$user->country);
		$city=mysqli_real_escape_string($conn,$user->city);
        $email=mysqli_real_escape_string($conn,$user->email);	
        $password=mysqli_real_escape_string($conn,$user->password);
		$hashed=hash("md5", $password);
		$sql = "UPDATE user SET firstname = '$firstName', lastname = '$lastName', country = '$country', city = '$city', email = '$email', password = '$hashed' WHERE email = '$oldEmail';";
		$sql .= "UPDATE userjob SET company = '$company' WHERE userjobid IN (SELECT userjob_userjobid FROM work WHERE user_userid IN (SELECT userid FROM user WHERE email = '$oldEmail'));";
		if ($conn->multi_query($sql) === TRUE) {
			return true;
		} else {
			echo "Error: " . $sql . "<br>" . $conn->error;
		}
		$conn->close();
    }

    public static function updatePassword($email,$password){
        $conn=DBUtil::getConnection();
		$hashed=hash("md5", $password);
        $sql="UPDATE user SET password='$hashed' WHERE email='$email';";
		if ($conn->query($sql) === TRUE) {
			return true;
		} else {
			echo "Error updating record: " . $conn->error;
		}
		$conn->close();
    }	
	
    public static function deleteAccount($id){
        $conn=DBUtil::getConnection();
        $sql="DELETE FROM work";
		$i = 0;
        foreach ($id as $checked_id){
			$i++;
			if($i==1) {
				$sql .= " WHERE user_userid = " . $conn->real_escape_string($checked_id) . "";
			} else {
				$sql .= " OR user_userid = " . $conn->real_escape_string($checked_id) . "";
			}
		}
		$j = 0;
		foreach ($id as $checked_id){
			$j++;
			if($j==1) {
				$sql .= "; DELETE FROM user WHERE userid = " . $conn->real_escape_string($checked_id) . "";
			} else {
				$sql .= " OR userid = " . $conn->real_escape_string($checked_id) . "";
			}
		}
		echo $sql;
		$conn->multi_query($sql);
		$conn->close();
	}

}
?>