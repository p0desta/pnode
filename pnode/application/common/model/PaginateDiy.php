<?php
namespace app\common\model;
use think\Controller;
use think\paginator\driver\Bootstrap;
//分页
class PaginateDiy extends  Controller
{
    public $url;  
    public function _initialize(){
        $a=request()->action();
        $c=request()->controller();
        $m=request()->module();
        $this->url='/'.$m.'/'.$c.'/'.$a;
    }

    /***
     * @param $data   传入的数组
     * @param int $listRow // 默认为config的参数
     *  @param string $name // 在模版循环的渲染的名称
     *   @param string $page // 在模版分页显示
     */

    public   function page($data,$name,$page,$listRow=''){
        if (!is_array($data)||empty($data)||empty($name)||empty($page)){
            return false;
        }
        if (empty($listRow)){
            $listRow= intval(config('paginate')['list_rows']);  //获取config里面的参数
        }

        $curPage = input('page') ? input('page') : 1;//当前第x页，有效值为：1,2,3,4,5...
        $showData = array_slice($data, ($curPage - 1)*$listRow, $listRow,true);

        $p = Bootstrap::make($showData, $listRow, $curPage, count($data), false, [
            'var_page' => 'page',
            'path'     => url($this->url),
            'fragment' => '',
        ]);
        $p->appends($_GET);
        $this->assign($name, $p);
        $this->assign($page, $p->render());
        }
    }