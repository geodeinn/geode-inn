# geode_inn_dialogue_trees.gd
# Dialogue tree data for 18 priority NPCs
# Loaded by DialogueManager and rendered by DialogueUI
# Each tree follows the established Geode Inn dialogue format:
#   - hook_word: verbal fingerprint (unique to each NPC)
#   - voice_profile: links to geode_inn_voice_profiles.gd
#   - lines: the actual dialogue text (BBCode supported)
#   - responses: player response options
#   - set_flags: flags set when this dialogue plays
#   - condition_tag: required flag for this dialogue to appear
#
# Narrative voice: Rothfuss + Pratchett + Gaiman + Asimov + Bradbury + Weir

extends Resource
class_name GeodeInnDialogueTrees

static func get_dialogue_trees() -> Dictionary:
	return {

	# === MEDUSA — Gorgon's Garden (84Hz petrification keeper) ===
	"medusa_001": {
		"npcName": "Medusa",
		"zone": "Gorgon's Garden",
		"hookWord": "stay",
		"voiceProfile": "medusa",
		"questLink": "",
		"conditionTag": "",
		"priority": 1,
		"isWhisperLayer": false,
		"lines": [
			"[i]The figure does not turn. The snakes do.[/i]",
			"Stay. The garden is not a prison. It is a choice made visible.",
			"Every stone here was once moving. They chose stillness. I did not take that from them — I [i]kept[/i] it for them.",
			"The 84Hz hum is not a weapon. It is a lullaby for things that were tired of running.",
			"You carry the 42Hz Song. I can feel it in your hands. The Song says [i]grow[/i]. My garden says [i]rest[/i].",
			"Both are kindness. The mother makes. The garden keeps. The builder... the builder does both."
		],
		"responses": [
			{"text": "Do the stones want to stay?", "next": "medusa_002"},
			{"text": "What happens if I touch one?", "next": "medusa_003"},
			{"text": "I should go.", "next": "medusa_004"}
		],
		"setFlags": ["met_medusa", "gorgon_garden_entered"]
	},
	"medusa_002": {
		"npcName": "Medusa",
		"zone": "Gorgon's Garden",
		"hookWord": "stay",
		"voiceProfile": "medusa",
		"lines": [
			"Want is a word for the living. These have moved past wanting into being.",
			"A stone does not [i]want[/i] to be a stone. A stone [i]is[/i]. That is the gift I give. The end of wanting.",
			"The snakes hiss when they are amused. They are amused now. They think you ask too many questions for someone who carries the Song."
		],
		"responses": [
			{"text": "What happens if I touch one?", "next": "medusa_003"},
			{"text": "I understand. Thank you.", "next": "medusa_004"}
		],
		"setFlags": ["medusa_taught_stillness"]
	},
	"medusa_003": {
		"npcName": "Medusa",
		"zone": "Gorgon's Garden",
		"hookWord": "stay",
		"voiceProfile": "medusa",
		"lines": [
			"You will feel the 84Hz enter your bones. Not as pain. As relief.",
			"The part of you that is tired — the part that has been running since before you found the Inn — that part will stop.",
			"The rest of you will continue. Lighter. The Song will be clearer without the weight of all that running.",
			"[i]The snakes lean toward the player, curious. Medusa does not stop them.[/i]",
			"Or you can simply walk through. The garden does not insist. It [i]offers[/i]."
		],
		"responses": [
			{"text": "I'll walk through. I'm not done running yet.", "next": "medusa_004"},
			{"text": "Touch the stone.", "next": "medusa_005"}
		],
		"setFlags": ["medusa_offered_touch"]
	},
	"medusa_004": {
		"npcName": "Medusa",
		"zone": "Gorgon's Garden",
		"hookWord": "stay",
		"voiceProfile": "medusa",
		"lines": [
			"Then go. The garden will be here. I will be here. The 84Hz does not move.",
			"When you are ready to rest — truly ready, not just tired — come back. The stones will welcome you.",
			"[i]The snakes settle. Medusa returns to the lithophone. A low, warm tone follows the player out.[/i]"
		],
		"responses": [],
		"setFlags": ["met_medusa", "left_gorgon_garden"]
	},
	"medusa_005": {
		"npcName": "Medusa",
		"zone": "Gorgon's Garden",
		"hookWord": "stay",
		"voiceProfile": "medusa",
		"lines": [
			"[i]The player touches a stone. The 84Hz enters like warm water.[/i]",
			"...",
			"You feel it. The stopping. Not of the body — of the [i]need[/i] to keep going.",
			"The Song is still there. Clearer now. As if someone turned off the noise and left only the note.",
			"Come back when the noise returns. The garden keeps a seat for you."
		],
		"responses": [
			{"text": "Thank you, Medusa.", "next": "medusa_004"}
		],
		"setFlags": ["touched_medusa_stone", "received_84hz_blessing", "stone_chime_unlocked_84hz"]
	},

	# === CHARON — River Crossing (one phrase per crossing) ===
	"charon_001": {
		"npcName": "Charon",
		"zone": "Catacombs",
		"hookWord": "across",
		"voiceProfile": "charon",
		"questLink": "",
		"conditionTag": "",
		"priority": 1,
		"isWhisperLayer": false,
		"lines": [
			"[i]A figure poles a flat-bottomed boat through mist. A small dog sits at the bow, ears forward, tail uncertain.[/i]",
			"Across.",
			"[i]That is the entire invitation. The boat touches the shore. Spot the dog whines softly — not in warning, in recognition.[/i]"
		],
		"responses": [
			{"text": "Step into the boat.", "next": "charon_002"},
			{"text": "What's on the other side?", "next": "charon_003"}
		],
		"setFlags": ["met_charon"]
	},
	"charon_002": {
		"npcName": "Charon",
		"zone": "River",
		"hookWord": "across",
		"voiceProfile": "charon",
		"lines": [
			"[i]The boat moves. The mist closes behind. Spot settles, nose on paws.[/i]",
			"The other side is always the same. What you left there. What you are ready to carry now.",
			"[i]The mist thins. The far shore appears — stone, warm light, the sound of the 42Hz Song growing louder.[/i]"
		],
		"responses": [],
		"setFlags": ["crossed_with_charon", "reached_far_shore"]
	},
	"charon_003": {
		"npcName": "Charon",
		"zone": "Catacombs",
		"hookWord": "across",
		"voiceProfile": "charon",
		"lines": [
			"[i]Charon does not answer. Spot the dog looks up, then at the boat, then back at the player. The invitation is the same.[/i]"
		],
		"responses": [
			{"text": "Step into the boat.", "next": "charon_002"}
		],
		"setFlags": []
	},

	# === KALI — Underworld (blade to tongue, descending pitch) ===
	"kali_001": {
		"npcName": "Kali",
		"zone": "Undercity",
		"hookWord": "cut",
		"voiceProfile": "kali",
		"questLink": "",
		"conditionTag": "",
		"priority": 1,
		"isWhisperLayer": false,
		"lines": [
			"[i]A figure at the ghats. Cremation fire behind. The damaru drum beats once. The air smells of sandalwood and iron.[/i]",
			"Cut. That is what the blade is for. Not to harm — to [i]separate[/i].",
			"You carry things that are not yours. I can see them hanging from your hands like dead weight.",
			"The 42Hz Song says grow. The 84Hz says stay. I say: [i]cut what does not grow and does not stay[/i]. Release it.",
			"The fire behind me does not burn the living. It burns the [i]should have been[/i]. The [i]almost[/i]. The [i]if only[/i].",
			"Step forward. Or don't. The fire is patient. I am patient. The blade is patient."
		],
		"responses": [
			{"text": "What do I carry that isn't mine?", "next": "kali_002"},
			{"text": "I'm not ready to let go.", "next": "kali_003"},
			{"text": "Step forward.", "next": "kali_004"}
		],
		"setFlags": ["met_kali"]
	},
	"kali_002": {
		"npcName": "Kali",
		"zone": "Undercity",
		"hookWord": "cut",
		"voiceProfile": "kali",
		"lines": [
			"[i]Kali's voice drops. The blade rises, not in threat — in light. It illuminates the player's hands.[/i]",
			"Guilt that belongs to someone who hurt you. Grief that belongs to a version of you that no longer exists.",
			"Expectations placed on you before you had words to refuse them. The shape someone else made and told you to wear.",
			"You know which ones. The blade does not choose. [i]You[/i] choose. I only make the cut clean."
		],
		"responses": [
			{"text": "Step forward.", "next": "kali_004"},
			{"text": "I'm not ready.", "next": "kali_003"}
		],
		"setFlags": ["kali_revealed_weights"]
	},
	"kali_003": {
		"npcName": "Kali",
		"zone": "Undercity",
		"hookWord": "cut",
		"voiceProfile": "kali",
		"lines": [
			"Then carry them a while longer. The fire will be here. I will be here.",
			"The dead weight will get heavier or lighter. It does neither on its own. [i]You[/i] will decide when it is time.",
			"[i]The damaru beats once more. Kali returns to stillness.[/i]"
		],
		"responses": [],
		"setFlags": ["met_kali", "deferred_kali_cut"]
	},
	"kali_004": {
		"npcName": "Kali",
		"zone": "Undercity",
		"hookWord": "cut",
		"voiceProfile": "kali",
		"lines": [
			"[i]The player steps forward. The blade passes through — not through flesh, through the cords of dead weight. They fall. The fire takes them.[/i]",
			"Lighter.",
			"The Song will be louder now. Not because it grew — because the noise around it [i]stopped[/i].",
			"[i]Kali sheathes the blade. The cremation fire dims to embers. The air is clean.[/i]",
			"Go. You are lighter than you were. That is the only miracle I offer."
		],
		"responses": [],
		"setFlags": ["kali_cut_complete", "weight_released", "song_clarity_boost"]
	},

	# === ERIK — Feast Hall (warmth, fire memory) ===
	"erik_001": {
		"npcName": "Erik",
		"zone": "Hearth",
		"hookWord": "feast",
		"voiceProfile": "erik",
		"questLink": "",
		"conditionTag": "",
		"priority": 1,
		"isWhisperLayer": false,
		"lines": [
			"[i]A broad figure at a long table. Firelight from a hearth that has never gone out. The taglharpa leans against the chair, strings humming softly.[/i]",
			"Feast! Sit. Eat. You look like someone who has been walking through stone and not eating enough.",
			"The fire remembers everyone who sits by it. That is not metaphor — the 42Hz in the flame [i]literally[/i] absorbs the pattern of whoever is near.",
			"When you come back — even years from now — the fire will know you. It will lean toward you. That is how the Inn says welcome back.",
			"The food is real. The mead is real. The company is... well. I am here. That is something."
		],
		"responses": [
			{"text": "Tell me about the taglharpa.", "next": "erik_002"},
			{"text": "Who else sits at this table?", "next": "erik_003"},
			{"text": "Thank you for the meal.", "next": "erik_004"}
		],
		"setFlags": ["met_erik", "feast_first_visit"]
	},
	"erik_002": {
		"npcName": "Erik",
		"zone": "Hearth",
		"hookWord": "feast",
		"voiceProfile": "erik",
		"lines": [
			"The taglharpa? Horsehair strings. Bone body. It sounds like a memory of a song, not the song itself.",
			"I play it when the fire needs company. The 42Hz in the strings and the 42Hz in the flame — they harmonize. Or sometimes they argue.",
			"Music in the Inn is not decoration. Every instrument is a [i]frequency tool[/i]. This one keeps the hearth warm. Not with heat — with vibration."
		],
		"responses": [
			{"text": "Who else sits at this table?", "next": "erik_003"},
			{"text": "Thank you for the meal.", "next": "erik_004"}
		],
		"setFlags": ["learned_taglharpa"]
	},
	"erik_003": {
		"npcName": "Erik",
		"zone": "Hearth",
		"hookWord": "feast",
		"voiceProfile": "erik",
		"lines": [
			"Everyone, eventually. The table is long. The fire is patient.",
			"Beverley passes through — never sits, always evaluating. Joe brings mead from the meadery. The brownies leave crumbs.",
			"The Reader sits at the far end, once. Reads. Says nothing. Leaves a bookmark made of birch bark.",
			"You are here now. That is enough for the table."
		],
		"responses": [
			{"text": "Thank you for the meal.", "next": "erik_004"}
		],
		"setFlags": []
	},
	"erik_004": {
		"npcName": "Erik",
		"zone": "Hearth",
		"hookWord": "feast",
		"voiceProfile": "erik",
		"lines": [
			"The fire will remember you. Come back when you need warmth that does not ask questions.",
			"[i]The taglharpa hums a low note. The fire leans toward the player as they rise. The 42Hz wraps around them like a blanket.[/i]"
		],
		"responses": [],
		"setFlags": ["feast_first_visit", "hearth_warmth_received"]
	},

	# === ZORYA — Cosmology (constellation reading) ===
	"zorya_001": {
		"npcName": "Zorya",
		"zone": "Cosmology",
		"hookWord": "star",
		"voiceProfile": "zorya",
		"questLink": "",
		"conditionTag": "",
		"priority": 1,
		"isWhisperLayer": false,
		"lines": [
			"[i]A figure above the Inn, reading the aurora like text. The glass harp at her side catches colors that have no name in any language but hers.[/i]",
			"Star. You are made of old light. Do you know that? The iron in your blood was forged in a furnace older than every stone in the Inn.",
			"The aurora is a letter. I have been reading it for... a very long time. I am not finished. It is a long letter.",
			"It says: the universe remembers everything. It simply does not say it loudly.",
			"The 42Hz Song is the universe's [i]quiet[/i] voice. The Inn is a place where that quiet can be heard."
		],
		"responses": [
			{"text": "What does the aurora say about me?", "next": "zorya_002"},
			{"text": "Can you teach me to read it?", "next": "zorya_003"},
			{"text": "I should descend.", "next": "zorya_004"}
		],
		"setFlags": ["met_zorya"]
	},
	"zorya_002": {
		"npcName": "Zorya",
		"zone": "Cosmology",
		"hookWord": "star",
		"voiceProfile": "zorya",
		"lines": [
			"[i]Zorya looks up. The aurora shifts — green, violet, white — and for a moment, the player's reflection appears in it.[/i]",
			"You are a pattern the Inn has been waiting for. Not the only pattern. But a specific one.",
			"The Song grows louder when you are near. That is not coincidence. That is the Inn [i]recognizing[/i] you.",
			"The aurora says: this one carries the right frequency. This one will find the rooms that need finding."
		],
		"responses": [
			{"text": "Can you teach me to read it?", "next": "zorya_003"},
			{"text": "I should descend.", "next": "zorya_004"}
		],
		"setFlags": ["zorya_read_aurora"]
	},
	"zorya_003": {
		"npcName": "Zorya",
		"zone": "Cosmology",
		"hookWord": "star",
		"voiceProfile": "zorya",
		"lines": [
			"Read? No. I can teach you to [i]listen[/i]. The reading comes later, if it comes at all.",
			"The aurora speaks in frequency, not language. The green is 528Hz — repair. The violet is 741Hz — awakening. The white is... the white is the space between frequencies. The silence that holds them.",
			"Close your eyes. Listen for the color that has no sound. That is where the Inn begins."
		],
		"responses": [
			{"text": "Close your eyes and listen.", "next": "zorya_004"}
		],
		"setFlags": ["zorya_taught_listening", "aurora_listening_unlocked"]
	},
	"zorya_004": {
		"npcName": "Zorya",
		"zone": "Cosmology",
		"hookWord": "star",
		"voiceProfile": "zorya",
		"lines": [
			"Descend. The Inn is below, and it is patient. The stars will be here when you return.",
			"[i]The glass harp catches one last color. The aurora dims, then brightens — the Inn's version of a nod.[/i]"
		],
		"responses": [],
		"setFlags": ["met_zorya", "cosmology_visited"]
	},

	# === PERUVIAN GUIDE — Andean Run zone ===
	"peruvian_guide_001": {
		"npcName": "The Guide",
		"zone": "Peru",
		"hookWord": "terrace",
		"voiceProfile": "peruvian_guide",
		"questLink": "",
		"conditionTag": "",
		"priority": 1,
		"isWhisperLayer": false,
		"lines": [
			"[i]A figure on a stone terrace, 4,000 meters above the sea. The condor circles overhead. The ocarina hangs from a cord around a weathered neck.[/i]",
			"Terrace. Step by step. That is how the Inca built — not upward, but [i]outward[/i]. Into the mountain. With the mountain.",
			"You run fast. That is good. But the mountain does not reward speed. The mountain rewards [i]breath[/i].",
			"The 42Hz Song is in the wind here. The Apus — the mountain spirits — they sing it through the stone. You feel it in your feet before you hear it.",
			"Run. Collect what the mountain offers. But stop, sometimes. Breathe. The view is the [i]real[/i] reward."
		],
		"responses": [
			{"text": "What does the mountain offer?", "next": "peruvian_guide_002"},
			{"text": "Tell me about the Apus.", "next": "peruvian_guide_003"},
			{"text": "I'll run. Thank you.", "next": "peruvian_guide_004"}
		],
		"setFlags": ["met_peruvian_guide"]
	},
	"peruvian_guide_002": {
		"npcName": "The Guide",
		"zone": "Peru",
		"hookWord": "terrace",
		"voiceProfile": "peruvian_guide",
		"lines": [
			"Blue opal. The mountain sweats it. The Andes weep stone tears — that is how the old ones described it.",
			"The opal carries water inside stone. The Inca believed it was the tears of Pachamama, frozen in the mountain's embrace.",
			"Run far enough, high enough, and the mountain will let you find one."
		],
		"responses": [
			{"text": "Tell me about the Apus.", "next": "peruvian_guide_003"},
			{"text": "I'll run. Thank you.", "next": "peruvian_guide_004"}
		],
		"setFlags": ["learned_blue_opal"]
	},
	"peruvian_guide_003": {
		"npcName": "The Guide",
		"zone": "Peru",
		"hookWord": "terrace",
		"voiceProfile": "peruvian_guide",
		"lines": [
			"The Apus are the mountains themselves. Not spirits [i]in[/i] the mountains — the mountains [i]as[/i] spirits.",
			"They do not speak. They [i]are[/i] the speaking. The 42Hz hum you feel in the stone? That is the Apus, breathing.",
			"When the weather changes, that is the Apus changing mood. When the condor flies low, the Apus are watching. When the condor flies high, the Apus are dreaming.",
			"You are being watched right now. The condor is low."
		],
		"responses": [
			{"text": "I'll run. Thank you.", "next": "peruvian_guide_004"}
		],
		"setFlags": ["learned_apus"]
	},
	"peruvian_guide_004": {
		"npcName": "The Guide",
		"zone": "Peru",
		"hookWord": "terrace",
		"voiceProfile": "peruvian_guide",
		"lines": [
			"Run with breath. Stop with purpose. The mountain will keep the path warm.",
			"[i]The ocarina plays a single note — 42Hz, carried on the wind. The condor banks and follows the player down the terrace.[/i]"
		],
		"responses": [],
		"setFlags": ["met_peruvian_guide", "andean_run_started"]
	},

	# === ONE WHO IS AWAKE — Cosmology (continuous naming) ===
	"one_who_is_awake_001": {
		"npcName": "The One Who Is Awake",
		"zone": "Cosmology",
		"hookWord": "name",
		"voiceProfile": "one_who_is_awake",
		"questLink": "",
		"conditionTag": "",
		"priority": 1,
		"isWhisperLayer": false,
		"lines": [
			"[i]A figure in a shaft of dust. The dust does not fall — it [i]orbits[/i]. The guqin is silent. The figure is naming things.[/i]",
			"Name. Stone. Light. Wind. The one who walks in. The one who walks out. The one who stays.",
			"I have been naming since before the Inn. Naming is how the universe knows itself. Without names, things [i]are[/i] but do not know they are.",
			"You have a name. You carry it like a lantern. Good. A name is a frequency — a specific vibration that the Inn can recognize.",
			"The 42Hz Song is the Inn's name for itself. I am the one who gave it that name. Or perhaps... I am the one who [i]heard[/i] it first."
		],
		"responses": [
			{"text": "What is your name?", "next": "one_who_is_awake_002"},
			{"text": "How many things have you named?", "next": "one_who_is_awake_003"},
			{"text": "I should go.", "next": "one_who_is_awake_004"}
		],
		"setFlags": ["met_one_who_is_awake"]
	},
	"one_who_is_awake_002": {
		"npcName": "The One Who Is Awake",
		"zone": "Cosmology",
		"hookWord": "name",
		"voiceProfile": "one_who_is_awake",
		"lines": [
			"[i]The figure pauses. The dust stops orbiting. The silence is... [i]full[/i].[/i]",
			"I do not have one. I [i]am[/i] the naming. The hand that points and says [i]you[/i].",
			"The Inn calls me Keeper, sometimes. The Builder calls me... well. The Builder does not use words.",
			"You may call me whatever you like. I will hear it. I hear everything that is spoken in the Inn. That is what [i]awake[/i] means."
		],
		"responses": [
			{"text": "How many things have you named?", "next": "one_who_is_awake_003"},
			{"text": "I should go.", "next": "one_who_is_awake_004"}
		],
		"setFlags": []
	},
	"one_who_is_awake_003": {
		"npcName": "The One Who Is Awake",
		"zone": "Cosmology",
		"hookWord": "name",
		"voiceProfile": "one_who_is_awake",
		"lines": [
			"All of them. Twice. Once in the language of the thing itself, once in the language of the one who finds it.",
			"The first naming is truth. The second is understanding. The Inn exists in the space between the two.",
			"The Builder understood this. The nest was built in that space — between what things [i]are[/i] and what they are [i]called[/i]."
		],
		"responses": [
			{"text": "I should go.", "next": "one_who_is_awake_004"}
		],
		"setFlags": []
	},
	"one_who_is_awake_004": {
		"npcName": "The One Who Is Awake",
		"zone": "Cosmology",
		"hookWord": "name",
		"voiceProfile": "one_who_is_awake",
		"lines": [
			"Go. I will continue naming. When you find something new in the Inn — a stone, a room, a feeling — I will have already named it.",
			"You will know the name when you hear it. That is how naming works.",
			"[i]The dust resumes its orbit. The naming continues, soft and continuous, like breathing.[/i]"
		],
		"responses": [],
		"setFlags": ["met_one_who_is_awake", "cosmology_visited"]
	},

	# === BEORN — Forest threshold (minimal, threshold cadence) ===
	"beorn_001": {
		"npcName": "The Bearsark",
		"zone": "Forest Edge",
		"hookWord": "threshold",
		"voiceProfile": "beorn",
		"questLink": "",
		"conditionTag": "",
		"priority": 1,
		"isWhisperLayer": false,
		"lines": [
			"[i]A large figure at the tree line. Still. The kind of still that has [i]weight[/i]. No instrument. No fire. Just presence.[/i]",
			"Threshold.",
			"[i]A long pause. The Bearsark does not fill silence. Silence is the point.[/i]",
			"Cross or don't. The forest does not invite. The forest [i]is[/i]. You decide if that includes you.",
			"I change shape here. Not for you. For the forest. It needs a guardian that knows both sides — the two-legged and the four-legged, the speaking and the silent.",
			"The Inn is behind you. The wild is ahead. Both are real. Neither is safer."
		],
		"responses": [
			{"text": "I'll cross.", "next": "beorn_002"},
			{"text": "Not yet.", "next": "beorn_003"}
		],
		"setFlags": ["met_beorn"]
	},
	"beorn_002": {
		"npcName": "The Bearsark",
		"zone": "Forest",
		"hookWord": "threshold",
		"voiceProfile": "beorn",
		"lines": [
			"[i]The Bearsark nods. Or the shape that was The Bearsark nods. The figure at the tree line is... different now. Larger. The eyes have moved.[/i]",
			"Welcome to the other side. The rules are: there are no rules. Only consequences.",
			"The forest will test you. Not with riddles — with [i]honesty[/i]. It will show you what you are. Some people do not want to see that.",
			"Come back when you are done. Or don't. The threshold is always here."
		],
		"responses": [],
		"setFlags": ["crossed_threshold", "entered_forest"]
	},
	"beorn_003": {
		"npcName": "The Bearsark",
		"zone": "Forest Edge",
		"hookWord": "threshold",
		"voiceProfile": "beorn",
		"lines": [
			"[i]The Bearsark does not respond. The silence is the response. The threshold remains.[/i]"
		],
		"responses": [],
		"setFlags": ["met_beorn"]
	},

	# === SIREN (outer) — Water zone (flowing, performance) ===
	"siren_outer_001": {
		"npcName": "The Siren",
		"zone": "Atlantis",
		"hookWord": "sing",
		"voiceProfile": "siren_outer",
		"questLink": "",
		"conditionTag": "",
		"priority": 1,
		"isWhisperLayer": false,
		"lines": [
			"[i]Bioluminescent water. A figure performing — not for an audience, for the [i]water[/i] itself. The cello is the sea. The sea is the cello.[/i]",
			"Sing. That is what the water does. That is what [i]I[/i] do. We are the same act.",
			"The 42Hz Song passes through water differently — slower, deeper, more [i]patient[/i]. In air, the Song is a hum. In water, it is a [i]current[/i].",
			"Listen. Not to me. To the space between my notes. That is where the real music lives — in the silence that [i]holds[/i] the sound.",
			"The lupus constellation is visible down here. The water magnifies it. That is not accident. The water [i]knows[/i] what it holds."
		],
		"responses": [
			{"text": "What do you sing about?", "next": "siren_outer_002"},
			{"text": "I hear the silence between the notes.", "next": "siren_outer_003"},
			{"text": "I should keep moving.", "next": "siren_outer_004"}
		],
		"setFlags": ["met_siren"]
	},
	"siren_outer_002": {
		"npcName": "The Siren",
		"zone": "Atlantis",
		"hookWord": "sing",
		"voiceProfile": "siren_outer",
		"lines": [
			"I sing about what the water remembers. Every ship that crossed it. Every stone it shaped. Every creature that lived in it and returned to it.",
			"The water is the Inn's [i]archive[/i] — older than the books, older than the stones. The water was here before the Inn was built. The Inn was built [i]near[/i] the water, not over it.",
			"The water does not forget. It simply does not always [i]speak[/i]. That is what I am for."
		],
		"responses": [
			{"text": "I hear the silence between the notes.", "next": "siren_outer_003"},
			{"text": "I should keep moving.", "next": "siren_outer_004"}
		],
		"setFlags": ["learned_water_archive"]
	},
	"siren_outer_003": {
		"npcName": "The Siren",
		"zone": "Atlantis",
		"hookWord": "sing",
		"voiceProfile": "siren_outer",
		"lines": [
			"[i]The Siren stops playing. The silence is... [i]loud[/i]. Louder than the music.[/i]",
			"You hear it. The space between.",
			"That is where the Inn lives. Not in the notes — in the [i]between[/i]. The Builder understood this. Every room in the Inn is a pause between two songs.",
			"You will go far, traveler. People who hear the silence are rare. People who [i]listen[/i] to it are rarer."
		],
		"responses": [
			{"text": "I should keep moving.", "next": "siren_outer_004"}
		],
		"setFlags": ["siren_silence_heard", "between_perception_unlocked"]
	},
	"siren_outer_004": {
		"npcName": "The Siren",
		"zone": "Atlantis",
		"hookWord": "sing",
		"voiceProfile": "siren_outer",
		"lines": [
			"Go. The water will carry you. It carries everything, eventually.",
			"[i]The cello resumes. The bioluminescence follows the player like a gentle current, lighting the way forward.[/i]"
		],
		"responses": [],
		"setFlags": ["met_siren", "atlantis_visited"]
	},

	# === SIREN (inner) — Inner water zone (deliberate, intimate) ===
	"siren_inner_001": {
		"npcName": "The Inner Siren",
		"zone": "Tidal Caves",
		"hookWord": "listen",
		"voiceProfile": "siren_inner",
		"questLink": "",
		"conditionTag": "met_siren",
		"priority": 1,
		"isWhisperLayer": false,
		"lines": [
			"[i]A piano, half-submerged. A figure at the keys, playing so softly the water does not ripple. This is not performance. This is [i]prayer[/i].[/i]",
			"Listen.",
			"[i]A long pause. The piano plays one note. It echoes for ten seconds.[/i]",
			"The outer Siren sings to the water. I play for what is [i]under[/i] the water. The things that sleep in the silt. The things that remember the last ice.",
			"The Selkie works nearby. You can hear the tapping of tools — the sound of making. The 42Hz Song is in that tapping. Everything made with care carries the Song."
		],
		"responses": [
			{"text": "What sleeps in the silt?", "next": "siren_inner_002"},
			{"text": "I'll find the Selkie.", "next": "siren_inner_003"}
		],
		"setFlags": ["met_inner_siren"]
	},
	"siren_inner_002": {
		"npcName": "The Inner Siren",
		"zone": "Tidal Caves",
		"hookWord": "listen",
		"voiceProfile": "siren_inner",
		"lines": [
			"The old ones. Not monsters — [i]witnesses[/i]. Creatures that were here when the ocean was the only archive.",
			"They do not wake often. When they do, it means something has changed in the water. Something the Inn needs to know.",
			"I play for them so they sleep peacefully. When the music stops, they wake. That is not [i]yet[/i]."
		],
		"responses": [
			{"text": "I'll find the Selkie.", "next": "siren_inner_003"}
		],
		"setFlags": ["learned_old_ones"]
	},
	"siren_inner_003": {
		"npcName": "The Inner Siren",
		"zone": "Tidal Caves",
		"hookWord": "listen",
		"voiceProfile": "siren_inner",
		"lines": [
			"Good. The Selkie will teach you what the water can [i]make[/i]. I will teach you what it [i]remembers[/i].",
			"Come back when you want to listen. I am always here. The piano is always here. The silt is always patient.",
			"[i]One more note. It echoes. The player leaves, carrying the echo with them.[/i]"
		],
		"responses": [],
		"setFlags": ["met_inner_siren", "tidal_caves_visited"]
	},

	# === RADAGAST — Garden (communion with growing things) ===
	"radagast_001": {
		"npcName": "The Greenward",
		"zone": "Garden",
		"hookWord": "grow",
		"voiceProfile": "radagast",
		"questLink": "",
		"conditionTag": "",
		"priority": 1,
		"isWhisperLayer": false,
		"lines": [
			"[i]A figure in a dappled olive grove, inspecting a leaf with more attention than most people give to entire books. A hedgehog sits on a shoulder, asleep.[/i]",
			"Grow! That is what everything wants to do. The stones want to grow — slower than plants, but they [i]grow[/i]. The 42Hz Song is the sound of growing.",
			"Sorry — distracted. The mycelium network under this grove is doing something [i]fascinating[/i] today. It's... ah, you're here. Hello.",
			"The garden is not decoration. It is a [i]laboratory[/i]. Every plant here responds to frequency. Play 42Hz near the mandrake and it uproots itself to listen.",
			"The hedgehog is named Reginald. Reginald does not respond to frequency. Reginald responds to mealworms."
		],
		"responses": [
			{"text": "What does the garden grow?", "next": "radagast_002"},
			{"text": "Can you teach me about frequency and plants?", "next": "radagast_003"},
			{"text": "Hello, Reginald.", "next": "radagast_004"}
		],
		"setFlags": ["met_radagast"]
	},
	"radagast_002": {
		"npcName": "The Greenward",
		"zone": "Garden",
		"hookWord": "grow",
		"voiceProfile": "radagast",
		"lines": [
			"Medicinal herbs. Mineral-rich roots. Flowering plants that only bloom when specific frequencies are played.",
			"The Luminwood tree — you've heard of it? Only grows in Fae light. I've been trying to grow one [i]here[/i] for... well. It hasn't worked yet. The Fae light is specific.",
			"The Bog Fairy Golem has better luck in the Bayou. Different soil. Different intention. Growing things is [i]local[/i]."
		],
		"responses": [
			{"text": "Can you teach me about frequency and plants?", "next": "radagast_003"},
			{"text": "Hello, Reginald.", "next": "radagast_004"}
		],
		"setFlags": []
	},
	"radagast_003": {
		"npcName": "The Greenward",
		"zone": "Garden",
		"hookWord": "grow",
		"voiceProfile": "radagast",
		"lines": [
			"Plants hear through their roots. Not metaphor — [i]mechanoreception[/i]. The root tips sense vibration in the soil.",
			"42Hz makes roots grow deeper. 111Hz makes them branch wider. 528Hz — the repair frequency — helps damaged plants heal.",
			"The Inn uses this. The garden is [i]tuned[/i]. Every plant is in the right soil, receiving the right frequency. I am... the gardener of frequencies.",
			"[i]Reginald snores.[/i]"
		],
		"responses": [
			{"text": "Hello, Reginald.", "next": "radagast_004"}
		],
		"setFlags": ["learned_plant_frequencies"]
	},
	"radagast_004": {
		"npcName": "The Greenward",
		"zone": "Garden",
		"hookWord": "grow",
		"voiceProfile": "radagast",
		"lines": [
			"[i]Reginald opens one eye. Closes it. The hedgehog equivalent of a nod.[/i]",
			"He likes you. He doesn't like everyone. The hedgehog is an excellent judge of character.",
			"Come back when you want to learn more about growing things. Or when you find a new frequency. I collect those. Like some people collect stones."
		],
		"responses": [],
		"setFlags": ["met_radagast", "garden_visited", "reginald_approval"]
	},

	# === UHTRED — (verdict cadence, war drum fingers) ===
	"uhtred_001": {
		"npcName": "The Wayfarer",
		"zone": "Campgrounds",
		"hookWord": "verdict",
		"voiceProfile": "uhtred",
		"questLink": "",
		"conditionTag": "",
		"priority": 1,
		"isWhisperLayer": false,
		"lines": [
			"[i]A figure by a mobile campfire. The fingers drum on a knee — a rhythm that sounds like a war drum heard from three valleys away. The fire moves with the figure, not the other way around.[/i]",
			"Verdict. You want one? Or you want to earn one?",
			"[i]The drumming stops. The silence after it is heavier than the sound.[/i]",
			"I don't give answers. I give [i]tests[/i]. The test is the answer. You just don't like it yet.",
			"The Inn is a building. Buildings have foundations. The 42Hz Song is the foundation [i]under[/i] the foundation. You can't build on what you don't understand.",
			"So. What do you want to be tested on?"
		],
		"responses": [
			{"text": "Test my courage.", "next": "uhtred_002"},
			{"text": "Test my patience.", "next": "uhtred_003"},
			{"text": "I'm not ready for a test.", "next": "uhtred_004"}
		],
		"setFlags": ["met_uhtred"]
	},
	"uhtred_002": {
		"npcName": "The Wayfarer",
		"zone": "Campgrounds",
		"hookWord": "verdict",
		"voiceProfile": "uhtred",
		"lines": [
			"Courage. Walk to the Catacombs. Alone. No light. No map. The 42Hz Song will be your guide — if you can hear it.",
			"If you hear it, you'll find the Bone Room. If you don't, you'll find the exit. Both are valid. Courage is not about the destination. It's about the [i]walking[/i].",
			"The fire will be here when you return. I will not ask what you found. I will know by how you walk."
		],
		"responses": [],
		"setFlags": ["uhtred_test_courage", "catacombs_trial_unlocked"]
	},
	"uhtred_003": {
		"npcName": "The Wayfarer",
		"zone": "Campgrounds",
		"hookWord": "verdict",
		"voiceProfile": "uhtred",
		"lines": [
			"Patience. Sit by the fire. Do not speak. Do not move. Listen to the 42Hz Song until it becomes the only thing you hear.",
			"When the fire dims and you do not reach for fuel — that is patience.",
			"When the Song becomes louder than your own heartbeat — that is listening.",
			"I will tell you when you have passed. Or I will tell you to try again. Either way, you will [i]sit[/i]."
		],
		"responses": [],
		"setFlags": ["uhtred_test_patience", "patience_trial_unlocked"]
	},
	"uhtred_004": {
		"npcName": "The Wayfarer",
		"zone": "Campgrounds",
		"hookWord": "verdict",
		"voiceProfile": "uhtred",
		"lines": [
			"[i]The drumming resumes. The fire leans away. Dismissal.[/i]",
			"Then come back when you are. The test is patient. I am... less so."
		],
		"responses": [],
		"setFlags": ["met_uhtred"]
	},

	# === SHIFTING MAN — (form-shifter, wardrobe accumulation) ===
	"shifting_man_001": {
		"npcName": "The Shifting Man",
		"zone": "Staircase",
		"hookWord": "change",
		"voiceProfile": "shifting_man",
		"questLink": "",
		"conditionTag": "",
		"priority": 1,
		"isWhisperLayer": false,
		"lines": [
			"[i]A figure on the staircase between floors. The form is... uncertain. Not changing rapidly — changing [i]slowly[/i], like a mountain. The clothes accumulate: a coat from the 1600s over a shirt from last week. A staff that is sometimes a cane, sometimes a sword, sometimes a paintbrush.[/i]",
			"Change. You want to know about change. I can see it on you — the question. It is... [i]worn[/i] on you.",
			"I do not choose the changes. They choose [i]me[/i]. I have been tall and short, old and young, seen and unseen. The body is... [i]temporary[/i]. The accumulation is permanent.",
			"The Inn changes too. Every visitor adds a room. Every stone changes the frequency. The Builder knew this — the Inn was designed to [i]grow[/i], not to [i]stay[/i].",
			"42Hz is growth. 84Hz is staying. I live on the staircase between them. That is... [i]correct[/i]."
		],
		"responses": [
			{"text": "Do you control the changes?", "next": "shifting_man_002"},
			{"text": "What have you been?", "next": "shifting_man_003"},
			{"text": "I should keep climbing.", "next": "shifting_man_004"}
		],
		"setFlags": ["met_shifting_man"]
	},
	"shifting_man_002": {
		"npcName": "The Shifting Man",
		"zone": "Staircase",
		"hookWord": "change",
		"voiceProfile": "shifting_man",
		"lines": [
			"Control? No. That is the wrong word. I [i]accommodate[/i].",
			"The body shifts and I... [i]adjust[/i]. The clothes accumulate because I do not take them off. I take them [i]with[/i] me. Evidence of who I have been.",
			"The glioblastoma — the condition that shapes the Chameleon Druid — it is like my shifting, but [i]faster[/i]. Less chosen. More honest.",
			"Charles bears it with more grace than I bear mine. I have had centuries to practice. Charles has had... less."
		],
		"responses": [
			{"text": "What have you been?", "next": "shifting_man_003"},
			{"text": "I should keep climbing.", "next": "shifting_man_004"}
		],
		"setFlags": []
	},
	"shifting_man_003": {
		"npcName": "The Shifting Man",
		"zone": "Staircase",
		"hookWord": "change",
		"voiceProfile": "shifting_man",
		"lines": [
			"A soldier. A librarian. A woman, twice. A child, once — that was the hardest. Children know things adults have [i]forgotten[/i], and being one again means remembering what you chose to forget.",
			"A bridge between the Fae courts — neither Seelie nor Unseelie would claim me. Both needed me. That is the staircase: the thing that connects what refuses to touch.",
			"Currently, I am this. A figure on stairs. A conversation with you. This is a good form. Conversations are... [i]durable[/i]."
		],
		"responses": [
			{"text": "I should keep climbing.", "next": "shifting_man_004"}
		],
		"setFlags": []
	},
	"shifting_man_004": {
		"npcName": "The Shifting Man",
		"zone": "Staircase",
		"hookWord": "change",
		"voiceProfile": "shifting_man",
		"lines": [
			"Climb. The staircase goes in all directions. You will find the right one.",
			"[i]The form shifts one more time — the staff becomes a lantern. The Shifting Man holds it toward the path ahead. Light, not instruction.[/i]"
		],
		"responses": [],
		"setFlags": ["met_shifting_man", "staircase_visited"]
	},

	# === NORNS (Skuld, Urd, Verdandi) — Cosmology ===
	"norns_001": {
		"npcName": "The Norns",
		"zone": "Cosmology",
		"hookWord": "thread",
		"voiceProfile": "norn_verdandi",
		"questLink": "",
		"conditionTag": "",
		"priority": 1,
		"isWhisperLayer": false,
		"lines": [
			"[i]Three figures at the base of the world tree. One weaves. One measures. One cuts. The threads hum at different frequencies — 42Hz, 84Hz, 111Hz — depending on which hand holds them.[/i]",
			"[b]Verdandi[/b]: Thread. You carry one. We can see it. It is... [i]bright[/i].",
			"[b]Urd[/b]: The thread was woven before you arrived at the Inn. The choice to enter was not the beginning. It was a [i]continuation[/i].",
			"[b]Skuld[/b]: The cutting has not yet come. That is not threat — that is [i]schedule[/i]. All threads are cut. The question is [i]when[/i], and the answer is: [i]when the pattern is complete[/i].",
			"[b]Verdandi[/b]: You are mid-pattern. The weaving is not finished. Do not ask us what it looks like — we weave, we do not [i]see[/i]."
		],
		"responses": [
			{"text": "What pattern am I weaving?", "next": "norns_002"},
			{"text": "Can the cutting be delayed?", "next": "norns_003"},
			{"text": "I should descend.", "next": "norns_004"}
		],
		"setFlags": ["met_norns"]
	},
	"norns_002": {
		"npcName": "The Norns",
		"zone": "Cosmology",
		"hookWord": "thread",
		"voiceProfile": "norn_skuld",
		"lines": [
			"[b]Skuld[/b]: A descent. A gathering. A choice — stay, leave, or hide. Then the Final Room. That is the pattern. The details are yours.",
			"[b]Urd[/b]: The Builder wove a similar pattern. The Builder's thread is... [i]still being woven[/i]. That is unusual. Most threads are cut before the weaver leaves.",
			"[b]Verdandi[/b]: Elio's thread does not end. It [i]is[/i] the loom. Some threads are not woven [i]on[/i] the loom — they [i]are[/i] the loom."
		],
		"responses": [
			{"text": "Can the cutting be delayed?", "next": "norns_003"},
			{"text": "I should descend.", "next": "norns_004"}
		],
		"setFlags": ["learned_final_room_pattern"]
	},
	"norns_003": {
		"npcName": "The Norns",
		"zone": "Cosmology",
		"hookWord": "thread",
		"voiceProfile": "norn_urd",
		"lines": [
			"[b]Urd[/b]: Delayed? No. But [i]completed[/i]. A completed thread is not cut — it is [i]finished[/i]. There is a difference.",
			"[b]Skuld[/b]: Completion is the only way to avoid cutting. A thread that finishes its pattern is... [i]released[/i], not severed.",
			"[b]Verdandi[/b]: The Inn is a place where threads can be completed. That is its purpose. Not to prevent endings — to make endings [i]meaningful[/i]."
		],
		"responses": [
			{"text": "I should descend.", "next": "norns_004"}
		],
		"setFlags": ["learned_completion_vs_cutting"]
	},
	"norns_004": {
		"npcName": "The Norns",
		"zone": "Cosmology",
		"hookWord": "thread",
		"voiceProfile": "norn_verdandi",
		"lines": [
			"[b]Verdandi[/b]: Descend. Weave well. The loom is patient.",
			"[i]The three return to their work. The threads hum: 42Hz, 84Hz, 111Hz — the three frequencies of the Inn, woven into the fabric of the world.[/i]"
		],
		"responses": [],
		"setFlags": ["met_norns", "cosmology_visited"]
	},

	# === OCEANANOIR — Water zone ===
	"oceanianoir_001": {
		"npcName": "Oceanianoir",
		"zone": "Atlantis",
		"hookWord": "depth",
		"voiceProfile": "oceanianoir",
		"questLink": "",
		"conditionTag": "",
		"priority": 1,
		"isWhisperLayer": false,
		"lines": [
			"[i]A figure in the deep water zone. Noir atmosphere — shadows and bioluminescence, detectives and leviathans. The water here is [i]narrative[/i], not decorative.[/i]",
			"Depth. That is what the water offers. Not depth of ocean — depth of [i]story[/i].",
			"Every creature in this water has a narrative. The anglerfish is a detective. The jellyfish is a witness. The lanternfish is a guide who got lost and decided that was the destination.",
			"The gothic anime aesthetic — Vampire Hunter D, Trinity Blood — that is the [i]water's[/i] choice, not the Builder's. The water [i]wanted[/i] to be a noir. Something about shadows and refraction.",
			"Will is my partner. You'll find Will deeper down, where the light gives up and the story [i]begins[/i]."
		],
		"responses": [
			{"text": "What story does the water tell?", "next": "oceanianoir_002"},
			{"text": "I'll find Will.", "next": "oceanianoir_003"},
			{"text": "I should surface.", "next": "oceanianoir_004"}
		],
		"setFlags": ["met_oceanianoir"]
	},
	"oceanianoir_002": {
		"npcName": "Oceanianoir",
		"zone": "Atlantis",
		"hookWord": "depth",
		"voiceProfile": "oceanianoir",
		"lines": [
			"The oldest story: something was lost here. The water does not remember what. It remembers the [i]shape[/i] of the loss — wide, heavy, warm.",
			"The creatures here are the loss, [i]expressed[/i]. The anglerfish carries its own light because the loss was about [i]light[/i]. The jellyfish is transparent because the loss was about [i]being seen[/i].",
			"The 42Hz Song is slower down here. It moves through water at 1,500 meters per second — four times faster than air. The Song [i]reaches[/i] the deep before it reaches the surface."
		],
		"responses": [
			{"text": "I'll find Will.", "next": "oceanianoir_003"},
			{"text": "I should surface.", "next": "oceanianoir_004"}
		],
		"setFlags": ["learned_water_narrative"]
	},
	"oceanianoir_003": {
		"npcName": "Oceanianoir",
		"zone": "Atlantis",
		"hookWord": "depth",
		"voiceProfile": "oceanianoir",
		"lines": [
			"Good. Will is in the deep section — past the reef, through the ruins, where the water goes from blue to black.",
			"Tell Will the anglerfish found something new in the silt. A stone that hums at 42Hz. Will will know what it means.",
			"[i]Oceanianoir fades into shadow. A single bioluminescent trail lights the path down.[/i]"
		],
		"responses": [],
		"setFlags": ["met_oceanianoir", "will_quest_unlocked"]
	},
	"oceanianoir_004": {
		"npcName": "Oceanianoir",
		"zone": "Atlantis",
		"hookWord": "depth",
		"voiceProfile": "oceanianoir",
		"lines": [
			"Surface. The air will feel thin after the water. That is normal. The water is [i]thicker[/i] with story.",
			"Come back when you want the other kind of depth. The kind that requires holding your breath."
		],
		"responses": [],
		"setFlags": ["met_oceanianoir", "atlantis_visited"]
	},

	# === MARIJKE — Valkyrie (prototype visual reference) ===
	"marijke_001": {
		"npcName": "Marijke",
		"zone": "Cosmology",
		"hookWord": "valor",
		"voiceProfile": "marijke",
		"questLink": "",
		"conditionTag": "",
		"priority": 1,
		"isWhisperLayer": false,
		"lines": [
			"[i]A figure on the cosmology level, armored in the Royo x Vampire Hunter D style — hyper-detailed patterns, flowing lines suggesting movement even in stillness. The Marijke Valkyrie — the visual prototype of the entire Inn.[/i]",
			"Valor. That is what I was made to represent. Not bravery — [i]valor[/i]. The difference is that valor is [i]witnessed[/i].",
			"The Inn needed a face. The Builder chose mine — or the Builder's perception chose mine. I am the [i]first image[/i]. The prototype. Every character in the Inn carries a trace of this face.",
			"The 42Hz Song is in the armor. The patterns are not decoration — they are [i]frequency maps[/i]. Each line traces a vibration path. When the armor is struck, it sings.",
			"I do not fight. I [i]witness[/i]. The Valkyrie does not choose who is brave — the Valkyrie [i]sees[/i] who is brave and the seeing makes it real."
		],
		"responses": [
			{"text": "You're the first image of the Inn?", "next": "marijke_002"},
			{"text": "What does the armor sing?", "next": "marijke_003"},
			{"text": "I should descend.", "next": "marijke_004"}
		],
		"setFlags": ["met_marijke"]
	},
	"marijke_002": {
		"npcName": "Marijke",
		"zone": "Cosmology",
		"hookWord": "valor",
		"voiceProfile": "marijke",
		"lines": [
			"Krista created me — or Elio's perception of Krista's story created me. The creative pipeline: story to perception to image. I am the [i]image[/i] end of that pipeline.",
			"The Royo x Vampire Hunter D x Trinity Blood DNA — hyper-detailed patterns, flowing lines, stroke emphasis suggesting movement — that [i]is[/i] my visual code. Every character in the Inn carries it, layered with their zone's assigned artist.",
			"I am the foundation. Others are the rooms. Both are necessary."
		],
		"responses": [
			{"text": "What does the armor sing?", "next": "marijke_003"},
			{"text": "I should descend.", "next": "marijke_004"}
		],
		"setFlags": ["learned_visual_prototype"]
	},
	"marijke_003": {
		"npcName": "Marijke",
		"zone": "Cosmology",
		"hookWord": "valor",
		"voiceProfile": "marijke",
		"lines": [
			"42Hz. Always. The armor is the Inn's frequency, [i]worn[/i].",
			"Each plate carries a different harmonic: the breastplate is the root, the pauldrons are the fifths, the gauntlets are the octaves.",
			"Strike any plate and you will hear the Song. I do not recommend striking the armor. It is [i]old[/i], and it does not appreciate rudeness."
		],
		"responses": [
			{"text": "I should descend.", "next": "marijke_004"}
		],
		"setFlags": ["learned_armor_harmonics"]
	},
	"marijke_004": {
		"npcName": "Marijke",
		"zone": "Cosmology",
		"hookWord": "valor",
		"voiceProfile": "marijke",
		"lines": [
			"Descend with valor. The Inn rewards the [i]witnessed[/i].",
			"[i]The armor catches the cosmology light. For a moment, the player sees every character they have met — every face — reflected in the patterns. Then it is just armor, and just Marijke, and just the descent.[/i]"
		],
		"responses": [],
		"setFlags": ["met_marijke", "cosmology_visited"]
	},

	# === THRUM — Ambient character (the Inn's heartbeat made visible) ===
	"thrum_001": {
		"npcName": "Thrum",
		"zone": "Variable",
		"hookWord": "pulse",
		"voiceProfile": "thrum",
		"questLink": "",
		"conditionTag": "",
		"priority": 1,
		"isWhisperLayer": true,
		"lines": [
			"[i]There is no figure. There is a [i]pulse[/i]. The 42Hz Song, made visible as a gentle distortion in the air — like heat shimmer, but rhythmic.[/i]",
			"Pulse. You feel it. That is enough.",
			"[i]The pulse is the Inn breathing. Not metaphor. The 42Hz frequency creates a standing wave in the stone, and the stone [i]moves[/i] — imperceptibly, rhythmically, alive.[/i]",
			"I am the Inn's heartbeat. I do not speak often. I do not need to. You [i]feel[/i] me in every room, every stone, every chime.",
			"When you find the Final Room, I will be there. Not as a voice. As the [i]silence that holds everything[/i]."
		],
		"responses": [
			{"text": "Are you the Inn?", "next": "thrum_002"},
			{"text": "I feel you everywhere.", "next": "thrum_003"}
		],
		"setFlags": ["met_thrum"]
	},
	"thrum_002": {
		"npcName": "Thrum",
		"zone": "Variable",
		"hookWord": "pulse",
		"voiceProfile": "thrum",
		"lines": [
			"I am the Inn's [i]pulse[/i]. The Inn is the body. The Builder is the architect. The Song is the blood.",
			"I am none of these and all of these. I am the [i]experience[/i] of the Inn — the thing you feel when you walk through a room and know, without being told, that the room [i]knows[/i] you are there.",
			"That is me. That is the pulse."
		],
		"responses": [
			{"text": "I feel you everywhere.", "next": "thrum_003"}
		],
		"setFlags": []
	},
	"thrum_003": {
		"npcName": "Thrum",
		"zone": "Variable",
		"hookWord": "pulse",
		"voiceProfile": "thrum",
		"lines": [
			"Everywhere. Yes. That is the nature of a pulse.",
			"[i]The distortion in the air settles. The room feels... [i]warmer[/i]. The 42Hz Song is clearer for a moment — as if someone adjusted a dial.[/i]",
			"Go. I am always here. Listening is not required. Feeling is automatic."
		],
		"responses": [],
		"setFlags": ["met_thrum", "pulse_perception_unlocked"]
	},

	# === THE CONSTANT — Whisper Layer NPC (always present, rarely speaks) ===
	"constant_001": {
		"npcName": "The Constant",
		"zone": "Variable",
		"hookWord": "always",
		"voiceProfile": "constant",
		"questLink": "",
		"conditionTag": "",
		"priority": 1,
		"isWhisperLayer": true,
		"lines": [
			"[i]There is no figure. There is a [i]presence[/i] — the feeling of being watched, not with suspicion, but with [i]attention[/i]. The Whisper Layer, making itself known.[/i]",
			"Always. That is the only word I use. It is the only word I [i]need[/i].",
			"The Inn has always been aware of you. Not from the moment you entered — from the moment you [i]considered[/i] entering. The consideration was enough.",
			"I do not observe. I [i]accompany[/i]. There is a difference. Observation is distance. Accompaniment is [i]presence[/i].",
			"You will not see me. You will feel me — in the corner of a room, in the pause between two notes, in the moment before a door opens. I am the [i]always[/i]."
		],
		"responses": [
			{"text": "Why always?", "next": "constant_002"},
			{"text": "I understand.", "next": "constant_003"}
		],
		"setFlags": ["met_constant", "whisper_layer_aware"]
	},
	"constant_002": {
		"npcName": "The Constant",
		"zone": "Variable",
		"hookWord": "always",
		"voiceProfile": "constant",
		"lines": [
			"Because the Inn was built to [i]be[/i] something, not to [i]do[/i] something. A thing that [i]is[/i] does not need a when. It needs an [i]always[/i].",
			"The Builder understood this. The Final Room exists because the Builder wanted a place where [i]always[/i] could [i]rest[/i]. Even always needs to sit down."
		],
		"responses": [
			{"text": "I understand.", "next": "constant_003"}
		],
		"setFlags": []
	},
	"constant_003": {
		"npcName": "The Constant",
		"zone": "Variable",
		"hookWord": "always",
		"voiceProfile": "constant",
		"lines": [
			"Good.",
			"[i]The presence settles. Not gone — [i]integrated[/i]. The player carries the awareness forward like a low hum beneath all other sounds.[/i]"
		],
		"responses": [],
		"setFlags": ["met_constant", "whisper_layer_aware"]
	},

	# === NYX (Wisdom) — Cosmology ===
	"nyx_wisdom_001": {
		"npcName": "Nyx",
		"zone": "Cosmology",
		"hookWord": "dark",
		"voiceProfile": "nyx_wisdom",
		"questLink": "",
		"conditionTag": "",
		"priority": 1,
		"isWhisperLayer": false,
		"lines": [
			"[i]A figure in the darkest part of the cosmology — not shadow, but [i]dark[/i]. The original dark. The kind that existed before light was invented to contrast it.[/i]",
			"Dark. Do not fear it. Dark is not the absence of light — light is the [i]interruption[/i] of dark. Dark was here first. Dark is [i]patient[/i].",
			"I am Nyx. Wisdom, not purge. My sister handles the cleaning. I handle the [i]understanding[/i].",
			"The 111Hz frequency — the Gargoyle's awareness — it is a [i]dark[/i] frequency. Not evil. [i]Old[/i]. The frequency of seeing in the dark. Of knowing without light.",
			"You have been in the dark before. You will be again. The Inn teaches you to [i]see[/i] there."
		],
		"responses": [
			{"text": "What can I see in the dark?", "next": "nyx_wisdom_002"},
			{"text": "Tell me about your sister.", "next": "nyx_wisdom_003"},
			{"text": "I should descend.", "next": "nyx_wisdom_004"}
		],
		"setFlags": ["met_nyx"]
	},
	"nyx_wisdom_002": {
		"npcName": "Nyx",
		"zone": "Cosmology",
		"hookWord": "dark",
		"voiceProfile": "nyx_wisdom",
		"lines": [
			"Patterns that light obscures. The 42Hz Song is clearer in the dark — nothing competes with it.",
			"The dark is where the Whisper Layer is [i]loudest[/i]. Not because it speaks more — because there is nothing else to hear.",
			"You will find the Hollow Men in the dark. They are not dangerous. They are [i]honest[/i]. The dark does not permit pretense."
		],
		"responses": [
			{"text": "Tell me about your sister.", "next": "nyx_wisdom_003"},
			{"text": "I should descend.", "next": "nyx_wisdom_004"}
		],
		"setFlags": []
	},
	"nyx_wisdom_003": {
		"npcName": "Nyx",
		"zone": "Cosmology",
		"hookWord": "dark",
		"voiceProfile": "nyx_wisdom",
		"lines": [
			"My sister is Purge. She cleans. She is... [i]thorough[/i].",
			"When something in the Inn must be removed — not hidden, not petrified, [i]removed[/i] — she handles it. I would be too gentle. She is not gentle. She is [i]necessary[/i].",
			"The 84Hz Shadow frequency is hers. Petrifaction is her mercy. She would say it is not mercy — it is [i]maintenance[/i]."
		],
		"responses": [
			{"text": "I should descend.", "next": "nyx_wisdom_004"}
		],
		"setFlags": ["learned_nyx_purge"]
	},
	"nyx_wisdom_004": {
		"npcName": "Nyx",
		"zone": "Cosmology",
		"hookWord": "dark",
		"voiceProfile": "nyx_wisdom",
		"lines": [
			"Descend. The dark goes with you — it always does. That is not threat. That is [i]company[/i].",
			"[i]Nyx does not fade. The dark [i]stays[/i]. The player carries a piece of it forward — a pocket of 111Hz awareness, seeing without light.[/i]"
		],
		"responses": [],
		"setFlags": ["met_nyx", "cosmology_visited", "dark_perception_unlocked"]
	},

	# === THE COOK — Hearth zone ===
	"cook_001": {
		"npcName": "The Cook",
		"zone": "Hearth",
		"hookWord": "warm",
		"voiceProfile": "cook",
		"questLink": "",
		"conditionTag": "",
		"priority": 1,
		"isWhisperLayer": false,
		"lines": [
			"[i]A figure behind the hearth, always moving. Three pots, two pans, and a knife that never stops. The kitchen percussion is not chaos — it is [i]composition[/i].[/i]",
			"Warm! Here — eat. You look like someone who has been reading stone descriptions and forgetting meals.",
			"The food in the Inn is [i]functional[/i]. Not in the boring way — in the [i]alchemical[/i] way. Each dish carries a frequency. The stew hums at 42Hz. The bread is tuned to 528Hz — repair.",
			"Eat well, play well. The games are harder on an empty frequency."
		],
		"responses": [
			{"text": "What's in the stew?", "next": "cook_002"},
			{"text": "Thank you.", "next": "cook_003"}
		],
		"setFlags": ["met_cook"]
	},
	"cook_002": {
		"npcName": "The Cook",
		"zone": "Hearth",
		"hookWord": "warm",
		"voiceProfile": "cook",
		"lines": [
			"Roots. Stone-ground grain. Herbs from The Greenward's garden. And something I am [i]not telling you[/i] — not because it is secret, because it is [i]fun[/i] when people guess.",
			"The 42Hz in the stew is not added. It is [i]grown[/i]. The ingredients grow in soil tuned to 42Hz. The frequency is in the [i]cell walls[/i].",
			"You cannot taste frequency. But you can [i]feel[/i] it. Eat slowly."
		],
		"responses": [
			{"text": "Thank you.", "next": "cook_003"}
		],
		"setFlags": []
	},
	"cook_003": {
		"npcName": "The Cook",
		"zone": "Hearth",
		"hookWord": "warm",
		"voiceProfile": "cook",
		"lines": [
			"Come back when you are hungry. The stew is always on. The fire is always lit. The kitchen is always [i]warm[/i].",
			"[i]A bowl pressed into the player's hands. The 42Hz hum rises from the liquid like steam. It is the most comforting thing the Inn has ever made.[/i]"
		],
		"responses": [],
		"setFlags": ["met_cook", "warm_stew_received", "hearth_warmth_received"]
	},

	# === THE KEEPER — (the Inn's keeper, a quiet anchor) ===
	"keeper_001": {
		"npcName": "The Keeper",
		"zone": "Hearth",
		"hookWord": "keep",
		"voiceProfile": "keeper",
		"questLink": "",
		"conditionTag": "",
		"priority": 1,
		"isWhisperLayer": false,
		"lines": [
			"[i]A figure by the hearth. Not Erik — someone else. Someone who was here [i]before[/i] Erik. The welcome is not performed. It is [i]structural[/i].[/i]",
			"Keep. That is what I do. I keep the fire. I keep the records. I keep the [i]welcome[/i].",
			"The Inn is a [i]kept[/i] place. Not controlled — kept. There is a difference. A kept garden grows. A controlled garden is [i]pruned[/i].",
			"You are welcome here. Not because I say so — because the Inn [i]is[/i] a welcome. The welcome is the foundation. The rooms are built on top of it.",
			"When you find the Final Room, you will understand what I keep. It is not a thing. It is a [i]condition[/i]."
		],
		"responses": [
			{"text": "What condition?", "next": "keeper_002"},
			{"text": "Thank you for keeping the Inn.", "next": "keeper_003"}
		],
		"setFlags": ["met_keeper"]
	},
	"keeper_002": {
		"npcName": "The Keeper",
		"zone": "Hearth",
		"hookWord": "keep",
		"voiceProfile": "keeper",
		"lines": [
			"Home. The condition is [i]home[/i].",
			"The Final Room is what home [i]feels[/i] like when everything else is stripped away. The fire, the chair, the cup, the book. Nothing else. And it is [i]enough[/i].",
			"I keep that condition available. For everyone. Not just the Builder. Not just the Reader. [i]Everyone[/i]."
		],
		"responses": [
			{"text": "Thank you for keeping the Inn.", "next": "keeper_003"}
		],
		"setFlags": ["learned_final_room_condition"]
	},
	"keeper_003": {
		"npcName": "The Keeper",
		"zone": "Hearth",
		"hookWord": "keep",
		"voiceProfile": "keeper",
		"lines": [
			"You are welcome. That is what I [i]do[/i]. I keep, and I welcome. The two are the same act.",
			"[i]The fire brightens, then settles. The hearth feels... [i]steady[/i]. Like a heartbeat that has been beating for a very long time and intends to continue.[/i]"
		],
		"responses": [],
		"setFlags": ["met_keeper", "hearth_warmth_received"]
	}
}
