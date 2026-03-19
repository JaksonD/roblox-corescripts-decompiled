local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_Modules_0.LuaApp.ArgCheck);
local v3 = require(l_Modules_0.LuaApp.Enum.OverlayType);
local v4 = require(l_Modules_0.LuaApp.Actions.SetCentralOverlay);
local v5 = require(l_CorePackages_0.Workspace.Packages.SocialLuaAnalytics);
local v6 = require(l_CorePackages_0.Workspace.Packages.ProfilePlatform);
local l_initializeProfileAnalytics_0 = v6.initializeProfileAnalytics;
local l_EventNames_0 = v6.EventNames;
local v9 = require(l_CorePackages_0.Workspace.Packages.SocialStopwatch);
local v10 = l_initializeProfileAnalytics_0();
return function(v11) --[[ Line: 29 ]]
    -- upvalues: v2 (copy), v9 (copy), v10 (copy), l_EventNames_0 (copy), v5 (copy), v4 (copy), v3 (copy)
    return function(v12) --[[ Line: 30 ]]
        -- upvalues: v2 (ref), v11 (copy), v9 (ref), v10 (ref), l_EventNames_0 (ref), v5 (ref), v4 (ref), v3 (ref)
        v2.isType(v11.user, "table", "props.user passed down to OpenCentralOverlayForPeopleList");
        v2.isType(v11.positionIndex, "number", "props.positionIndex passed down to OpenCentralOverlayForPeopleList");
        v2.isType(v11.onOpen, "function", "props.onOpen passed down to OpenCentralOverlayForPeopleList");
        v2.isType(v11.onClose, "function", "props.onClose passed down to OpenCentralOverlayForPeopleList");
        v2.isType(v11.anchorSpaceSize, "Vector2", "props.anchorSpaceSize passed down to OpenCentralOverlayForPeopleList");
        v2.isType(v11.anchorSpacePosition, "Vector2", "props.anchorSpacePosition passed down to OpenCentralOverlayForPeopleList");
        v2.isType(v11.absolutePosition, "number", "props.absolutePosition passed down to OpenCentralOverlayForPeopleList");
        v9.Stopwatch.start(v9.Events.JoinGameCardOpened);
        (if v11.mockProfileAnalytics_dev then v11.mockProfileAnalytics_dev else v10).fireAnalyticsEvent(l_EventNames_0.ProfileInExperienceUserLoadingStage, {
            status = v5.Analytics.Enums.LoadingStages.Started, 
            statValue = 0
        });
        v12:dispatch(v4(v3.PeopleList, v11));
    end;
end;