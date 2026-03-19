local l_Parent_0 = script.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local v2 = require(l_Parent_1.Rodux);
local v3 = require(l_Parent_0.Actions.OverlayFlashActivated);
local v4 = require(l_Parent_0.Actions.OverlayFlashDeactivated);
return v2.createReducer(false, {
    [v3.name] = function(_, _) --[[ Line: 14 ]]
        return true;
    end, 
    [v4.name] = function(_, _) --[[ Line: 18 ]]
        return false;
    end
});