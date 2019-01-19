<?php 
namespace app\common\model;
use think\Model;

class Files extends Model{

    /**
     * 保存文件
     */
    static public function uploadFile($filename, $code){
        if(preg_match("/\.js$/", $filename)){
            $path = ROOT_PATH.'public/uploads/js/';
        }else{
            $path = ROOT_PATH.'public/uploads/other/';
        }
        if(file_put_contents($path.$filename, $code)){
            return true;
        }else{
            return false;
        }    
    }

    /**
     * 删除文件
     */
    static public function delFile($filename){
        if(preg_match("/\.js$/", $filename)){
            $path = ROOT_PATH.'public/uploads/js/';
        }else{
            $path = ROOT_PATH.'public/uploads/other/';
        }
        if(file_exists($path.$filename)){
            unlink($path.$filename);
        }
    }

}