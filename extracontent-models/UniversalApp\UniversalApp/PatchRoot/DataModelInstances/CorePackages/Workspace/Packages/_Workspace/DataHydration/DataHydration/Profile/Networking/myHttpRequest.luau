local l_Parent_0 = script:FindFirstAncestor("DataHydration").Parent;
local v1 = require(l_Parent_0.HttpRequest);
local v2 = game:DefineFastInt("ProfileCTAHttpRetryCount", 3);
return (v1.config({
    requestFunction = function(v3, v4, v5) --[[ Line: 7 ]] --[[ Name: requestFunction ]]
        -- upvalues: v1 (copy)
        return v1.requestFunctions.RequestInternal(v3, v4, v5);
    end, 
    maxRetryCount = v2
}));