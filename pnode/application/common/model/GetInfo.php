<?php 
    namespace app\common\model;

    class GetInfo{

        /**
         * 判断是否是base64编码
         */
        static function isBase64Formatted($str) {
            if (preg_match('/^[A-Za-z0-9+\/=]+$/', $str))
                if ($str == base64_encode(base64_decode($str)))
                    if (preg_match('/^[A-Za-z0-9\x00-\x80~!@#$%&_+-=:";\'<>,\/"\[\]\\\^\.\|\?\*\+\(\)\{\}\s]+$/', base64_decode($str)))
                        return true;
            return false;
        }

        /**
         * 获取访问者真是ip
         */
        static function getRealIP(){
            $ip="unknown";
            if ( isset($_SERVER['REMOTE_ADDR']) )
                $ip = $_SERVER['REMOTE_ADDR'];
            return $ip;
        }

        /**
         * 尝试base解码
         */
        static function tryBase64Decode($arr) {
            if (isset($arr) && count($arr) > 0) {
                $isChanged = 0;
                
                $new_arr = array();
                foreach ($arr as $k => $v) {
                    $decoded_v = "";
                    if (self::isBase64Formatted($v)) {
                        $decoded_v = base64_decode($v);
                        $isChanged = 1;
                    }
                    $new_arr[$k] = $decoded_v;
                }
                
                if ($isChanged)
                    return $new_arr;
                else
                    return false;
            } else
                return false;
        }

        /**
         * xss 过滤
         */
        static function stripStr($str) {
            if (get_magic_quotes_gpc())
                $str = stripslashes($str);
            return htmlspecialchars($str, ENT_QUOTES, 'UTF-8');
        }
        
        static function stripArr($arr) {
            $new_arr = array();
            foreach ($arr as $k => $v) {
                $new_arr[self::stripStr($k)] = self::stripStr($v);
            }
            return $new_arr;
        }

        /**
         * 判断所有地区，使用360接口
         */
        static public function getArea($ip){
            $data = file_get_contents("http://ip.360.cn/IPQuery/ipquery?ip=".$ip);
            $data = json_decode($data,true);
            if(isset($data['data'])){
                return $data['data'];
            }else{
                return $data['errmsg'];
            }
        }
    }
?>