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

function scr_speaker(_name, _sprite = undefined, _portrait = undefined, _background = undefined, _side = undefined) : scr_actions() constructor
{
	name = _name;
	sprite = _sprite;
	portrait = _portrait;
	background = _background;
	side = _side;
	
	act = function(_textbox)
	{
		_textbox.speaker_name = name;
		
		if !is_undefined(sprite)
			_textbox.text_sprite = sprite;
		
		if !is_undefined(background)
			_textbox.background_sprite = background;
		
		if !is_undefined(portrait)
			_textbox.portrait_sprite = portrait;
		
		if !is_undefined(side)
			_textbox.portrait_side = side;
		
		_textbox.next();
	}
}