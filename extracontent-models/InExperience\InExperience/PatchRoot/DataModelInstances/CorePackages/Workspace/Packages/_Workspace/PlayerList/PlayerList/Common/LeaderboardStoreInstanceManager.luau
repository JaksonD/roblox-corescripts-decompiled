local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Signals);
local v2 = require(l_Parent_0.LeaderboardStore).createLeaderboardStore();
local v3 = nil;
local v4 = nil;
local v5, v6 = v1.createSignal(nil);
v3 = v5;
v4 = v6;
return {
    createLeaderboardStoreInstance = function() --[[ Line: 13 ]] --[[ Name: createLeaderboardStoreInstance ]]
        -- upvalues: v4 (ref), v2 (copy)
        v4(v2());
    end, 
    getLeaderboardStoreInstance = v3, 
    cleanUpInstance = function() --[[ Line: 17 ]] --[[ Name: cleanUpInstance ]]
        -- upvalues: v3 (ref), v4 (ref)
        local v7 = v3(false);
        if v7 ~= nil then
            v7.cleanUp();
            v4(nil);
        end;
    end
};