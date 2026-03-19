local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.Packages.Cryo);
local v3 = require(l_CorePackages_0.Packages.Rodux);
local v4 = require(l_Modules_0.Luobu.Actions.ReadTencentNoticeId);
return v3.createReducer({}, {
    [v4.name] = function(v5, v6) --[[ Line: 8 ]]
        -- upvalues: v2 (copy)
        local l_noticeId_0 = v6.noticeId;
        return v2.Dictionary.join(v5, {
            [l_noticeId_0] = true
        });
    end
});