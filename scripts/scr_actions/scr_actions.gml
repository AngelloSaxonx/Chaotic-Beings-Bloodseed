function scr_actions() constructor
{
	act = function() {};
}

function scr_text(_text) : scr_actions() constructor
{
	text = _text;
	
	act = function(_textbox)
	{
		_textbox.set_text(text);
	}
}