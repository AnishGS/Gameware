
// global variable...
var sc_headblock = ['start','collision','global','keydown','inradius','impassable','always'];
var sc_globalobject = ['man[]','enemy[]','g1','ground','wall','ball','wallH1','wallH','wallV','wallVR','platform','ptop'];
var sc_platformer = ['man[]','platform'];
var sc_topdown = ['enemy[]','ptop'];
var sc_static = ['wall[]','ground[]','ball','wallH1','wallH','wallV','wallVR','block[]'];
var sc_gun = ['g1'];
var sc_audio = ['bg'];
var sc_datatypes = ['platformer','topdown','static','gun','audio'];
var sc_platformerfunction=['moveX','moveY','follow','stick','destory'];
var sc_topdownfunction=['moveX','moveY','follow','stick','destory','jump'];
var sc_gunfunction = ['shoot'];
var sc_audiofunction = ['playOnce','playForever'];
var sc_staticfunction = ['stick','destory'];
var sc_systemfunction = ['loadObject','loadAudio','random','switchState','setBgColor'];
var sc_globalfunc = ['moveX','moveY','follow','destory','jump','shoot','playOnce','playForever','stick','loadObject','loadAudio','random','switchState','setBgColor'];
var sc_loadedobject = [];
var sc_errorarray = [];
var sc_localvariable = [];
var arr = '';
// syntax checking start here

function checkSyntax(){
    var text = $textarea.val();    
    sc_loadedobject = [];
    sc_localvariable = [];
    sc_errorarray = [];    
    var sc_checktext = text.split('\n');
    for(i=0;i<sc_checktext.length;i++){
        sc_checktext[i] = sc_checktext[i].trim();
    }
    blockCheck(sc_checktext);
    document.getElementById('error-panel').innerHTML = 'Error Console:';
    for(i=0;i<sc_errorarray.length;i++){
        document.getElementById('error-panel').innerHTML += '<br>'+sc_errorarray[i];
    }
}



