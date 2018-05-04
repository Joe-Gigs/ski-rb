require 'ruby2d'

set background: 'white'

sprites_normal = "skifree-sprites.png"
sprites_reverse = "skifree-sprites-reversed.png"

skier = Sprite.new(
sprites_normal,

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
		skier.x -= speed
		moving = true
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

show

