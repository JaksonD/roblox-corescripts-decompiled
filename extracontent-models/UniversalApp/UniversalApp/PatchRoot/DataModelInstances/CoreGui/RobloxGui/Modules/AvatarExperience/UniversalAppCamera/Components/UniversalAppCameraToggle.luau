local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v2 = require(l_CorePackages_0.Packages.Roact);
local v3 = require(l_CorePackages_0.Packages.RoactRodux);
local v4 = require(l_CorePackages_0.Packages.UIBlox);
local v5 = require(l_CorePackages_0.Packages.t);
local l_Images_0 = v4.App.ImageSet.Images;
local l_ImageSetButton_0 = v4.Core.ImageSet.ImageSetButton;
local l_withStyle_0 = v4.Style.withStyle;
local l_IconSize_0 = v4.App.Constant.IconSize;
local v10 = require(l_Modules_0.AvatarExperience.Common.Constants);
local v11 = require(l_Modules_0.AvatarExperience.Common.Utils);
local v12 = require(l_Modules_0.LuaApp.Enum.ToastType);
local v13 = require(l_Modules_0.AvatarExperience.Common.Managers.AnimationUtils);
local l_AvatarScreen_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceNavigation).Enums.AvatarScreen;
local v15 = require(l_Modules_0.LuaApp.Actions.SetCurrentToastMessage);
local v16 = require(l_Modules_0.AvatarExperience.Common.Actions.SetCameraButtonStatus);
local v17 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.withAppRoute);
local l_withSelectionCursorProvider_0 = v4.App.SelectionImage.withSelectionCursorProvider;
local v19 = require(l_Modules_0.LuaApp.mutedError);
local v20 = require(l_Modules_0.AvatarExperience.Common.Selectors.SelectOutfitTryOnEmoteAnimationAssetId);
local l_DeviceOrientationMode_0 = require(l_CorePackages_0.Workspace.Packages.RobloxAppEnums).DeviceOrientationMode;
local l_RoactServices_0 = require(l_CorePackages_0.Workspace.Packages.RoactServices).RoactServices;
local v23 = require(l_Modules_0.AvatarExperience.Common.Services.Analytics);
local l_withNavigationFocus_0 = require(l_CorePackages_0.Packages.RoactNavigation).withNavigationFocus;
local v25 = require(l_Modules_0.LuaApp.Services.RoactNetworking);
local l_getCameraOptIn_0 = require(l_CorePackages_0.Workspace.Packages.CameraOptIn).getCameraOptIn;
local l_getCameraDevicePermission_0 = require(l_CorePackages_0.Workspace.Packages.CameraOptIn).getCameraDevicePermission;
local _ = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceCommon);
local v29 = l_Images_0["icons/controls/videoOff"];
local v30 = l_Images_0["icons/controls/video"];
local v31 = Vector2.new(1, 0);
local v32 = UDim2.new(1, -4, 0, 3);
local v33 = UDim2.fromOffset(5, 5);
local v34 = Color3.new(0, 1, 0);
local v35 = v2.PureComponent:extend("UniversalAppCameraToggle");
local v36 = {
    toastMessage = "Feature.Avatar.Message.ClassicHeadAndR6CameraWarning", 
    isLocalized = false, 
    toastType = v12.InformationMessage
};
local v37 = {
    toastMessage = "Feature.Avatar.Message.CameraFacialAnimationPaused", 
    isLocalized = false, 
    toastType = v12.InformationMessage
};
local v38 = {
    toastMessage = "Feature.FaceChat.Subtitle.UnableToAccessCamera", 
    isLocalized = false, 
    toastType = v12.InformationMessage
};
local v39 = {
    toastMessage = "Feature.FaceChat.Subtitle.FeatureDisabled", 
    isLocalized = false, 
    toastType = v12.InformationMessage
};
v35.validateProps = v5.strictInterface({
    isUIFullView = v5.optional(v5.boolean), 
    isSceneFullView = v5.optional(v5.boolean), 
    layoutOrder = v5.optional(v5.number), 
    isDebug = v5.optional(v5.boolean), 
    hasEmoteTryOn = v5.boolean, 
    ableToAnimateHead = v5.boolean, 
    receivedOutfitInfo = v5.boolean, 
    canPlayAnimation = v5.boolean, 
    pageCanAnimateCameraBasedMood = v5.boolean, 
    isPortrait = v5.boolean, 
    topBarHeight = v5.number, 
    buttonEnabled = v5.boolean, 
    errorOccurred = v5.boolean, 
    analytics = v5.table, 
    networking = v5.callback, 
    avatarRoute = v5.table, 
    navigation = v5.table, 
    isFocused = v5.boolean, 
    setCurrentToastMessage = v5.callback, 
    setCameraButtonStatus = v5.callback
});
v35.setCameraButtonStatusWithAnalytics = function(v40, v41) --[[ Line: 112 ]] --[[ Name: setCameraButtonStatusWithAnalytics ]]
    v40.props.setCameraButtonStatus(v41);
    v40.props.analytics.toggleCameraInEditorAndShop(v41, v40.props.avatarRoute.opaque.name);
