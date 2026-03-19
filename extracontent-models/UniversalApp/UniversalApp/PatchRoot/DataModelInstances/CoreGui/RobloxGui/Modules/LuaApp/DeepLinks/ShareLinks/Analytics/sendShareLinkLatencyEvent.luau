local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Workspace.Packages.SocialStopwatch);
local v2 = require(script.Parent.EventNames);
local v3 = require(script.Parent.fireTelemetry);
local _ = require(script.Parent.Parent.LinkStatus);
local _ = require(script.Parent.Parent.ShareLinkTypes);
return function(v6, v7) --[[ Line: 10 ]]
    -- upvalues: v1 (copy), v3 (copy), v2 (copy)
    local v8 = v1.Stopwatch.stop(v1.Events.ShareLinkOpened);
    local v9 = {
        linkStatus = v7, 
        linkType = v6, 
        statValue = if v8 then v8.timeElapsed else nil
    };
    v3(v2.ShareLinkLatency, v9);
end;