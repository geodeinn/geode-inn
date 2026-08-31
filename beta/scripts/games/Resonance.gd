###
# Geode Inn — Resonance Card Game
# Stones as cards. 42Hz (Living), 84Hz (Shadow), 111Hz (Gargoyle) as mechanics.
# 
# Deck building: Players collect stones from the 198-stone database.
# Each stone has stats derived from its geological properties:
#   - Mohs hardness → Power (1-10 scale)
#   - Stone family → Faction (Silicates, Oxides, Carbonates, etc.)
#   - Optical phenomenon → Special ability (Chatoyancy, Asterism, etc.)
#   - Opacity → Defense (opaque = high defense, transparent = low defense)
#   - Color → Element (Fire, Water, Earth, Air, Aether)
#
# The three frequencies are the core mechanic:
#   - 42Hz cards grow stronger each turn (Living mode — patience rewarded)
#   - 84Hz cards petrify the opponent (Shadow mode — disruption)
#   - 111Hz cards reveal hidden information (Gargoyle mode — awareness)
###

extends Node2D
signal game_ended(winner: String, player_score: int, opponent_score: int)

# === Game States ===
enum State { SETUP, PLAYER_TURN, OPPONENT_TURN, RESOLUTION, GAME_OVER }
var current_state: State = State.SETUP

# === Card Definition ===
class StoneCard:
	var stone_name: String
	var mohs_hardness: float        # 1-10 → Power
	var stone_family: String        # Faction
	var optical_phenomenon: String  # Special ability
	var opacity: String             # "opaque", "translucent", "transparent"
	var color_notes: String         # Element mapping
	var frequency: int              # 42, 84, or 111
	var power: int                  # Computed from Mohs
	var defense: int                # Computed from opacity
	var element: String             # Computed from color
	var ability_text: String        # Human-readable special
	var turn_counter: int = 0       # For 42Hz growth mechanic
	
	func _init(data: Dictionary):
		stone_name = data.get("name", "Unknown")
		mohs_hardness = float(data.get("mohs", 5.0))
		stone_family = data.get("stoneFamily", "Unknown")
		optical_phenomenon = data.get("opticalPhenomenon", "")
		opacity = data.get("opacity", "opaque")
		color_notes = data.get("colorNotes", "")
		
		# Compute stats
		power = int(clamp(mohs_hardness, 1, 10))
		defense = _compute_defense()
		element = _compute_element()
		ability_text = _compute_ability()
		frequency = _assign_frequency()
	
	func _compute_defense() -> int:
		match opacity:
			"opaque": return 8
			"translucent": return 5
			"transparent": return 3
			_: return 5
	
	func _compute_element() -> String:
		var color = color_notes.to_lower()
		if "red" in color or "orange" in color: return "Fire"
		if "blue" in color or "cyan" in color: return "Water"
		if "green" in color or "brown" in color: return "Earth"
		if "white" in color or "clear" in color: return "Air"
		if "purple" in color or "gold" in color or "iridescen" in color: return "Aether"
		return "Earth"
	
	func _compute_ability() -> String:
		if optical_phenomenon == "": return ""
		var phen = optical_phenomenon.to_lower()
		if "chatoyan" in phen: return "Cat's Eye: Cannot be targeted by opponent's next card"
		if "asterism" in phen: return "Star: Counters all frequency effects for one turn"
		if "color change" in phen or "color-change" in phen: return "Shifter: Copies the element of the opponent's card"
		if "play of color" in phen: return "Opalescence: Random element each turn"
		if "labradoresc" in phen: return "Labradorescence: Reveals opponent's hand (111Hz effect)"
		if "adularesc" in phen: return "Adularescence: Reduces opponent card power by 2"
		return optical_phenomenon
	
	func _assign_frequency() -> int:
		# Assign frequency based on stone properties
		# Opaque, high-defense stones → 84Hz (Shadow/Petrify)
		# Transparent, high-power stones → 42Hz (Living/Grow)
		# Stones with optical phenomena → 111Hz (Gargoyle/Awareness)
		if optical_phenomenon != "":
			return 111
		if opacity == "opaque" and mohs_hardness >= 6:
			return 84
		return 42
	
	func get_effective_power() -> int:
		var p = power
		# 42Hz mechanic: grows +1 each turn
		if frequency == 42:
			p += turn_counter
		# 84Hz mechanic: petrify reduces opponent power
		if frequency == 84:
			p += 2  # Base bonus for being Shadow
		# 111Hz mechanic: stable, no growth but can't be reduced
		if frequency == 111:
			p = max(p, 5)  # Minimum power floor
		return p
	
	func get_effective_defense() -> int:
		var d = defense
		# 84Hz cards have higher defense (petrify = stay)
		if frequency == 84:
			d += 2
		return d

