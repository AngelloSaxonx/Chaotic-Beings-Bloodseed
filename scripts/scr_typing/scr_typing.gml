function scr_start_cutscene(_cutscene)
{
	if instance_exists(obj_textbox)
	return;
	
	var _inst = instance_create_depth(x, y, -999, obj_textbox)
	_inst.set_cutscene(_cutscene)
}

function scr_typing( x, y, _text, _progress, _width)
{
	var _draw_x = 0;
	var _draw_y = 0;
	
	for (var _t = 1;_t <= _progress; _t++)
	{
		var _char = string_char_at(_text, _t);
		if (_char == "\n")
		{
			_draw_x = 0;
			_draw_y += string_height("A");
		}
		else if (_char == "")
		{
			_draw_x += string_width(_char);
			
			var _word_width = 0;
			for (var _tt = _t + 1; _tt <= string_length(_text); _tt++)
			{
			var _word_char = string_char_at(_text, _tt);
			
			if (_word_char == "\n" || _word_char == "")
			break;
			
			_word_width += string_width(_word_char);
			if (_draw_x + _word_width > _width)
			{
				_draw_x = 0;
				_draw_y += string_height("A");
				break;
			}
		}
			
		}
		else
		{
		//type character
		draw_text(x + _draw_x, y + _draw_y, _char);
		_draw += string_width(_char);
		}
	}
}