end;
v35.init = function(v42) --[[ Line: 118 ]] --[[ Name: init ]]
    -- upvalues: v36 (copy), v39 (copy), v37 (copy), l_getCameraDevicePermission_0 (copy), v38 (copy), v19 (copy)
    v42.isMounted = false;
    v42:setState({
        isCameraOptIn = false, 
        hasDeviceCameraPermissions = false
    });
    v42.toggleCamera = function() --[[ Line: 124 ]]
        -- upvalues: v42 (copy), v36 (ref), v39 (ref), v37 (ref), l_getCameraDevicePermission_0 (ref), v38 (ref), v19 (ref)
        if not v42.props.ableToAnimateHead and v42.props.receivedOutfitInfo then
            v42.props.setCurrentToastMessage(v36);
            return;
        else
            local l_buttonEnabled_0 = v42.props.buttonEnabled;
            if v42.props.errorOccurred then
                v42.props.setCameraButtonStatus(false);
                v42.props.setCurrentToastMessage(v39);
                return;
            elseif v42.state.hasDeviceCameraPermissions then
                if not l_buttonEnabled_0 and not v42.props.pageCanAnimateCameraBasedMood then
                    v42.props.setCurrentToastMessage(v37);
                end;
                v42:setCameraButtonStatusWithAnalytics(not l_buttonEnabled_0);
                return;
            else
                l_getCameraDevicePermission_0():andThen(function(v44) --[[ Line: 142 ]]
                    -- upvalues: v42 (ref), v38 (ref)
                    if v44 then
                        if v42.isMounted then
                            v42:setState({
                                hasDeviceCameraPermissions = true
                            });
                        end;
                        v42:setCameraButtonStatusWithAnalytics(true);
                        return;
                    else
                        v42.props.setCurrentToastMessage(v38);
                        return;
                    end;
                end):catch(function(v45) --[[ Line: 156 ]]
                    -- upvalues: v19 (ref), v42 (ref)
                    v19(string.format("Universal App Camera Hardware Check error: %s", (tostring(v45))));
                    v42.props.setCameraButtonStatus(false);
                end);
                return;
            end;
        end;
    end;
end;
v35.render = function(v46) --[[ Line: 165 ]] --[[ Name: render ]]
    -- upvalues: l_withStyle_0 (copy), l_withSelectionCursorProvider_0 (copy)
    return l_withStyle_0(function(v47) --[[ Line: 166 ]]
        -- upvalues: l_withSelectionCursorProvider_0 (ref), v46 (copy)
        return l_withSelectionCursorProvider_0(function(v48) --[[ Line: 167 ]]
            -- upvalues: v46 (ref), v47 (copy)
            return v46:renderWithProviders(v47, v48);
        end);
    end);
end;
v35.isVisible = function(v49) --[[ Line: 173 ]] --[[ Name: isVisible ]]
    -- upvalues: v11 (copy)
    if v49.props.isDebug then
        return true;
    else
        local v50 = v11.isUserCameraEligible() and v49.state.isCameraOptIn;
        local v51 = v11.isAvatarSceneButtonsVisible(v49.props.avatarRoute, v49.props.isFocused, v49.props.isUIFullView, v49.props.isSceneFullView, v49.props.navigation);
        return v50 and v51;
    end;
end;
v35.getIcon = function(v52) --[[ Line: 198 ]] --[[ Name: getIcon ]]
    -- upvalues: v30 (copy), v29 (copy)
    if v52.props.buttonEnabled then
        return v30;
    else
        return v29;
    end;
end;
v35.setCameraOptIn = function(v53) --[[ Line: 206 ]] --[[ Name: setCameraOptIn ]]
    -- upvalues: l_getCameraOptIn_0 (copy)
    l_getCameraOptIn_0(v53.props.networking, false):andThen(function(v54) --[[ Line: 207 ]]
        -- upvalues: v53 (copy)
        if not v53.isMounted then
            return;
        else
            if v54 ~= v53.state.isCameraOptIn then
                v53:setState({
                    isCameraOptIn = v54
                });
            end;
            return;
        end;
    end);
end;
v35.didMount = function(v55) --[[ Line: 219 ]] --[[ Name: didMount ]]
    v55.isMounted = true;
    v55:setCameraOptIn();
end;
v35.willUnmount = function(v56) --[[ Line: 224 ]] --[[ Name: willUnmount ]]
    v56.isMounted = false;
