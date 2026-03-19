local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Packages.Rodux);
local l_Parent_0 = script.Parent.Parent;
local v3 = require(l_Parent_0.Actions.SetTryingOnInfo);
local v4 = {
    tryingOn = false, 
    assetId = nil, 
    assetTypeId = nil
};
return v1.createReducer(v4, {
    [v3.name] = function(_, v6) --[[ Line: 13 ]]
        return {
            tryingOn = v6.tryingOn, 
            assetId = v6.assetId, 
            assetTypeId = v6.assetTypeId
        };
    end
});