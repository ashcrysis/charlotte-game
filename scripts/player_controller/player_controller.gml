	function controller(){
	esquerda = keyboard_check(vk_left); // recebe o trigger das teclas
	cima = keyboard_check(vk_up);
	baixo = keyboard_check(vk_down);
	direita = keyboard_check(vk_right);
	
	hveloc =  (direita - esquerda) * veloc;
	vveloc = (baixo - cima) * veloc;

	col_check(); // executa a função de colisão 
	
	if keyboard_check_pressed(vk_lshift) and dashTime == true{
		estado = player_dash;
	alarm[0] = 15;
	switch (dir){
		case "cima":
			dash_dir = point_direction(x,y,x,y-10);
	break;
		case "baixo":
			dash_dir = point_direction(x,y,x,y+10);
	break;
		case "esquerda":
			dash_dir = point_direction(x,y,x-10,y);
	break;
		case "direita":
			dash_dir = point_direction(x,y,x+10,y);
	break;
	}
	
	
	dashTime = false;
	alarm[1] = 45;
	}
		
	}

function col_check(){
	
if place_meeting(x + hveloc * veloc, y, obj_col){ // bloco de instruções pra detectar colisões no eixo x
	while !place_meeting(x + sign(hveloc * veloc),y,obj_col){
		x += sign(hveloc * veloc)

	}

hveloc = 0;
}

x += hveloc; //adiciona a movimentação no eixo x


if place_meeting(x, y + vveloc * veloc, obj_col){// bloco de instruções pra detectar colisões no eixo y
	while !place_meeting(x,y + sign(vveloc * veloc),obj_col){
		y += sign(vveloc * veloc)

	}

vveloc = 0;
}


y += vveloc; //adiciona a movimentação no eixo y
}

function last_dir()
{
	dirEsquerda = keyboard_check(vk_left);
	dirCima = keyboard_check(vk_up);
	dirBaixo = keyboard_check(vk_down);
	dirDireita = keyboard_check(vk_right);
	
	if dirEsquerda{
	dir = "esquerda";
	}

	if dirCima{
	dir = "cima";
	}
		if dirBaixo{
	dir = "baixo";
	}
	
		if dirDireita{
	dir = "direita";
	}

}

function animation_handler(){
	switch estado
	{
	
	case player_dash:
		
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
	break;
	case controller:
		if hveloc == 0 and vveloc == 0{
	
switch (dir)
{
	case "esquerda" :
		sprite_index = sprite_idle_left;
	break; 
	case "cima" :
		sprite_index = sprite_idle_up;
	break;
	case "baixo":
		sprite_index = sprite_idle_down;
	break;
	case "direita":
		sprite_index = sprite_idle_right;
	break;


	}
}

		if hveloc != 0 or vveloc != 0
			{
			switch (dir)
			{
				case "esquerda" :
					sprite_index = sprite_walking_left;
				break; 
				case "cima" :
					sprite_index = sprite_walking_up;
				break;
				case "baixo":
					sprite_index = sprite_walking_down;
				break;
				case "direita":
					sprite_index = sprite_walking_right;
				break;


				}
	
			}
	break;
	
	}

	
	
	

}



function player_dash(){

hveloc = lengthdir_x(dash_veloc, dash_dir);
vveloc = lengthdir_y(dash_veloc, dash_dir);

x += hveloc;
y += vveloc;

//animation_handler();

var _inst = instance_create_layer(x,y,"eff",obj_dash);
_inst.sprite_index = obj_player.sprite_index;
col_check();
}