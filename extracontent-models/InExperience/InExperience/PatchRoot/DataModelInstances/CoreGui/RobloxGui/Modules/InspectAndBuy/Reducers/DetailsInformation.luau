local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Packages.Rodux);
local l_Parent_0 = script.Parent.Parent;
local v3 = require(l_Parent_0.Actions.SetDetailsInformation);
local v4 = {
    viewingDetails = false, 
    assetId = nil
};
return v1.createReducer(v4, {
    [v3.name] = function(_, v6) --[[ Line: 12 ]]
        return {
            viewingDetails = v6.viewingDetails, 
            assetId = v6.assetId
        };
    end
});