require 'ruby2d'

set background: 'white'

sprites = "skifree-sprites.png"

skier = Sprite.new(
sprites,

clip_width: 20,
clip_height: 33,
time: 120,
animations: {
	ski_right: [
			{
				x: 0, y: 0,
				time: 100
			},
		],
		ski_down: [
			{
				x: 64.5, y: 0,
				time: 100,
			}
		],
		ski_left: [
			{
				x: 300, y: 0,
				time: 100,
			}
		]
	}
)

moving = false
speed = 3

on :key_held do |e|
	close if e.key == 'escape'

	case e.key
	when 'right'
		skier.play :ski_right
		skier.x += speed
		moving = true
	when 'left'
		skier.play :ski_left
		skier.x -= speed
		moving = true
		p sprites
	when 'down'
		skier.play :ski_down
		skier.y += speed
		moving = true
	when 'up'
		skier.y -= speed
		moving = true
	end
end

on :key_down do |e|
	case e.key
	when 'space'
		skier.play :jump
	end
end

def swap_spritesheet(x)
end 

#testing dedicated update loop
update do 

	# on :key_held do |e|
		# if e.key == 'left'
 	# 		sprites = 'skifree-sprites-reversed.png'
 	# 	else
 	# 		sprites = 'skifree-sprites'
		# end
		# p sprites
		# p e.key
	# end
end


show