# === Game State ===
var player_deck: Array[StoneCard] = []
var opponent_deck: Array[StoneCard] = []
var player_hand: Array[StoneCard] = []
var opponent_hand: Array[StoneCard] = []
var player_board: Array[StoneCard] = []
var opponent_board: Array[StoneCard] = []
var player_score: int = 0
var opponent_score: int = 0
var turn_number: int = 1
var max_turns: int = 10

# === Deck Building ===

func build_deck_from_stones(stone_data: Array) -> Array[StoneCard]:
	var deck: Array[StoneCard] = []
	for data in stone_data:
		var card = StoneCard.new(data)
		deck.append(card)
	
	# Shuffle
	deck.shuffle()
	return deck

func deal_hands() -> void:
	for i in range(5):
		if player_deck.size() > 0:
			player_hand.append(player_deck.pop_front())
		if opponent_deck.size() > 0:
			opponent_hand.append(opponent_deck.pop_front())

# === Turn Logic ===

func start_game(player_stones: Array, opponent_stones: Array) -> void:
	player_deck = build_deck_from_stones(player_stones)
	opponent_deck = build_deck_from_stones(opponent_stones)
	deal_hands()
	current_state = State.PLAYER_TURN
	turn_number = 1
	
	# Audio: game start
	if AudioManager:
		AudioManager.play_stinger("fae_portal_ignition")
		AudioManager.set_mode(AudioManager.AudioMode.LIVING)
	
	print("[Resonance] Game started — Player: %d cards, Opponent: %d cards" % [player_deck.size(), opponent_deck.size()])

func play_card(hand_index: int, target_index: int = -1) -> void:
	if current_state != State.PLAYER_TURN:
		return
	
	if hand_index < 0 or hand_index >= player_hand.size():
		return
	
	var card = player_hand[hand_index]
	player_hand.remove_at(hand_index)
	player_board.append(card)
	
	# Apply frequency effect
	_apply_frequency_effect(card, true)
	
	# Audio: stone chime for the played card
	if AudioManager:
		AudioManager.play_stone_chime(card.stone_name.to_lower().replace(" ", "_"))
	
	print("[Resonance] Player played: %s (Power: %d, Defense: %d, Freq: %dHz)" % [
		card.stone_name, card.get_effective_power(), card.get_effective_defense(), card.frequency
	])
	
	# Resolve combat if there's a target
	if target_index >= 0 and target_index < opponent_board.size():
		_resolve_combat(card, opponent_board[target_index])
	
	# Check turn end
	if player_hand.size() == 0 or player_board.size() >= 5:
		_end_player_turn()

func _resolve_combat(player_card: StoneCard, opponent_card: StoneCard) -> void:
	var p_power = player_card.get_effective_power()
	var o_power = opponent_card.get_effective_power()
	var p_def = player_card.get_effective_defense()
	var o_def = opponent_card.get_effective_defense()
	
	# Element advantage: Fire > Earth > Water > Fire, Air neutral, Aether strong vs all
	var p_advantage = _get_element_advantage(player_card.element, opponent_card.element)
	p_power += p_advantage
	
	# Combat resolution
	if p_power > o_def:
		# Player wins — opponent card destroyed
		opponent_board.erase(opponent_card)
		player_score += int(opponent_card.mohs_hardness) * 10
		
		if AudioManager:
			AudioManager.play_stinger("standing_stones_row_clear")
		
		print("[Resonance] %s defeats %s (+%d points)" % [player_card.stone_name, opponent_card.stone_name, int(opponent_card.mohs_hardness) * 10])
	
	if o_power > p_def:
		# Opponent wins — player card destroyed
		player_board.erase(player_card)
		opponent_score += int(player_card.mohs_hardness) * 10
		
		if AudioManager:
			AudioManager.play_stinger("monster_encounter")
		
		print("[Resonance] %s defeated by %s" % [player_card.stone_name, opponent_card.stone_name])

func _get_element_advantage(attacker: String, defender: String) -> int:
	# Fire > Earth > Water > Fire (rock-paper-scissors)
	if attacker == "Fire" and defender == "Earth": return 3
	if attacker == "Earth" and defender == "Water": return 3
	if attacker == "Water" and defender == "Fire": return 3
	if attacker == "Aether": return 1  # Aether is slightly strong vs all
	return 0

