local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Packages.React);
local v2 = require(l_CorePackages_0.Workspace.Packages.RobloxTranslator);
local l_Parent_0 = script.Parent.Parent;
local v4 = require(l_Parent_0.Components.ScreenshotDialog);
local v5 = require(l_Parent_0.Components.ScreenshotReviewDialog);
local _ = require(script.Parent.Parent.Parent.Components.Types);
local l_GetFFlagAvatarIdentificationSafeAreaFix_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagAvatarIdentificationSafeAreaFix;
return function(v8) --[[ Line: 28 ]] --[[ Name: ScreenshotFlowStepHandler ]]
    -- upvalues: v1 (copy), l_GetFFlagAvatarIdentificationSafeAreaFix_0 (copy), v5 (copy), v2 (copy), v4 (copy)
    local v9, v10 = v1.useState(v8.initialPageNumber == nil and 1 or v8.initialPageNumber);
    local v11, v12 = v1.useState(1.7777777777777777);
    local v13, v14 = v1.useState(800);
    local v15, v16 = v1.useState(800);
    local v17, v18 = v1.useState(true);
    local v19 = v1.useCallback(function() --[[ Line: 35 ]]
        -- upvalues: v10 (copy)
        v10(2);
    end, {
        v10
    });
    local v20 = v1.useCallback(function() --[[ Line: 38 ]]
        -- upvalues: v10 (copy)
        v10(1);
    end, {
        v10
    });
    v1.useEffect(function() --[[ Line: 42 ]]
        -- upvalues: l_GetFFlagAvatarIdentificationSafeAreaFix_0 (ref), v8 (copy), v12 (copy), v14 (copy), v16 (copy), v18 (copy)
        local l_CurrentCamera_0 = game.Workspace.CurrentCamera;
        if l_CurrentCamera_0 ~= nil then
            local l_viewportSize_0 = l_CurrentCamera_0.viewportSize;
            if l_GetFFlagAvatarIdentificationSafeAreaFix_0() and v8.viewportInfo then
                v12(v8.viewportInfo.width / v8.viewportInfo.height);
            else
                v12(l_viewportSize_0.X / l_viewportSize_0.Y);
            end;
            v14(l_viewportSize_0.Y);
            v16(l_viewportSize_0.X);
            local l_v18_0 = v18;
            local v24 = false;
            if l_viewportSize_0.X < l_viewportSize_0.Y then
                v24 = l_viewportSize_0.X < 800;
            end;
            l_v18_0(v24);
        end;
    end, {});
    local _ = nil;
    if v9 == 1 then
        return (v1.createElement(v5, {
            imageAspectRatio = v11, 
            isSmallPortraitMode = v17, 
            viewportUISafeAreaHeight = v13, 
            viewportUISafeAreaWidth = v15, 
            onNextPage = v19, 
            onBack = v8.dismissAction, 
            onSkip = v8.skipAnnotationAction, 
            onRestart = v8.restartAction, 
            screenshot = v8.screenshot, 
            reportAnythingAnalytics = v8.reportAnythingAnalytics
        }, {}));
    else
        local v26 = if v8.entryPoint == "player" then v2:FormatByKey("Feature.ReportAbuse.Label.SelectPerson") else v2:FormatByKey("Feature.ReportAbuse.Label.SelectProblem");
        return (v1.createElement(v4, {
            titleText = v26, 
            backAction = v20, 
            dismissAction = v8.dismissAction, 
            finishAnnotationAction = v8.finishAnnotationAction, 
            initialAnnotationPoints = v8.initialAnnotationPoints, 
            isSmallPortraitMode = v17, 
            screenshot = v8.screenshot, 
            imageAspectRatio = v11, 
            setAnnotationCircleRadius = v8.setAnnotationCircleRadius, 
            setAnnotationAreaDimensions = v8.setAnnotationAreaDimensions, 
            reportAnythingAnalytics = v8.reportAnythingAnalytics
        }));
    end;
end;