end;
v35.didUpdate = function(v57, v58) --[[ Line: 228 ]] --[[ Name: didUpdate ]]
    -- upvalues: l_AvatarScreen_0 (copy), v37 (copy)
    local l_name_0 = v57.props.avatarRoute.opaque.name;
    v57:setCameraOptIn();
    if v57.props.buttonEnabled and l_name_0 ~= l_AvatarScreen_0.CatalogSearch and l_name_0 ~= l_AvatarScreen_0.Catalog and l_name_0 ~= l_AvatarScreen_0.AvatarEditor then
        v57.props.setCameraButtonStatus(false);
        return;
    elseif not v57:isVisible() then
        return;
    else
        if v57.props.buttonEnabled and not v57.props.ableToAnimateHead and v57.props.receivedOutfitInfo then
            v57.props.setCameraButtonStatus(false);
        end;
        local l_pageCanAnimateCameraBasedMood_0 = v58.pageCanAnimateCameraBasedMood;
        local l_pageCanAnimateCameraBasedMood_1 = v57.props.pageCanAnimateCameraBasedMood;
        local v62 = l_pageCanAnimateCameraBasedMood_0 and not l_pageCanAnimateCameraBasedMood_1;
        local v63 = not v58.hasEmoteTryOn and v57.props.hasEmoteTryOn;
        if v57.props.buttonEnabled and (v62 or v63) then
            v57.props.setCurrentToastMessage(v37);
        end;
        return;
    end;
end;
v35.renderWithProviders = function(v64, v65) --[[ Line: 260 ]] --[[ Name: renderWithProviders ]]
    -- upvalues: v10 (copy), v2 (copy), l_ImageSetButton_0 (copy), l_IconSize_0 (copy), v31 (copy), v32 (copy), v34 (copy), v33 (copy)
    local l_Theme_0 = v65.Theme;
    local l_SceneButtonSize_0 = v10.SceneButtonSize;
    local v68 = not v64.props.canPlayAnimation;
    return v2.createElement("Frame", {
        Size = UDim2.fromOffset(l_SceneButtonSize_0, l_SceneButtonSize_0), 
        Visible = v64:isVisible(), 
        BackgroundColor3 = l_Theme_0.BackgroundMuted.Color, 
        BackgroundTransparency = l_Theme_0.BackgroundMuted.Transparency, 
        LayoutOrder = v64.props.layoutOrder
    }, {
        Corner = v2.createElement("UICorner", {
            CornerRadius = v10.SceneButtonCornerRadius
        }); 
        v2.createElement(l_ImageSetButton_0, {
            Position = UDim2.fromScale(0.5, 0.5), 
            AnchorPoint = Vector2.new(0.5, 0.5), 
            Size = UDim2.fromOffset(l_IconSize_0.Regular, l_IconSize_0.Regular), 
            BackgroundTransparency = 1, 
            Image = v64:getIcon(), 
            ImageColor3 = l_Theme_0.IconEmphasis.Color, 
            ImageTransparency = (not v68 or v64.props.buttonEnabled) and 0 or 0.5, 
            ZIndex = 2, 
            [v2.Event.Activated] = v64.toggleCamera
        }, {
            Dot = v2.createElement("Frame", {
                AnchorPoint = v31, 
                Position = v32, 
                BackgroundColor3 = v34, 
                Size = v33, 
                BorderSizePixel = 0, 
                ZIndex = 2, 
                Visible = not v68 and v64.props.buttonEnabled, 
                LayoutOrder = 2
            }, {
                Corner = v2.createElement("UICorner", {
                    CornerRadius = UDim.new(1, 0)
                })
            })
        })
    });
end;
v35 = l_withNavigationFocus_0((v17((v3.connect(function(v69, v70) --[[ Line: 306 ]]
    -- upvalues: v11 (copy), v13 (copy), v20 (copy), l_DeviceOrientationMode_0 (copy)
    local l_topBarHeight_0 = v69.TopBar.topBarHeight;
    local v72 = v11.getCategoryInfoFromState(v69, v70.avatarRoute).CanAnimateCameraBasedMood == true;
    local v73, _ = v13.getAllowsTryingEmotesOrAnimations(v69, v70.avatarRoute);
    local v75 = v13.canPlayCameraBasedMoodAnimation(v69, v72, v73);
    local v76 = v20(v69) ~= nil;
    local v77, v78 = v13.ableToAnimateHead(v69);
    return {
        hasEmoteTryOn = v76, 
        pageCanAnimateCameraBasedMood = v72, 
        ableToAnimateHead = v77, 
        receivedOutfitInfo = v78, 
        canPlayAnimation = v75, 
        isPortrait = v69.DeviceOrientation == l_DeviceOrientationMode_0.Portrait, 
        topBarHeight = l_topBarHeight_0, 
        buttonEnabled = v69.AvatarExperience.CameraButton.enabled, 
        errorOccurred = v69.AvatarExperience.CameraButton.errorOccurred
    };
end, function(v79) --[[ Line: 337 ]] --[[ Name: mapDispatchToProps ]]
    -- upvalues: v15 (copy), v16 (copy)
    return {
        setCurrentToastMessage = function(v80) --[[ Line: 339 ]] --[[ Name: setCurrentToastMessage ]]
            -- upvalues: v79 (copy), v15 (ref)
            v79(v15(v80));
        end, 
        setCameraButtonStatus = function(v81) --[[ Line: 342 ]] --[[ Name: setCameraButtonStatus ]]
            -- upvalues: v79 (copy), v16 (ref)
            v79(v16(v81));
        end
    };
end)(v35)))));
return (l_RoactServices_0.connect({
    analytics = v23, 
    networking = v25
})(v35));