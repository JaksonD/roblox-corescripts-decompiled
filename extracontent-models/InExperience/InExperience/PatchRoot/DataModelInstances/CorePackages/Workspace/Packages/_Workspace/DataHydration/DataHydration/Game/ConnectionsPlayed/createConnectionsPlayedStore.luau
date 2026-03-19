local l_script_FirstAncestor_0 = script:FindFirstAncestor("DataHydration");
local v1 = require(l_script_FirstAncestor_0.createDataCache);
local _ = require(l_script_FirstAncestor_0.DataHydrationTypes);
local _ = require(script.Parent.ConnectionsPlayedStoreTypes);
return function() --[[ Line: 11 ]] --[[ Name: createConnectionsPlayedStore ]]
    -- upvalues: v1 (copy)
    local v4 = v1();
    return {
        getConnectionsPlayed = v4.getItem, 
        updateItems = v4.updateItems, 
        clear = v4.clear
    };
end;