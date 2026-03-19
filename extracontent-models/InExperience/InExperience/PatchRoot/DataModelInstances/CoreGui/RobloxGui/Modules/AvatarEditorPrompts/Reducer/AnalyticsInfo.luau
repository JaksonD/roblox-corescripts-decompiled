local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Packages.Rodux);
local v2 = require(l_CorePackages_0.Packages.Cryo);
local l_Parent_0 = script.Parent.Parent;
local v4 = require(l_Parent_0.Actions.CloseOpenPrompt);
local v5 = require(l_Parent_0.Actions.AddAnalyticsInfo);
local v6 = {
    addedAssets = nil, 
    removedAssets = nil
};
return (v1.createReducer(v6, {
    [v5.name] = function(v7, v8) --[[ Line: 18 ]]
        -- upvalues: v2 (copy)
        return v2.Dictionary.join(v7, v8.info);
    end, 
    [v4.name] = function(_, _) --[[ Line: 22 ]]
        return {};
    end
}));