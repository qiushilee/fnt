<?php
	require('build/lib/smarty/Smarty.class.php');

	$smarty = new Smarty;
	$smarty->caching = false;
	$smarty->configs = false;
	$smarty->template_dir = 'view/';
	$smarty->compile_dir = 'build/cview/';

	$version = "0.0.0";
	$viewDir = "view/";
	$compileDir = "build/compile/";

	$mod = trim($_GET['mod']);

	// 区分首页与内页 {{{
	if ($mod == "" || $mod == "index") {
		$smarty->assign("isHome", true);
	} else {
		$smarty->assign("isPage", $mod);
	}
	// }}}

	// 注册模板页面 {{{
	$viewFile;

	if (!empty($mod)) {
		$viewFile = $mod . ".html";
	} else {
		$viewFile = "index.html";
	}

	$smarty->display($viewFile);
	// }}}

	/* createfile() {{{ */
	function createfile($fn, $str = '', $write = true){  //PHP创建文件同时创建不存在的目录
		if (!$write && file_exists($fn)) {
			return false;
		}

		if(preg_match('/\//', $fn)) {  //检测文件路径中是否存在/
			$filename = end(explode('/', $fn));
			$dn = str_replace('/'.$filename, '', $fn);
			if (!is_dir($dn)) {
				mkdir($dn,0777);  //如果目录不存在，则创建目录
			}
		}

		$fp = fopen($fn, 'w');
		fwrite($fp, $str);
		fclose($fp);
		return true;
	}
	/* }}} */

	$htmlFile = $compileDir.$viewFile;
	$htmlCon = $smarty->fetch($viewDir.$viewFile);
	createfile("build/compile/".$viewFile, $htmlCon);
?>
