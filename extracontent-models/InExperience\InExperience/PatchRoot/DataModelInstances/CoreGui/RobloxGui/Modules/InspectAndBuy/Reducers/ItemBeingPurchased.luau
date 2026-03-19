local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Packages.Rodux);
local l_Parent_0 = script.Parent.Parent;
local v3 = require(l_Parent_0.Actions.SetItemBeingPurchased);
local v4 = {
    itemType = nil, 
    itemId = nil
};
return v1.createReducer(v4, {
    [v3.name] = function(_, v6) --[[ Line: 12 ]]
        return {
            itemType = v6.itemType, 
            itemId = v6.itemId
        };
    end
});