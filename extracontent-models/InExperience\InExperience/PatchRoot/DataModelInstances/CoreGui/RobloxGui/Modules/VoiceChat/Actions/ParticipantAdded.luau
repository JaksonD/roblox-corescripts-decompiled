local l_CorePackages_0 = game:GetService("CorePackages");
local l_RobloxGui_0 = game:GetService("CoreGui"):WaitForChild("RobloxGui");
local l_makeActionCreator_0 = require(l_CorePackages_0.Packages.Rodux).makeActionCreator;
local _ = require(l_CorePackages_0.Packages.t);
local v4 = require(l_RobloxGui_0.Modules.VoiceChat.Helpers.maybeAssert);
return l_makeActionCreator_0(script.Name, function(v5) --[[ Line: 9 ]]
    -- upvalues: v4 (copy)
    v4(tonumber(v5) ~= nil);
    return {
        userId = tostring(v5)
    };
end);