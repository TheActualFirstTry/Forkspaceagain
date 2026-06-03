SMODS.Challenge {
    key = 'shopping',
    rules = {
        custom = {
            { id = 'no_interest' },
            { id = 'no_extra_hand_money' },
            { id = 'no_reward' }
        },
        modifiers = {
            { id = 'joker_slots', value = 4 },
        },
    },

    jokers = {
        { id = 'j_star_shard', edition = 'negative' },
        { id = 'j_credit_card' }
    },
    restrictions = {
        banned_cards = {
            { id = 'v_seed_money' },
            { id = 'v_money_tree' },
            { id = 'j_to_the_moon' },
            { id = 'j_rocket' },
            { id = 'j_golden' },
            { id = 'j_satellite' },
        },
        banned_tags = {
            { id = 'tag_investment' },
        }
    },
}
