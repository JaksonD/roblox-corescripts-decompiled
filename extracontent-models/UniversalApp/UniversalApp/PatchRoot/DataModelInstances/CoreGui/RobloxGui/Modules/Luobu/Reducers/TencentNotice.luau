local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.Packages.Cryo);
local v3 = require(l_CorePackages_0.Packages.Rodux);
local v4 = require(l_Modules_0.Luobu.Actions.SetTencentNoticeInfo);
return v3.createReducer({}, {
    [v4.name] = function(v5, v6) --[[ Line: 8 ]]
        -- upvalues: v2 (copy)
        return v2.Dictionary.join(v5, {
            noticeList = v6.noticeList
        });
    end
});