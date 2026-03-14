local l_Parent_0 = script:FindFirstAncestor("AvatarExperienceInspectAndBuy").Parent;
local l_useSelector_0 = require(l_Parent_0.RoactUtils).Hooks.RoactRodux.useSelector;
local v2 = require(l_Parent_0.tutils);
local l_Players_0 = game:GetService("Players");
local v4 = require(l_Parent_0.UserLib);
local function v6(v5) --[[ Line: 13 ]] --[[ Name: selectPlayer ]]
    return {
        playerName = v5.playerName, 
        playerId = v5.playerId
    };
end;
return function() --[[ Line: 26 ]]
    -- upvalues: l_useSelector_0 (copy), v6 (copy), v2 (copy), l_Players_0 (copy), v4 (copy)
    local v7 = l_useSelector_0(v6, v2.deepEqual);
    local v8 = if v7 then v7.playerName else nil;
    local v9 = if v7 then tonumber(v7.playerId) else nil;
    local v10 = v9 and l_Players_0:GetPlayerByUserId(v9);
    local v11 = if v10 then v4.Utils.isPlayerVerified(v10) else false;
    return {
        playerName = v8, 
        playerId = v9, 
        hasVerifiedBadge = v11
    };
end;