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
<link rel="stylesheet" href="outsourced/w3css.css">
<script src="outsourced/textHighlighter.js"></script>
<script src="outsourced/SyntaxChecker.js"></script>
<!--<link rel="stylesheet" type="text/css" href="outsourced/texteditorstyle.css">-->
<link rel="stylesheet" href='outsourced/font/SourceCodePro-Regular.otf'>
<link rel="shortcut icon" href="logo16.png">
<script src="outsourced/jquery.min.js"></script>
<style>
.explorer
	{
		height: 95%;
		padding-left: 20px;
   		width: 20%;
   		position: fixed;
    	z-index: 0;
    	top: 0;
    	left: 0;
    	background-color:white ;
   		overflow-x: hidden;
    	transition: 0.5s;
    	padding-top: 60px;
    	margin-top:40px;
		margin-left: 10px;
    	color:black;
		box-shadow:1px 0px 2px #ccc;
	border-radius: 1%;
    	 font-family:"Segoe UI";
    	 font-size:14px;
    	// border-right: 1px solid;
    	  cursor:default;
 // border-color:#FF7733;
   / border-width:thin;
	}
	.file
	{
		width:400px;
		font-family: "Segoe UI";
		font-weight: 430;
	}
	.file:hover
	{
		color:#4885ed;
	}
	.fileExplorer
	{
    	margin-top:-50px;
    	left:40;
    	
	}
	.errorLog
	{
		padding-left: 10px;
		z-index: 4;
		color: #5b5b5b;
		background-color: #fff;
		width: 550px;
		height: 100px;
		margin-top: 100px;
		left: 290px;
		margin-left:-5px;
		overflow-y:auto;
		font-size: 12px;
		border: 1px solid;
		border-color: #FF7733;
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
   		margin-top:5px;
   		
	}
	ul {
	z-index:0;
    list-style-type: none;
    margin: 0;
   
    padding: 0;
    overflow: hidden;
	background-color:#4285F4;
	//background-color:#2196F3;
   // background-color: #0093D1;
   //   background-color: #3F51B5;
    left:0;
    height:33px;
    font-size:12px;
 font-family:"Segoe UI";
}
.navdiv
{
	box-shadow:1px 1px 1px #ccc;
	background-color:#47536B;
	//height:400px;
	
	z-index: 7;
}

li {
	float: left;
	width: 120px;
}

li a, .dropbtn {
    display: inline-block;
    color: white;
   font-weight:450;
    text-align: center;
    padding: 7px 7px;
    text-decoration: none;
    z-index:4;
 font-family:"Segoe UI";
    cursor:default;
}

