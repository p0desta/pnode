<?php 
namespace app\common\model;
use think\Model;
use think\Session;
class Users extends Model{

    /**
     * 用户登录
     * @param string $username 用户名
     * @param string $password 密码
     * @return bool 
     */
    static public function login($username, $password){

        $user = self::where(array("username"=>$username, "password"=>$password))->find()->getData();
        if(is_array($user)){
            return true;
        }else{
            return false;
        }
    }
    /**
     * 用户登录
     * @param string $password 密码
     * @return string 加密后的密码 
     */
    static public function encPassword($password){
        return md5($password);
    }

    /**
     * 验证
     */
    static public function is_login(){
        if(Session::has("username")){
            return true;
        }else{
            return false;
        }
    }

}