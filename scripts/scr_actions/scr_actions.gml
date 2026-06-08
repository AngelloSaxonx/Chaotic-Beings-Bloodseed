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

function scr_speaker(_name, _portrait = undefined, _side = undefined) : scr_actions() constructor
{
	name = _name;
	portrait = _portrait;
	side = _side
	
	act = function(_textbox)
	{
		_textbox.speaker_name = name;
		
		if !is_undefined(portrait)
			_textbox.portrait_sprite = portrait;
		
		if !is_undefined(side)
			_textbox.portrait_side = side;
		
		_textbox.next();
	}
}