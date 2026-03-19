local l_script_FirstAncestor_0 = script:FindFirstAncestor("GameVotesRodux");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local l_Immutable_0 = require(l_Parent_0.AppCommonLib).Immutable;
local v3 = require(l_script_FirstAncestor_0.GameVotes.SetGameVotes);
return function(v4, v5) --[[ Line: 15 ]]
    -- upvalues: v3 (copy), l_Immutable_0 (copy)
    v4 = v4 or {};
    assert(v4, "");
    if v5.type == v3.name then
        local v6 = {
            upVotes = v5.upVotes, 
            downVotes = v5.downVotes
        };
        v4 = l_Immutable_0.Set(v4, v5.universeId, v6);
    end;
    return v4;
end;