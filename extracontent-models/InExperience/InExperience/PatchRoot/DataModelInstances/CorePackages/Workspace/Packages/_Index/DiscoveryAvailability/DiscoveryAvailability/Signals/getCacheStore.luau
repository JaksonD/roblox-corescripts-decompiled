local l_Parent_0 = script:FindFirstAncestor("DiscoveryAvailability").Parent;
local v1 = require(l_Parent_0.Signals);
local _ = require(script.Parent.CacheStoreTypes);
return v1.createComputed(function() --[[ Line: 15 ]] --[[ Name: createCacheStore ]]
    -- upvalues: v1 (copy)
    local v3, v4 = v1.createSignal(nil);
    return {
        getHomePageDataSource = v3, 
        setHomePageDataSource = v4
    };
end);