li a:hover, .dropdown:hover .dropbtn {
   color: black;
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
	
	background-color: #F2F4F5 ;
	
	
}
.filenames {
    background-color: #8E44AD; /* Green */
    border-style:solid;
   border-bottom-style:none;
    border-width:thin;
    color: white;
    //border-color:white;
    padding: 8px 7px;
    text-align: center;
    text-decoration: none;
    display: inline-block;
    font-size: 12px;
	border-left-style: none;
	border-radius: 1%;
}
.systembuttons {
    background-color: #4885ed; /* Green */
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
.closebuttons {
    background-color: #FF4931; /* Green */
    border-style:solid;
   //border-bottom-style:none;
    //border-width:thin;
    color: white;
    border-color:#4885ed;
    //padding: 8px 7px;
    text-align: center;
    //text-decoration: none;
   // display: inline-block;
	font-size: 12px;
	border-radius:50%;
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
  background-color: rgba(0,0,0,0.4); /* Black w/ opacity */
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
  background-color: rgba(0,0,0,0.4); /* Black w/ opacity */
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
  background-color: rgba(0,0,0,0.4); /* Black w/ opacity */
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
  background-color: rgba(0,0,0,0.4); /* Black w/ opacity */
  //opacity:0.5;
	transition:1s;
}
.w3-container::before, .w3-container::after {
            box-sizing: border-box;
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
  background-color: rgba(0,0,0,0.4); /* Black w/ opacity */
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
  background-color: rgba(0,0,0,0.4); /* Black w/ opacity */
  //opacity:0.5;
	transition:1s;
}
.projectExplorer {
    background-color: white;
    margin: auto;
    padding: 20px;
   // border: 1px solid #0078d7;
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
   // border: 1px solid #0078d7;
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
    background-color:#36A3D9;
    margin: auto;
   // padding: 20px;
//	border: 1px solid;
	// #0078d7;
    width: 500px;
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
    background-color: #36A3D9;
    margin: auto;
   // padding: 20px;
   / border: 1px solid #0078d7;
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
	color:#35414C;
	cursor:default;
	
}
.projectName:hover
{
color:#FF4931;
}

.runSelect {
	border: 1px solid black;
	background-color:#FF4931;
    width: 120px;
  //  border-radius: 3px;
    overflow: hidden;
   font-family:"Segoe UI";
}

.runSelect select {
    padding: 5px 8px;
    width: 130%;
  //  border: none;
    box-shadow: none;
   // background: transparent;
    background-image: none;
    -webkit-appearance: none;
}

.runSelect select:focus {
    outline: none;
}

.selectDiv
 {
  background: url(arrow.png) no-repeat 96% 0;
  height: 29px;
  overflow: hidden;
  width: 150px;
 //background-color:#FF4931;
background-color: white;
 // border-radius: 20px;
 color:white;
  
}
.selectDiv select
 {
  background: transparent;
 // border:1px solid #FF4931;
  font-size: 12px;
  height: 29px;
  padding: 2px;
  /* If you add too much padding here, the options won't show in IE */
  width: 268px;
}
.runButton
{
background-color: #4285F4; /* Green */
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
.playButton:hover
{
	border-left: 20px solid chartreuse;
}
.hints
{
	position: absolute;
	margin-left:400px;
	margin-top:400px;
	font-family: 'Segoe UI';
	color:#5b5b5b; 
}
.Container1{                        
            width: 900px;
            height:607px;
         //   border: 1px #c0c0c0 solid; 
            display: block;        
            background-color: transparent;            
        }
        .hLight{            
            float: left;
            position: absolute;
            top: -600;
            z-index: -1;
            left: 54px;
            width: 1000px;
            height: 579px;
            color: #5b5b5b;
            //border: 1px #c0c0c0 solid;
          //  border-left: #c0c0c0 thick solid;
            background-color: white; 
            white-space: pre;
            overflow: hidden;
			margin-left: 285px;
        }
        .texteditor:focus{
            outline-color: transparent;
        }        
        .texteditor{
            float: left;
            resize: none;
			z-index: 5;         
			box-shadow:1px 1px 1px #ccc;
       
            width: 1000px;
			margin-left: 0px;
            height: 579px;
           // border: 1px #c0c0c0 solid; 
            color: transparent;
            background-color: transparent;
          //  border-left: #c0c0c0 thick solid;
            overflow: auto;            
            caret-color: #5b5b5b;
        }
        #col-num{
            float: left;            
            width: 35px;
            height: 579px;
           // border: 1px #36A3D9 solid;
           // background-color: #e2e2e2;
		   background-color:#EAEDED;
		   color:gray;
			overflow: hidden;     
			box-shadow:1px 1px 1px #ccc;
              
        }
        #col-num,.texteditor,.hLight{
            padding: 10px;
            font: 14px/20px 'Source Code Pro',sans-serif;
            font-weight: 400;
            letter-spacing: 1px;            
        }
        #err-console{
          float: left; 
          position: absolute; 
          margin-left: 280px; 
          top: 20px;
          width: 400px; 
          height: 100px; 
          border: 1px silver solid; 
          visibility: hidden; 
          color: black; 
		  background-color: whitesmoke;   
		          
        }        
        mark{
            background-color: transparent;
        }
        .error-line{background-color: transparent; width: 20px; color: red;}
        .code-elem{color: #36A3D9; }
        .code-keywords{color: blueviolet ;}
        ::selection{background-color: #e2e2e2;}
        .code-func{color:#FF7733 ; }
        .wrapper{color: silver;}
        .wrapper *{color:silver ;}
        .parenthese{color: #F59F16; }
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
		handleInput();
		document.getElementById('error-panel').innerHTML="";
		checkSyntax(); 
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
			//document.getElementById('textEditorDiv').style.visibility="visible";
			highlightExplorer(e);
			//handleInput();
			document.getElementById('error-panel').innerHTML="";
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
		 document.getElementById('buttons').innerHTML+="<input type='button'  value='"+changeExtension(id)+"' id='"+e.id+"' class='filenames' onClick='setEditor(this.id)'>";

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
	var filename=document.getElementById('newFile').value+".txt";
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
	saveAjax();
	
	if(e.keyCode==83 && e.ctrlKey)
	{
		
		e.preventDefault();
		var info=document.getElementById("current").value;
		var buffer=document.getElementsByName(info);
		var data=buffer[0].value;
		while(data.indexOf("+")>=0)
			data=data.replace("+","%2B");
		//alert(data);
		str="fileWriter.jsp?filename="+info+"&filecontent="+encodeURI(data);
		
		var xmlhttp=new XMLHttpRequest();
	    xmlhttp.onreadystatechange = function()
		 {
	        if (xmlhttp.readyState == 4 || xmlhttp.readyState == "complete")
			 {
				//alert('saved');
				checkAjax();
	        }
	    };
	    xmlhttp.open("GET", str , true);
	    xmlhttp.send();
		
	}
},false);
function saveAjax()
{
	var info=document.getElementById("current").value;
	//alert('saved');
		var buffer=document.getElementsByName(info);
		var data=buffer[0].value;
		while(data.indexOf("+")>=0)
			data=data.replace("+","%2B");
		//alert(data);
		str="fileWriter.jsp?filename="+info+"&filecontent="+encodeURI(data);
		//alert(str);
		var xmlhttp=new XMLHttpRequest();
	    xmlhttp.onreadystatechange = function()
		 {
	        if (xmlhttp.readyState == 4 || xmlhttp.readyState == "complete")
			 {
				//alert('saved');
				
	        }
	    };
	    xmlhttp.open("GET", str , true);
	    xmlhttp.send();
}
function setEditor(e)
{
	var text=document.getElementsByName(e);
	var write=text[0].value;
	manageTabs(e);
	document.getElementById("textEditor").value=write;
	document.getElementById("current").value=e;
	handleInput();
	document.getElementById('error-panel').innerHTML="";
	checkSyntax();   
}
function manageTabs(e)
{
	var buttons=document.getElementsByClassName('filenames');
	for(var i=0;i<buttons.length;i++)
	{
		if(buttons[i].id!=e)
			buttons[i].style.backgroundColor=" #7dc8ed ";
		else
			buttons[i].style.backgroundColor=" #2196f3 ";
		
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
	checkAjax();
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
function checkAjax()
{
	//experimental above
	var runLevel=document.getElementById('runSelection');
	var levelName=runLevel.options[runLevel.selectedIndex].value;
	var projectRoot=document.getElementById("projectRootVal").value;
	var str="GameChecker.jsp?run="+levelName+"&projectroot="+projectRoot.substring(8,projectRoot.length)+"/";
	var xmlhttp=new XMLHttpRequest();
	var lineArray=[];
	var messageArray=[];
	 xmlhttp.onreadystatechange = function()
	 {
        if (xmlhttp.readyState == 4 || xmlhttp.readyState == "complete")
		 {
           if(this.responseText!=".")
		   {
		  	// document.getElementById('errorLog').innerHTML=this.responseText;
			var errorArray=this.responseText.toString().split("#");
			//alert(errorArray.trim());
			for(i=0;i<errorArray.length;i++)
			{
				var disArray=errorArray[i].split("&");
				lineArray[i]=disArray[0].trim()+";";
				messageArray[i]=disArray[1]+"".trim();
			//alert(lineArray[i]+" - "+messageArray[i]);
				
			}
		//	alert(lineArray+" - "+messageArray);	
		   }
          //alert(lineArray+" - "+messageArray);
		   ajaxerror(lineArray,messageArray);
        }
    };
    xmlhttp.open("GET", str , true);
    xmlhttp.send();
}
function checkGame()
{
	var runLevel=document.getElementById('runSelection');
	var levelName=runLevel.options[runLevel.selectedIndex].value;
	var projectRoot=document.getElementById("projectRootVal").value;
	var str="http://localhost:8080/Gameware/GameChecker.jsp?run="+levelName+"&projectroot="+projectRoot.substring(8,projectRoot.length)+"/";
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
	//alert('here');
	str="openProject.jsp";
	var xmlhttp=new XMLHttpRequest();
    xmlhttp.onreadystatechange = function()
	 {
        if (xmlhttp.readyState == 4 || xmlhttp.readyState == "complete")
		 {
            document.getElementById('openProject').innerHTML=this.responseText;
         //  alert('here');
		    closeProject();
			
            openChildWindow();
            expand();
        }
    };
    xmlhttp.open("GET", str , true);
    xmlhttp.send();
}
function changeExtension(e)
{
	var temp=e.substring(0,e.indexOf("."));
	return temp+".ps";
}
function closeProject()
{
	//retract();
	document.getElementById('fileExplorer').innerHTML="";
	document.getElementById('current').value="";
	document.getElementById('projectRootVal').value="";
	document.getElementById('textEditor').value="";
	document.getElementById('textEditor').style.visibility="hidden";
	//alert('areas');
	//document.getElementById('textEditorDiv').style.visibility="hidden";
	document.getElementById('col-num').innerHTML="";
	document.getElementById('textareas').innerHTML="";
	document.getElementById('tempareas').innerHTML="";
	document.getElementById('buttons').innerHTML="";
	document.getElementById('runLevel').innerHTML="";
	document.getElementById('error-panel').innerHTML="";
	disablePostProject();
	
}
function disablePostProject()
{
	var para=document.getElementsByClassName('postProject');
	for(var i=0;i<para.length;i++)
	{
		//para[i].style.color="green";
		para[i].style.visibility="hidden";
	}
}
function enablePostProject()
{
	var para=document.getElementsByClassName('postProject');
	for(var i=0;i<para.length;i++)
	{
	//	para[i].style.color="black";
	    para[i].style.visibility="visible";
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
function init()
{
	disablePostProject();
	try
	{
//setInterval(checkErrors,1000);
	}
	catch(e)
	{

	}
}
function checkErrors()
{
	try
	{
		saveAjax();
		checkAjax();
		//alert('checking');

	}
	catch(e)
	{

	}
}
function checkReturn3(event)
{
	if(event.keyCode==13)
	{
		createProject();
	}
}
function checkReturn2(event)
{
	if(event.keyCode==13)
	{
		createFile();
	}
}
//window.open("https://www.w3schools.com","newWIndow","height=200,width=200"); 
</script>

</head>

<body onload="init()">
<div class="navdiv">
<ul>
	<li></li>
  <li ><a onClick="openProject()" >Open Project</p></a>
  </li>
  <li><a onClick="openChildWindow3()">New Project</a></li>
  <li><a class="postProject" onClick="openChildWindow2()">New Gamefile</a></li>
  <li><a class="postProject" onClick="openChildWindow6()">New Asset</a></li>
  <li><a class="postProject" onClick="closeProject()">Close Project</a></li>
  <li ><div style="width:200px;"></div></li>
  <li>
  <div id="runLevel"></div>
  </li>
  <li style="width:30px">&nbsp;</li>
  
  <li>
  <div class="runButton" onClick="runGame()">
  <div class="playButton"></div>
  </div>
  </li>
  <!--<li>
	  <input type="button" onClick="checkGame()" value="check and run"> <input type="button" onClick="checkAjax()" value="check and run ajax">
  </li>-->
</ul>
</div>

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
<div class="projectExplorerTitle" align="right"><input type="button" value="X" onClick="closeChildWindow()" class="closebuttons"></div>
<div id="openProject" class="projectExplorer">

</div>
</div>

<div class="childWindow2">
<div class="projectExplorerTitle" align="right"><input type="button" value="X" onClick="closeChildWindow2()" class="closebuttons"></div>
<div id="newFileMenu" class="projectExplorer">
		<center><img src="fileicon.png">
			<br>
<input type="text" id="newFile" value="" placeholder="Filename" onkeydown="checkReturn2(event)">
<input type="button" onClick="createFile()"  value="Create File" class="systembuttons">
</center>
</div>
</div>

<div class="childWindow3">
<div class="projectExplorerTitle" align="right"><input type="button" value="X" onClick="closeChildWindow3()" class="closebuttons"></div>
<div id="newProjectMenu" class="projectExplorer">
	
	<center><img src="fileicon.png">
	<br>
	
<input type="text" id="newProject" value="" placeholder="Project name" onkeydown="checkReturn3(event)">

<input type="button" onClick="createProject()"  value="Create Project" class="systembuttons">
</center>
</div>
</div>

<div class="childWindow4">
<div class="projectExplorerTitle" align="right"><input type="button" value="X" onClick="closeChildWindow4()" class="closebuttons"></div>
<div id="newFolderMenu" class="projectExplorer">
<input type="text" id="newFolder" value="">
<input type="button" onClick="createFolder()" value="Create Folder" class="systembuttons">
</div>
</div>

<div class="childWindow6">
<div class="projectExplorerTitle" align="right" style="margin-top:100px;"><input type="button" value="X" onClick="closeChildWindow6()" class="closebuttons"></div>
<div id="uploadImageMenu" class="projectExplorer">
<iframe src="fileTest.jsp" style="border:none; height:100%; width:100%;"></iframe>
</div>
</div>


<div class="childWindow5">
<div class="projectExplorerTitleImg" align="right"><input type="button" value="X" onClick="closeChildWindow5()" class="closebuttons"></div>
<div id="imageMenu" class="imageExplorer" style="background-image:url('png12.png')">
<div id="imageView" ></div>
</div>
</div>
			

  
			
<table   style="width:100%; height:80%;'" cellpadding="0" cellspacing="0" style="margin-top:300px; margin-left:-20px;">
<tr>
<td height="30px">
<div id="buttons" style="margin-left:0px" >
</div>
</td>
</tr>
<tr>
<tr>
<td style="width:100%; height:90%;'">

<!--<textarea id="textEditor" style="width:98%; height:100%; visibility:hidden" onKeyUp="updateBuffer(this.id)" class="editor"></textarea>-->

<!--<div class="w3-container">
            
	<div class="background" id="backg">
		<div class="highlight" id="textEditorDiv" style="visibility:hidden">
			
		</div>
	</div>
	<textarea id="textEditor" style="visibility:hidden" onKeyUp="updateBuffer(this.id)" class="editor" autocomplete="off" autocorrect="off" autocapitalize="off" spellcheck="false"></textarea>
	
</div> -->
<div class="Container1">
	<table>
		<tr>
			<td><div id="col-num">1</div></td>
			<td>
				<textarea class="texteditor" id="textEditor" wrap="off" spellcheck="false" onkeyup="updateBuffer(this.id)"></textarea>
				<div class="hLight" id="hLight">                            
				</div>
				<div class="err-console" id="err-console"></div>
			</td>
		</tr>
	</table>            
</div>
<br>





</td>
</tr>
</table>	


<div id="errorLog" class="errorLog" style="display:none;">Semantic Error Console:</div>
<div class="error-panel" id="error-panel" style="display:none;">
	Syntactic Error Console:
</div>			
<div id="textareas" style="position:fixed;">
</div>
<div id="tempareas" style="position:fixed;">
</div>
</div>
</body>
<script>
       
	   function check()
        {
            var txt=[];
            txt[0]=document.getElementById('er').value;
            txt[1]="abcdef;"
           var error=[];
            error[0]="some error1";
            error[1]="some error2";
            ajaxerror(txt,error);
        }
        
        var linecount,linecount1;
        var linenum;
        var text , temp=[];        
        var linecol = document.getElementById('col-num');
        var textcol = document.getElementById('textEditor');
        var curpos=0;
        var curlinenum;
        // ------------------------------------------------//
        // ------For line number Indication Code...--------//
        // ------------------------------------------------//        
        document.addEventListener('keyup',function(){

            text = textcol.value;
            linecount = text.split('\n');
			
            document.getElementById('col-num').innerHTML="";
            linenum = '';
            for(i=1;i<=linecount.length;i++){
                if(i < 10){                        
                    linenum +=(i)+'<br/>';
                }else{
                    linenum +=(i)+'<br/>';
                }
            }            
           // checkSyntax(text);
           dumpError();
            document.getElementById('col-num').innerHTML=linenum;            
        });
        function errpop(object1 , event){
            
		var object2=parseInt(object1)*-1;
		//alert("object= "+object2);
            for(j = 0 ; j < sc_Errorline.length; j++){
				//alert(sc_Errorline[j]);
			//	alert(sc_Errorline[j]+","+object2);
  			if(sc_Errorline[j] == (object2)){
				
                    $('#err-console').html(sc_errorarray[j]);
                    document.getElementById("err-console").setAttribute("style","position: absolute; left: 65px; top: "+event.clientY+"px; padding:5px; width: 400px; height: 100px; border: 1px silver solid; visibility: visible; color: black; background-color: whitesmoke; overflow: auto;");
				  //  console.log('hello');
				 // alert('brok');
                    break;
               }
            }
        }
        function errpopout(){
            document.getElementById("err-console").setAttribute("style","position: absolute; width: 400px; height: 100px; border: 1px silver solid; visibility: hidden; color: black; background-color: whitesmoke;");
        }
        // ------------------------------------------------//
        // -----transfer code from textarea to div...------//
        // ------------------------------------------------//
        var myvar = setInterval(texthightlight,10);
        function texthightlight(){
            text = textcol.value;
            linecount1 = text.replace(/\n/g,'<br/>');                        
            temp = linecount1.split('<br/>');
            curpos = textcol.selectionStart+1;            
            
            // ------------------------------------------------//
            // ------geting cursor line number position..------//
            // ------------------------------------------------//
        
            curlinenum=0;
            for(j=0;j<curpos;j++){
                if(text.charAt(j) === '\n'){
                    curlinenum++;                    
                }                
            }
            if(text.charAt(curpos) !== '\n' && text.charAt(curpos-1) === '\n'){
                curlinenum--;
            }
            // ------------------------------------------------//
            // ------sending line for syntax checking...------//
            // ------------------------------------------------//            
            var temp1 = applyHighlights(linecount1);
            if(linecol.scrollWidth < 47 && linecol.scrollWidth > 38){
                $('#col-num').scrollLeft(5);
            }
            if(linecol.scrollWidth > 47){
                $('#col-num').scrollLeft(9);
            }
            $('#hLight').html(temp1);            
        };        
        // ------------------------------------------------//
        // -binding Scroll of textarea with number line...-//
        // ------------------------------------------------//
        
        /*$('#hLight').on('scroll', function () {
            $('.texteditor').scrollTop($(this).scrollTop());            
        });*/
        $('.texteditor').on('scroll', function () {
            $('#hLight').scrollTop($(this).scrollTop());
            $('#col-num').scrollTop($(this).scrollTop());
        });
        $('#hLight').click(function(){
            $('.texteditor').focus();
        });

      function ajaxerror(lin , ertxt)
	  {
		 
    //var text = wordtextcheck;    
    sc_errorarray = [];
    sc_Errorline = [];
    //alert(lin.length +'    '+ ertxt.length);
    
    var txtcheck = document.getElementById('textEditor').value;
    var instruct = txtcheck.split('\n');
    //alert("length= "+instruct.length);
	var i=0;
	while(i<instruct.length)
    //for(i= 0;i<instruct.length;i++)
	{
		//alert(instruct[i]+":"+lin[i]);
      //  if(instruct[i]!="" && instruct[i].trim().localeCompare(lin[i].trim()) === 0){
		if(instruct[i]!="" && searchInArray(instruct[i],lin)>-1){
		//	alert("line "+(i+1) +" contains error "+ertxt[searchInArray(instruct[i],lin)]);
			//alert('re');
            sc_Errorline[sc_Errorline.length] = i+1;
            sc_errorarray[sc_errorarray.length] = ertxt[searchInArray(instruct[i],lin)];
			
		  }
		i++;
    }  
    
}
function searchInArray(a,b)
{
	//alert(b.length);
	for(i=0;i<b.length;i++)
	{
		console.log(a.trim()+","+b[i].trim());
		if(a.trim()==b[i].trim())
			return i;
			console.log(i);
	}
	return -1;
}
function dumpError()
{
  //  alert("error "+sc_Errorline);
	document.getElementById('err-console').innerHTML = 'Error Console:';
    for(i=0;i<sc_errorarray.length;i++){  
        var reg = new RegExp('\\b'+sc_Errorline[i]+'\\b','g');   
        linenum = linenum.replace(reg,'<mark class="error-line" id = "0'+sc_Errorline[i]+'" onmouseover="errpop(-'+sc_Errorline[i]+',event);" onmouseout="errpopout();">&#8855;</mark>');        
    }
    console.log(linenum);
}
    </script>
</html>