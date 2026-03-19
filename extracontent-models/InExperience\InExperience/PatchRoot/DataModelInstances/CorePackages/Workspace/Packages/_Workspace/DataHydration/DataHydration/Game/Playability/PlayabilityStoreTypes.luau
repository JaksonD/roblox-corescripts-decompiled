local l_script_FirstAncestor_0 = script:FindFirstAncestor("DataHydration");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local _ = require(l_script_FirstAncestor_0.DataHydrationTypes);
local v3 = require(l_Parent_0.t);
local v4 = require(l_Parent_0.DiscoveryTypes);
return {
    playabilityResponseValidator = v3.array(v3.interface({
        universeId = v3.number, 
        isPlayable = v3.boolean, 
        playabilityStatus = v3.optional(v3.string)
    })), 
    PlayabilityStatusEnum = v4.PlayabilityStatusEnum
};