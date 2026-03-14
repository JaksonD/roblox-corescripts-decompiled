local l_Parent_0 = script:FindFirstAncestor("GameCollections").Parent;
local l_GameCollectionItemTypes_0 = require(l_Parent_0.DiscoveryTypes).GameCollectionItemTypes;
local v2 = require(l_Parent_0.React);
local v4 = v2.memo(function(v3) --[[ Line: 15 ]]
    -- upvalues: v2 (copy)
    return v2.createElement("Frame", {
        BackgroundTransparency = 1, 
        LayoutOrder = v3.index
    });
end);
return function(v5) --[[ Line: 23 ]]
    -- upvalues: v2 (copy), v4 (copy), l_GameCollectionItemTypes_0 (copy)
    return v2.createElement(v4, v5), l_GameCollectionItemTypes_0.GameCollectionItemType.Blank;
end;