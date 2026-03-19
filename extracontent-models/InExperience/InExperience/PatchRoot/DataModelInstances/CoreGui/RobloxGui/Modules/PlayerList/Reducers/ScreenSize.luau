local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Packages.Rodux);
local l_Actions_0 = script.Parent.Parent.Actions;
local v3 = require(l_Actions_0.SetScreenSize);
return (v1.createReducer({
    X = 1000, 
    Y = 1000
}, {
    [v3.name] = function(_, v5) --[[ Line: 12 ]]
        return {
            X = v5.sizeX, 
            Y = v5.sizeY
        };
    end
}));