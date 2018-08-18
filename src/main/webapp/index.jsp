<%--
  Created by IntelliJ IDEA.
  User: 冯庆
  Date: 2018/7/31
  Time: 20:29
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@page isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html>
<head>
    <title>员工列表</title>
    <!-- jQuery (Bootstrap 的所有 JavaScript 插件都依赖 jQuery，所以必须放在前边) -->
    <script src="${pageContext.request.contextPath }/static/js/jquery-1.12.4.min.js"></script>
    <!-- 加载 Bootstrap 的所有 JavaScript 插件。你也可以根据需要只加载单个插件。 -->
    <script src="${pageContext.request.contextPath }/static/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
    <!-- Bootstrap -->
    <link href="${pageContext.request.contextPath }/static/bootstrap-3.3.7-dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
    <%--
        新增员工模态框
    --%>

    <div class="modal fade" id="addEmp" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title" id="myModalLabel">新员工信息</h4>
                </div>
                <div class="modal-body">
                    <%--表单--%>
                        <form class="form-horizontal" id="emp_form">
                            <div class="form-group">
                                <label  class="col-sm-2 control-label">empName</label>
                                <div class="col-sm-10">
                                    <input type="text" name="empName" class="form-control" id="empName" placeholder="小明">
                                    <span id="helpBlock2" class="help-block"></span>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-2 control-label">gender</label>
                                <label class="radio-inline">
                                    <input type="radio" name="gender" id="gender1" value="男" checked> 男
                                </label>
                                <label class="radio-inline">
                                    <input type="radio" name="gender" id="gender2" value="女"> 女
                                </label>

                            </div>
                            <div class="form-group">
                                <label for="email" class="col-sm-2 control-label">email</label>
                                <div class="col-sm-10">
                                    <input type="email" name="email" class="form-control" id="email" placeholder="@ali.com">
                                    <span id="helpBlock" class="help-block"></span>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-2 control-label">deptName</label>
                                <div class="col-sm-4">
                                    <select class="form-control" id="department" name="deptId">

                                    </select>
                                </div>
                            </div>
                        </form>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                    <button type="button" class="btn btn-primary" id="sava_btn">保存</button>
                </div>
            </div>
        </div>
    </div>


<%--
        更新员工模态框
    --%>

<div class="modal fade" id="update-emp-model" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" id="myModalLabel-update">更新员工信息</h4>
            </div>
            <div class="modal-body">
                <%--表单--%>
                <form class="form-horizontal" id="update-emp-form">
                    <div class="form-group">
                        <label  class="col-sm-2 control-label">empName</label>
                        <div class="col-sm-10">
                            <input type="text" name="empName" class="form-control" id="update-empName" placeholder="小明">
                            <span id="helpBlock-update" class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">gender</label>
                        <label class="radio-inline">
                            <input type="radio" name="gender" id="gender3" value="男" checked> 男
                        </label>
                        <label class="radio-inline">
                            <input type="radio" name="gender" id="gender4" value="女"> 女
                        </label>

                    </div>
                    <div class="form-group">
                        <label for="email" class="col-sm-2 control-label">email</label>
                        <div class="col-sm-10">
                            <input type="email" name="email" class="form-control" id="update-email" placeholder="@ali.com">
                            <span id="helpBlock4" class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">deptName</label>
                        <div class="col-sm-4">
                            <select class="form-control" id="update-department" name="deptId">

                            </select>
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button type="button" class="btn btn-primary" id="update-btn">更新</button>
            </div>
        </div>
    </div>
</div>


