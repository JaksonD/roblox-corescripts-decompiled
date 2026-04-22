local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_Modules_0.LuaApp.ArgCheck);
local v3 = require(l_Modules_0.LuaApp.Enum.OverlayType);
local v4 = require(l_Modules_0.LuaApp.Actions.SetCentralOverlay);
local v5 = require(l_CorePackages_0.Workspace.Packages.SocialLuaAnalytics);
local v6 = require(l_CorePackages_0.Workspace.Packages.ProfilePlatform.initializeProfileAnalytics);
local v7 = require(l_CorePackages_0.Workspace.Packages.ProfilePlatform.EventNames);
local v8 = require(l_CorePackages_0.Workspace.Packages.SocialStopwatch);
local v9 = v6();
return function(v10) --[[ Line: 28 ]]
    -- upvalues: v2 (copy), v8 (copy), v9 (copy), v7 (copy), v5 (copy), v4 (copy), v3 (copy)
    return function(v11) --[[ Line: 29 ]]
        -- upvalues: v2 (ref), v10 (copy), v8 (ref), v9 (ref), v7 (ref), v5 (ref), v4 (ref), v3 (ref)
        v2.isType(v10.user, "table", "props.user passed down to OpenCentralOverlayForPeopleList");
        v2.isType(v10.positionIndex, "number", "props.positionIndex passed down to OpenCentralOverlayForPeopleList");
        v2.isType(v10.onOpen, "function", "props.onOpen passed down to OpenCentralOverlayForPeopleList");
        v2.isType(v10.onClose, "function", "props.onClose passed down to OpenCentralOverlayForPeopleList");
        v2.isType(v10.anchorSpaceSize, "Vector2", "props.anchorSpaceSize passed down to OpenCentralOverlayForPeopleList");
        v2.isType(v10.anchorSpacePosition, "Vector2", "props.anchorSpacePosition passed down to OpenCentralOverlayForPeopleList");
        v2.isType(v10.absolutePosition, "number", "props.absolutePosition passed down to OpenCentralOverlayForPeopleList");
        v8.Stopwatch.start(v8.Events.JoinGameCardOpened);
        (if v10.mockProfileAnalytics_dev then v10.mockProfileAnalytics_dev else v9).fireAnalyticsEvent(v7.ProfileInExperienceUserLoadingStage, {
            status = v5.Analytics.Enums.LoadingStages.Started, 
            statValue = 0
        });
        v11:dispatch(v4(v3.PeopleList, v10));
    end;
end;