/mob/living/carbon/human/species/lamia
	race = /datum/species/lamia

/datum/species/lamia
	name = "Lamia"
	id = "lamia"
	desc = "<b>Lamia (TEMPORARY)</b><br>\
	Snek."

	skin_tone_wording = "Tribal Heratige"

	species_traits = list(EYECOLOR,HAIR,FACEHAIR,LIPS,STUBBLE,OLDGREY)
	inherent_traits = list(TRAIT_NOMOBSWAP)
	default_features = MANDATORY_FEATURE_LIST
	use_skintones = 1
	skinned_type = /obj/item/stack/sheet/animalhide/human
	disliked_food = NONE
	liked_food = NONE
	possible_ages = ALL_AGES_LIST
	changesource_flags = MIRROR_BADMIN | WABBAJACK | MIRROR_MAGIC | MIRROR_PRIDE | ERT_SPAWN | RACE_SWAP | SLIME_EXTRACT
	limbs_icon_m = 'icons/roguetown/mob/bodies/m/mt.dmi'	//Change to new lamia sprite
	limbs_icon_f = 'icons/roguetown/mob/bodies/f/fm.dmi'	//Change to new lamia sprite
	dam_icon = 'icons/roguetown/mob/bodies/dam/dam_male.dmi'
	dam_icon_f = 'icons/roguetown/mob/bodies/dam/dam_female.dmi'
	soundpack_m = /datum/voicepack/male/elf		//Possibly change soundpack, not sure its needed
	soundpack_f = /datum/voicepack/female/elf	//Possibly change soundpack, not sure its needed
	offset_features = list(		//Offsets in position, may need changed for lamia tail
		OFFSET_ID = list(0,1), OFFSET_GLOVES = list(0,1), OFFSET_WRISTS = list(0,1),\
		OFFSET_CLOAK = list(0,1), OFFSET_FACEMASK = list(0,1), OFFSET_HEAD = list(0,1), \
		OFFSET_FACE = list(0,1), OFFSET_BELT = list(0,1), OFFSET_BACK = list(0,1), \
		OFFSET_NECK = list(0,1), OFFSET_MOUTH = list(0,1), OFFSET_PANTS = list(0,0), \
		OFFSET_SHIRT = list(0,1), OFFSET_ARMOR = list(0,1), OFFSET_HANDS = list(0,1), OFFSET_UNDIES = list(0,1), \
		OFFSET_ID_F = list(0,-1), OFFSET_GLOVES_F = list(0,0), OFFSET_WRISTS_F = list(0,0), OFFSET_HANDS_F = list(0,0), \
		OFFSET_CLOAK_F = list(0,0), OFFSET_FACEMASK_F = list(0,-1), OFFSET_HEAD_F = list(0,-1), \
		OFFSET_FACE_F = list(0,-1), OFFSET_BELT_F = list(0,0), OFFSET_BACK_F = list(0,-1), \
		OFFSET_NECK_F = list(0,-1), OFFSET_MOUTH_F = list(0,-1), OFFSET_PANTS_F = list(0,0), \
		OFFSET_SHIRT_F = list(0,0), OFFSET_ARMOR_F = list(0,0), OFFSET_UNDIES_F = list(0,0), \
		)
	specstats = list(	//Rebalance stats
		"strength" = 0,
		"perception" = 1,
		"intelligence" = 2,
		"constitution" = -2,
		"endurance" = 1,
		"speed" = 0,
		"fortune" = -1
		)
	enflamed_icon = "widefire"

	//ORGAN LIST REMOVED DUE TO BEING DEFAULT HUMAN

	bodypart_features = list(
		/datum/bodypart_feature/hair/head,
		/datum/bodypart_feature/hair/facial,
	)
	customizers = list(
		/datum/customizer/organ/eyes/humanoid,
		/datum/customizer/bodypart_feature/hair/head/humanoid,
		/datum/customizer/bodypart_feature/hair/facial/humanoid,
		/datum/customizer/bodypart_feature/accessory,
		/datum/customizer/bodypart_feature/face_detail,
		/datum/customizer/organ/testicles/human,
		/datum/customizer/organ/penis/human,
		/datum/customizer/organ/breasts/human,
		/datum/customizer/organ/vagina/human,
		/*/datum/customizer/organ/tail/lamia,*/
		)
	body_markings = list(
		/datum/body_marking/tonage,
	)
	languages = list(
		/datum/language/common,
		//Put snek language here
	)

