<%@ page language="java" import="java.util.*,com.education.experiment.commons.UserBean" pageEncoding="UTF-8"%>
<%@ include file="/share/taglib.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<%
	UserBean ub = (UserBean) request.getSession().getAttribute("user");
%>
<title>云文件列表</title>
<link href="css/style.css" rel="stylesheet" type="text/css" />
<link href="css/base.css" rel="stylesheet" type="text/css" />
<link href="css/boxSearch.css" rel="stylesheet" type="text/css" />
<link href="css/reportOA.css" rel="stylesheet" type="text/css" />
<link href="css/new-style.css" rel="stylesheet" type="text/css" />
<script src="js/jquery-1.8.0.js"></script>
<script src="js/common/filelist.js"></script>
<script src="js/common/checkbox.js"></script>
<script type="text/javascript">

$(function(){
     getFileSystem('<%=ub.getUserId()%>','files');
});
	
</script>
</head>
<body>
<div class="hd-main" style="min-width:1000px;">
	<div class="logo-main" xmlns="http://www.w3.org/1999/xhtml">
		<img src="images/geren.png" /><span class="logo">个人私有存储系统</span>
	</div>
	<ul xmlns="http://www.w3.org/1999/xhtml" class="b-list-1 options fMainBlue top_menu">
		<li style="_width:90px;max-width:116px" class="b-list-item list-li haspulldown">
		<a title="ae12580" target="_blank" href="#"><%=ub.getUserId()%>,欢迎您!</a>
		</li>
	</ul>
</div>
<div class="clearfix1 wrap">
	<div id="Container" style="float:left;width: 100%; height: 100%;min-width:790px;">
		<div class="fns">
			<div id="header-shaw" style="background-color: #fff;height: 542px;">
				<div class="module-history-list">
					<span class="history-list-dir">全部文件</span>
					<span class="history-list-tips" id="filecount"></span>
				</div>
				<div class="list-view-header">
					<ul class="list-cols">
						<li class="col first-col" style="width: 60%;">
							<input class="check" name="chkAll" id="chkAll" onClick="ChkAllClick('keyIds','chkAll')" type="checkbox"/>
							<span class="text">文件名</span>
							<span class="order-icon"></span>
							<a class="g-button" href="#">
								<span class="g-button-right">
									<em class="icon icon-download-gray" title="下载"></em>
									<span class="text">下载</span>
								</span>
							</a>
							<a class="g-button" href="#">
								<span class="g-button-right">
									<em class="icon icon-delete" title="删除" onClick="deleteAllAction('<%=ub.getUserId()%>','files')"></em>
									<span class="text">删除</span>
								</span>
							</a>
						</li>
						<li class="col" style="width: 16%;">
							<span class="text">大小</span>
							<span class="order-icon"></span>
						</li>
						<li class="col last-col" style="width: 22%;">
							<span class="text">修改日期</span>
							<span class="order-icon"></span>
						</li>
					</ul>
				</div>
				<div id="tab_filesystem" class="list-view-container">
					
				</div>
			</div>
		</div>
	</div>
	<%@ include file="/share/storage-left.jsp"%>
</div>
<%@ include file="/share/foot.jsp"%>
</body>
</html>
