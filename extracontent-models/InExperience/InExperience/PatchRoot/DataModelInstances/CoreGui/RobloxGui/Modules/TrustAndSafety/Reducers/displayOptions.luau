local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Packages.Rodux);
local v2 = require(l_CorePackages_0.Packages.Cryo);
local l_Parent_0 = script.Parent.Parent;
local v4 = require(l_Parent_0.Actions.SetScreenSize);
local v5 = require(l_Parent_0.Actions.Hide);
local v6 = require(l_Parent_0.Actions.Show);
return v1.createReducer({
    inputType = nil, 
    screenSize = Vector2.new(0, 0), 
    visible = true
}, {
    [v4.name] = function(v7, v8) --[[ Line: 16 ]]
        -- upvalues: v2 (copy)
        return v2.Dictionary.join(v7, {
            screenSize = v8.screenSize
        });
    end, 
    [v5.name] = function(v9) --[[ Line: 21 ]]
        -- upvalues: v2 (copy)
        return v2.Dictionary.join(v9, {
            visible = false
        });
    end, 
    [v6.name] = function(v10) --[[ Line: 26 ]]
        -- upvalues: v2 (copy)
        return v2.Dictionary.join(v10, {
            visible = true
        });
    end
});