function blockCheck(sc_checktext){/**  Catching Block For checking...  **/
    
    
    var sc_sysFuncName = '';    
    var sc_funcParam = [];
    var sc_comparevalue = -1;
    var sc_comparevalue1 = true;
    var sc_comparevalue2 = true;
    arr ='';
    
    for(i=0;i<sc_checktext.length;i++){
        sc_comparevalue = -1;        
        sc_funcParam = [];      
        if(/\b.*[;]{1}/g.test(sc_checktext[i]) === true || /\b.*[:]{1}/g.test(sc_checktext[i]) === true){
            if(/\b.*[(].*[)]/g.test(sc_checktext[i]) === true){// string with function....
                sc_sysFuncName = sc_checktext[i].replace(/\b(.*)[(].*/g,'$1');                
                //console.log('hello');
                if(sc_systemfunction.indexOf(sc_sysFuncName) > -1){// string with system function...
                    if(/\bloadAudio\b/g.test(sc_checktext[i]) === true){   // string with loadAudio...                 
                        text = sc_checktext[i].replace(/loadAudio[(](.*)[)];/g,'$1');
                        text = text.trim();
                        sc_funcParam = text.split(',');                        
                        if(sc_funcParam.length > 1){
                            sc_errorarray[sc_errorarray.length] = 'Line'+(i+1)+': Error <strong class="code-elem">"'+sc_checktext[i]+'"</strong> Hey!!! One Parameter of object type audio required...';
                            continue;
                        }
                    }
                    if(/\bloadObject\b/g.test(sc_checktext[i]) === true){ // string with loadObject...
                        text = sc_checktext[i].replace(/loadObject[(](.*)[)];/g,'$1');
                        text = text.trim();
                        sc_funcParam = text.split(',');
                        //console.log(sc_funcParam);
                        for(j=0;j<sc_funcParam.length;j++){
                            sc_funcParam[j] = sc_funcParam[j].trim(); 
                        }                        
                        if(sc_funcParam.length > 3 || sc_funcParam.length <3){
                            sc_errorarray[sc_errorarray.length] = 'Line'+(i+1)+': Error <strong class="code-elem">"'+sc_checktext[i]+'"</strong> Hey!!! Three Parameter required like loadObject(Object,Number1,Number2);...';
                            continue;
                        }
                        //console.log(sc_funcParam[1]);
                        /*text1 = paramcheck(sc_funcParam[1]);
                        text2 = paramcheck(sc_funcParam[2]);
                        if( text2.localeCompare('') !== 0 && text1.localeCompare('') !== 0){
                            sc_errorarray[sc_errorarray.length] = 'Line'+(i+1)+': Error <strong class="code-elem">"'+sc_checktext[i]+'"</strong> Hey!!!'+text1+'...';
                        }*/
                        //console.log(sc_funcParam[1]);
                    }
                }else{
                    //system function not found block...
                    if(/(.*)[.]{1}(.*)[(](.*)[)];/g.test(sc_checktext[i]) === true){
                        text = sc_checktext[i].substring(0,sc_checktext[i].lastIndexOf("("));                    
                        var word = text.split('.');
                        if(word.length > 2){
                            sc_errorarray[sc_errorarray.length] = 'Line '+(i+1)+': Error <strong class="code-elem">"'+sc_checktext[i]+'"</strong> Hey!!! you wrote here Invalid object Function....';
                        }
                        text = sc_checktext[i].substring(sc_checktext[i].indexOf(".")+1,sc_checktext[i].indexOf("("));
                        if(text.localeCompare('destory') === 0 || text.localeCompare('playOnce') === 0 || text.localeCompare('playForever') === 0){
                            text1 = sc_checktext[i].substring(sc_checktext[i].indexOf("(")+1,sc_checktext[i].length-2);
                            word = text1.split(',');
                            if(word.length > 0 && word[0].localeCompare('') !== 0){
                                sc_errorarray[sc_errorarray.length] = 'Line '+(i+1)+': Error <strong class="code-elem">"'+sc_checktext[i]+'"</strong> Hey!!! there should be No parameter....';
                            }
                        }else if(text.localeCompare('setRadius') === 0 || text.localeCompare('follow') === 0){
                            text = sc_checktext[i].substring(sc_checktext[i].indexOf("(")+1,sc_checktext[i].length-2);
                            word = text.split(',');
                            if(word.length > 2){
                                sc_errorarray[sc_errorarray.length] = 'Line '+(i+1)+': Error <strong class="code-elem">"'+sc_checktext[i]+'"</strong> Hey!!! there should be two parameter only....';
                            }
                            /*text1 = paramcheck(word[0]);                            
                            if(text1.localeCompare('') !== 0){
                                sc_errorarray[sc_errorarray.length] = 'Line'+(i+1)+': Error <strong class="code-elem">"'+sc_checktext[i]+'"</strong> Hey!!!'+text1+'...';
                            }*/
                        }else{
                            text = sc_checktext[i].substring(sc_checktext[i].indexOf("(")+1,sc_checktext[i].length-2);
                            word = text.split(',');
                            if(word.length > 1){
                                sc_errorarray[sc_errorarray.length] = 'Line '+(i+1)+': Error <strong class="code-elem">"'+sc_checktext[i]+'"</strong> Hey!!! there should be one parameter only....';
                            }
                        }                        
                    }
                    if(/.*random[(].*[)]/g.test(sc_checktext[i]) === true){
                        text = sc_checktext[i].replace(/.*random[(](.*)[)].*/,'$1');
                        var word = text.split(',');
                        if(word.length !== 2){
                            sc_errorarray[sc_errorarray.length] = 'Line '+(i+1)+': Error <strong class="code-elem">"'+sc_checktext[i]+'"</strong> Hey!!! there should be two parameter only....';
                        }
                        /*text1 = paramcheck(word[0]);
                        text2 = paramcheck(word[1]);
                        if( text2.localeCompare('') !== 0 && text1.localeCompare('') !== 0){
                            sc_errorarray[sc_errorarray.length] = 'Line'+(i+1)+': Error <strong class="code-elem">"'+sc_checktext[i]+'"</strong> Hey!!!'+text1+'...';
                        }*/
                    }
                    if(/while[(].*[)]/g.test(sc_checktext[i]) === true){
                        text =sc_checktext[i].replace(/while[(](.*)[)]/g,'$1');
                        if(/.* (>=|!<|<=|!>|!=|>|<) .*/g.test(text) === false){
                            sc_errorarray[sc_errorarray.length] = 'Line '+(i+1)+': Error <strong class="code-elem">"'+sc_checktext[i]+'"</strong> Hey!!! Logical Condition checking error....';
                        }
                    }
                }                
            }else{
                //string not containing function....
                if(/.*with.*/g.test(sc_checktext[i]) === true){
                    text2 = sc_checktext[i].replace(/(.*)with.*/g,'$1');
                    text1 = sc_checktext[i].replace(/.*with[\s]+(.*):/g,'$1');
                    //console.log(text2+' '+text1);
                    if(text2.localeCompare('') !== 0){
                        //console.log(text2);
                        if(text1.localeCompare('') === 0){
                            //console.log(text1);
                            sc_errorarray[sc_errorarray.length] = 'Line '+(i+1)+': Error <strong class="code-elem">"'+sc_checktext[i]+'"</strong> Hey!!! It should be like object with object here....';
                            continue;
                        }                        
                    }else{
                        console.log(text2);
                        sc_errorarray[sc_errorarray.length] = 'Line '+(i+1)+': Error <strong class="code-elem">"'+sc_checktext[i]+'"</strong> Hey!!! It should be like object with object here....';
                        continue;
                    }
                }
                if(/.*=.*;/g.test(sc_checktext[i]) === true){
                    text1 = sc_checktext[i].replace(/.*=(.*);/g,'$1');
                    text1 = text1.trim();
                    console.log(text1);
                    if(text1.localeCompare('') === 0){
                        sc_errorarray[sc_errorarray.length] = 'Line '+(i+1)+': Error <strong class="code-elem">"'+sc_checktext[i]+'"</strong> Hey!!! Enter some value for variables....';
                    }
                }
                
                //if(/.*:/g.test(sc_checktext[i]) === true){
                    
                  //  if(/.*with.*/g.test(sc_checktext[i]) === false){
                    //    text = sc_checktext[i].replace(/(.*):/g,'$1');
                  /*      var checkblock = false;
                        for(k=0;k< sc_headblock.length;k++){
                            if(text.localeCompare(sc_headblock[i]) === 0){
                                checkblock=true;
                            }
                        }
                        if(checkblock === false){
                            sc_errorarray[sc_errorarray.length] = 'Line '+(i+1)+': Error <strong class="code-elem">"'+sc_checktext[i]+'"</strong> Hey!!! Dont declare your own Blocks....';
                        }
                    }*/
                //}
                if(/integer.*[;]/g.test(sc_checktext[i]) === true){
                    console.log(sc_checktext);
                    if(sc_checktext[i].indexOf('=') > -1){
                        text = sc_checktext[i].substring(8,sc_checktext[i].indexOf('='));
                        //console.log(sc_checktext[i].indexOf('r'));
                    }else{
                        text = sc_checktext[i].substring(8,sc_checktext[i].indexOf(';'));
                        console.log(text);
                    }                    
                    text = text.trim();
                    if(text.localeCompare('') !== 0){
                        sc_localvariable[sc_localvariable.length] = text;
                        console.log(sc_localvariable);
                    }else{
                        sc_errorarray[sc_errorarray.length] = 'Line '+(i+1)+': Error <strong class="code-elem">"'+sc_checktext[i]+'"</strong> Hey!!! Invalid variable declaration....';
                    }
                }
            }
            //console.log(sc_checktext[i]);
        }else{
            // semicolon missing block.
            if(sc_checktext[i].length > 0){
                sc_errorarray[sc_errorarray.length]='Line'+(i+1)+': Error <strong class="code-elem">"'+sc_checktext[i]+'"</strong> semi Colon Missing...';
            }
        }
    }//loop close block.
}//function close block.

// match Object function...
function matchobject(check2,objectcheck){
    for(j=0;j<objectcheck.length;j++){                
        var matches = check2.indexOf(objectcheck[j]);
        if (matches > -1){
            //alert(matches);
            return matches;
        }        
    }
    return -1;
}
// object array declare here...
function arrobj(sc_arrobj){
    var check1 = sc_arrobj.replace(/(.*\[)(.*)(\])/g,'$2');
    for(i = 0;i < sc_localvariable.length ; i++){
        if(check1.localeCompare(sc_localvariable[i]) === 0){
            sc_arrobj = sc_arrobj.replace(/(.*\[)(.*)(\])/g,'$1$3');
            console.log(sc_arrobj);
            return sc_arrobj;
        }
    }
    return 'Hey!!! you have not yet declare '+check1+' variable';
}
/*/function paramcheck(text5){
    text6 = [];
    var j =0;
    //console.log(text5);
    for(i=0; i < text5.length;i++){
        //console.log(text5);
        if(text5.charAt(i) === '+' || text5.charAt(i) === '-' || text5.charAt(i) === '*' || text5.charAt(i) === '/'){
            text6[text6.length] = text5.substring(j,i);
            j=i+1;          
            console.log(j);
        }        
    }
    text6[text6.length] = text5.substring(j);
    console.log(text6.length);
    
    //return 0;
    for(var k=0;k<text6.length;k++){      
        if(isNaN(text6[k]) === true){
            if(sc_localvariable.indexOf(text6[k]) === -1){
                return 'variable not declare';
            }
        }
    }   
   return ''; 
}*/