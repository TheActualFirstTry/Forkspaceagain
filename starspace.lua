STAR_UTIL = {}

assert(SMODS.load_file('lib/definitions.lua'))()
assert(SMODS.load_file('lib/utilities.lua'))()
assert(SMODS.load_file('lib/hooks.lua'))()
assert(SMODS.load_file('lib/ui.lua'))()

-- placeholder atlas
SMODS.Atlas {
  key = "placeholder",
  path = "placeholder.png",
  px = 71, py = 95
}

-- consumable atlas
SMODS.Atlas {
  key = "consumables",
  path = "consumables.png",
  px = 71, py = 95
}

-- deck atlas
SMODS.Atlas {
  key = "decks",
  path = "decks.png",
  px = 71, py = 95
}

-- joker atlas
SMODS.Atlas {
  key = "jokers",
  path = "jokers.png",
  px = 71, py = 95
}

-- rank atlas
SMODS.Atlas {
  key = "ranks_lc",
  path = "ranks_lc.png",
  px = 71, py = 95
}

STAR_UTIL.load_items(STAR_UTIL.enabled_commons, 'content/jokers/common')
STAR_UTIL.load_items(STAR_UTIL.enabled_uncommons, 'content/jokers/uncommon')
STAR_UTIL.load_items(STAR_UTIL.enabled_rares, 'content/jokers/rare')
STAR_UTIL.load_items(STAR_UTIL.enabled_legendaries, 'content/jokers/legendary')
STAR_UTIL.load_items(STAR_UTIL.enabled_galaxies, 'content/jokers/galaxy')
STAR_UTIL.load_items(STAR_UTIL.enabled_consumables, 'content/consumables')
STAR_UTIL.load_items(STAR_UTIL.enabled_decks, 'content/decks')
STAR_UTIL.load_items(STAR_UTIL.enabled_hands, 'content/pokerhands')
STAR_UTIL.load_items(STAR_UTIL.enabled_modifiers, 'content/modifiers')
STAR_UTIL.load_items(STAR_UTIL.enabled_quips, 'content/quips')
STAR_UTIL.load_items(STAR_UTIL.enabled_vouchers, 'content/vouchers')

for modid, jokerlist in pairs(STAR_UTIL.enabled_crossmod) do
    if next(SMODS.find_mod(modid)) then
        STAR_UTIL.load_items(jokerlist, "content/jokers/crossmod/" .. modid)
    end
end
