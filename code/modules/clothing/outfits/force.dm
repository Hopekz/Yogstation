// occupying force clothing
/obj/item/clothing/under/rank/security/grey/ocpforce
	name = "ocuppying force jumpsuit"

/obj/item/clothing/head/beret/sec/ocpforce_baret
	name = "occupying commander beret"
	desc = "A special white beret for the mundane life of a occupying commander."
	icon = 'yogstation/icons/obj/clothing/hats.dmi'
	alternate_worn_icon = 'yogstation/icons/mob/head.dmi'
	icon_state = "beret_ce"


// occupying force vest loadouts
// To note: each vest has 7 normal slots - Hopek
/obj/item/storage/belt/military/ocpforce/ComponentInitialize() // Occupying force
	. = ..()
	new /obj/item/ammo_box/magazine/wt550m9(src)
	new /obj/item/ammo_box/magazine/wt550m9(src)
	new /obj/item/reagent_containers/hypospray/medipen(src)
	new /obj/item/flashlight/flare(src)
	new /obj/item/restraints/handcuffs(src)
	new /obj/item/restraints/handcuffs/cable/zipties(src)
	new /obj/item/jawsoflife/jimmy(src)


/datum/outfit/ocpforce
	name = "Occupying force"

	uniform = /obj/item/clothing/under/rank/security/grey/amber
	suit = /obj/item/clothing/suit/armor/vest
	shoes = /obj/item/clothing/shoes/jackboots // make a knife variant
	gloves = /obj/item/clothing/gloves/color/black 
	ears = /obj/item/radio/headset/headset_cent/alt
	mask = /obj/item/clothing/mask/breath/tactical
	belt = /obj/item/storage/belt/military/amber
	suit_store = /obj/item/gun/ballistic/automatic/wt550
	head = /obj/item/clothing/head/helmet/sec // make flashlight version
	l_pocket = /obj/item/flashlight/seclite
	id = /obj/item/card/id/centcom // non removable ID
	implants = list(/obj/item/implant/mindshield)



/datum/outfit/ocpforce/post_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	if(visualsOnly)
		return

	H.facial_hair_style = "None" // Everyone in the occupying force is bald and has no facial hair
	H.hair_style = "None"

	var/obj/item/radio/R = H.ears
	R.set_frequency(FREQ_CENTCOM)
	R.freqlock = TRUE

	var/obj/item/clothing/mask/bandana/durathread/D = new /obj/item/clothing/mask/bandana/durathread(src)
	D.AltClick(H)

	var/obj/item/card/id/W = H.wear_id
	W.icon_state = "centcom"
	W.registered_name = "Unknown"
	W.assignment = "Amber Task Force"
	W.update_label(W.registered_name, W.assignment)

	H.ignores_capitalism = TRUE // Yogs -- Lets the Amber force buy a damned smoke for christ's sake


/datum/outfit/amber/ocpforce/commander
	name = "Occupying Force Commander"
	head = /obj/item/clothing/head/beret/corpsec/amber_commander
	belt = /obj/item/storage/belt/military/amber_commander
	r_pocket = /obj/item/clothing/mask/breath/tactical
	mask = /obj/item/clothing/mask/cigarette/cigar/cohiba
	glasses = /obj/item/clothing/glasses/hud/security

