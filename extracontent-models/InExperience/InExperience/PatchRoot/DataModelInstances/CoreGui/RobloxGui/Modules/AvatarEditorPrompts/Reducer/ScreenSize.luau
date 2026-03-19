local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Packages.Rodux);
local l_Parent_0 = script.Parent.Parent;
local v3 = require(l_Parent_0.Actions.ScreenSizeUpdated);
return (v1.createReducer(Vector2.new(0, 0), {
    [v3.name] = function(_, v5) --[[ Line: 11 ]]
        return v5.screenSize;
    end
}));