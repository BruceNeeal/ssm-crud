<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set value="${pageContext.request.contextPath}" var="APP_PATH"/>
<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <title>员工列表</title>

    <script type="text/javascript" src="${APP_PATH }/static/js/jquery-3.4.1.min.js"></script>
    <link href="${APP_PATH }/static/bootstrap-3.3.7-dist/css/bootstrap.min.css" rel="stylesheet">
    <script type="text/javascript" src="${APP_PATH }/static/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
</head>

<body>
<!-- 员工修改的模态框 -->
<div class="modal fade" id="empUpdateModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
                <h4 class="modal-title">员工修改</h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal">
                    <div class="form-group">
                        <label class="col-sm-2 control-label">empName</label>
                        <div class="col-sm-10">
                            <p class="form-control-static" id="empName_update_static"></p>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">email</label>
                        <div class="col-sm-10">
                            <input type="text" name="email" class="form-control" id="email_update_input"
                                   placeholder="email@outlook.com"> <span class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">gender</label>
                        <div class="col-sm-10">
                            <label class="radio-inline"> <input type="radio" name="gender" id="gender1_update_input"
                                                                value="M" checked="checked"> 男
                            </label> <label class="radio-inline"> <input type="radio" name="gender"
                                                                         id="gender2_update_input" value="F"> 女
                        </label>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">deptName</label>
                        <div class="col-sm-6">
                            <!--部门提交部门id即可-->
                            <select class="form-control" name="dId">

                            </select>
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button type="button" class="btn btn-primary" id="emp_update_btn">更新</button>
            </div>
        </div>
    </div>
</div>

<!-- 员工添加的模态框 -->
<div class="modal fade" id="empAddModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
                <h4 class="modal-title" id="myModalLabel">员工添加</h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal">
                    <div class="form-group">
                        <label class="col-sm-2 control-label">empName</label>
                        <div class="col-sm-10">
                            <input type="text" name="empName" class="form-control" id="empName_add_input"
                                   placeholder="empName"> <span class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">email</label>
                        <div class="col-sm-10">
                            <input type="text" name="email" class="form-control" id="email_add_input"
                                   placeholder="email@outlook.com"> <span class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">gender</label>
                        <div class="col-sm-10">
                            <label class="radio-inline"> <input type="radio" name="gender" id="gender1_add_input"
                                                                value="M" checked="checked"> 男
                            </label> <label class="radio-inline"> <input type="radio" name="gender"
                                                                         id="gender2_add_input" value="F"> 女
                        </label>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">deptName</label>
                        <div class="col-sm-6">
                            <!--部门提交部门id即可-->
                            <select class="form-control" name="dId">

                            </select>
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button type="button" class="btn btn-primary" id="emp_save_btn">保存</button>
            </div>
        </div>
    </div>
</div>

<!-- 显示页面 -->
<div class="container">
    <div class="row">
        <div class="col-md-12">
            <a href="views/detail.jsp?emp=1">人员管理跳转测链接</a>
        </div>
    </div>

    <div class="row">
        <div class="col-md-4 col-md-offset-9">
            <button class="btn btn-primary" id="emp_add_modal_btn">新增员工</button>
            <button class="btn btn-danger" id="emp_delete_all_btn">批量删除</button>
        </div>
    </div>
    <!--表单-->
    <div class="row">
        <div class="col-md-12">
            <table class="table table-hover" id="emps_table">
                <!--表头-->
                <thead>
                <tr>
                    <th>
                        <input type="checkbox" id="check_all" />
                    </th>
                    <th>#</th>
                    <th>姓名</th>
                    <th>性别</th>
                    <th>邮箱</th>
                    <th>职位</th>
                    <th>操作</th>
                </tr>
                </thead>
                <!--表体-->
                <tbody>

                </tbody>
            </table>
        </div>
    </div>

    <div class="row">
        <div class="col-md-6" id="page_nav_area"></div>
        <div class="col-md-6" id="page_info_area"></div>
    </div>
