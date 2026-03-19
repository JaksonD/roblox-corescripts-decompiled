local l_script_FirstAncestor_0 = script:FindFirstAncestor("ExpChat");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local l_Dictionary_0 = require(l_Parent_0.llama).Dictionary;
local l_None_0 = require(l_Parent_0.llama).None;
local v4 = require(l_Parent_0.Rodux);
local l_Actions_0 = l_script_FirstAncestor_0.Actions;
local v6 = require(l_Actions_0.VoiceParticipantToggleMuted);
local v7 = require(l_Actions_0.VoiceParticipantAdded);
local v8 = require(l_Actions_0.VoiceParticipantRemoved);
return v4.createReducer({}, {
    [v7.name] = function(v9, v10) --[[ Line: 19 ]]
        -- upvalues: l_Dictionary_0 (copy)
        local l_userId_0 = v10.userId;
        local v12 = v9[l_userId_0] or false;
        return l_Dictionary_0.set(v9, l_userId_0, v12);
    end, 
    [v8.name] = function(v13, v14) --[[ Line: 27 ]]
        -- upvalues: l_Dictionary_0 (copy), l_None_0 (copy)
        return l_Dictionary_0.set(v13, v14.userId, l_None_0);
    end, 
    [v6.name] = function(v15, v16) --[[ Line: 32 ]]
        -- upvalues: l_Dictionary_0 (copy)
        if v15[v16.userId] ~= nil then
            return l_Dictionary_0.join(v15, {
                [v16.userId] = v16.isMuted
            });
        else
            return v15;
        end;
    end
});