func _apply_frequency_effect(card: StoneCard, is_player: bool) -> void:
	match card.frequency:
		42:  # Living — grows each turn
			card.turn_counter = 0  # Will grow at start of each turn
			print("[Resonance] 42Hz: %s will grow stronger each turn" % card.stone_name)
		84:  # Shadow — petrify opponent's lowest card
			if is_player and opponent_board.size() > 0:
				# Find opponent's lowest power card and reduce it
				var lowest = opponent_board[0]
				for c in opponent_board:
					if c.get_effective_power() < lowest.get_effective_power():
						lowest = c
				lowest.turn_counter = -3  # Penalty to growth
				print("[Resonance] 84Hz: %s petrified %s" % [card.stone_name, lowest.stone_name])
				
				if AudioManager:
					AudioManager.play_solfeggio("thalia")
		111:  # Gargoyle — reveal opponent's hand
			if is_player:
				print("[Resonance] 111Hz: %s reveals opponent hand:" % card.stone_name)
				for c in opponent_hand:
					print("  → %s (Power: %d, Freq: %dHz)" % [c.stone_name, c.get_effective_power(), c.frequency])
				
				if AudioManager:
					AudioManager.play_gargoyle_proximity()

func _end_player_turn() -> void:
	current_state = State.OPPONENT_TURN
	
	# Grow 42Hz cards
	for card in player_board:
		if card.frequency == 42:
			card.turn_counter += 1
	
	# Opponent AI
	_opponent_ai_turn()

func _opponent_ai_turn() -> void:
	# Simple AI: play highest power card, target player's weakest
	if opponent_hand.size() > 0 and opponent_board.size() < 5:
		# Find highest power card
		var best_index = 0
		var best_power = -1
		for i in range(opponent_hand.size()):
			if opponent_hand[i].get_effective_power() > best_power:
				best_power = opponent_hand[i].get_effective_power()
				best_index = i
		
		var card = opponent_hand[best_index]
		opponent_hand.remove_at(best_index)
		opponent_board.append(card)
		_apply_frequency_effect(card, false)
		
		# Target player's weakest card
		if player_board.size() > 0:
			var weakest = player_board[0]
			var weakest_index = 0
			for i in range(player_board.size()):
				if player_board[i].get_effective_defense() < weakest.get_effective_defense():
					weakest = player_board[i]
					weakest_index = i
			_resolve_combat(card, weakest)
	
	# Grow opponent's 42Hz cards
	for card in opponent_board:
		if card.frequency == 42:
			card.turn_counter += 1
	
	# Draw new cards
	if opponent_deck.size() > 0 and opponent_hand.size() < 5:
		opponent_hand.append(opponent_deck.pop_front())
	if player_deck.size() > 0 and player_hand.size() < 5:
		player_hand.append(player_deck.pop_front())
	
	turn_number += 1
	
	# Check game end
	if turn_number > max_turns or (player_deck.size() == 0 and player_hand.size() == 0):
		_end_game()
	else:
		current_state = State.PLAYER_TURN
		print("[Resonance] Turn %d — Player's turn" % turn_number)

func _end_game() -> void:
	current_state = State.GAME_OVER
	var winner = "Player" if player_score > opponent_score else "Opponent"
	
	if winner == "Player":
		if AudioManager:
			AudioManager.play_stinger("level_up")
		if SteamManager:
			SteamManager.unlock_achievement("first_game")
	else:
		if AudioManager:
			AudioManager.play_stinger("monster_encounter")
	
	game_ended.emit(winner, player_score, opponent_score)
	print("[Resonance] Game over! Winner: %s (Player: %d, Opponent: %d)" % [winner, player_score, opponent_score])

# === Tri-Mode Audio Shift ===
# The game's audio mode shifts based on the dominant frequency on the board

func _check_audio_mode() -> void:
	var living_count = 0
	var shadow_count = 0
	var gargoyle_count = 0
	
	for card in player_board + opponent_board:
		match card.frequency:
			42: living_count += 1
			84: shadow_count += 1
			111: gargoyle_count += 1
	
	if shadow_count > living_count and shadow_count > gargoyle_count:
		if AudioManager:
			AudioManager.set_mode(AudioManager.AudioMode.SHADOW)
	elif living_count > 0 and shadow_count > 0:
		if AudioManager:
			AudioManager.set_mode(AudioManager.AudioMode.IN_BETWEEN)
	else:
		if AudioManager:
			AudioManager.set_mode(AudioManager.AudioMode.LIVING)
