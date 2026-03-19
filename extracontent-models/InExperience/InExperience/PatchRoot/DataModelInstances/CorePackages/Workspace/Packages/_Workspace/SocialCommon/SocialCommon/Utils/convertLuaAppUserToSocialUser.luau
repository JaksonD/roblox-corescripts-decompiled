local l_Parent_0 = script:FindFirstAncestor("SocialCommon").Parent;
local v1 = require(l_Parent_0.Dash);
return function(v2) --[[ Line: 13 ]]
    -- upvalues: v1 (copy)
    return v1.join(v2, {
        name = v2.username, 
        gameInstanceId = v2.gameId
    });
end;