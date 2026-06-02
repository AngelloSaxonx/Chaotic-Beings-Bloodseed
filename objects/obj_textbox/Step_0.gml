scr_menu_control();

text_progress = min(text_progress + text_speed, text_lenght);

if (text_progress == text_lenght)
{
	if accept_key
	{
		next();
	}
}
else if accept_key
{
	text_progress = text_lenght;
}