</div>
<script type="text/javascript">
    var totalRecord;
    var currentPage;

    //1.页面加载完以后直接发送一个ajax请求，要到分页数据
    $(function () {
        to_page(1);
    });

    function to_page(pn) {
        $.ajax({
            url: "${APP_PATH}/emps",
            data: "pn=" + pn,
            type: "GET",
            success: function (result) {
                //1.解析并显示员工数据
                build_emps_table(result);
                //2.解析并显示分页信息
                build_page_info(result);
                //3.解析显示分页条
                build_page_nav(result);
            }
        });
    }

    function build_emps_table(result) {
        //填充表格前先清空数据
        $("#emps_table tbody").empty();

        //获取所有员工的list集合
        var emps = result.extend.pageInfo.list;
        $.each(emps, function (index, item) {
            var checkBoxTd = $("<td><input type='checkbox' class='check_item'/></td>");
            var empIdTd = $("<td></td>").append(item.empId);
            var empNameTd = $("<td></td>").append(item.empName);
            var genderTd = $("<td></td>").append(
                item.gender == 'M' ? "男" : "女");
            var emailTd = $("<td></td>").append(item.email);
            var deptNameTd = $("<td></td>")
                .append(item.department.deptName);
            var editBtn = $("<button></button").addClass(
                "btn btn-primary btn-sm edit_btn").append(
                $("<span></span>").addClass(
                    "glyphicon glyphicon-pencil")).append("编辑");
            //为编辑按钮添加一个自定义属性，来表示员工id
            editBtn.attr("edit-id", item.empId);
            var delBtn = $("<button></button").addClass(
                "btn btn-danger btn-sm delete_btn").append(
                $("<span></span>")
                    .addClass("glyphicon glyphicon-trash")).append(
                "删除");
            //为删除按钮添加一个自定义属性，来表示员工id
            delBtn.attr("del-id", item.empId);
            var btnTd = $("<td></td>").append(editBtn).append(" ").append(
                delBtn);

            //append方法执行完成以后还是返回原来的元素
            $("<tr></tr>").append(checkBoxTd).append(empIdTd).append(empNameTd).append(
                genderTd).append(emailTd).append(deptNameTd).append(
                btnTd).appendTo("#emps_table tbody");
        });
    }

    //解析显示分页信息
    function build_page_info(result) {
        //填充分页信息前先清空数据
        $("#page_info_area").empty();

        $("#page_info_area").append(
            "当前" + result.extend.pageInfo.pageNum + "页,总"
            + result.extend.pageInfo.pages + "页,总"
            + result.extend.pageInfo.total + "条记录");
        totalRecord = result.extend.pageInfo.total;
        currentPage = result.extend.pageInfo.pageNum;
    }

    //解析显示分页条
    function build_page_nav(result) {
        //填充分页条前先清空数据
        $("#page_nav_area").empty();

        var ul = $("<ul></ul>").addClass("pagination")
        var firstPageLi = $("<li></li>").append(
            $("<a></a>").append("首页").attr("herf", "#"));
        var prePageLi = $("<li></li>").append(
            $("<a></a>").append("&laquo;"));
        if (result.extend.pageInfo.hasPreviousPage == false) {
            firstPageLi.addClass("disabled");
            prePageLi.addClass("disabled");
        } else {
            firstPageLi.click(function () {
                to_page(1);
            });
            prePageLi.click(function () {
                to_page(result.extend.pageInfo.pageNum - 1);
            });
        }
        ul.append(firstPageLi).append(prePageLi);

        $.each(result.extend.pageInfo.navigatepageNums, function (index,
                                                                  item) {
            var numLi = $("<li></li>").append($("<a></a>").append(item));
            if (result.extend.pageInfo.pageNum == item) {
                numLi.addClass("active");
            }
            numLi.click(function () {
                to_page(item);
            });
            ul.append(numLi);
        });

        var nextPageLi = $("<li></li>").append(
            $("<a></a>").append("&raquo;"));
        var lastPageLi = $("<li></li>").append(
            $("<a></a>").append("末页").attr("herf", "#"));
        if (result.extend.pageInfo.hasNextPage == false) {
            nextPageLi.addClass("disabled");
            lastPageLi.addClass("disabled");
        } else {
            nextPageLi.click(function () {
                to_page(result.extend.pageInfo.pageNum + 1);
            });
            lastPageLi.click(function () {
                to_page(result.extend.pageInfo.pages);
            });
        }
        ul.append(nextPageLi).append(lastPageLi);
        var navEle = $("<nav></nav>").append(ul);
        navEle.appendTo("#page_nav_area");
    }

    //清空表单样式及内容
    function reset_form(ele) {
        $(ele)[0].reset();
        $(ele).find("*").removeClass("has-error has-success");
        $(ele).find(".help-block").text("");
    }

    //点击新增按钮弹出模态框
    $("#emp_add_modal_btn").click(function () {
        //先清除模态框表单数据
        reset_form("#empAddModal form");

        //发送ajax请求,查出部门信息,显示在下拉列表中
        getDepts("#empAddModal select");

        //弹出模态框
        $("#empAddModal").modal({
            backdrop: "static"
        });
    });

    //查出所有部门信息并显示在下拉列表中
    function getDepts(ele) {
        //先清除下拉框已有信息
        $(ele).empty();
        $.ajax({
            url: "${APP_PATH}/depts",
            type: "GET",
            success: function (result) {
                $.each(result.extend.depts, function () {
                    var optionEle = $("<option></option>").append(
                        this.deptName).attr("value", this.deptId);
                    optionEle.appendTo(ele);
                });
            }
        });
    }

    //校验表单数据
    function validate_add_form() {
        //1.拿到校验数据,使用正则表达式
        var empName = $("#empName_add_input").val();
        var regName = /(^[a-zA-Z0-9_-]{3,16}$)|(^[\u2E80-\u9FFF]{2,5})/;
        if (!regName.test(empName)) {
            show_validate_msg("#empName_add_input", "error",
                "提交失败:用户名必须是2-5位汉字或者3-16位英文字母或下划线或数字组合");
            return false;
        } else {
            show_validate_msg("#empName_add_input", "success", "");
        }
        //2.校验邮箱
        var email = $("#email_add_input").val();
        var regEmail = /^([a-z0-9_\.-]+)@([\da-z\.-]+)\.([a-z\.]{2,6})$/;
        if (!regEmail.test(email)) {
            show_validate_msg("#email_add_input", "error", "邮箱格式不正确");
            return false;
        } else {
            show_validate_msg("#email_add_input", "success", "");
        }
        return true;
    }

    //校验结果提示信息
    function show_validate_msg(ele, status, msg) {
        //先清除当前元素的校验状态
        $(ele).parent().removeClass("has-success has-error");
        $(ele).next("span").text("");
        if (status == "success") {
            $(ele).parent().addClass("has-success");
            $(ele).next("span").text(msg);
        } else if (status = "error") {
            $(ele).parent().addClass("has-error");
            $(ele).next("span").text(msg);
        }
    }

    //检验用户名是否可用
    $("#empName_add_input").change(
        function () {
            //发送ajax请求校验用户名是否可用
            var empName = this.value;
            $.ajax({
                url: "${APP_PATH}/checkuser",
                data: "empName=" + empName,
                type: "POST",
                success: function (result) {
                    if (result.code == 100) {
                        show_validate_msg("#empName_add_input",
                            "success", "用户名可用");
                        $("#emp_save_btn").attr("ajax-va", "success");
                    } else {
                        show_validate_msg("#empName_add_input",
                            "error", result.extend.va_msg);
                        $("#emp_save_btn").attr("ajax-va", "error");
                    }
                }
            });
        });

    //点击保存,保存员工
    $("#emp_save_btn").click(function () {
        //1.模态框表格数据提交给服务器保存
        //先对要提交的数据进行前端正则校验
        if (!validate_add_form()) {
            return false;
        }

        //1.5判断之前的ajax用户名校验是否成功
        if ($(this).attr("ajax-va") == "error") {
            return false;
        }

        //2.发送ajax请求保存员工
        $.ajax({
            url: "${APP_PATH}/emp",
            type: "POST",
            data: $("#empAddModal form").serialize(),
            success: function (result) {
                if (result.code == 100) {
                    //1.员工保存成功,关闭模态框
                    $("#empAddModal").modal('hide');
                    //2.来到最后一页,显示刚才数据
                    //发送ajax请求显示最后一个数据即可
                    to_page(totalRecord);
                } else {
                    //显示失败信息
                    if (undefined != result.extend.errorFields.email) {
                        show_validate_msg("#email_add_input", "error", result.extend.errorFields.email);
                    }
                    if (undefined != result.extend.errorFields.empName) {
                        show_validate_msg("#empName_add_input", "error", result.extend.errorFields.empName);
                    }
                }
            }
        });
    });

    //Jquery使用on为ajax请求刷出的编辑按钮绑定点击事件
    $(document).on("click", ".edit_btn", function () {
        //查出员工信息,显示员工信息
        getEmp($(this).attr("edit-id"));
        //1.先清除模态框表单数据
        reset_form("#empUpdateModal form");
        //2.查出部门信息,显示部门列表
        getDepts("#empUpdateModal select");
        //3.把员工的id传递给模态框的更新按钮
        $("#emp_update_btn").attr("edit-id", $(this).attr("edit-id"));
        $("#empUpdateModal").modal({
            backdrop: "static"
        });
    });

    //Jquery使用on为ajax请求刷出的删除按钮绑定点击事件
    $(document).on("click", ".delete_btn", function () {
        //1.弹出确认是否删除对话框
        var empName = $(this).parents("tr").find("td:eq(2)").text();
        var empId = $(this).attr("del-id");
        if (confirm("确认删除[" + empName + "]吗?")) {
            //确认发送ajax请求删除即可
            $.ajax({
                url: "${APP_PATH}/emp/" + empId,
                type: "DELETE",
                success: function (result) {
                    alert(result.msg);
                    to_page(currentPage);
                }
            });
        }
    });

    function getEmp(id) {
        $.ajax({
            url: "${APP_PATH}/emp/" + id,
            type: "GET",
            success: function (result) {
                var empData = result.extend.emp;
                $("#empName_update_static").text(empData.empName);
                $("#email_update_input").val(empData.email);
                $("#empUpdateModal input[name=gender]").val([empData.gender]);
                $("#empUpdateModal select").val([empData.dId]);
            }
        });
    }

    //点击更新,更新员工信息
    $("#emp_update_btn").click(function () {
        //1.验证邮箱是否合法
        var email = $("#email_update_input").val();
        var regEmail = /^([a-z0-9_\.-]+)@([\da-z\.-]+)\.([a-z\.]{2,6})$/;
        if (!regEmail.test(email)) {
            show_validate_msg("#email_update_input", "error", "邮箱格式不正确");
            return false;
        } else {
            show_validate_msg("#email_update_input", "success", "");
        }

        //2.发送ajax请求保存更新员工数据
        $.ajax({
            url: "${APP_PATH}/emp/" + $(this).attr("edit-id"),
            type: "PUT",
            data: $("#empUpdateModal form").serialize(),
            success: function (result) {
                //1.关闭模态框
                $("#empUpdateModal").modal("hide");
                //2.回到本页面
                to_page(currentPage);
            }
        });
    });

    //完成全选/全不选功能
    $("#check_all").click(function(){
        //attr获取checked总是undefined
        //用prop获取dom原生属性的值,attr获取自定义的值
        $(".check_item").prop("checked",$(this).prop("checked"));
    });

    //check_item绑定事件
    $(document).on("click",".check_item",function(){
        //判断当前选中的元素是否为本页所有
        var flag = $(".check_item:checked").length==$(".check_item").length;
        $("#check_all").prop("checked",flag);
    });

    //点击批量删除
    $("#emp_delete_all_btn").click(function(){
        var empNames="";
        var del_idstr="";
        $.each($(".check_item:checked"),function(){
            //组装员工名字的字符串
            empNames+=$(this).parents("tr").find("td:eq(2)").text()+",";
            //组装员工id的字符串
            del_idstr+=$(this).parents("tr").find("td:eq(1)").text()+"-"
        });
        //去除多余分隔符号
        empNames=empNames.substring(0,empNames.length-1);
        del_idstr=del_idstr.substring(0,empNames.length-1);
        if(confirm("确认删除["+empNames+"]吗?")){
            //确认发送ajax请求
            $.ajax({
                url: "${APP_PATH}/emp/" + del_idstr,
                type:"DELETE",
                success:function(result){
                    alert(result.msg);
                    to_page(currentPage);
                }
            });
        }
    });
</script>
</body>

</html>