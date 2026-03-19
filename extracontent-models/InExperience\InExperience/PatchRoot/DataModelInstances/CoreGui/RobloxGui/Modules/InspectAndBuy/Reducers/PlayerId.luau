local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Packages.Rodux);
local l_Parent_0 = script.Parent.Parent;
local v3 = require(l_Parent_0.Actions.SetPlayerId);
return v1.createReducer("", {
    [v3.name] = function(_, v5) --[[ Line: 7 ]]
        return v5.playerId;
    end
});