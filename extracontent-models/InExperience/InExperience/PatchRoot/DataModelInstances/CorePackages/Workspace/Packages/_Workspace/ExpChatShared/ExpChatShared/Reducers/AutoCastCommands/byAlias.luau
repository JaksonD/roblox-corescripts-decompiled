local l_script_FirstAncestor_0 = script:FindFirstAncestor("ExpChatShared");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.Rodux);
local l_Dictionary_0 = require(l_Parent_0.llama).Dictionary;
local l_Commands_0 = l_script_FirstAncestor_0.Commands;
local v5 = require(l_Commands_0.Whisper.RBXWhisperCommand);
local v6 = require(l_Commands_0.RBXTeamCommand);
local l_Actions_0 = l_script_FirstAncestor_0.Actions;
local v8 = require(l_Actions_0.CommandAliasChanged);
local v9 = {
    RBXWhisperCommand = {
        primaryAlias = v5.alias[1], 
        secondaryAlias = v5.alias[2]
    }, 
    RBXTeamCommand = {
        primaryAlias = v6.alias[1], 
        secondaryAlias = v6.alias[2]
    }
};
return v2.createReducer(v9, {
    [v8.name] = function(v10, v11) --[[ Line: 25 ]]
        -- upvalues: l_Dictionary_0 (copy)
        return l_Dictionary_0.join(v10, {
            [v11.name] = {
                primaryAlias = v11.primaryAlias, 
                secondaryAlias = v11.secondaryAlias
            }
        });
    end
});