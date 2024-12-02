

//parametros textbox

textbox_width = 16*20
textbox_height = 9*20
border = 10
line_sep = 30
line_width = 1250
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
	
	text[0] = "A história tem início no ano de 2030, o mundo está uma bagunça, a maio parte dos países passam por uma falta gigantesca de recursos naturais e outros problemas surgem, como a fome generalizada e a violência extrema. Dois anos depois do início da crise, as maiores potências mundiais começam pequenos confrontos pela soberania do petróleo e outros recursos naturais, que até esse ponto, se tornaram escassos."
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