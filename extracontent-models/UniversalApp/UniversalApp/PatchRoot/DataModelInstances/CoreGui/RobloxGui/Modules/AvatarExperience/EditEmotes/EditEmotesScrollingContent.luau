local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.Packages.React);
local v3 = require(l_Modules_0.AvatarExperience.Common.Context.useAdaptiveScrolling);
local l_AvatarScreen_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceNavigation).Enums.AvatarScreen;
local v5 = require(l_Modules_0.AvatarExperience.Common.Components.AXRefreshScrollingFrameWithLoadMore);
return function(v6) --[[ Line: 19 ]] --[[ Name: EditEmotesScrollingContent ]]
    -- upvalues: v3 (copy), v2 (copy), v5 (copy), l_AvatarScreen_0 (copy)
    local v7 = v3();
    local v9 = v2.useCallback(function(v8) --[[ Line: 22 ]]
        -- upvalues: v6 (copy), v7 (copy)
        if v6.onCanvasPositionChanged then
            v6.onCanvasPositionChanged(v8);
        end;
        if v7 and v7.onCanvasYChanged and v8 then
            v7.onCanvasYChanged(v8.CanvasPosition.Y);
        end;
    end, {
        v7, 
        v6.onCanvasPositionChanged
    });
    return v2.createElement(v5, {
        Size = UDim2.fromScale(1, 1), 
        Position = UDim2.fromScale(0, 0), 
        parentAppPage = l_AvatarScreen_0.EditEmotes, 
        ScrollingEnabled = not v7 or v7.scrollingEnabledBinding, 
        onCanvasPositionChanged = v9, 
        onThresholdReached = v6.onThresholdReached, 
        createEndOfScrollElement = true, 
        preventInitialLoadMore = true
    }, v6.children);
end;