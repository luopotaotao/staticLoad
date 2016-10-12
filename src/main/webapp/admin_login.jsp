<%@ page contentType="text/html; charset=UTF-8" %>
<%
    HttpSession s = request.getSession();
    s.setMaxInactiveInterval(300);
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>

    <title>模板支撑系统智能监测平台</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta http-equiv="Pragma" content="no-cache"/>
    <meta http-equiv="Cache-Control" content="no-cache"/>

    <%--<jsp:include page="inc.jsp"></jsp:include>--%>
    <%--<link href="${pageContext.request.contextPath}/style/admin_login.css"--%>
    <%--rel="stylesheet" type="text/css"/>--%>
    <script type="text/javascript"
            src="${pageContext.request.contextPath}/jslib/jquery-1.11.3.js"></script>
    <%--<script type="text/javascript"--%>
            <%--src="${pageContext.request.contextPath}/jslib/extBrowser.js"></script>--%>
    <script type="text/javascript"
            src="${pageContext.request.contextPath}/jslib/sha256.js"></script>
    <script type="text/javascript"
            src="${pageContext.request.contextPath}/jslib/artDialog/artDialog.js"></script>
    <script type="text/javascript" charset="utf-8">
        $(function () {
            bindHandlers();
            function doLogin() {
                var name = $("#name").val();
                var pwd = $("#pwd").val();
                var verifycode = $("#verifycode").val();
                if (true) {//validate(name,pwd,verifycode)) {
                    pwd = $("#pwd").val();
                    $.ajax({
                        url: "${pageContext.request.contextPath}/userController/login.action",
                        dataType: 'json',
                        type: 'post',
                        data: {name: name, pwd: pwd, verifycode: verifycode}
                    }).success(function (r) {

                        try {
                            if (r.success) {
                                //登录成功跳转
                                window.location.href = "index.jsp";
                            } else {
                                //显示错误信息
                                art.dialog({
                                    time: 1,
                                    icon: 'warning',
                                    content: r.msg
                                });
                            }
                        } catch (e) {
                            $.messager.alert('操作提示', result);
                        }
                    }).error(function (err) {
                        art.dialog({
                            time: 1,
                            icon: 'warning',
                            content: '登陆错误!'
                        });
                    }).complete(function () {
                        $("#pwd").val("");
                        $("#img").attr("src", "authimg?now=" + new Date());
                    });
                }
            }

            function validate(name, pwd, verifycode) {
                $("#btn_login").focus();

                if (!name) {
                    art.dialog({
                        time: 1,
                        icon: 'warning',
                        content: '账号不能为空！'
                    });
                    $("#name").focus();
                    return false;
                }
                if (!pwd) {
                    art.dialog({
                        time: 1,
                        icon: 'warning',
                        content: '密码不能为空！'
                    });
                    $("#pwd").focus();
                    return false;
                } else {
                    $("#pwd").val(sha256_digest(pwd));
                }
                if (!verifycode) {
                    art.dialog({
                        time: 1,
                        icon: 'warning',
                        content: '验证码不能为空！'
                    });
                    $("#verifycode").focus();
                    return false;
                }
                return true;
            }

            function bindHandlers() {
                $('#btn_login').bind('click', doLogin);
            }
        });
        function openWid(title, url, width, height) {
            art.dialog.open(url, {id: 'wid', resize: false, width: width, height: height, title: title, lock: true});
        }

        function closeReload() {
            parent.mainFrame.location.reload();
            art.dialog.close();
        }

        function d1() {
            //alert("2");
            //scrollContDiv.scrollLeft=-100;
            //$('.gdul>li:first').animate({width:'0px'},2000,callback);
            //$(".gdul").animate({left: '+=' + 100}, 1500);
            i = 0;
            leftRun();
        }
        function d2() {
            //alert("2");
            //scrollContDiv.scrollLeft=-100;
            //$('.gdul>li:first').animate({width:'0px'},2000,callback);
            //$(".gdul").animate({left: '+=' + 100}, 1500);
            i = 0;
            rightRun();
        }
        function d3() {
            alert($("#scrollContDiv").scrollLeft());
        }
        var i = 0;
        var settimeoutID;
        var settimeoutID2;
        function leftRun() {
            if (i < 480) {
                i += 10;
                $("#scrollContDiv").scrollLeft($("#scrollContDiv").scrollLeft() + 10);
                //alert("L"+i+"====="+$("#scrollContDiv").scrollLeft());
                settimeoutID = setTimeout("leftRun()", 1);
            } else
                clearTimeout(settimeoutID);

        }
        function rightRun() {
            if (i < 480) {
                i += 10;
                $("#scrollContDiv").scrollLeft($("#scrollContDiv").scrollLeft() - 10);
                //alert("R"+i+"====="+$("#scrollContDiv").scrollLeft());
                settimeoutID2 = setTimeout("rightRun()", 1);
            } else
                clearTimeout(settimeoutID2);

        }
    </script>
    <link rel="stylesheet" href="jslib/artDialog/skins/blue.css">
    <style type="text/css">
        html, body {
            overflow: hidden;
            height: 100%;
            margin: 0px;
            padding: 0px;
            min-width: 1200px;
            font-size: 13px;
            font-family: microsoft yahei;
        }

        img {
            border: 0px;
        }

        .txt {
            border: 1px solid #fff;
            font-size: 13px;
            height: 20px;
            line-height: 19px
        }

        .btn input {
            background: url(style/images/d9_03.png) no-repeat;
            border: none;
            width: 213px;
            height: 26px;
            cursor: pointer;
            float: left;
            margin: 15px 0px 0px 60px;
        }

        /*1b1b1b*/
        a {
            color: #f9f9f9;
            text-decoration: none;
        }

        .gdul {
            list-style-type: none;
            margin: 0;
            padding: 0;
            overflow: hidden;
        }

        .gdul li {
            display: inline;
        }
    </style>
