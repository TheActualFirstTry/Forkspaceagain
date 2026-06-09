SMODS.Challenge {
    key = 'shopping',
    rules = {
        custom = { { id = 'no_interest' }, { id = 'no_extra_hand_money' }, { id = 'no_reward' } },
        modifiers = { { id = 'joker_slots', value = 4 }, },
    },
    jokers = {
        { id = 'j_star_shard', edition = 'negative' },
        { id = 'j_credit_card' }
    },
    restrictions = {
        banned_cards = {
            { id = 'v_seed_money' }, { id = 'v_money_tree' }, { id = 'j_to_the_moon' },
            { id = 'j_rocket' }, { id = 'j_golden' }, { id = 'j_satellite' } },
        banned_tags = { { id = 'tag_investment' }, }
    },
}

SMODS.Challenge {
    key = 'foley',
    rules = {
        modifiers = { { id = 'discards', value = 6 } } },
    jokers = {
        { id = 'j_star_weathergirl', eternal = true }, { id = 'j_certificate', eternal = true, edition = 'negative' }
    },
    deck = {
        type = 'Challenge Deck',
        no_ranks = {
            J = true,
            Q = true,
            K = true,
        }
    }
}

SMODS.Challenge {
    key = 'order',
    rules = {
        custom = { { id = 'all_common' } },
        modifiers = { { id = 'joker_slots', value = 8 } } },
    apply = function(self)
        for k in pairs(SMODS.Rarities) do
            if k ~= "Common" then
                G.GAME[k:lower() .. "_mod"] = 0
            end
        end
    end,
    restrictions = {
        banned_cards = { { id = 'c_wraith' }, { id = 'c_soul' }, { id = 'c_star_starspace' } },
        banned_tags = { { id = 'tag_rare' }, { id = 'tag_uncommon' } }
    },
}
