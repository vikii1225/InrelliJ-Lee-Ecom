<%@ page import="com.Ecom.model.User" %>
<% String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path; %>

<div class="row">
	<nav class="navbar navbar-default" role="navigation">
	<div class="container-fluid">
		<div class="navbar-header">
			<a class="navbar-brand" id="HName">Shopin</a>
		</div>
		
		<ul class="nav navbar-nav" id="NavigationBar">
			<li><a href="<%=basePath %>/Home/home.jsp"><span class="glyphicon glyphicon-home"></span> Home</a></li>
			<li><a href="#"><span class="glyphicon glyphicon-th-list"></span> Category</a></li>
			<li><a href="#"><span class="glyphicon glyphicon-file"></span> Services</a></li>
			<li><a href="#"><span class="glyphicon glyphicon-info-sign"></span> Contact</a></li>

            <%
                User user=(User)session.getAttribute("user");
                //System.out.println("User : "+user.getName());
                if (user != null && !"".equals(user))
                {
                    %>
                        <li class="right1">
                            <a href="<%=basePath%>/User/ManageIndex.jsp?id=<%=user.getEmail()%>"><span class="glyphicon glyphicon-user"></span> <%= user.getName()%></a>
                        </li>
                    <%
                        int shops=Integer.parseInt(session.getAttribute("shops").toString());
                        System.out.println(shops);
                        System.out.println(shops==0);
                        if(shops==0)
                        {
                            %>
                            <li><a href="<%=basePath%>/User/ShopRegister.jsp" onclick="javascript:confirm('You have not apply for a shop yet. Click yes to start a shop!');"><span class="glyphicon glyphicon-gift"></span> My Shop</a></li>
                            <%
                        }
                        else
                        {
                            %>
                            <li><a href="<%=basePath%>/Shop/ShopIndex.jsp?id=<%=user.getEmail()%>"><span class="glyphicon glyphicon-gift"></span> My Shop</a></li>
                            <%
                        }
                    %>
                        <li><a onclick="confirmAct()"><span class="glyphicon glyphicon-log-out"></span>Exit</a></li>
                    <%
                }
                else
                {
                    %>
                        <li class="right1"><a role="button" data-toggle="modal" data-target="#MyRegistration">
                            <span class="glyphicon glyphicon-user"></span> Registration</a>
                        </li>
                        <li><a role="button" data-toggle="modal" data-target="#loginpaper">
                            <span class="glyphicon glyphicon-log-in"></span> Login</a>
                        </li>
                    <%
                }
            %>
        </ul>

        <!-- 模态框（Modal） -->
                    <div class="modal fade" id="MyRegistration" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                        <div class="modal-dialog">
                            <div class="modal-content">
                                <div class="modal-header">
									<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
									<h4 class="modal-title" id="myModalLabel">Registration</h4>
                                </div>
                                <div class="modal-body">
                                  
                     <form class="form-horizontal" id="registeForm" name="registeForm" action="<%=basePath %>/register" method="post" >
                     <div class="form-group row">
                        <label for="email" class="col-md-offset-2 col-md-2 control-label" >E-mail:</label>
                        <div class="col-md-6"><input type="email" class="form-control" id="email" name="email"></div>
                     </div>
                     <div class="form-group row">
                        <label for="name" class="col-md-offset-2 col-md-2 control-label" >Name:</label>
                        <div class="col-md-6"><input type="text" class="form-control" id="name" name="name"></div>
                    </div>
                    <div class="form-group row">
                        <label for="password" class="col-md-offset-2 col-md-2 control-label" >Password:</label>
                        <div class="col-md-6"><input type="password" class="form-control" id="password" name="password"></div>
                    </div>
                    <div class="form-group row">
                        <label for="repwd" class="col-md-offset-2 col-md-2 control-label" >Reconfirm Password:</label>
                        <div class="col-md-6"><input type="password" class="form-control" id="repwd" name="repwd"></div>
                    </div>
                     <div class="form-group row">
                         <label for="actual_name" class="col-md-offset-2 col-md-2 control-label" >Actual Name:</label>
                         <div class="col-md-6"><input type="text" class="form-control" id="actual_name" name="actual_name" ></div>
                     </div>
                     <div class="form-group row">
                        <label for="phone" class="col-md-offset-2 col-md-2 control-label" >Phone:</label>
                        <div class="col-md-6"><input type="text" class="form-control" id="phone" name="phone" ></div>
                    </div>                    
                    <div class="form-group row">
                        <label for="gender" class="col-md-offset-2 col-md-2 control-label" >Gender:</label>
                        <div class="col-md-6">
                            <lable class="radio-inline">
                                <input  type="radio" name="gender" id="male" value="0" checked="ture">Male
                            </lable>
                            <lable class="radio-inline">
                                <input  type="radio" name="gender" id="female" value="1">Female
                            </lable>
                        </div>
                    </div>
                       
                        <div class="form-group row">
                           <center><button type="submit" class="btn btn-primary" >Register</button></center>
                        </div>

                    
                    
                    </form>
                                        
                                                       
                                </div>
                                
                            </div><!-- /.modal-content -->
                        </div><!-- /.modal-dialog -->
                    </div><!-- /.modal -->
                    
                    <!-- 模态框（Modal） -->
                    <div class="modal fade" id="loginpaper" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                        <div class="modal-dialog">
                            <div class="modal-content">
                                <div class="modal-header">
									<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
									<h4 class="modal-title" id="myModalLabel">Login</h4>
                                </div>
                                <div class="modal-body">
                                  
                                    <form class="form-horizontal" id="indexform" name="indexForm" action="<%=basePath %>/login" method="post" >
                                    	<div class="form-group row">
                        					<label for="email" class="col-md-offset-2 col-md-2 control-label" >E-mail:</label>
                        					<div class="col-md-6"><input type="email" class="form-control" id="email" name="email"></div>
                     					</div>
                                        <div class="form-group">
                                            <label for="password" class="col-md-offset-2 col-md-2 control-label" >Password:</label>
                                            <div class="col-md-6"><input type="password" class="form-control" name="password"></div>
                                        </div>
                                        <div class="modal-footer">
                                        <!--<button type="button" class="btn btn-default" style="border: none">Forget Password</button>-->
                                        <center><button type="submit" class="btn btn-primary">Login</button></center>
                                        </div>
                                    </form>                                
                                </div>
                                
                            </div><!-- /.modal-content -->
                        </div><!-- /.modal-dialog -->
                    </div><!-- /.modal -->
        
	</div>
	</nav>
	</div>
	<script src="../js/jquery-3.2.1.min.js" type="text/javascript"></script>
<script src="../js/bootstrap.min.js" type="text/javascript"></script>
<script src="../js/bootstrapValidator.min.js" type="text/javascript"></script>
<script src="../js/jstarbox.js" type="text/javascript"></script>
<script src="../js/jquery.magnific-popup.js" type="text/javascript"></script>
<script src="../js/classie.js" type="text/javascript"></script>
<script src="../js/imagezoom.js" type="text/javascript"></script>
<script src="../js/jquery.chocolat.js" type="text/javascript"></script>
<script src="../js/jquery.flexslider.js" type="text/javascript"></script>
<script src="../js/simpleCart.min.js" type="text/javascript"></script>
<script src="../js/uisearch.js" type="text/javascript"></script>
<script src="../js/modernizr.custom.72111.js" type="text/javascript"></script>

<script type="text/javascript">
    function confirmAct()
    {
        if(confirm('Are you sure to Exit?'))
        {
            window.location.href= "<%=basePath%>/Home/LogOut.jsp";
            return true;
        }
        else
            return false;
    }
</script>