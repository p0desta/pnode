<?php
namespace app\index\controller;

use think\Controller;
use think\request;
use think\Session;
use app\common\model\Dnslogs;
use app\common\model\PaginateDiy;
use app\common\model\Users;
class DnsController extends Controller
{
    public function index()
    {
        if(!Users::is_login()){
            return $this->error("请先登陆", url('Admin/index'));
        }
        $dnslogs = Dnslogs::order("id","desc")->column("log", "time");
        $paginate_diy = new PaginateDiy();
        $paginate_diy->page($dnslogs, 'dnslogs', 'plistpage', 8);
        $this->assign("dnslogs", $dnslogs);
        return $this->fetch('Dns/index');
    }

    /**
     * 删除所有dnslog
     */
    public function del()
    {
        if(!Users::is_login()){
            return $this->error("请先登陆", url('Admin/index'));
        }
        $dnslogs = Dnslogs::where("1=1")->delete(true);
        return $this->success('删除成功', url('Dns/index'), -1, 1);

    }
}
