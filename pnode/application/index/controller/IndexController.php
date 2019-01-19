<?php
namespace app\index\controller;

use think\request;
use app\common\model\Users;
use app\common\model\GetInfo;
use app\common\model\Infos;
class IndexController
{
    public function index()
    {   
        header("Access-Control-Allow-Origin:*");

        $info = array();

        $headers_data = Request::instance()->header();
        $user_IP = getInfo::getRealIP();
        $user_port      = isset($_SERVER['REMOTE_PORT']) ? $_SERVER['REMOTE_PORT'] : "unknown";
        $protocol       = isset($_SERVER['SERVER_PROTOCOL']) ? $_SERVER['SERVER_PROTOCOL'] : "unknown";
        $request_method = isset($_SERVER['REQUEST_METHOD']) ? $_SERVER['REQUEST_METHOD'] : "unknown";
        $request_URI    = isset($_SERVER['REQUEST_URI']) ? $_SERVER['REQUEST_URI'] : "unknown";
        $request_time   = isset($_SERVER['REQUEST_TIME']) ? $_SERVER['REQUEST_TIME'] : time();
        $get_data            = $_GET;
        $decoded_get_data    = GetInfo::tryBase64Decode($_GET);
        $post_data           = $_POST;
        $decoded_post_data   = getInfo::tryBase64Decode($_POST);
        $cookie_data         = $_COOKIE;
        $decoded_cookie_data = getInfo::tryBase64Decode($_COOKIE);

        $info['user_ip']        = getInfo::stripStr($user_IP);
        $info['user_port']      = getInfo::stripStr($user_port);
        $info['protocol']       = getInfo::stripStr($protocol);
        $info['request_method'] = getInfo::stripStr($request_method);
        $info['request_uri']    = getInfo::stripStr($request_URI);
        $info['request_time']   = getInfo::stripStr($request_time);
        $info['headers_data']   = getInfo::stripArr($headers_data);

        $info['get_data'] = getInfo::stripArr($get_data);
        if ($decoded_get_data)
            $info['decoded_get_data'] = getInfo::stripArr($decoded_get_data);

        $info['post_data'] = getInfo::stripArr($post_data);
        if ($decoded_post_data)
            $info['decoded_post_data'] = getInfo::stripArr($decoded_post_data);

        $info['cookie_data'] = getInfo::stripArr($cookie_data);
        if ($decoded_cookie_data)
            $info['decoded_cookie_data'] = getInfo::stripArr($decoded_cookie_data);
        $info = json_encode($info);
        $save_info = new Infos();
        $save_info->info = $info;
        $save_info->save();
        return;
    }
}
