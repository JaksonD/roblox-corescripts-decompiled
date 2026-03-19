local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Packages.InGameMenuDependencies);
local l_Cryo_0 = v1.Cryo;
local l_Rodux_0 = v1.Rodux;
local l_Parent_0 = script.Parent.Parent;
local v5 = require(l_Parent_0.Actions.SetFriendStatus);
return l_Rodux_0.createReducer({}, {
    [v5.name] = function(v6, v7) --[[ Line: 12 ]]
        -- upvalues: l_Cryo_0 (copy)
        local l_userId_0 = v7.userId;
        local l_friendStatus_0 = v7.friendStatus;
        return l_Cryo_0.Dictionary.join(v6, {
            [l_userId_0] = l_friendStatus_0 or l_Cryo_0.None
        });
    end
});