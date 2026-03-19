local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.Packages.Promise);
local l_RobloxGui_0 = l_CoreGui_0:WaitForChild("RobloxGui");
local v4 = require(l_RobloxGui_0.Modules.Tracker.TrackerMenu);
local v5 = require(l_RobloxGui_0.Modules.Tracker.TrackerPromptType);
return function() --[[ Line: 10 ]]
    -- upvalues: v4 (copy), v5 (copy), v2 (copy)
    v4:showPrompt(v5.None);
    v2.delay(0.016666666666666666):andThen(function() --[[ Line: 12 ]]
        -- upvalues: v4 (ref), v5 (ref)
        v4:showPrompt(v5.VideoNoPermission);
    end);
end;