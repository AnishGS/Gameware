function applyHighlights(text) {
    
    text = text.replace(/\n$/g, '\n\n').replace(/(-)/g,'<mark class="code-operators">$1</mark>');
    text = text.replace(/\b(topdown)\b/g,'<mark class="code-elem">$1</mark>');
    text = text.replace(/\b(static)\b/g,'<mark class="code-elem">$1</mark>');
    text = text.replace(/\b(platformer)\b/g,'<mark class="code-elem">$1</mark>');
    text = text.replace(/\b(integer)\b/g,'<mark class="code-elem">$1</mark>');
    text = text.replace(/\b(audio)\b/g,'<mark class="code-elem">$1</mark>');
    text = text.replace(/\b(gun)\b/g,'<mark class="code-elem">$1</mark>');
    text = text.replace(/\b(extend)\b/g,'<mark class="code-keywords">$1</mark>');
    text = text.replace(/\b(end)\b/g,'<mark class="code-keywords">$1</mark>');
    text = text.replace(/([:]+)/g,'<mark class="code-keywords">$1</mark>');
    text = text.replace(/\b(start)\b/g,'<mark class="code-keywords">$1</mark>');
    text = text.replace(/\b(keydown)\b/g,'<mark class="code-keywords">$1</mark>');
    text = text.replace(/\b(KEY_UP)\b/g,'<mark class="code-keywords">$1</mark>').replace(/\b(KEY_[A-Z,0-9]{1})\b/g,'<mark class="code-keywords">$1</mark>');
    text = text.replace(/\b(KEY_DOWN)\b/g,'<mark class="code-keywords">$1</mark>');
    text = text.replace(/\b(KEY_RIGHT)\b/g,'<mark class="code-keywords">$1</mark>');
    text = text.replace(/\b(KEY_LEFT)\b/g,'<mark class="code-keywords">$1</mark>');
    text = text.replace(/\b(KEY_SPACEBAR)\b/g,'<mark class="code-keywords">$1</mark>');
    text = text.replace(/\b(collision)\b/g,'<mark class="code-keywords">$1</mark>');
    text = text.replace(/\b(global)\b/g,'<mark class="code-keywords">$1</mark>');
    text = text.replace(/\b(inradius)\b/g,'<mark class="code-keywords">$1</mark>');
    text = text.replace(/\b(with)\b/g,'<mark class="code-keywords">$1</mark>');
    text = text.replace(/\b(if)\b/g,'<mark class="code-keywords">$1</mark>');
    text = text.replace(/\b(while)\b/g,'<mark class="code-keywords">$1</mark>');
    text = text.replace(/\b(else)\b/g,'<mark class="code-keywords">$1</mark>');
    text = text.replace(/\b(impassable)\b/g,'<mark class="code-keywords">$1</mark>');            
    text = text.replace(/\b(loadObject)\b/g,'<mark class="code-func">$1</mark>').replace(/\b(loadAudio)\b/g,'<mark class="code-func">$1</mark>');
    text = text.replace(/\b(stick)\b/g,'<mark class="code-func">$1</mark>');
    text = text.replace(/\b(random)\b/g,'<mark class="code-func">$1</mark>');
    text = text.replace(/\b(stop)\b/g,'<mark class="code-func">$1</mark>');
    text = text.replace(/\b(playOnce)\b/g,'<mark class="code-func">$1</mark>').replace(/\b(playForever)\b/g,'<mark class="code-func">$1</mark>');
    text = text.replace(/\b(jump)\b/g,'<mark class="code-func">$1</mark>').replace(/\b(setBgColor)\b/g,'<mark class="code-func">$1</mark>');
    text = text.replace(/\b(moveX)\b/g,'<mark class="code-func">$1</mark>').replace(/\b(follow)\b/g,'<mark class="code-func">$1</mark>');
    text = text.replace(/\b(moveY)\b/g,'<mark class="code-func">$1</mark>').replace(/([+,-,*,;,:]){1}/g,'<mark class="code-operators">$1</mark>');
    text = text.replace(/\b(shootX)\b/g,'<mark class="code-func">$1</mark>');
    text = text.replace(/\b(shootY)\b/g,'<mark class="code-func">$1</mark>');
    text = text.replace(/\b(reload)\b/g,'<mark class="code-func">$1</mark>');
    text = text.replace(/\b(destroy)\b/g,'<mark class="code-func">$1</mark>');
    text = text.replace(/\b(always)\b/g,'<mark class="code-keywords">$1</mark>');
    text = text.replace(/(\/\*.*\*\/)/g,'<mark class="wrapper">$1</mark>').replace(/(\()/g,'<mark class="parenthese">$1</mark>').replace(/(\))/g,'<mark class="parenthese">$1</mark>');
    //text = text.replace(/[+-/*;:]{1}/g,'<mark class="code-operators">$1</mark>');
    return text;
}
function insertTab(o, e)
{		
	var kC = e.keyCode ? e.keyCode : e.charCode ? e.charCode : e.which;
	if (kC === 9 && !e.shiftKey && !e.ctrlKey && !e.altKey)
	{
		var oS = o.scrollTop;
		if (o.setSelectionRange)
		{
			var sS = o.selectionStart;	
			var sE = o.selectionEnd;
			o.value = o.value.substring(0, sS) + "\t" + o.value.substr(sE);
			o.setSelectionRange(sS + 1, sS + 1);
			o.focus();
		}
		else if (o.createTextRange)
		{
			document.selection.createRange().text = "\t";
			e.returnValue = false;
		}
		o.scrollTop = oS;
		if (e.preventDefault)
		{
			e.preventDefault();
		}
		return false;
	}
	return true;
}