extends ParallaxLayer

@onready var texture_rect = $TextureRect


func _ready():
	# Esta linha garante que vamos pegar o tamanho da tela depois que ela foi inicializada.
	await get_tree().process_frame
	
	# Pega o tamanho atual da janela do jogo (viewport).
	var screen_size = get_viewport_rect().size
	
	# Define o tamanho do TextureRect para ser exatamente o tamanho da tela.
	texture_rect.size = screen_size
