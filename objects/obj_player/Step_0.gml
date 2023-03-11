script_execute(estado); // roda o codigo de movimento
script_execute(last_dir);
if estado == controller{
script_execute(animation_handler);
}

else if estado == player_dash
{
switch (dir)
		{
			case "esquerda" :
				sprite_index = charlotte_dash_esquerda;
			break; 
			case "cima" :
				sprite_index = charlotte_dash_cima;
			break;
			case "baixo":
				sprite_index = charlotte_dash_baixo;
			break;
			case "direita":
				sprite_index = charlotte_dash_direita;
			break;


			}
}

if place_meeting(x + hveloc, y, sans) or place_meeting(x , y + vveloc, sans){
	
switch (textbox.isTalking)
{

case false:
	if keyboard_check_pressed(ord("Z")) and textbox.isTalking == false
	{

		textbox.txt = sans.sansQuote;
		textbox.isTalking = true;
	
	}
	break;
case true:
	if keyboard_check_pressed(ord("Z")) && textbox.isTalking == true
		{
			textbox.txt = "";
			textbox.isTalking = false;
		}
break;
}
/*
if keyboard_check_pressed(ord("Z")) and textbox.isTalking == false
{

	textbox.txt = sans.sansQuote;
	textbox.isTalking = true;
	
}

if keyboard_check_pressed(ord("Z")) && textbox.isTalking == true
	{
		textbox.txt = "";
		textbox.isTalking = false;
	}
*/
}
depth = -y;