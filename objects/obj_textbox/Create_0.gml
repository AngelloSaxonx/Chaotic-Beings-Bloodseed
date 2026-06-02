///Positions
marging = 20;
padding = 10;
width = display_get_gui_width() - marging*2;
height = display_get_gui_height() - marging;
x  = (display_get_gui_width() - width) / 2;
y = display_get_gui_height() - height - marging;
//Text Definition
text_sprite = spr_textbox_classic;
text_font = global.classic_font;
text_color = #ffffff;
text_speed = 0.6;
text_x = padding;
text_y = padding;
text_width = width - padding*2;

actions = [];
current_action = 0;
text_progress = 0;
text_lenght = 0;
text = "";

set_cutscene = function(_cutscene)
{
	actions = scr_cutscene(_cutscene)
	current_action = 0;
	next();
}

next = function()
{
	current_action++;
	if (current_action >= array_length(actions))
	{
		instance_destroy();
	}
	else
	{
		actions[current_action].act(id);
	}
}

set_text = function(_text)
{
	text = _text;
	text_lenght = string_length(_text);
	text_progress = 0;
}

