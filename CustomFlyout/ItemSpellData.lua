local ADDON, T = ...
local L = {}

T.DB = {}

T.DB.conjureSpellItemMap = { -- number or {talentTabIndex, talentTalentIndex, idrank1, idrank2, ...}, GetTalentInfo
	-- mage
	[587]   = 5349,
	[5504]  = 5350,
	[6129]  = 1487,
	[10144] = 8075,
	[990]   = 1114,
	[6127]  = 3772,
	[10054] = 8008,
	[597]   = 1113,
	[3552]  = 5513,
	[5506 ] = 2136,
	[10053] = 8007,
	[10145] = 8076,
	[5505]  = 2288,
	[759]   = 5514,
	[10138] = 8077,
	[10139] = 8078,
	[27101] = 22044,
	[33717] = 22019,
	[28612] = 22895,
	[27090] = 22018,
	[10140] = 8079,
	[37420] = 30703,
	-- warlock 
	[27250] = 22128,
	[28172] = 22646,
	[6366]  = 1254,
	[2362]  = 5522,
	[17728] = 13603,
	[17953] = 13701,
	[20752] = 16892,
	[17951] = 13699,
	[20756] = 16895, 
	[17727] = 13602, 
	[693]   = 5232, 
	[17952] = 13700, 
	[20757] = 16896,
	[20755] = 16893,
	[27238] = 22116,
	-- warlock hs
	[6201]  = {2, 1, 5512, 19004, 19005},
	[6202]  = {2, 1, 5511, 19006, 19007},
	[5699]  = {2, 1, 5509, 19008, 19009},
	[11729] = {2, 1, 5510, 19010, 19011},
	[11730] = {2, 1, 9421, 19012, 19013},
	[27230] = {2, 1, 22103, 22104, 22105},
}

T.DB.conjure = {
	"Conjure Water",
	"Conjure Food",
	"Conjure Mana Ruby",
	"Conjure Mana Citrine",
	"Conjure Mana Agate",
	"Conjure Mana Jade",
	"Create Healthstone",
	"Create Soulstone",
	"Create Firstone",
	"Create Spellstone",
}

T.DB.spells = {
	["profession"]= {"Alchemy", "Blacksmithing", "Enchanting", "Disenchant", "Engineering", "Leatherworking", "Smelting", "Tailoring", "Jewelcrafting", "Prospecting", "Cooking", "First Aid", "Poisons", "Pick lock"},
	["portal"]= {"Portal: Shattrath", "Portal: Orgrimmar", "Portal: Undercity", "Portal: Thunder Bluff", "Portal: Silvermoon", "Portal: Stonard", "Portal: Stormwind", "Portal: Darnassus", "Portal: Ironforge", "Portal: Exodar", "Portal: Theramore"},
	["teleport"]= {"Teleport: Shattrath", "Teleport: Orgrimmar", "Teleport: Undercity", "Teleport: Thunder Bluff", "Teleport: Silvermoon", "Teleport: Stonard", "Teleport: Stormwind", "Teleport: Darnassus", "Teleport: Ironforge", "Teleport: Exodar", "Teleport: Theramore"},
	["warlockpet"]= {"Summon Imp", "Summon Voidwalker", "Summon Succubus", "Summon Felhunter", "Inferno", "Ritual of Doom", "Enslave Demon"},
	["trap"]= {"Freezing Trap", "Frost Trap", "Immolation Trap", "Explosive Trap", "Snake Trap"},
	["track"]= {"Find Herbs", "Find Minerals", "Find Fish", "Track Humanoids", "Track Beasts", "Track Demons", "Track Undead", "Track Dragonkin", "Track Elementals", "Track Giants", "Track Hidden", "Sense Demons"},
	["aspect"]= {"Aspect of the Hawk", "Aspect of the Monkey", "Aspect of the Pack", "Aspect of the Cheetah", "Aspect of the Viper", "Aspect of the Beast", "Aspect of the Wild"},
	["totem_air"]= {"Windfury Totem", "Grace of Air Totem", "Wrath of Air Totem", "Nature Resistance Totem", "Windwall Totem", "Grounding Totem", "Sentry Totem", "Tranquil Air Totem"},
	["totem_earth"]= {"Strength of Earth Totem", "Stoneskin Totem", "Stoneclaw Totem", "Earthbind Totem", "Tremor Totem"},
	["totem_fire"]= {"Totem of Wrath", "Searing Totem", "Frost Resistance Totem", "Fire Nova Totem", "Magma Totem", "Flametongue Totem"},
	["totem_water"]= {"Healing Stream Totem", "Mana Spring Totem", "Fire Resistance Totem", "Mana Tide Totem", "Disease Cleansing Totem", "Poison Cleansing Totem"},
}

