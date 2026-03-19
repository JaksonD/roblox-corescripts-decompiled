local l_Parent_0 = script:FindFirstAncestor("ServerDrivenUi").Parent;
local v1 = require(l_Parent_0.Signals);
local v2 = nil;
local function v4(v3) --[[ Line: 7 ]] --[[ Name: getInGameFriendsByGame ]]
    -- upvalues: v2 (ref), v1 (copy)
    if v2 == nil then
        v2 = v1.createSignal({});
    end;
    return v2(v3);
end;
local function v6(v5) --[[ Line: 14 ]] --[[ Name: setInGameFriendsByGameSignal ]]
    -- upvalues: v2 (ref)
    v2 = v5;
end;
return {
    getInGameFriendsByGame = v4, 
    setInGameFriendsByGameSignal = v6
};