/datum/species/lamia/on_species_gain(mob/living/carbon/C, datum/species/old_species)
	..()
	RegisterSignal(C, COMSIG_MOB_SAY, PROC_REF(handle_speech))

/datum/species/lamia/after_creation(mob/living/carbon/C)
	..()
	to_chat(C, "<span class='info'>I can speak (LAMIA LANGUAGE) with ,s before my speech.</span>")

/datum/species/lamia/on_species_loss(mob/living/carbon/C)
	. = ..()
	UnregisterSignal(C, COMSIG_MOB_SAY)

/datum/species/lamia/qualifies_for_rank(rank, list/features)
	return TRUE

/datum/species/lamia/get_skin_list()
	return list(	//Change to tribal heratiges
		"Castillian" = SKIN_COLOR_CASTILLIAN,
		"Mysterious" = SKIN_COLOR_MYSTERIOUS,
		"Succubus" = SKIN_COLOR_SUCCUBUS,
		"Incubus" = SKIN_COLOR_INCUBUS,
		"Mephistopheles" = SKIN_COLOR_MEPHISTOPHELES,
		"Zariel" = SKIN_COLOR_ZARIEL,
		"Dispater" = SKIN_COLOR_DISPATER,
	)

/datum/species/lamia/get_hairc_list()
	return sortList(list(
	"black - oil" = "181a1d",
	"black - cave" = "201616",
	"black - rogue" = "2b201b",
	"black - midnight" = "1d1b2b"
	))

/datum/species/lamia/random_name(gender,unique,lastname)

	var/randname
	if(unique)
		if(gender == MALE)
			for(var/i in 1 to 10)
				randname = pick( world.file2list("strings/rt/names/other/tiefm.txt") )
				if(!findname(randname))
					break
		if(gender == FEMALE)
			for(var/i in 1 to 10)
				randname = pick( world.file2list("strings/rt/names/other/tieff.txt") )
				if(!findname(randname))
					break
	else
		if(gender == MALE)
			randname = pick( world.file2list("strings/rt/names/other/tiefm.txt") )
		if(gender == FEMALE)
			randname = pick( world.file2list("strings/rt/names/other/tieff.txt") )
	return randname

/datum/species/lamia/random_surname()
	return " [pick(world.file2list("strings/rt/names/other/tieflast.txt"))]"
/* Commenting out Spanish Tieflings for now.
//Groups of Accents for each race set by associated 'skin_tone', see 'get_skin_list' above
// "full" group in JSON lists
/datum/species/lamia/get_accent(mob/living/carbon/human/H)
		switch(H.skin_tone)
				if(SKIN_COLOR_CASTILLIAN)
						return strings("spanish_replacement.json", "full")
		return null

// "start" group in JSON lists
/datum/species/lamia/get_accent_start(mob/living/carbon/human/H)
		switch(H.skin_tone)
				if(SKIN_COLOR_CASTILLIAN)
						return strings("spanish_replacement.json", "start")
		return null

// "end" group in JSON lists
/datum/species/lamia/get_accent_end(mob/living/carbon/human/H)
		switch(H.skin_tone)
				if(SKIN_COLOR_CASTILLIAN)
						return strings("spanish_replacement.json", "end")
		return null

// "syllable" group in JSON lists
/datum/species/lamia/get_accent_any(mob/living/carbon/human/H)
		switch(H.skin_tone)
				if(SKIN_COLOR_CASTILLIAN)
						return strings("spanish_replacement.json", "syllable")
		return null
*/
