local l_script_FirstAncestor_0 = script:FindFirstAncestor("GameVotesRodux");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local l_Immutable_0 = require(l_Parent_0.AppCommonLib).Immutable;
local v3 = require(l_script_FirstAncestor_0.UserGameVotes.SetUserGameVotes);
local v4 = require(l_script_FirstAncestor_0.UserGameVotes.ClearUserGameVotes);
return function(v5, v6) --[[ Line: 7 ]]
    -- upvalues: v3 (copy), l_Immutable_0 (copy), v4 (copy)
    v5 = v5 or {};
    if v6.type == v3.name then
        local v7 = {
            canVote = v6.canVote, 
            userVote = v6.userVote, 
            reasonForNotVoteable = v6.reasonForNotVoteable
        };
        return (l_Immutable_0.Set(v5, v6.universeId, v7));
    else
        if v6.type == v4.name then
            v5 = l_Immutable_0.Set(v5, v6.universeId, nil);
        end;
        return v5;
    end;
end;