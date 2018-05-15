/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

// ------------------------------------------------//
// -----checking the text for syntax error...------//
// ------------------------------------------------//
function applyCheck(text1){
    
}

/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor*/

var sc_errorarray = [];
var sc_Errorline = [];
function checkSyntax(wordtextcheck){
    var text = wordtextcheck;    
    //sc_errorarray = [];
   // sc_Errorline = [];
    blockCheck(text);    
    document.getElementById('err-console').innerHTML = 'Error Console:';
    for(i=0;i<sc_errorarray.length;i++){  
        var reg = new RegExp('\\b'+sc_Errorline[i]+'\\b','g'); 
       // alert("regex= "+reg+"linenum= "+linenum);       
        linenum = linenum.replace(reg,'<mark class="error-line" id = "0'+sc_Errorline[i]+'" onmouseover="errpop('+sc_Errorline[i]+',event);" onmouseout="errpopout();">&#8855;</mark>');
        alert("linenum= "+linenum);  
    }
}
function blockCheck(btext){/**  Catching Block For checking...  **/
    var checktext = btext.split('\n');
    for(i = 0 ;i < checktext.length ; i++){
        var checktxt = checktext[i].trim();
        if(/.*;/g.test(checktext[i]) === true || /.*:/g.test(checktext[i]) === true || checktxt.length === 0){
            if(checktxt.length < 2 && checktxt.length > 0){
                sc_errorarray[sc_errorarray.length] = 'Statement is blank Please write some code or delete the Colon or Semi-Colon. <br/><b>Example:     "start:" or "i=20;"</b>';
                sc_Errorline[sc_Errorline.length] = i+1;
            }
            var coloncount = 0;
            for(j=0;j<checktxt.length;j++){
                if(checktxt.charAt(j) === ';' || checktxt.charAt(j) === ':'){
                    coloncount++;
                }
            }
            if(coloncount > 1){
                sc_errorarray[sc_errorarray.length] = 'A Line can not have more than one:<br/>     <b>":" OR ";"</b>';
                sc_Errorline[sc_Errorline.length] = i+1;
            }           
        } else {
            sc_errorarray[sc_errorarray.length] = 'Semi Colon or Colon Missing at the end of line... <br/><b>Example:     "start:" or "i=20;"</b>';
            sc_Errorline[sc_Errorline.length] = i+1;
        }
    }
}
function ajaxerror(lin,ertxt){
    sc_errorarray[sc_errorarray.length] = ertxt;
    var txtcheck = document.getElementById('textEditor').value;        
    sc_Errorline[sc_Errorline.length] = lin;
}