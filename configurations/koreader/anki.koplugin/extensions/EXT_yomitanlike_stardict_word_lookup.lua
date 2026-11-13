-- This is a required extension for anki.koplugin (https://github.com/Ajatt-Tools/anki.koplugin)
-- when using a dictionary that inverts word / reading, such as
-- https://github.com/UnexpectedTiramisu/immersionkit-jp-yomitanlike-jmdict-stardict

local conf = require("anki_configuration")

local YomitanlikeStardictWordLookup = {
    description = "Use the dictionary headword for Yomitan-like Stardict entries where kanji and kana parsing are reversed.",
    reading_field = "Kana",
}

function YomitanlikeStardictWordLookup:run(note)
    if not self.popup_dict.is_extended then
        self.popup_dict.results = require("langsupport/ja/dictwrapper").extend_dictionaries(self.popup_dict.results, self.conf)
        self.popup_dict.is_extended = true
    end
    local selected = self.popup_dict.results[self.popup_dict.dict_index]

    -- this is an unclean solution for a stardict in which the formatting of headwords is reversed.
    -- example: 溶かす【とかす】instead of the "normal" とかす【溶かす】
    -- it uses the kana selection for the kanji, and the kanji selection for the kana.
    -- meh.
    local parsed_word = selected:get_kana_words()[1]
    local parsed_reading = selected:get_kanji_words()[1]

    if parsed_word then
        note.fields[conf.word_field:get_value()] = parsed_word
    end
    if parsed_reading and self.reading_field and self.reading_field ~= "" then
        note.fields[self.reading_field] = parsed_reading
    end
    return note
end

return YomitanlikeStardictWordLookup
