<%@page language="java" pageEncoding="UTF-8"%>
<%@ include file="/common.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>相册首页-集集组是一个平台，方便家长组织好友，带着孩子们聚在一起，玩耍、交流、分享。</title>
<link href="${CSS_PATH}/global.css" rel="stylesheet" type="text/css" />
<link type="image/x-icon" href="favicon.ico" rel="shortcut icon"/>
<script type="text/javascript" src="${JS_PATH}/jquery-1.4.2.min.js${JS_EDITION}"></script>
<script type="text/javascript" src="${JS_PATH}/jquery-1.2.6.pack.js${JS_EDITION}"></script>
<script type="text/javascript" src="${JS_PATH}/jquery.tools.min.js${JS_EDITION}"></script>
<script type="text/javascript" src="${JS_PATH}/global.js${JS_EDITION}"></script>
<script type="text/javascript" src="${JS_PATH}/hl_all.js${JS_EDITION}"></script>
<script type="text/javascript" src="${JS_PATH}/common_layer.js${JS_EDITION}"></script>
<script type="text/javascript" src="${JS_PATH}/album.js${JS_EDITION}"></script>
<!--[if IE 6]>
<script type="text/javascript" src="js/DD_belatedPNG_0.0.8a.js"></script>
<![endif]-->
</head>

<body>
<!--头部文件-->
<%@include file="/common/header.jsp" %>
<!--主体部分-->
<div class="W_main">
  <div class="W_main_bg clearfix"> 
    <!--菜单部分-->
    <%@include file="/status/inc/left-tab-inc.jsp" %>
    <!--内容部分-->
    <div class="plc_main">
      <div class="W_main_a">
        <div class="W_main_c">
        	<div class="tab">
            	<a href="javascript:void(0);" class="hover">我的相册</a>
            </div>
          <div class="pl_content">
          	<div class="Album_lay">
          		<s:if test="canUploadPhoto(sessionUserInfo,userId)">
	            	<a href="/album/upload.jspa" class="Album_btn"></a>
          		</s:if>
          		<s:if test="canCreateAlbum(sessionUserInfo,userId)">
                	<span><a href="javascript:void(0);" onclick="show_CreateAlbums()" class="new_btn">创建相册</a></span>
            	</s:if>
            </div>
            <div class="m_user_albumlist">
            	<s:iterator value="albumPage.result">
            		<dl>
	                	<dt><a href="/album/photo.jspa?albumId=<s:property value="albumId"/>"><img width="150" height="150" src="<s:property value="defaultPhotoImgUrl"/>" class="img"/></a></dt>
	                    <dd class="title"><a href="/album/photo.jspa?albumId=<s:property value="albumId"/>"><s:property value="name"/></a></dd>
	                    <dd class="tips">
	                    	<div class="number"><s:property value="photoNum"/>张</div>
	                        <div class="operation">
	                        	<s:if test="%{canEdit(sessionUserInfo)}">
	                        		<a href="javascript:void(0);" onclick="show_ChangeAlbums(<s:property value="albumId"/>,'<s:property value="name"/>','<s:property value="content"/>')">编辑</a>
	                        	</s:if>
	                        	<s:else>
	                        		<a href="javascript:void(0)"></a>
	                        	</s:else>
	                        	<s:if test="%{canDelete(sessionUserInfo)}">
	                        		<a href="javascript:void(0);" onclick="show_album_del(<s:property value="albumId"/>)">删除</a>
	                       		</s:if>
	                       		<s:else>
	                        		<a href="javascript:void(0)"></a>
	                        	</s:else>
	                        </div>
	                    </dd>
	                </dl>
            	</s:iterator>
            </div>
          </div>
          <s:if test="albumPage.pageCnt>1">
					<div class="W_pages_minibtn">
						<s:if test="albumPage.befPageNum>0 && albumPage.curPageNum!=1">      	
						   <a href="/album/?userId=<s:property value="userId"/>&page=<s:property value="albumPage.befPageNum" />" class="btn_page">上一页</a>
						</s:if>
						<s:iterator value="albumPage.pageList" id="curPage">
							<s:if test="#curPage==albumPage.curPageNum">
								 <a href="javascript:void(0);" class="on"><s:property value="#curPage" /></a>
							</s:if>
							<s:else>
								<a href="/album/?userId=<s:property value="userId"/>&page=<s:property value="#curPage" />"><s:property value="#curPage" /></a>
							</s:else>
						</s:iterator>
						   <s:if test="albumPage.curPageNum!=albumPage.pageCnt">
						   <a href="/album/?userId=<s:property value="userId"/>&page=<s:property value="albumPage.aftPageNum" />" class="btn_page">下一页</a>
						   </s:if>
					</div>
			</s:if>
        </div>
        
        <!--右边-->
        <%@include file="/status/inc/status-right-inc.jsp" %>
        <!--右边END-->
      </div>
    </div>
  </div>
</div>
<!--尾部文件-->
<%@include file="/common/footer.jsp" %>
<!--弹出框-->
<!-- 创建相册弹出层 -->
<%@include file="/album/layer/create-album-layer.jsp" %>
<!-- 创建相册成功弹出层 -->
<%@include file="/album/layer/create-album-success-layer.jsp" %>
<!-- 删除相册弹出层 -->
<%@include file="/album/layer/delete-album-layer.jsp" %>
<!-- 更新相册弹出层 -->
<%@include file="/album/layer/update-album-layer.jsp" %>
<div id="medal" style="display:none;">
  <div class="layer_point ly12 lay_box">
    <div class="bg">
      <h1>姚俊玮的勋章<a href="javascript:void(0);" class="span" onclick="hide_medal()"></a></h1>
      <dl class="medal_dl">
      	<dt class="badge"><img src="${IMG_PATH}/badge/big/1.png" /></dt>
        <dd class="title">第一名 勋章</dd>
        <dd class="content2">在"<span>宝宝爬行比赛</span>"中获得第一名</dd>
        <dd class="time">2012.10.3</dd>
      </dl>
    </div>
  </div>
</div>
<script language="javascript">
function show_medal(){
	box5.Center="true";
	box5.Fixed="true";	
	box5.Show();
}
	
function hide_medal(){
	box5.Close();
}
var box5=new LightBox("medal");
</script>
</body>
</html>
