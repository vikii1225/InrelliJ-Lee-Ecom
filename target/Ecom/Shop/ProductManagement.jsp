<%@ page import="com.Ecom.model.Product" %>
<%@ page import="com.Ecom.model.ProductCategory" %>
<%@ page import="java.util.List" %>
<%@ page import="com.Ecom.model.ProductPicture" %>
<%@ page import="com.Ecom.dao.UploadImageHelper" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<link href="../css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
	<link href="../css/bootstrapValidator.min.css" rel="stylesheet" type="text/css"/>
	<link href="../css/bootstrap-select.min.css" rel="stylesheet">
	<link href="../css/bootstrap-datetimepicker.min.css" rel="stylesheet">
	<link href="../css/fileinput.min.css" rel="stylesheet">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Myshop - Product Management</title>
</head>
<%
	List<Product> productList=(List<Product>)session.getAttribute("productList");
	List<ProductCategory> categoryNames=(List<ProductCategory>)session.getAttribute("categoryNames");
%>
<body>
<jsp:include page="../Shared/_ShopManagement.jsp" />
			<ul class="breadcrumb">
				<li class="active">
					 Product Management
				</li>
				<li class="active">
					Product List
				</li>
			</ul>

<form name="form1" method="post" action="">
            <button type="button" class="btn btn-primary" onclick="javascrtpt:window.location.href='AddProduct.jsp'">
                <span><img src="../images/t01.png" /></span> Add
            </button>

			<button type="button" class="btn btn-info" onclick="callModify()">
			    <span><img src="../images/t02.png" /></span> Edit
			</button>

			<button type="button"  class="btn btn-danger" onclick="callDelete()">
			    <span><img src="../images/t03.png" /></span> Delete
			</button>

			<table class="table table-striped table-hover">
				<thead>
					<tr>
						<th></th>
						<th>ProductID</th>
						<th>Picture</th>
						<th>Product Name</th>
						<th>Category</th>
						<th>Price</th>
						<th>Stock</th>
						<th>Add Time</th>
						<th>Status</th>
					</tr>
				</thead>
				<tbody>
				<%
					if(!productList.isEmpty()){
						for(int i=0;i<productList.size();i++){//行数
				%>
					<tr>
						<td class="tb2_td1">
							<input type = "radio" name = "check" id = "check" value="<%=productList.get(i).getProduct_id()%>"/>
						</td>
						<td><%=productList.get(i).getProduct_id()%></td>
						<td>
							<img  alt="no image" style="height: 50px;width: 40px" src="http://localhost:8080/productimage/<%=productList.get(i).getProduct_id()%>/1">
						</td>
						<td><%=productList.get(i).getProduct_name()%></td>
						<td>
							<%
								String category_name=null;
								if(!categoryNames.isEmpty()){
									for(int j=0;j<categoryNames.size();j++)
									{
									    if(categoryNames.get(j).getCategory_id()==productList.get(i).getCategory_id())
									        category_name=categoryNames.get(j).getCategory_name();
									}
								}
							%>
						<%=category_name%></td>
						<td><%=productList.get(i).getUnit_price()%></td>
						<td><%=productList.get(i).getStock()%></td>
						<td>
							<%
								String addDateTime=productList.get(i).getAdd_date();
								String[] sArray=addDateTime.split(" ") ;
								String addDate=null;
								for(int a=0;a<sArray.length;a++)
									addDate=sArray[0];
							%>
						<%=addDate%></td>
						<td>
							<%
								String product_status=null;
								int status=productList.get(i).getStatus();
								if(status==0)
									product_status="On Sale";
								else if(status==1)
									product_status="Sold Out";
							%>
						<%=product_status%></td>
					</tr>
				<%
						}
					}
				%>
				</tbody>
			</table>
</form>

<script src="../js/jquery-3.2.1.min.js" type="text/javascript"></script>
<script src="../js/bootstrap.min.js" type="text/javascript"></script>
<script src="../js/bootstrapValidator.min.js" type="text/javascript"></script>
<script src="../js/bootstrap-select.min.js" type="text/javascript"></script>
<script src="../js/bootstrap-datetimepicker.min.js" type="text/javascript"></script>
<script src="../js/fileinput.min.js" type="text/javascript"></script>

<script>
    //点击行时选中单选框
    $("tr").bind("click",function(){
        $("input:radio").attr("checked",false);
        $(this).find("td").find("input:radio").attr("checked",true);
    });

    function confirmChecked() {
        var check=document.getElementsByName("check");
        var productId=0;
        for(var c=0;c<check.length;c++)
        {
            if(check[c].checked==true)
            {
                productId = check[c].value;
            }
        }
        return productId;
    }

    function callDelete() {
        var productId=confirmChecked();
        if(productId!=0)
		{
            var action=confirmDelete();
		    if(action==true)
			{
                document.form1.action='/deleteProduct?product_id='+productId;
                document.form1.submit();
			}
		}
		else
		    alert("Please select a product!");
    }

    function confirmDelete()
    {
        if(confirm('Are you sure to delete the seleted product?'))
            return true;
        else
            return false;
    }

    function callModify() {
        var productId=confirmChecked();
        if(productId!=0) {
            document.form1.action = '/getParameters?product_id=' + productId;
            document.form1.submit();
        }
        else
            alert("Please select a product!");
    }

    window.onload=function () {
        var message="${param.Message}";
        if(message.length == 0 || null == message)
        {
            message=null;
        }
        else
        {
            alert(message);
            window.location.href="ProductManagement.jsp";
        }
    };
</script>
</body>




</html>