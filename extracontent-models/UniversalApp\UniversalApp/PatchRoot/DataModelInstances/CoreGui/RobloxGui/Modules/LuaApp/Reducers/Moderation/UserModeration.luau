local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_LuaApp_0 = l_CoreGui_0.RobloxGui.Modules.LuaApp;
local v3 = require(l_LuaApp_0.Actions.Moderation.SetModerationStatus);
local v4 = require(l_LuaApp_0.Actions.Moderation.SetModerationDetail);
local v5 = require(l_CorePackages_0.Packages.Cryo);
return function(v6, v7) --[[ Line: 16 ]]
    -- upvalues: v3 (copy), v4 (copy), v5 (copy)
    v6 = v6 or {};
    assert(v6, "");
    if v7.type == v3.name then
        v6 = {
            userModerated = v7.userModerated
        };
    end;
    if v7.type == v4.name then
        local v8 = v6 or {};
        v8 = v5.Dictionary.join(v8, {
            moderationDetail = v7.moderationDetail
        });
        v6 = v5.Dictionary.join(v6, v8);
    end;
    return v6;
end;