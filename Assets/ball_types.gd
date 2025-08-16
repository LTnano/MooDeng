#enum for different types of balls in the game
enum ball_type { CHERRY, APPLE, WATERMELON, PEACH, BLUEBERRY }

const ball_type_names = {
	ball_type.CHERRY: "Cherry",
	ball_type.APPLE: "Apple",
	ball_type.WATERMELON: "Watermelon",
	ball_type.PEACH: "Peach",
	ball_type.BLUEBERRY: "Blueberry"
}

static func get_ball_type_name(type):
	return ball_type_names.get(type, "Unknown")
