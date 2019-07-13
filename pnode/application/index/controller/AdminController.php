<?php
/*
 * @Description: 
 * @Author: p0desta
 * @Date: 2019-07-13 14:36:05
 * @LastEditors: p0desta
 * @LastEditTime: 2019-07-13 14:36:06
 */
namespace app\index\controller;

use think\Controller;
use think\request;
use think\Session;
use app\common\model\Users;
use app\common\model\Infos;
use app\common\model\GetInfo;
use app\common\model\PaginateDiy;
class AdminController extends Controller
{
    public function index()
    {
        return $this->fetch('Admin/index');
    }
    #登录接口
    public function login()
    {
        $postData = Request::instance()->post();
        $username = $postData['username'];
        $password = Users::encPassword($postData['password']);

        if(Users::login($username, $password)){
            Session::set("username", $username);
            return $this->success('login success', url('Admin/admin'), -1, 1);
        }else{
            return $this->error('login fail', url('Admin/index'), -1, 1);
        }
    }

    /**
     * 注销
     */
    public function logout(){
        Session::delete("username");
        return $this->success('logout success', url('Admin/index'), -1, 1);
    }

    //后台主页
    public function admin()
    {
        if(!Users::is_login()){
            return $this->error("请先登陆", url('Admin/index'), -1, 1);
        }
        $infos = Infos::order("id","desc")->column("info");
        $info_list = array();
        foreach($infos as $info){
            $tmp = json_decode($info,true);
            $info_list[] = $tmp;
        }
        $paginate_diy = new PaginateDiy();
        $paginate_diy->page($info_list, 'info_list', 'plistpage', 8);
        return $this->fetch('Admin/admin');
    }

    /**
     * 删除所有xss记录
     */
    public function del(){
        if(!Users::is_login()){
            return $this->error("请先登陆", url('Admin/index'), -1, 1);
        }
        $infos = Infos::where("1=1")->delete(true);
        return $this->success('删除成功', url('Admin/admin'), -1, 1);
    }

    /**
     * payload&about
     */
    public function help()
    {
        return $this->fetch("Admin/help");
    }
}
