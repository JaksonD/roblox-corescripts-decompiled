local l_CorePackages_0 = game:GetService("CorePackages");
local l_AppPage_0 = require(l_CorePackages_0.Workspace.Packages.RobloxAppEnums).AppPage;
local v2 = require(l_CorePackages_0.Packages.Cryo);
local v3 = require(l_CorePackages_0.Workspace.Packages.SocialStopwatch);
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local _ = require(l_Modules_0.LuaApp.Reducers.Navigation);
local l_Parent_0 = script.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local v8 = require(l_Parent_1.Analytics.EventNames);
local v9 = require(l_Parent_1.Analytics.fireTelemetry);
local v10 = require(l_Parent_0.StaticLinkTypeToHandlerMap);
local v11 = require(l_Parent_0.StaticShareLinkTypes);
local _ = require(l_Parent_1.Types);
local v13 = {
    c = v11.Asset, 
    b = v11.Bundle, 
    e = v11.ExperienceDetails, 
    g = v11.Group, 
    l = v11.Look, 
    s = v11.Server, 
    u = v11.UserProfile
};
local v14 = {
    {
        {
            name = l_AppPage_0.Home
        }, 
        {
            name = l_AppPage_0.ShareLinkInvalidModal
        }
    }
};
return function(v15, v16, v17, v18) --[[ Line: 36 ]]
    -- upvalues: v3 (copy), v13 (copy), v11 (copy), v10 (copy), v14 (copy), v9 (copy), v8 (copy), v2 (copy)
    v3.Stopwatch.start(v3.Events.StaticShareLinkOpened);
    local v19 = v13[v15] or v11.Unknown;
    local v20 = v10[v19];
    local v21 = {
        didSucceed = true, 
        extraProps = v17, 
        linkId = v16, 
        staticLinkType = v19
    };
    local v22 = v20(v16, v17, v18);
    if not v22 then
        v21.didSucceed = false;
        v22 = v14;
    end;
    v9(v8.StaticShareLinkResolveLink, v21);
    local v23 = v3.Stopwatch.stop(v3.Events.StaticShareLinkOpened);
    if v23 then
        v9(v8.StaticShareLinkLatency, v2.Dictionary.union(v21, {
            statValue = v23.timeElapsed
        }));
    end;
    return v22;
end;