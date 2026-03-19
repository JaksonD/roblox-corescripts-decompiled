local l_Parent_0 = script:FindFirstAncestor("DiscoveryMonolith").Parent;
local v1 = require(l_Parent_0.DiscoveryTypes);
local l_OmniFeedTypes_0 = v1.OmniFeedTypes;
local l_OmniFeedConstants_0 = v1.OmniFeedConstants;
return function(v4) --[[ Line: 7 ]] --[[ Name: mapContentTypeToTreatmentType ]]
    -- upvalues: l_OmniFeedConstants_0 (copy), l_OmniFeedTypes_0 (copy)
    local v5 = nil;
    if v4 == l_OmniFeedConstants_0.ContentGroupType.Game then
        return l_OmniFeedTypes_0.SearchGameGrid;
    elseif v4 == l_OmniFeedConstants_0.ContentGroupType.Text then
        return l_OmniFeedTypes_0.SearchText;
    else
        if v4 == l_OmniFeedConstants_0.ContentGroupType.User then
            v5 = l_OmniFeedTypes_0.UserSearchGrid;
        end;
        return v5;
    end;
end;