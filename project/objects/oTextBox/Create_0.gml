

//parametros textbox

textbox_width = 16*20
textbox_height = 9*20
border = 10
line_sep = 12
line_width = textbox_width - border*2
txtb_spr = chat
txtb_img = 0
txtb_img_spd = 0

//text

page = 0
page_number = 0
draw_char = 0
text_speed = 1

setup = false

switch room{
	
	case Intro:
	textbox_width = room_width-100
	textbox_height = room_height-100
	
	text[0] = "Sou eeeeeu, o tiririca, gugu ieie rapaisdfswdfsdfsdfw2erwedfcsdgerfsdszvdfghfhtrz"
	text[1] = "Nao, nao sou eeeeeu o tiririca"
	
	break
	
	case game:
	text[0] = "sala 2 teste"
	text[1] = "Nao, nao sou eeeeeu o tiririca"
	break
	
	case bossfight:
	text[0] = "boss fight teste"
	text[1] = "Nao, nao sou eeeeeu o tiririca"
	break

}

text_lenght[0] = string_length(text[0])