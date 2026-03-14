local l_script_FirstAncestor_0 = script:FindFirstAncestor("ExpChatShared");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.Rodux);
local v3 = require(l_script_FirstAncestor_0.Actions.LocalCharacterLoaded);
return v2.createReducer(nil, {
    [v3.name] = function(_, v5) --[[ Line: 8 ]]
        return v5.character;
    end
});