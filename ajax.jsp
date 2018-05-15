<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" %>
    <%
    	String userName=request.getParameter("username");
   		session.setAttribute("username", userName);
    //	session.setAttribute("userroot","E:/gameware/"+userName);
    	session.setAttribute("userroot","C:/xampp/tomcat/webapps/Gameware/users/"+userName);
    	String rootVal=String.valueOf(session.getAttribute("userroot"));
    %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<style>
.explorer
	{
		height: 100%;
   		width: 20%;
   		position: fixed;
    	z-index: 1;
    	top: 0;
    	left: 0;
    	background-color: white ;
   		overflow-x: hidden;
    	transition: 0.5s;
    	padding-top: 60px;
    	margin-top:30px;
    	color:black;
    	 font-family:"Segoe UI";
    	 font-size:14px;
    	 border-right: 1px solid;
    	  cursor:default;
  border-color:#7F8C8D;
    border-width:thin;
	}
	.file
	{
		width:400px;
	}
	.file:hover
	{
		background-color:#eec111;
	}
	.fileExplorer
	{
    	margin-top:-50px;
    	left:40;
    	
	}
	.body
	{
		 transition: margin-left .5s;
   		left:0;
   		margin-left: 22%;
   		display:block;
   		height:600px;
   		//width:77%;
   		//position: fixed;
   		top:0;
   		
	}
	ul {
	z-index:4;
    list-style-type: none;
    margin: 0;
   
    padding: 0;
    overflow: hidden;
    background-color: #3B8EC2;
   //   background-color: #3F51B5;
    left:0;
    height:30px;
    font-size:12px;
    
}

li {
    float: left;
}

li a, .dropbtn {
    display: inline-block;
    color: white;
    text-align: center;
    padding: 7px 7px;
    text-decoration: none;
    z-index:4;
    font-family:"Arial";
    cursor:default;
}

li a:hover, .dropdown:hover .dropbtn {
    background-color: #D35400;
}

li.dropdown {
    display: inline-block;
    z-index:4;
}

.dropdown-content {
    display: none;
    position: absolute;
    background-color: #f9f9f9;
    min-width: 160px;
   // box-shadow: 0px 8px 12px 0px rgba(0,0,0,0.2);
    z-index: 4;
    border-style:solid;
    border-top-style:none;
    border-width:thin;
}
.dropdown-content a {
    color: black;
    padding: 12px 16px;
    text-decoration: none;
    display: block;
    text-align: left;
}

