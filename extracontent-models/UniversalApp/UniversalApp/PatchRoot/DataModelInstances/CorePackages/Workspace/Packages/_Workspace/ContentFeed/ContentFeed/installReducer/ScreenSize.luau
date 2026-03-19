local l_Parent_0 = script.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local v2 = require(l_Parent_1.Rodux);
local v3 = require(l_Parent_0.Actions.ScreenSizeChanged);
local v4 = Vector2.new(0, 0);
return v2.createReducer(v4, {
    [v3.name] = function(_, v6) --[[ Line: 13 ]]
        return v6.screenSize;
    end
});