<%--
            主体内容
    --%>
    <div class="container">
        <%--标题--%>
        <div class="row">
            <div class="col-xs-12">
                <h2>SSM_CRUD</h2>
            </div>
        </div>
    <%--按钮--%>

        <div class="row">

            <div class="col-xs-12 col-xs-offset-8">
                <button class="btn btn-primary" id="incre_bt">新增</button>
                <button class="btn btn-warning" id="delect-btn">删除</button>
            </div>
        </div>
        <br>
    
        <%--员工信息--%>
        <div class="row">
            <div class="col-xs-12">
                <table class="table table-hover" id="emps-table">
                    <thead>
                        <tr>
                            <th>
                                <button type="checkbox" id="checkAll" style="position: relative">#</button>
                                <input type="checkbox" id="selectAll" hidden>

                            </th>
                            <th>empName</th>
                            <th>gender</th>
                            <th>email</th>
                            <th>department</th>
                            <th>操作</th>
                        </tr>
                    </thead>
                    <%--遍历pageInfo中员工信息--%>
                    <tbody>
                    </tbody>
                </table>
            </div>
        </div>
    
        <%--页码信息--%>
        <div class="row">
            <div id="page_info_1">
                每页显示
                <select id="pageSize">
                    <option>5</option>
                    <option>10</option>
                    <option>15</option>
                </select>
                条
            </div>
            <div id="page_info"></div>
            <div class="col-xs-12 col-xs-offset-8">
                <nav aria-label="Page navigation">
                    <ul class="pagination" id="url-li" go_pageNum="1">
                        <li id="firstPage"  go_pageNum="1"><a href="#">首页</a></li>
                        <li id="previousPage" go_pageNum="1"><a href="#"><span aria-hidden="true">&laquo;</span></a></li>

                        <li id="nextPage" go_pageNum="2"><a href="#"><span aria-hidden="true">&raquo;</span></a></li>
                        <li id="lastPage"  go_pageNum="999999"><a href="#">末页</a></li>
                    </ul>
                </nav>
            </div>
        </div>
    </div>

    <script type="text/javascript">
  /*
 *
 * 显示主体信息
 *
  */

        //第一次启动去首页
        $(function () {
            to_page(1)
        })
    
        function to_page(pn) {
            $.ajax({
                url:"${pageContext.request.contextPath }/emps?pageShowNum="+$("#pageSize").val(),
                data:"pn="+pn,
                type:"GET",
                success:function (result) {
                    //解析并显示员工信息
                    build_emps_table(result);
                    //解析显示分页信息
                    page_info(result);
                    //解析显示分页条信息
                    build_pages_table(result);
                    $("#selectAll").attr("style","display:none");
                }
            });
        };
    
       /*
       *解析并显示员工信息
        */
        function build_emps_table(result) {
            //清空表格
            $("#emps-table tbody").empty();
    
            //解析出员工信息
            var emps = result.extend.pageInfo.list;
            //遍历员工信息
            $.each(emps,function (index, item) {
               var empIdTd = $("<td></td>").append($("<input type='checkbox' class='checkOne' hidden >").attr("pageNum",result.extend.pageInfo.pageNum))
                   .append(item.empId).addClass("empIdTd");
               var empNameTd = $("<td></td>").append(item.empName);
               var empGenderTd = $("<td></td>").append(item.gender);
               var empEmailTd = $("<td></td>").append(item.email);
               var empDepartmentTd = $("<td></td>").append(item.department.deptName);
               var ediBt = $("<button></button>").addClass("btn btn-primary btn-xs edit_btn").attr("editId",item.empId)
                   .attr("pageNum", result.extend.pageInfo.pageNum)
                   .append($("<span></span>").addClass("glyphicon glyphicon-pencil"))
                   .append("编辑");
               var delBt = $("<button></button>").addClass("btn btn-warning btn-xs del_btn").attr("delId",item.empId)
                   .attr("pageNum", result.extend.pageInfo.pageNum)
                   .append($("<span></span>").addClass("glyphicon glyphicon-trash"))
                   .append("删除");

               $("<tr></tr>")
                   .append(empIdTd)
                   .append(empNameTd)
                   .append(empGenderTd)
                   .append(empEmailTd)
                   .append(empDepartmentTd)
                   .append(ediBt)
                   .append("&nbsp;")
                   .append(delBt)
                   .appendTo("#emps-table tbody" );
            });
        };
    


      /*
      *解析并显示分页信息
       */
        function page_info(result) {
            //清空
            $("#page_info").empty();
    
            $("#page_info").append(
                "当前为第 "
                +result.extend.pageInfo.pageNum+
                " 页,总"
                +result.extend.pageInfo.pages+
                "页 "
                +result.extend.pageInfo.total
                +"条记录");
        };

        /*
        * 解析显示分页条信息
        */
        function build_pages_table(result) {

            //分页条按键的细节处理
            btn_detail(result.extend.pageInfo);

            //判断是否要重载分页条信息
            var pageNum = result.extend.pageInfo.pageNum;
            var objs = $("#url-li .numLi");
            if(objs.first().text()<=pageNum && objs.first().text() !="" && objs.last().text()>=pageNum){
                return;
            }

            //清空
            $("#url-li .numLi").remove();

            //显示分页条
            $.each(result.extend.pageInfo.navigatepageNums, function (index, item) {
                var numLi = $("<li></li >").addClass("numLi").attr("go_pageNum",item)
                    .append($("<a></a>").attr("href","#")
                    .append(item));
    
                //判断是否是当前页码
                if (result.extend.pageInfo.pageNum == item) {
                    numLi.addClass("active");
                };

                $("#nextPage").before(numLi);
            });

        };

       //为分页条添加鼠标点击事件
        $(document).on("click", "#url-li li", function () {
            to_page($(this).attr("go_pageNum"));
        });


        //分页条按键的细节处理
        function btn_detail(page_Info){
            //页码处理
            var pageNum = page_Info.pageNum;
            $("#previousPage").attr("go_pageNum", pageNum-1);
            var p = ++pageNum;
            $("#nextPage").attr("go_pageNum", p);
            $("#lastPage").attr("go_pageNum", page_Info.pages);

            //禁用状态
            $("#url-li li").removeClass("disabled");
            //首页
            if (page_Info.isFirstPage){
                $("#firstPage").addClass("disabled");
            }
            //回退页
            if (!page_Info.hasPreviousPage){
                $("#previousPage").addClass("disabled")
            }
            //前进页键
            if (!page_Info.hasNextPage){
                $("#nextPage").addClass("disabled")
            };
            //末页
            if (page_Info.isLastPage){
                $("#lastPage").addClass("disabled");
            }

            //当前页高亮显示
            $("#url-li .numLi").removeClass("active");
            $("#url-li .numLi[go_pageNum="+page_Info.pageNum+"]").addClass("active");
        }

  /*
  *
  * 新增员工
  *
   */
        //点击"新增"按钮
        $("#incre_bt").click(function () {
            //重置表单
            $("#emp_form")[0].reset();
            //发送ajax请求,查取所有部门信息
            getDepts("#department");
            //弹出模拟框
            $("#addEmp").modal();
        });

        //弹出模拟框并且获取部门信息
       function simulated_box() {

       }

        //发送ajax请求,查取所有部门信息
        function getDepts(ele) {
            $.ajax({
                url:"${pageContext.request.contextPath}/depts",
                type:"GET",
                success:function (result) {
                    //清空
                    $(ele).empty();
                    //遍历部门信息并显示
                    $.each(result.extend.depts,function (index,item) {
                        $(ele).append($("<option></option>")
                                .attr("value",item.deptId)
                                .append(item.deptName));
                    });
                }
            });
        }

        //点击"保存"按钮保存员工
        $("#sava_btn").click(function () {
            //判断"保存"按钮是否可用
            if(save_btn()) {
                return;
            }

            $.ajax({
                url:"${pageContext.request.contextPath}/emps",
                data:$("#emp_form").serialize(),
                type:"POST",
                success:function (result) {
                    if (result.stauts == 200) {
                        //后台校验出错
                        if(undefined != result.extend.errors.empName){
                            alert("aaaaaaaaaaaaa")
                            validStauts("#empName", "erro", result.extend.errors.empName);
                            //邮箱设为可用
                            $("#email").attr("usable","usable");
                        }else if(undefined != result.extend.errors.email){
                            validStauts("#email", "erro", result.extend.errors.email);
                        };
                    }else {
                        $('#addEmp').modal('hide');
                        to_page(9999999);
                    }
                }
            });
        });


        //校验用户名是否可用或者已存在
        $("#empName").change(function () {
            //校验用户名是否可用
            var empName = $("#empName").val();
            var valid_emp = /(^[a-z0-9_-]{6,16}$)|(^[\u2E80-\u9FFF]+)/;
            var bl = valid_emp.test(empName);
            if (!bl) {
                validStauts("#empName", "faile", "请输入6到16位字符");
                return;
            }
            checkUser(this.value);
        });

        //校验用户名是否已存在
       function checkUser(empName){
            $.ajax({
                url:"${pageContext.request.contextPath}/checkUser?empName="+empName,
                type:"GET",
                success:function (result) {
                    if(result.stauts == 200){
                       validStauts("#empName", "erro", "用户名已存在");
                        usable("#empName", "disable");
                    }else {
                        validStauts("#empName", "success", "很好,请继续填写下列信息");
                        usable("#empName", "usable");
                    }
                }
            });
        };

        //校验邮箱是否可用
        $("#email").change(function () {
            var email = $("#email").val();
            var valid_email = /^[a-z\d]+(\.[a-z\d]+)*@([\da-z](-[\da-z])?)+(\.{1,2}[a-z]+)+$/;
            var bl2 = valid_email.test(email);
            if (!bl2) {
                validStauts("#email","faile","邮箱不正确");
                //设置邮箱不可用
                usable("#email", "disable");
            }else {
                validStauts("#email","success","邮箱可用");
                //设置邮箱可用
                usable("#email", "usable");
            }
        });

        //判断"保存"按钮是否可用
        function save_btn(){
            var emailUb= $("#email").attr("usable");
            var empNameUb= $("#empName").attr("usable");

            if(empNameUb == "usable"&&emailUb =="usable"){
                //可执行"保存"按钮,清空校验显示信息
                empty_validationInfo("#empName");
                empty_validationInfo("#email");
                return false;
            }
            return true;
        }

        //设置员工名和邮箱的属性决定可用状态
        function usable(ele,attrValue) {
            $(ele).attr("usable",attrValue);
        }


        //显示校验信息
        function validStauts(els,stauts,msg) {
            //清空之前状态
            empty_validationInfo(els);

            if ("success" == stauts){
                //校验成功
                $(els).parent().addClass("has-success");
                $(els).next("span").text(msg);
            }else {
                //校验失败
                $(els).parent().addClass("has-error");
                $(els).next("span").text(msg);
            }
        }

        //清空校验显示信息
        function empty_validationInfo(id) {
            $(id).attr("usable","disable");
            $(id).parent().removeClass("has-success has-error");
            $(id).next("span").text("");
        }


    /*
    *
   * 更改员工信息
   *
    */
        //为"编辑"按钮绑定事件
        $(document).on("click", ".edit_btn", function () {
            //重置表单
            $("#update-emp-form")[0].reset();
            //设置员工名和邮箱为可用状态
            usable("#update-email", "usable");
            usable("#update-empName", "usable");

            //添加部门信息
            getDepts("#update-department");
            //添入员工信息
            getEmp($(this).attr("editId"));
            //把相关值传递给"更新"按钮
            $("#update-btn").attr("empId", $(this).attr("editId"));
            $("#update-btn").attr("pageNum", $(this).attr("pageNum"));

            //禁用empName输入框
            $("#update-empName").attr("disabled","");

            //弹出模拟框
            $("#update-emp-model").modal();
        });

        //上传更新信息
        $("#update-btn").click(function () {
            $.ajax({
                url:"${pageContext.request.contextPath }/emps?empId="+$("#update-btn").attr("empId"),
                data:$("#update-emp-form").serialize()+"&_method=PUT",
                type:"POST",
                success:function (result) {
                    $('#update-emp-model').modal('hide');
                    to_page($("#update-btn").attr("pageNum"));
                },
            });
        });


        //获取一个员工数据
        function getEmp(id) {
            $.ajax({
                url:"${pageContext.request.contextPath}/selectEmp?empId="+id,
                type:"GET",
                success:function (result) {
                    console.log(result);
                        var emp = result.extend.employee;
                        $("#update-empName").val(emp.empName);
                        $("#update-email").val(emp.email);
                        $("#update-department").val(emp.deptId);
                        $("#update-emp-model input[name=gender]").val([emp.gender]);
                },
            });
        }


  /*
      *
      * 删除员工
      *
       */
      //为小"删除"按钮添加点击事件
      $(document).on("click", ".del_btn", function () {
          //弹出确认删除按钮
          if(confirm("确认删除#"+$(this).parents("tr").find("td:eq(1)").text()+"#吗")){
              //调用删除方法,并传入id和当前页码
              del_emp($(this).attr("delId"), $(this).attr("pageNum"));
          }
      });

      //删除一条员工信息或者批量删除
      function del_emp(str,pageNum) {
          $.ajax({
              url:"${pageContext.request.contextPath}/emps?empId="+str,
              type:"delete",
              success:function (result) {
                  to_page(pageNum);
              }
          });
      };

        //实现点击"#"按钮显示或隐藏删除多选按钮
        $("#checkAll").click(function () {
                $("#checkAll").css("color","black");
                //$(".checkOne").toggle();
                 $("#selectAll").toggle();
                $(".checkOne").attr("style", $("#selectAll").attr("style"));
            }
        );

        //设置全选
        $("#selectAll").click(function () {
            $(".checkOne").prop("checked",$("#selectAll").prop("checked"));
        });
        $(document).on("click", ".checkOne", function () {
            if($(".checkOne:checked").length ==5){
                $("#selectAll").prop("checked",true);
            };
        });

        //"删除"按钮绑定事件
        $("#delect-btn").click(function () {
            //判断有没有选中删除员工
            if($(".checkOne:checked").length ==0){
                var div=$("#checkAll");
                div.css("color","red");
                div.animate({left:'+10px'},50);
                div.animate({left:'-10px'},50);
                div.animate({left:'+10px'},50);
                div.animate({left:'+10px'},50);
                div.animate({left:'+10px'},50);
                div.animate({left:'-10px'},50);
                setTimeout(function () {
                        $("#checkAll").css("color","black");
                },
                    5000
                );
                return;
            };

            //遍历要删除的员工
            var empNames = "";
            var empIds = "";
            var pageNum = "";
            $.each($(".checkOne:checked"),function () {
                empNames += $(this).parents("tr").find("td:eq(1)").text()+"，";
                empIds += $(this).parents("tr").find("td:eq(0)").text()+"-";
                pageNum = $(this).attr("pageNum");
            });
            empNames = empNames.substring(0, empNames.length - 1);
            empIds = empIds.substring(0, empIds.length - 1);
            if(confirm("您要删除"+empNames+"这些员工吗")){
                del_emp(empIds,pageNum)
                $('#checkAll').click();
            };
        });

        $("#pageSize").click(function () {
            to_page(1);
        });

    </script>
</body>
</html>