.dropdown-content a:hover {background-color: #eec111}

.dropdown:hover .dropdown-content {
    display: block;
}
body
{
	margin:0;
	background-color: #f4f6f6 ;
	
}
.filenames {
    background-color: #8E44AD; /* Green */
    border-style:solid;
   border-bottom-style:none;
    border-width:thin;
    color: white;
    border-color:white;
    padding: 8px 7px;
    text-align: center;
    text-decoration: none;
    display: inline-block;
    font-size: 12px;
    border-left-style: none;
}
.editor
{
  border-style:solid;
    border-width:thin;
     border-color:black;
     resize:none;
   
}
.childWindow
{
	 display: none; /* Hidden by default */
    position: fixed; /* Stay in place */
    z-index: 5; /* Sit on top */
    padding-top: 100px; /* Location of the box */
    left: 0;
    top: 0;
    width: 100%; /* Full width */
    height: 100%; /* Full height */
    overflow: auto; /* Enable scroll if needed */
    background-color: #FFF; /* Fallback color */
  background-color: rgba(0,0,0,0.8); /* Black w/ opacity */
  //opacity:0.5;
	transition:1s;
}

.childWindow2
{
	 display: none; /* Hidden by default */
    position: fixed; /* Stay in place */
    z-index: 5; /* Sit on top */
    padding-top: 100px; /* Location of the box */
    left: 0;
    top: 0;
    width: 100%; /* Full width */
    height: 100%; /* Full height */
    overflow: auto; /* Enable scroll if needed */
    background-color: #FFF; /* Fallback color */
  background-color: rgba(0,0,0,0.8); /* Black w/ opacity */
  //opacity:0.5;
	transition:1s;
}

.childWindow3
{
	 display: none; /* Hidden by default */
    position: fixed; /* Stay in place */
    z-index: 5; /* Sit on top */
    padding-top: 100px; /* Location of the box */
    left: 0;
    top: 0;
    width: 100%; /* Full width */
    height: 100%; /* Full height */
    overflow: auto; /* Enable scroll if needed */
    background-color: #FFF; /* Fallback color */
  background-color: rgba(0,0,0,0.8); /* Black w/ opacity */
  //opacity:0.5;
	transition:1s;
}
.childWindow4
{
	 display: none; /* Hidden by default */
    position: fixed; /* Stay in place */
    z-index: 5; /* Sit on top */
    padding-top: 100px; /* Location of the box */
    left: 0;
    top: 0;
    width: 100%; /* Full width */
    height: 100%; /* Full height */
    overflow: auto; /* Enable scroll if needed */
    background-color: #FFF; /* Fallback color */
  background-color: rgba(0,0,0,0.8); /* Black w/ opacity */
  //opacity:0.5;
	transition:1s;
}
.childWindow5
{
	 display: none; /* Hidden by default */
    position: fixed; /* Stay in place */
    z-index: 5; /* Sit on top */
    //padding-top: 100px; /* Location of the box */
    left: 0;
    top: 0;
    width: 100%; /* Full width */
    height: 100%; /* Full height */
    overflow: auto; /* Enable scroll if needed */
    background-color: #FFF; /* Fallback color */
  background-color: rgba(0,0,0,0.8); /* Black w/ opacity */
  //opacity:0.5;
	transition:1s;
}
.childWindow6
{
	 display: none; /* Hidden by default */
    position: fixed; /* Stay in place */
    z-index: 5; /* Sit on top */
    //padding-top: 100px; /* Location of the box */
    left: 0;
    top: 0;
    width: 100%; /* Full width */
    height: 100%; /* Full height */
    overflow: auto; /* Enable scroll if needed */
    background-color: #FFF; /* Fallback color */
  background-color: rgba(0,0,0,0.8); /* Black w/ opacity */
  //opacity:0.5;
	transition:1s;
}
.projectExplorer {
    background-color: white;
    margin: auto;
    padding: 20px;
    border: 1px solid #0078d7;
    width: 500px;
	//color:black;
	overflow:auto;
	//background-color:#4a8bc1;
	font-family:'Segoe UI Light';
	font-size:20px;
	height:300px;
	opacity:1;
	//margin-top:20px;
	//transition:1s;
	
}
.imageExplorer {
    background-color: white;
    margin: auto;
    padding: 20px;
    border: 1px solid #0078d7;
    width: 100%;
	//color:black;
	overflow:auto;
	//background-color:#4a8bc1;
	font-family:'Segoe UI Light';
	font-size:20px;
	height:100%;
	opacity:1;
	//margin-top:20px;
	//transition:1s;
}
.projectExplorerTitle 
{
    background-color: white;
    margin: auto;
   // padding: 20px;
    border: 1px solid #0078d7;
    width: 540px;
	//color:black;
	overflow:none;
	//background-color:#4a8bc1;
	font-family:'Segoe UI Light';
	font-size:20px;
	height:25px;
	opacity:1;
	top:200;
	//margin-top:20px;
	//transition:1s;
}
.projectExplorerTitleImg
{
    background-color: white;
    margin: auto;
   // padding: 20px;
    border: 1px solid #0078d7;
    width: 100%;
	//color:black;
	overflow:none;
	//background-color:#4a8bc1;
	font-family:'Segoe UI Light';
	font-size:20px;
	height:25px;
	opacity:1;
	//margin-top:20px;
	//transition:1s;
}
.projectName
{
	color:blue;
}
.projectName:hover
{
	background-color:green;
}

.runSelect {
    border: 1px solid #ccc;
    width: 120px;
  //  border-radius: 3px;
    overflow: hidden;
   font-family:"Segoe UI";
}

.runSelect select {
    padding: 5px 8px;
    width: 130%;
    border: none;
    box-shadow: none;
    background: transparent;
    background-image: none;
    -webkit-appearance: none;
}

.runSelect select:focus {
    outline: none;
}

.selectDiv
 {
  background: url(http://i62.tinypic.com/15xvbd5.png) no-repeat 96% 0;
  height: 29px;
  overflow: hidden;
  width: 150px;
//  background-color: #eec111;
background-color: white;
 // border-radius: 20px;
  
}
.selectDiv select
 {
  background: transparent;
  border: none;
  font-size: 12px;
  height: 29px;
  padding: 2px;
  /* If you add too much padding here, the options won't show in IE */
  width: 268px;
}
.runButton
{
background-color: #3B8EC2; /* Green */
    border: none;
    color: white;
  padding:5px;
    text-align: center;
    text-decoration: none;
   // display: inline-block;
    font-size: 16px;
   -moz-border-radius:50%;
   border-radius:50%;
    width:20px;
    height:20px;
    
    
}
.playButton
{
width: 0; height: 0;

 border-top: 10px solid transparent;
  border-left: 20px solid white;
   border-bottom: 10px solid transparent;
}

</style>
<script>
function getFileContents(e)
{
	var str="textReader.jsp?path="+e.id;
	var xmlhttp=new XMLHttpRequest();
	var data;
	
	if(fileExistsInClient(e))
	{
		setEditor(e.id);
		manageTabs(e.id);
		highlightExplorer(e);
		return;
	}
	xmlhttp.onreadystatechange = function()
	 {
        if (xmlhttp.readyState == 4 || xmlhttp.readyState == "complete")
		 {
        	data=this.responseText;
        	 while(data.indexOf("%2B")>=0)
 				data=data.replace("%2B","+");
            addFile(e,data);
            document.getElementById('textEditor').value=data;
            document.getElementById("current").value=e.id;
        	manageTabs(e.id);
        	document.getElementById('textEditor').style.visibility="visible";
        	highlightExplorer(e);
          }
    };
    xmlhttp.open("GET", str , true);
    xmlhttp.send();
}
function getImage(e)
{
	var str="imageReader.jsp?path="+e.id;
	var xmlhttp=new XMLHttpRequest();
	xmlhttp.onreadystatechange = function()
	 {
       if (xmlhttp.readyState == 4 || xmlhttp.readyState == "complete")
	   {
       		document.getElementById('imageView').innerHTML=this.responseText;
  		   	//alert(this.responseText);
  		   	openChildWindow5();
       }
   };
   xmlhttp.open("GET", str , true);
   xmlhttp.send();
}
function highlightExplorer(e)
{
	//breakHighlight()
	//document.getElementById(e.id).style.backgroundColor="green";
}
function breakHighlight()
{
	var files=document.getElementsByClassName('file');
	for(var i=0;i<files.length;i++)
	{
		files[i].style.backgroundColor="#8E44AD";
	}
}
function fileExistsInClient(e)
{
	var files=document.getElementsByClassName('filenames');
	var flag=true;
	for(var i=0;i<files.length;i++)
	{
		if(files[i].id==e.id)
		{
			return true;
		}
	}
	return false;
}
function addFile(e,data)
{
	 	
	if(!fileExistsInClient(e))
	{
		 var textareas=document.getElementsByClassName('filecontents');
		 for(var i=0;i<textareas.length;i++)
		 {
			 var temparea=document.getElementsByClassName(textareas[i].name);
			 temparea[0].value=textareas[i].value;
		 }
		 var id=getFilename(e.id);
		 document.getElementById('buttons').innerHTML+="<input type='button'  value='"+id+"' id='"+e.id+"' class='filenames' onClick='setEditor(this.id)'>";

		 document.getElementById('textareas').innerHTML+="<textarea name='"+e.id+"' class='filecontents' rows='1' cols='1'  style='visibility:hidden'>"+data+"</textarea>";
		 var tempareas=document.getElementsByName('filecontentbuffer');
		 for(var i=0;i<tempareas.length;i++)
		 {
			var names=document.getElementsByName(tempareas[i].className);
			names[0].value=tempareas[i].value;
		 }
		 document.getElementById('tempareas').innerHTML+="<textarea class='"+e.id+"' name='filecontentbuffer' rows='1' cols='1' style='visibility:hidden'></textarea>"; 
	}
}
function deleteFile(e)
{
		str="delete_file.jsp?filename="+e;
	var xmlhttp=new XMLHttpRequest();
    xmlhttp.onreadystatechange = function()
	 {
        if (xmlhttp.readyState == 4 || xmlhttp.readyState == "complete")
		 {
            document.getElementById('fileExplorer').innerHTML=this.responseText;
          
        }
    };
    xmlhttp.open("GET", str , true);
    xmlhttp.send();
}
function showExplorer(e)
{
	var projectFolder=e.substring(8,e.length);
	str="ajax_request.jsp?projectroot="+projectFolder;
	
	document.getElementById('projectRootVal').value=e;
	var xmlhttp=new XMLHttpRequest();
    xmlhttp.onreadystatechange = function()
	 {
        if (xmlhttp.readyState == 4 || xmlhttp.readyState == "complete")
		 {
            document.getElementById('fileExplorer').innerHTML=this.responseText;
            closeChildWindow();
           
            loadRunLevels();
            enablePostProject();
        }
    };
    xmlhttp.open("GET", str , true);
    xmlhttp.send();
}
function createFile()
{
	var filename=document.getElementById('newFile').value;
	str="fileWriter.jsp?filename="+filename+"&filecontent=";
	
	var xmlhttp=new XMLHttpRequest();
    xmlhttp.onreadystatechange = function()
	 {
        if (xmlhttp.readyState == 4 || xmlhttp.readyState == "complete")
		 {
           
        	showExplorer(document.getElementById('projectRootVal').value);
        	loadRunLevels();
        	closeChildWindow2();
        }
    };
    xmlhttp.open("GET", str , true);
    xmlhttp.send();
}
function createFolder()
{
	var e=document.getElementById('folderRoot').value;
	var folder=document.getElementById('newFolder').value;
	var folderName=e.substring(7,e.length)+"/"+folder;
	str="createFolder.jsp?foldername="+folderName;
	var xmlhttp=new XMLHttpRequest();
    xmlhttp.onreadystatechange = function()
	 {
        if (xmlhttp.readyState == 4 || xmlhttp.readyState == "complete")
		 {
           
        	showExplorer(document.getElementById('projectRootVal').value);
        	
        	closeChildWindow4();
        }
    };
    xmlhttp.open("GET", str , true);
    xmlhttp.send();
}

function createProject()
{
	var filename=document.getElementById('newProject').value;
	str="create_project.jsp?projectname="+filename;
	
	var xmlhttp=new XMLHttpRequest();
    xmlhttp.onreadystatechange = function()
	 {
        if (xmlhttp.readyState == 4 || xmlhttp.readyState == "complete")
		 {
        	closeChildWindow3();
        	
        	var path=this.responseText;
        	showExplorer(path.trim());
         }
    };
    xmlhttp.open("GET", str , true);
    xmlhttp.send();
}
document.addEventListener("keydown",function(e)
{
	if(e.keyCode==83 && e.ctrlKey)
	{
		e.preventDefault();
		var info=document.getElementById("current").value;
		var buffer=document.getElementsByName(info);
		var data=buffer[0].value;
		while(data.indexOf("+")>=0)
			data=data.replace("+","%2B");
		alert(data);
		str="fileWriter.jsp?filename="+info+"&filecontent="+encodeURI(data);
		
		var xmlhttp=new XMLHttpRequest();
	    xmlhttp.onreadystatechange = function()
		 {
	        if (xmlhttp.readyState == 4 || xmlhttp.readyState == "complete")
			 {
	            alert('saved');
	        }
	    };
	    xmlhttp.open("GET", str , true);
	    xmlhttp.send();
		
	}
},false);
function setEditor(e)
{
	var text=document.getElementsByName(e);
	var write=text[0].value;
	manageTabs(e);
	document.getElementById("textEditor").value=write;
	document.getElementById("current").value=e;
}
function manageTabs(e)
{
	var buttons=document.getElementsByClassName('filenames');
	for(var i=0;i<buttons.length;i++)
	{
		if(buttons[i].id!=e)
			buttons[i].style.backgroundColor=" #7fb3d5 ";
		else
			buttons[i].style.backgroundColor=" #2e86c1 ";
		
	}
}
function getFilename(e)
{
	var i=0;
	for(i=e.length-1;i>=0;i--)
	{
		if(e.charAt(i)=="/")
			break
	}
	return e.substring(i+1,e.length);
}
function updateBuffer(e)
{
	var data=document.getElementById(e).value;
	var info=document.getElementById("current").value;
	var buffer=document.getElementsByName(info);
	buffer[0].value=data;
	
}
function loadRunLevels()
{
	var e=document.getElementById('projectRootVal').value;
	var projectRoot=e.substring(8,e.length)
	str="runFileSelector.jsp?projectroot="+projectRoot;
	
	var xmlhttp=new XMLHttpRequest();
	 xmlhttp.onreadystatechange = function()
	 {
        if (xmlhttp.readyState == 4 || xmlhttp.readyState == "complete")
		 {
           document.getElementById('runLevel').innerHTML=this.responseText;
            //alert(this.responseText);
           
        }
    };
    xmlhttp.open("GET", str , true);
    xmlhttp.send();
}
function toggle(e)
{
	var div_id="div_"+e;
	if(document.getElementById(div_id).style.overflow=="hidden")
	{
		document.getElementById(div_id).style.overflow="visible";
		document.getElementById(div_id).style.height="auto";
	}
	else
	{
		document.getElementById(div_id).style.overflow="hidden";
		document.getElementById(div_id).style.height="20px";
	}
}
function restoreDiv(e)
{
	var div_id="div_"+e;
	var noOfChildren=document.getElementById(div_id).className;
	if(document.getElementById(div_id).style.height=="20px")
	{
		document.getElementById(div_id).style.height=((parseInt(noOfChildren)+1)*20)+"px";
		//expandParent(div_id,noOfChildren);
	}
	else
	{
		document.getElementById(div_id).style.height="20px";
		//restoreParent(div_id,noOfChildren);
	}
}
function restoreParent(e,n)
{
	while(e!="div_E:\temp_files\newFolder\js")
	{
		var i=e.length-1;
		while(e.charAt(i)!='/')
			i--;
		var parent=e.substring(0,i);
		var parentHeight=document.getElementById(parent).clientHeight;
		document.getElementById(parent).style.height=(parentHeight-n)+"px";
		e=parent;
	}
}
function expandParent(e,n)
{
	while(e!="div_E:\temp_files\newFolder\js")
	{
		var i=e.length-1;
		while(e.charAt(i)!='/')
			i--;
		var parent=e.substring(0,i);
		var parentHeight=document.getElementById(parent).clientHeight;
		document.getElementById(parent).style.height=(parentHeight+n)+"px";
		e=parent;
	}
	
}
function runGame()
{
	var runLevel=document.getElementById('runSelection');
	var levelName=runLevel.options[runLevel.selectedIndex].value;
	var projectRoot=document.getElementById("projectRootVal").value;
	var str="http://localhost:8080/Gameware/gamerun.jsp?run="+levelName+"&projectroot="+projectRoot.substring(8,projectRoot.length)+"/";
	//window.open(str,"newWindow","height="+screen.height+",width="+screen.width);
	var w=820;
	var h=620;
	var left=(screen.width/2)-(w/2);
	var top=(screen.height/2)-(h/2)-50;
	window.open(str,"newWindow","height="+620+",width="+820+",top="+top+",left="+left);
}
function retract()
{
	document.getElementById('files').style.width="0%";
	document.getElementById("contents").style.marginLeft = "2%"
}
function expand()
{
	document.getElementById('files').style.width="20%";
	document.getElementById("contents").style.marginLeft = "22%"
}
function openProject()
{
	
	str="openProject.jsp";
	var xmlhttp=new XMLHttpRequest();
    xmlhttp.onreadystatechange = function()
	 {
        if (xmlhttp.readyState == 4 || xmlhttp.readyState == "complete")
		 {
            document.getElementById('openProject').innerHTML=this.responseText;
            closeProject();
            openChildWindow();
            expand();
        }
    };
    xmlhttp.open("GET", str , true);
    xmlhttp.send();
}
function closeProject()
{
	//retract();
	document.getElementById('fileExplorer').innerHTML="";
	document.getElementById('current').value="";
	document.getElementById('projectRootVal').value="";
	document.getElementById('textEditor').value="";
	document.getElementById('textEditor').style.visibility="hidden";
	document.getElementById('textareas').innerHTML="";
	document.getElementById('tempareas').innerHTML="";
	document.getElementById('buttons').innerHTML="";
	document.getElementById('runLevel').innerHTML="";
	disablePostProject();
	
}
function disablePostProject()
{
	var para=document.getElementsByClassName('postProject');
	for(var i=0;i<para.length;i++)
	{
		para[i].style.color="green";
	}
}
function enablePostProject()
{
	var para=document.getElementsByClassName('postProject');
	for(var i=0;i<para.length;i++)
	{
		para[i].style.color="black";
	}
}
function openChildWindow()
{
	var child=document.getElementsByClassName('childWindow');
	child[0].style.display="block";
}
function openChildWindow2()
{
	var child=document.getElementsByClassName('childWindow2');
	child[0].style.display="block";
}
function openChildWindow3()
{
	var child=document.getElementsByClassName('childWindow3');
	child[0].style.display="block";
}
function openChildWindow4(e)
{
	document.getElementById('folderRoot').value=e;
	var child=document.getElementsByClassName('childWindow4');
	child[0].style.display="block";
}
function openChildWindow5(e)
{
	document.getElementById('folderRoot').value=e;
	var child=document.getElementsByClassName('childWindow5');
	child[0].style.display="block";
}
function openChildWindow6(e)
{
	document.getElementById('folderRoot').value=e;
	var child=document.getElementsByClassName('childWindow6');
	child[0].style.display="block";
}
function closeChildWindow()
{
	var child=document.getElementsByClassName('childWindow');
	child[0].style.display="none";
}
function closeChildWindow2()
{
	var child=document.getElementsByClassName('childWindow2');
	child[0].style.display="none";
	
}
function closeChildWindow3()
{
	var child=document.getElementsByClassName('childWindow3');
	child[0].style.display="none";
	
}
function closeChildWindow4()
{
	var child=document.getElementsByClassName('childWindow4');
	child[0].style.display="none";
	
}
function closeChildWindow5()
{
	var child=document.getElementsByClassName('childWindow5');
	child[0].style.display="none";	
}
function closeChildWindow6()
{
	var child=document.getElementsByClassName('childWindow6');
	child[0].style.display="none";	
	showExplorer(document.getElementById('projectRootVal').value);
}
//window.open("https://www.w3schools.com","newWIndow","height=200,width=200"); 
</script>

</head>

<body>

<ul>
  <li class="dropdown"><a href="#home" >File</a>
  	<div class="dropdown-content" id="fileMenu">
      <p onClick="openProject()"><a>Open Project</a></p>
      <p onClick="openChildWindow3()"><a>New Project</a></p>
       <p onClick="closeProject()"><a class="postProject" style="color:green;"> Close Project</a></p>
        <p onClick="openChildWindow2()"><a class="postProject" style="color:green;">New Gamefile</a></p>
         <p onClick="openChildWindow6()"><a class="postProject" style="color:green;">Upload Image</a></p>
    </div>
  </li>
  <li><a href="#news">Edit</a></li>
  <li class="dropdown">
    <a href="javascript:void(0)" class="dropbtn">Help</a>
    <div class="dropdown-content">
      <a href="#">Link 1</a>
      <a href="#">Link 2</a>
      <a href="#">Link 3</a>
    </div>
  </li>
  <li ><div style="width:200px;"></div></li>
  <li>
  <div id="runLevel"></div>
  </li>
  <li>
  <div class="runButton" onClick="runGame()">
  <div class="playButton"></div>
 <!-- <input type="button"  value="run">-->
  </div>
  </li>
</ul>


<div class="explorer" id="files">

<div id="fileExplorer" class="fileExplorer">
						</div>
</div>
<div class="body" id="contents">
<input type="hidden" id="projectRootVal">
<input type="hidden" id="folderRoot">
<input type="hidden" value="<%= rootVal%>">
<!-- 
<input type="button" onClick="expand()" value="expand">
<input type="button" onClick="retract()" value="retract">
 -->
<input type="hidden" id="current" size="50">
<!--

<input type="button" onClick="showExplorer()" value="view explorer">
  -->
<input type="hidden" id="newfilename">
<!-- 
<input type="button" value="create file" onClick="createFile()">
  -->

<!--
<input type="button" onClick="closeProject()" value="close">
-->

<div class="childWindow">
<div class="projectExplorerTitle" align="right"><input type="button" value="X" onClick="closeChildWindow()"></div>
<div id="openProject" class="projectExplorer">

</div>
</div>

<div class="childWindow2">
<div class="projectExplorerTitle" align="right"><input type="button" value="X" onClick="closeChildWindow2()"></div>
<div id="newFileMenu" class="projectExplorer">
<input type="text" id="newFile" value="">
<input type="button" onClick="createFile()"  value="Create File">
</div>
</div>

<div class="childWindow3">
<div class="projectExplorerTitle" align="right"><input type="button" value="X" onClick="closeChildWindow3()"></div>
<div id="newProjectMenu" class="projectExplorer">
<input type="text" id="newProject" value="">
<input type="button" onClick="createProject()"  value="Create Project">
</div>
</div>

<div class="childWindow4">
<div class="projectExplorerTitle" align="right"><input type="button" value="X" onClick="closeChildWindow4()"></div>
<div id="newFolderMenu" class="projectExplorer">
<input type="text" id="newFolder" value="">
<input type="button" onClick="createFolder()" value="Create Folder">
</div>
</div>

<div class="childWindow6">
<div class="projectExplorerTitle" align="right" style="margin-top:100px;"><input type="button" value="X" onClick="closeChildWindow6()"></div>
<div id="uploadImageMenu" class="projectExplorer">
<iframe src="fileTest.jsp" style="border:1px solid; height:100%; width:100%;"></iframe>
</div>
</div>


<div class="childWindow5">
<div class="projectExplorerTitleImg" align="right"><input type="button" value="X" onClick="closeChildWindow5()"></div>
<div id="imageMenu" class="imageExplorer">
<div id="imageView"></div>
</div>
</div>
			


			
<table style="width:100%; height:100%;'" cellpadding="0" cellspacing="0">
<tr>
<td height="20px">
<div id="buttons">
</div>
</td>
</tr>
<tr>
<tr>
<td style="width:100%; height:100%;'">

<textarea id="textEditor" style="width:98%; height:100%; visibility:hidden" onKeyUp="updateBuffer(this.id)" class="editor"></textarea>

</td>
</tr>
</table>				
<div id="textareas" style="position:fixed;">
</div>
<div id="tempareas" style="position:fixed;">
</div>
</div>
</body>
</html>