</head>

<body>

<div id="bgTop"
     style="position: absolute; z-index: 1; width: 100%; height: 408px; background-color: rgb(38, 150, 203);">
    &nbsp;</div>
<div style="position:absolute;z-index:2;width: 100%">
    <%--<img src="style/images/logo.png" style="height: 56px;margin-left: 5px;">--%>
    <div id="title" style="text-align: center; height: 55px; margin-top: 206px">
        <h1 style="color: white;font-size: 40px;font-family: initial;">智能无线静荷载试验检测云平台</h1>
    </div>

    <div style="height: 200px;width: 636px;background: url('style/images/031.gif') no-repeat;margin: 0px auto">

        <div style="float: left;width: 30%;margin-top: 30px;margin-left: 30px;"><img src="style/images//9_03.png"></div>
        <div style="float: right;width: 60%;margin-top: 30px;">
            <table cellpadding="0" cellspacing="10" style="width: 300px;color: white;"
                   onkeydown="if(event.keyCode==13) {getLogin(); return false;}">
                <tbody>
                <tr>
                    <td width="80px" align="right">用户名：</td>
                    <td><input style="width: 180px" name="name" id="name" class="txt" tabindex="1"></td>
                </tr>
                <tr>
                    <td align="right">密&nbsp;&nbsp;&nbsp;码：</td>
                    <td><input style="width: 180px" type="password" name="pwd" id="pwd" class="txt" tabindex="2"></td>
                </tr>
                <tr>
                    <td align="right">验证码：</td>
                    <td><input name="verifycode" id="verifycode" style="width: 80px" maxlength="4" class="txt"
                               tabindex="3"><img id="code"
                                                 src="authimg?now=new Date()"
                                                 alt="点击更换"
                                                 width="65"
                                                 height="25"
                                                 align="absMiddle"
                                                 onClick="this.src='authimg?now='+new Date()">
                    </td>
                </tr>
                </tbody>
            </table>

            <div class="btn"><input type="button" name="btn_login" id="btn_login"></div>
        </div>
    </div>

    <table id="gdTable" cellpadding="0" cellspacing="0" align="center" style="margin-top: 279px;">
        <tbody>
        <tr>
            <td style="width: 23px;"><img onclick="d2();" style="cursor: pointer;width: 23px;"
                                          src="style/images/LL.png">
            </td>
            <td>
                <div id="scrollContDiv" style=" width: 960px;height: 130px;overflow:hidden;">
                    <ul class="gdul" style="width: 1680px;height: 130px;">
                        <li>
                            <a href="http://59.42.210.10:9100" target="_top">
                                <div style="float: left;width: 220px;height: 130px;margin: 0px 10px 0px 10px;text-align: center;">
                                    <img src="style/images/16.gif" width="220px" height="130px;"></div>
                            </a>
                        </li>
                        <li>
                            <div style="float: left;width: 220px;height: 130px;background:url('style/images/14.gif') repeat-x;margin: 0px 10px 0px 10px;text-align: center;">
                                <div style="margin-top:25px;font-size: 15px;color: #f9f9f9;font-weight: bold;">
                                    模板支撑系统无线智能安全监测云平台
                                </div>
                                <div style="margin-top: 10px;"><img src="style/images/5466aaaab98d9_21.png"></div>
                            </div>
                        </li>
                        <li>
                            <a href="http://59.42.210.10:9100/huitanyi" target="_top">
                                <div style="float: left;width: 220px;height: 130px;background-color: #a9a9a9;margin: 0px 10px 0px 10px;text-align: center;">
                                    <div style="margin-top:25px;font-size: 15px;font-weight: bold;">
                                        回弹法检测混凝土抗压强度数据采集管理云平台
                                    </div>
                                    <div style="margin-top: 10px;"><img src="style/images/5466aaaab98d9_212.png"></div>
                                </div>
                            </a>
                        </li>
                        <li>
                            <a href="#">
                                <div style="float: left;width: 220px;height: 130px;background-color: #a9a9a9;margin: 0px 10px 0px 10px;text-align: center;">
                                    <div style="margin-top:25px;font-size: 15px;font-weight: bold;">模块2</div>
                                    <div style="margin-top: 10px;">（待开发）</div>
                                </div>
                            </a>
                        </li>
                        <li>
                            <a href="#">
                                <div style="float: left;width: 220px;height: 130px;background-color: #a9a9a9;margin: 0px 10px 0px 10px;text-align: center;">
                                    <div style="margin-top:25px;font-size: 15px;font-weight: bold;">模块3</div>
                                    <div style="margin-top: 10px;">（待开发）</div>
                                </div>
                            </a>
                        </li>
                        <li>
                            <a href="#">
                                <div style="float: left;width: 220px;height: 130px;background-color: #a9a9a9;margin: 0px 10px 0px 10px;text-align: center;">
                                    <div style="margin-top:25px;font-size: 15px;font-weight: bold;">模块4</div>
                                    <div style="margin-top: 10px;">（待开发）</div>
                                </div>
                            </a>
                        </li>
                        <li>
                            <a href="#">
                                <div style="float: left;width: 220px;height: 130px;background-color: #a9a9a9;margin: 0px 10px 0px 10px;text-align: center;">
                                    <div style="margin-top:25px;font-size: 15px;font-weight: bold;">模块5</div>
                                    <div style="margin-top: 10px;">（待开发）</div>
                                </div>
                            </a>
                        </li>


                        <!--<li>
                        <a href="#"><div style="float: left;width: 220px;height: 130px;background-color: #a9a9a9;margin: 0px 10px 0px 10px;text-align: center;">
                        <div style="margin-top:20px;font-size: 14px;">回弹法检测混凝土抗压强度数据采集及溯源系统</div>
                        </div></a>
                        </li>
                        <li>
                        <a href="#"><div style="float: left;width: 220px;height: 130px;background-color: #a9a9a9;margin: 0px 10px 0px 10px;text-align: center;">
                        <div style="margin-top:20px;font-size: 14px;">钻芯法检测混凝土强度的芯样标识溯源系统</div>
                        </div></a>
                        </li>
                        <li>
                        <a href="#"><div style="float: left;width: 220px;height: 130px;background-color: #a9a9a9;margin: 0px 10px 0px 10px;text-align: center;">
                        <div style="margin-top:20px;font-size: 14px;">安全生产巡检系统</div>
                        </div></a>
                        </li>
                        <li>
                        <a href="#"><div style="float: left;width: 220px;height: 130px;background-color: #a9a9a9;margin: 0px 10px 0px 10px;text-align: center;">
                        <div style="margin-top:20px;font-size: 14px;">基桩竖向承载力测试系统</div>
                        </div></a>
                        </li>
                        <li>
                        <a href="#"><div style="float: left;width: 220px;height: 130px;background-color: #a9a9a9;margin: 0px 10px 0px 10px;text-align: center;">
                        <div style="margin-top:20px;font-size: 14px;">基桩钻芯检测系统</div>
                        </div></a>
                        </li>  -->
                    </ul>
                </div>

            </td>
            <td style="width: 23px;"><img onclick="d1();" style="cursor: pointer;width: 23px;"
                                          src="style/images/RR.png">
            </td>
        </tr>
        </tbody>
    </table>
</div>

</body>
</html>
