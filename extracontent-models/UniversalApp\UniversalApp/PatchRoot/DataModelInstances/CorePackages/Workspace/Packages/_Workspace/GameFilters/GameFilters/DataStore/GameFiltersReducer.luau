local l_script_FirstAncestor_0 = script:FindFirstAncestor("GameFilters");
local v1 = require(l_script_FirstAncestor_0.DataStore.SetGameFilters);
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v3 = require(l_Parent_0.Cryo);
local _ = require(l_Parent_0.DiscoveryTypes);
return {
    key = "GameFiltersKey", 
    reducer = function(v5, v6) --[[ Line: 11 ]]
        -- upvalues: v1 (copy), v3 (copy)
        local v7 = v5 or {};
        if v6.type == v1.name then
            v7 = v3.Dictionary.join(v7, {
                [v6.groupId] = {
                    allFilters = v6.filters, 
                    updatedTimestamp = v6.updatedTimestamp
                }
            });
        end;
        return v7;
    end
};