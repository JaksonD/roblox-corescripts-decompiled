local l_CorePackages_0 = game:GetService("CorePackages");
local l_CoreGui_0 = game:GetService("CoreGui");
local l_HttpService_0 = game:GetService("HttpService");
local l_GuiService_0 = game:GetService("GuiService");
local _ = game:GetService("ContentProvider");
local v5 = require(l_CorePackages_0.Packages.UIBlox);
local l_Images_0 = v5.App.ImageSet.Images;
local l_Toast_0 = v5.App.Dialog.Toast;
local l_RobloxGui_0 = l_CoreGui_0:WaitForChild("RobloxGui");
local v9 = require(l_CorePackages_0.Workspace.Packages.RobloxTranslator);
local v10 = require(l_RobloxGui_0.Modules.Common.renderWithCoreScriptsStyleProvider);
local v11 = require(l_CorePackages_0.Packages.Roact);
local v12 = require(l_CorePackages_0.Packages.t);
local v13 = require(l_RobloxGui_0.Modules.Tracker.TrackerPromptType);
local v14 = game:DefineFastFlag("TrackerPromptNewCopyForCameraPerformanceEnabled", false);
local v15 = game:DefineFastString("CameraUnavailableUrl", "https://help.roblox.com/hc/articles/17877687557396");
local v16 = v11.PureComponent:extend("TrackerPrompt");
v16.validateProps = v12.strictInterface({
    promptType = v12.optional(v12.string)
});
local v17 = {
    [v13.None] = "", 
    [v13.VideoNoPermission] = v9:FormatByKey("Feature.FaceChat.Heading.UnableToAccessCamera"), 
    [v13.NotAvailable] = v9:FormatByKey("Feature.FaceChat.Heading.NotAvailable"), 
    [v13.FeatureDisabled] = v9:FormatByKey("Feature.FaceChat.Heading.FacialAnimation"), 
    [v13.LODCameraRecommendDisable] = if v14 then v9:FormatByKey("Feature.FaceChat.Heading.LowPerformanceDetected") else v9:FormatByKey("Feature.FaceChat.Heading.VideoPerformancePromptDisable"), 
    [v13.NoDynamicHeadEquipped] = v9:FormatByKey("Feature.FaceChat.Heading.PromptNoDynamicHeadEquipped"), 
    [v13.VideoUnsupported] = v9:FormatByKey("Feature.FaceChat.Heading.VideoUnsupported"), 
    [v13.UnsupportedDevice] = v9:FormatByKey("Feature.FaceChat.Heading.NotAvailable"), 
    [v13.CameraUnavailable] = v9:FormatByKey("Feature.SettingsHub.Prompt.CameraUnavailable")
};
local v18 = {
    [v13.None] = "", 
    [v13.VideoNoPermission] = v9:FormatByKey("Feature.FaceChat.Subtitle.UnableToAccessCamera"), 
    [v13.NotAvailable] = v9:FormatByKey("Feature.FaceChat.Subtitle.NotAvailable"), 
    [v13.FeatureDisabled] = v9:FormatByKey("Feature.FaceChat.Subtitle.FeatureDisabled"), 
    [v13.LODCameraRecommendDisable] = v9:FormatByKey("Feature.FaceChat.Subtitle.VideoPerformancePromptDisable"), 
    [v13.NoDynamicHeadEquipped] = v9:FormatByKey("Feature.FaceChat.Subtitle.PromptNoDynamicHeadEquipped"), 
    [v13.VideoUnsupported] = v9:FormatByKey("Feature.FaceChat.Subtitle.VideoUnsupported"), 
    [v13.UnsupportedDevice] = v9:FormatByKey("Feature.FaceChat.Subtitle.UnsupportedDevice"), 
    [v13.CameraUnavailable] = v9:FormatByKey("Feature.SettingsHub.Prompt.Subtitle.CameraUnavailable")
};
local v19 = {
    FullScreen = 0, 
    FormSheet = 2
};
local function v22(v20) --[[ Line: 77 ]] --[[ Name: openWebview ]]
    -- upvalues: l_HttpService_0 (copy), v9 (copy), v19 (copy), l_GuiService_0 (copy)
    local v21 = l_HttpService_0:JSONEncode({
        title = if game:GetEngineFeature("SetWebViewTitle") then v9:FormatByKey("Feature.SettingsHub.Prompt.CameraUnavailable") else nil, 
        presentationStyle = v19.FormSheet, 
        visible = true, 
        url = v20
    });
    l_GuiService_0:BroadcastNotification(v21, 20);
end;
v16.init = function(v23) --[[ Line: 90 ]] --[[ Name: init ]]
    v23.promptType = v23.props.promptType;
end;
v16.render = function(v24) --[[ Line: 94 ]] --[[ Name: render ]]
    -- upvalues: v11 (copy), v13 (copy), l_Toast_0 (copy), l_Images_0 (copy), v17 (copy), v18 (copy), v22 (copy), v15 (copy), v10 (copy)
    v24.promptType = v24.props.promptType;
    local l_createElement_0 = v11.createElement;
    local v26 = "Frame";
    local v27 = {
        BackgroundTransparency = 1, 
        Size = UDim2.fromScale(1, 1)
    };
    local v28 = {};
    local v29 = false;
    if v24.promptType ~= v13.None then
        v29 = v11.createElement(l_Toast_0, {
            duration = 8, 
            toastContent = {
                iconImage = l_Images_0["icons/status/alert"], 
                toastTitle = v17[v24.promptType], 
                toastSubtitle = v18[v24.promptType], 
                onDismissed = function() --[[ Line: 106 ]] --[[ Name: onDismissed ]]

                end, 
                onActivated = function() --[[ Line: 107 ]] --[[ Name: onActivated ]]
                    -- upvalues: v24 (copy), v13 (ref), v22 (ref), v15 (ref)
                    if v24.promptType == v13.CameraUnavailable then
                        v22(v15);
                    end;
                end
            }
        });
    end;
    v28.Toast = v29;
    l_createElement_0 = l_createElement_0(v26, v27, v28);
    v26 = v10({
        TrackerPrompt = l_createElement_0
    });
    return v11.createElement("ScreenGui", {
        AutoLocalize = false, 
        DisplayOrder = 10, 
        IgnoreGuiInset = true, 
        OnTopOfCoreBlur = true, 
        ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    }, {
        Content = v26
    });
end;
return v16;