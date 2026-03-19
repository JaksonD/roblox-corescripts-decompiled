local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Packages.Cryo);
local v2 = require(l_CorePackages_0.Packages.Rodux);
local v3 = require(script.Parent.Parent.Actions.UpdateLastFriend);
return v2.createReducer({
    lastRemovedFriendId = ""
}, {
    [v3.name] = function(v4, v5) --[[ Line: 10 ]]
        -- upvalues: v1 (copy)
        return v1.Dictionary.join(v4, {
            lastRemovedFriendId = tostring(v5.lastRemovedFriendId) .. tostring(DateTime.now())
        });
    end
});