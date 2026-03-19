local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Packages.Rodux);
local v2 = require(l_CorePackages_0.Packages.Cryo);
local l_Parent_0 = script.Parent.Parent;
local v4 = require(l_Parent_0.Actions.SetScreenSize);
return v1.createReducer({
    inputType = nil, 
    screenSize = Vector2.new(0, 0)
}, {
    [v4.name] = function(v5, v6) --[[ Line: 18 ]]
        -- upvalues: v2 (copy)
        return v2.Dictionary.join(v5, {
            screenSize = v6.screenSize
        });
    end
});