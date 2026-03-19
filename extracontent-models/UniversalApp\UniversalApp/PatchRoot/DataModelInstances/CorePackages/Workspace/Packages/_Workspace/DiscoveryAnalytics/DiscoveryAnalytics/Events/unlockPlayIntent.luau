local l_Parent_0 = script:FindFirstAncestor("DiscoveryAnalytics").Parent;
local v1 = require(l_Parent_0.t);
local l_flaggedMutedError_0 = require(l_Parent_0.Loggers).flaggedMutedError;
local v3 = v1.strictInterface({
    universeId = v1.string, 
    upsellName = v1.string, 
    playabilityStatus = v1.optional(v1.string)
});
return function(v4, v5) --[[ Line: 13 ]]
    -- upvalues: v3 (copy), l_flaggedMutedError_0 (copy)
    local v6, v7 = v3(v5);
    if not v6 then
        l_flaggedMutedError_0("UnlockPlayIntentEventInterface", v7);
    end;
    v4:sendEventDeferred("PlayButton", "unlockPlayIntent", v5);
end;