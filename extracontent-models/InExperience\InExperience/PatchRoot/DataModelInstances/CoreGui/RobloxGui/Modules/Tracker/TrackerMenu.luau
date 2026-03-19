local l_CorePackages_0 = game:GetService("CorePackages");
local l_CoreGui_0 = game:GetService("CoreGui");
local l_RobloxGui_0 = l_CoreGui_0:WaitForChild("RobloxGui");
local v3 = require(l_CorePackages_0.Packages.Roact);
local v4 = require(l_RobloxGui_0.Modules.Tracker.TrackerPrompt);
local v5 = {};
v5.__index = v5;
v5.showPrompt = function(v6, v7) --[[ Line: 20 ]] --[[ Name: showPrompt ]]
    -- upvalues: v3 (copy), v4 (copy), l_CoreGui_0 (copy)
    if v6.trackerPrompt then
        v3.update(v6.trackerPrompt, v3.createElement(v4, {
            promptType = v7
        }));
        return;
    else
        v6.trackerPrompt = v3.mount(v3.createElement(v4, {
            promptType = v7
        }), l_CoreGui_0, "RobloxTrackerPromptGui");
        return;
    end;
end;
v5.new = function() --[[ Line: 39 ]] --[[ Name: new ]]
    -- upvalues: v5 (copy)
    local v8 = {
        trackerPrompt = nil
    };
    setmetatable(v8, v5);
    return v8;
end;
return v5.new();