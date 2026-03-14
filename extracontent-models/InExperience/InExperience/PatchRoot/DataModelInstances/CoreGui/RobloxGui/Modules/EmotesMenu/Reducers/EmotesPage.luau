local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Packages.Cryo);
local v2 = require(l_CorePackages_0.Packages.Rodux);
local l_Actions_0 = script.Parent.Parent.Actions;
local v4 = require(l_Actions_0.EmotesChanged);
local v5 = require(l_Actions_0.EquippedEmotesChanged);
local v6 = require(l_Actions_0.NumberEmotesLoadedChanged);
local v7 = {
    emotesInfo = {}, 
    equippedEmotes = {}, 
    numberEmotesLoaded = -1, 
    currentEmotes = {}
};
local function v15(v8, v9) --[[ Line: 24 ]] --[[ Name: createCurrentEmotes ]]
    local v10 = {};
    for _, v12 in ipairs(v9) do
        local l_Slot_0 = v12.Slot;
        local l_Name_0 = v12.Name;
        if l_Slot_0 and l_Name_0 and v8[l_Name_0] then
            v10[l_Slot_0] = l_Name_0;
        end;
    end;
    return v10;
end;
return v2.createReducer(v7, {
    [v4.name] = function(v16, v17) --[[ Line: 42 ]]
        -- upvalues: v1 (copy), v15 (copy)
        return v1.Dictionary.join(v16, {
            emotesInfo = v17.emotes, 
            currentEmotes = v15(v17.emotes, v16.equippedEmotes)
        });
    end, 
    [v5.name] = function(v18, v19) --[[ Line: 49 ]]
        -- upvalues: v1 (copy), v15 (copy)
        return v1.Dictionary.join(v18, {
            equippedEmotes = v19.equippedEmotes, 
            currentEmotes = v15(v18.emotesInfo, v19.equippedEmotes)
        });
    end, 
    [v6.name] = function(v20, v21) --[[ Line: 56 ]]
        -- upvalues: v1 (copy)
        return v1.Dictionary.join(v20, {
            numberEmotesLoaded = v21.numberEmotesLoaded
        });
    end
});