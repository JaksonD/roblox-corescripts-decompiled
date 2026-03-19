local l_CoreGui_0 = game:GetService("CoreGui");
local l_GuiService_0 = game:GetService("GuiService");
local l_RobloxGui_0 = l_CoreGui_0:WaitForChild("RobloxGui");
local l_script_FirstAncestor_0 = script:FindFirstAncestor("AbuseReportMenu");
local l_CorePackages_0 = game:GetService("CorePackages");
local v5 = require(l_CorePackages_0.Packages.Roact);
local l_Chrome_0 = l_RobloxGui_0.Modules.Chrome;
local l_Enabled_0 = require(l_CorePackages_0.Workspace.Packages.Chrome).Enabled;
local v8 = if l_Enabled_0() then require(l_Chrome_0.Service) else nil;
local _ = require(l_script_FirstAncestor_0.Components.Types);
local v10 = require(l_script_FirstAncestor_0.Components.Constants);
local v11 = require(l_script_FirstAncestor_0.ReportAnything.Components.ScreenshotFlowStepHandlerContainer);
local _ = require(l_script_FirstAncestor_0.ReportAnything.Utility.ReportAnythingAnalytics);
local l_FFlagEnableConsoleExpControls_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagEnableConsoleExpControls;
local v14 = {
    annotationPageHandle = nil, 
    annotationPageFrame = nil, 
    annotationPageScreenGui = nil
};
local function v15() --[[ Line: 28 ]] --[[ Name: unmountAnnotationPage ]]
    -- upvalues: l_FFlagEnableConsoleExpControls_0 (copy), l_Enabled_0 (copy), v8 (copy), v14 (copy), v5 (copy)
    if l_FFlagEnableConsoleExpControls_0 and if l_FFlagEnableConsoleExpControls_0 then l_Enabled_0() else l_Enabled_0 then
        v8:setHideShortcutBar("AnnotationModal", false);
    end;
    if v14.annotationPageHandle ~= nil then
        v5.unmount(v14.annotationPageHandle);
        v14.annotationPageHandle = nil;
    end;
    if v14.annotationPageScreenGui ~= nil then
        v14.annotationPageFrame.Parent = nil;
        v14.annotationPageFrame = nil;
        v14.annotationPageScreenGui = nil;
    end;
end;
return {
    mountAnnotationPage = function(v16, v17, v18, v19, v20) --[[ Line: 43 ]] --[[ Name: mountAnnotationPage ]]
        -- upvalues: l_FFlagEnableConsoleExpControls_0 (copy), l_Enabled_0 (copy), v8 (copy), l_GuiService_0 (copy), v14 (copy), l_CoreGui_0 (copy), v10 (copy), v5 (copy), v11 (copy), v15 (copy)
        if l_FFlagEnableConsoleExpControls_0 and if l_FFlagEnableConsoleExpControls_0 then l_Enabled_0() else l_Enabled_0 then
            v8:setHideShortcutBar("AnnotationModal", true);
        end;
        local l_l_GuiService_0_GuiInset_0, _ = l_GuiService_0:GetGuiInset();
        if not v14.annotationPageScreenGui then
            local l_ScreenGui_0 = Instance.new("ScreenGui");
            l_ScreenGui_0.Name = "AnnotationPageContents";
            l_ScreenGui_0.DisplayOrder = 7;
            l_ScreenGui_0.Enabled = true;
            l_ScreenGui_0.ZIndexBehavior = Enum.ZIndexBehavior.Sibling;
            l_ScreenGui_0.Parent = l_CoreGui_0:FindFirstChild(v10.AbuseReportMenuPlaceholderFrame, true);
            v14.annotationPageScreenGui = l_ScreenGui_0;
            local l_Frame_0 = Instance.new("Frame");
            l_Frame_0.BackgroundTransparency = 1;
            l_Frame_0.Position = UDim2.new(0, 0, 0, -l_l_GuiService_0_GuiInset_0.Y);
            l_Frame_0.Size = UDim2.new(1, 0, 1, l_l_GuiService_0_GuiInset_0.Y);
            l_Frame_0.Parent = v14.annotationPageScreenGui;
            v14.annotationPageFrame = l_Frame_0;
        end;
        local v29 = v5.createElement(v11, {
            screenshot = v19.screenshotContentId, 
            entryPoint = v16, 
            backAction = function() --[[ Line: 76 ]] --[[ Name: backAction ]]
                -- upvalues: v15 (ref)
                v15();
            end, 
            dismissAction = function() --[[ Line: 79 ]] --[[ Name: dismissAction ]]
                -- upvalues: v15 (ref)
                v15();
            end, 
            finishAnnotationAction = function(v25) --[[ Line: 82 ]] --[[ Name: finishAnnotationAction ]]
                -- upvalues: v15 (ref), v20 (copy), v10 (ref)
                v15();
                v20({
                    type = v10.ReportAnythingActions.SetAnnotationPoints, 
                    annotationPoints = v25
                });
                v20({
                    type = v10.ReportAnythingActions.CompleteAttachment
                });
            end, 
            restartAction = function() --[[ Line: 92 ]] --[[ Name: restartAction ]]
                -- upvalues: v15 (ref), v20 (copy), v10 (ref), v17 (copy)
                v15();
                v20({
                    type = v10.ReportAnythingActions.ClearAll
                });
                v17();
            end, 
            skipAnnotationAction = function() --[[ Line: 102 ]] --[[ Name: skipAnnotationAction ]]
                -- upvalues: v15 (ref), v20 (copy), v10 (ref)
                v15();
                v20({
                    type = v10.ReportAnythingActions.CompleteAttachment
                });
            end, 
            setAnnotationCircleRadius = function(v26) --[[ Line: 108 ]] --[[ Name: setAnnotationCircleRadius ]]
                -- upvalues: v20 (copy), v10 (ref)
                v20({
                    type = v10.ReportAnythingActions.SetAnnotationCircleRadius, 
                    radius = v26
                });
            end, 
            setAnnotationAreaDimensions = function(v27, v28) --[[ Line: 114 ]] --[[ Name: setAnnotationAreaDimensions ]]
                -- upvalues: v20 (copy), v10 (ref)
                v20({
                    type = v10.ReportAnythingActions.SetAnnotationAreaDimensions, 
                    width = v27, 
                    height = v28
                });
            end, 
            initialAnnotationPoints = {}, 
            initialPageNumber = 1, 
            viewportInfo = v19.identificationResults.avatarIDStats.viewportInfo, 
            reportAnythingAnalytics = v18
        });
        v20({
            type = v10.ReportAnythingActions.SetAnnotationOptionSeen
        });
        v14.annotationPageHandle = v5.mount(v29, v14.annotationPageFrame, "AnnotationFlow");
    end, 
    unmountAnnotationPage = v15
};