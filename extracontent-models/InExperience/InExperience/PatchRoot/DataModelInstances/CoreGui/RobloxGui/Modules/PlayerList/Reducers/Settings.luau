local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Packages.Rodux);
local l_Actions_0 = script.Parent.Parent.Actions;
local v3 = require(l_Actions_0.SetSettings);
return (v1.createReducer({
    preferredTransparency = 1, 
    reducedMotion = false
}, {
    [v3.name] = function(_, v5) --[[ Line: 12 ]]
        return {
            preferredTransparency = v5.preferredTransparency, 
            reducedMotion = v5.reducedMotion
        };
    end
}));