<?php
namespace app\index\controller;

use think\Controller;
use think\request;
use app\common\model\Users;
use app\common\model\Infos;
use app\common\model\GetInfo;
use app\common\model\PaginateDiy;
use app\common\model\Files;
class FileController extends Controller
{

    /**
     * js文件管理
     */
    public function jsManage()
    {
        if(!Users::is_login()){
            return $this->error("请先登陆", url('Admin/index'));
        }
        $list_js = Files::order("id", "desc")->where("filename", "like","%.js")->select();
        $this->assign("list_js", $list_js);
        return $this->fetch('File/jsmanage');
    }
    /**
     * 其他文件管理
     */
    public function otherManage()
    {        
        if(!Users::is_login()){
            return $this->error("请先登陆", url('Admin/index'));
        }
        $list_other = Files::order("id", "desc")->where("filename", "notlike","%.js")->select();
        $this->assign("list_other", $list_other);
        return $this->fetch('File/othermanage');
    }
    /**
     * 文件保存
     */
    public function saveFile(){
        if(!Users::is_login()){
            return;
        }
        $postData = Request::instance()->post();
        $code = htmlspecialchars_decode($postData['code']);
        $filename = $postData['filename'];
        $description = $postData['description'];

        $save_js = Files::where("filename", $filename)->find();
        $tmp2 = Files::uploadFile($filename, $code);
        if($save_js == null){
            $save_js = new Files();
            $save_js->code = $code;
            $save_js->filename = $filename;
            $save_js->description = $description;
            $save_js->save();           
            return "已增加";
        }else{
            $save_js->code = $code;
            $save_js->filename = $filename;
            $save_js->description = $description;
            $save_js->save();
            return "已保存";
        }
    }
    /**
     * 前台获取文件信息
     */
    public function getFileInfo(){
        if(!Users::is_login()){
            return;
        }
        $postData = Request::instance()->post();
        $filename = $postData['filename'];
        $js_info = Files::where("filename", $filename)->find();
        return $js_info;
    }
    
    /**
     * 删除文件
     */
    public function delFile(){
        if(!Users::is_login()){
            return;
        }
        $postData = Request::instance()->post();
        $filename = $postData['filename'];
        $file = Files::where("filename", $filename);
        if($file == null){
            return "删除失败";
        }else{
            $file->delete();
            Files::delFile($filename);
            return "删除成功";
        }
    }
    /**
     * 短url-api
     */
    public function shortUrl(){
        $postData = Request::instance()->post();
        $payload = $postData['payload'];
        $shortPayload = file_get_contents("http://api.c7.gg/api.php?url=".urlencode($payload));
        return $shortPayload;
    }

}
