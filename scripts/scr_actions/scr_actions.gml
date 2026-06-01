function scr_dialogue_actions() constructor
{
	act = function(){}
}

function scr_text(_text) constructor
{
	text = _text;
	act = function(_textbox)
	{
		_textbox.set_text(text)
	}
}