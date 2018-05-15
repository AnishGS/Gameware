<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.util.Arrays" import="java.util.HashMap" import="java.util.Set" import="java.util.Map" import="java.util.Iterator"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>

<body>
<%= "<table border='1'><tr><td><input type='text' onKeyDown='mv(event)' onKeyUp='stp(event)' value ='no'></td></tr><tr><td><canvas id='screen' height='1000' width='1000'></canvas></td></tr></table>"%>
<%= "Hello World." %>
<%
	int a=200;
	//out.println("a= "+a);
	int []ab=new int[2];
	ab[0]=2;
	ab[1]=1;
	Arrays.sort(ab);
	out.println(ab[0]);
	HashMap<String,String> hmp=new HashMap<String,String>();
	hmp.put("a","ob1.moveLeft()");
	hmp.put("b","a=20");
	out.println(hmp.get("a"));
	hmp.remove("b");
%>
</body>
<script src="res/matter.min.js">
</script>
<script src="res/engine.init.js">"

</script>
<script src="res/engine.human.js">
</script>
<script>
<%= "var h1=new Human(20,300);function mv(event){if(event.keyCode==39)interpolateHuman(h1,3,1);else if(event.keyCode==37)interpolateHuman(h1,3,-1);else if(event.keyCode==38)interpolateHumanY(h1,3,1);else if(event.keyCode==40)interpolateHumanY(h1,3,-1);}function stp(event){stopHumanInterpolation(h1);}Matter.World.add(world, h1.hbody);Matter.Engine.run(engine);Matter.Render.run(render);;"%>
</script>

</html>