T.DB.item_ench_temp = { --https://tbc.wowhead.com/items/consumables/item-enhancements-temporary
	[20748] = true, -- Brilliant Mana Oil
	[20749] = true, -- Brilliant Wizard Oil
	[22522] = true, -- Superior Wizard Oil
	[28421] = true, -- Adamantite Weightstone
	[18262] = true, -- Elemental Sharpening Stone
	[3829]  = true, -- Frost Oil
	[20750] = true, -- Wizard Oil
	[6533]  = true, -- Aquadynamic Fish Attractor
	[22521] = true, -- Superior Mana Oil
	[25679] = true, -- Comfortable Insoles
	[3824]  = true, -- Shadow Oil
	[23529] = true, -- Adamantite Sharpening Stone
	[12643] = true, -- Dense Weightstone
	[12404] = true, -- Dense Sharpening Stone
	[6532 ] = true, -- Bright Baubles
	[20747] = true, -- Lesser Mana Oil
	[6530]  = true, -- Nightcrawlers
	[2863]  = true, -- Coarse Sharpening Stone
	[34861] = true, -- Sharpened Fish Hook
	[2862]  = true, -- Rough Sharpening Stone
	[23576] = true, -- Greater Ward of Shielding
	[21927] = true, -- Instant Poison VII
	[22054] = true, -- Deadly Poison VII
	[6529]  = true, -- Shiny Bauble
	[25521] = true, -- Greater Rune of Warding
	[20746] = true, -- Lesser Wizard Oil
	[28420] = true, -- Fel Weightstone
	[23123] = true, -- Blessed Wizard Oil
	[23575] = true, -- Lesser Ward of Shielding
	[23559] = true, -- Lesser Rune of Warding
	[22053] = true, -- Deadly Poison VI
	[23122] = true, -- Consecrated Sharpening Stone
	[2892]  = true, -- Deadly Poison
	[6947]  = true, -- Instant Poison
	[23528] = true, -- Fel Sharpening Stone
	[2871]  = true, -- Heavy Sharpening Stone
	[8927]  = true, -- Instant Poison V
	[20744] = true, -- Minor Wizard Oil
	[34538] = true, -- Blessed Weapon Coating
	[34539] = true, -- Righteous Weapon Coating
	[3241]  = true, -- Heavy Weightstone
	[6811]  = true, -- Aquadynamic Fish Lens
	[9186]  = true, -- Mind-numbing Poison III
	[3240]  = true, -- Coarse Weightstone
	[8928]  = true, -- Instant Poison VI
	[3776]  = true, -- Crippling Poison II
	[8926]  = true, -- Instant Poison IV
	[6949]  = true, -- Instant Poison II
	[10918] = true, -- Wound Poison
	[3239]  = true, -- Rough Weightstone
	[20748] = true, -- Brilliant Mana Oil
	[20749] = true, -- Brilliant Wizard Oil
	[22522] = true, -- Superior Wizard Oil
	[28421] = true, -- Adamantite Weightstone
	[18262] = true, -- Elemental Sharpening Stone
	[3829]  = true, -- Frost Oil
	[20750] = true, -- Wizard Oil
	[6533]  = true, -- Aquadynamic Fish Attractor
	[22521] = true, -- Superior Mana Oil
	[25679] = true, -- Comfortable Insoles
	[3824]  = true, -- Shadow Oil
	[23529] = true, -- Adamantite Sharpening Stone
	[12643] = true, -- Dense Weightstone
	[12404] = true, -- Dense Sharpening Stone
	[6532]  = true, -- Bright Baubles
	[20747] = true, -- Lesser Mana Oil
	[6530]  = true, -- Nightcrawlers
	[2863]  = true, -- Coarse Sharpening Stone
	[34861] = true, -- Sharpened Fish Hook
	[2862]  = true, -- Rough Sharpening Stone
	[23576] = true, -- Greater Ward of Shielding
	[21927] = true, -- Instant Poison VII
	[22054] = true, -- Deadly Poison VII
	[6529]  = true, -- Shiny Bauble
	[25521] = true, -- Greater Rune of Warding
	[20746] = true, -- Lesser Wizard Oil
	[28420] = true, -- Fel Weightstone
	[23123] = true, -- Blessed Wizard Oil
	[23575] = true, -- Lesser Ward of Shielding
	[23559] = true, -- Lesser Rune of Warding
	[22053] = true, -- Deadly Poison VI
	[23122] = true, -- Consecrated Sharpening Stone
	[2892]  = true, -- Deadly Poison
	[6947]  = true, -- Instant Poison
	[23528] = true, -- Fel Sharpening Stone
	[2871]  = true, -- Heavy Sharpening Stone
	[8927]  = true, -- Instant Poison V
	[20744] = true, -- Minor Wizard Oil
	[34538] = true, -- Blessed Weapon Coating
	[34539] = true, -- Righteous Weapon Coating
	[3241]  = true, -- Heavy Weightstone
	[6811]  = true, -- Aquadynamic Fish Lens
	[9186]  = true, -- Mind-numbing Poison III
	[3240]  = true, -- Coarse Weightstone
	[8928]  = true, -- Instant Poison VI
	[3776]  = true, -- Crippling Poison II
	[8926]  = true, -- Instant Poison IV
	[6949]  = true, -- Instant Poison II
	[10918] = true, -- Wound Poison
	[3239]  = true, -- Rough Weightstone
	[7307]  = true, -- Flesh Eating Worm
	[20844] = true, -- Deadly Poison V
	[21835] = true, -- Anesthetic Poison
	[31535] = true, -- Bloodboil Poison
	[8985]  = true, -- Deadly Poison IV
	[5237]  = true, -- Mind-numbing Poison
	[7964]  = true, -- Solid Sharpening Stone
	[7965]  = true, -- Solid Weightstone
	[8984]  = true, -- Deadly Poison III
	[10921] = true, -- Wound Poison III
	[2893]  = true, -- Deadly Poison II
	[10920] = true, -- Wound Poison II
	[22055] = true, -- Wound Poison V
	[35713] = true, -- Ninja Hook [PH]
	[10922] = true, -- Wound Poison IV
	[3775]  = true, -- Crippling Poison
	[20745] = true, -- Minor Mana Oil
	[5654]  = true, -- Instant Toxin
	[6950]  = true, -- Instant Poison III
	[6951]  = true, -- Mind-numbing Poison II
}



