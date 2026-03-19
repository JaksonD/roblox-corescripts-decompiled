local l_CorePackages_0 = game:GetService("CorePackages");
local l_CoreGui_0 = game:GetService("CoreGui");
local l_NotificationService_0 = game:GetService("NotificationService");
local l_Modules_0 = l_CoreGui_0.RobloxGui.Modules;
local v4 = require(l_CorePackages_0.Packages.Cryo);
local v5 = require(l_CorePackages_0.Packages.Roact);
local _ = require(l_CorePackages_0.Packages.React);
local v7 = require(l_CorePackages_0.Packages.UIBlox);
local v8 = require(l_CorePackages_0.Packages.RoactRodux);
local _ = require(l_Modules_0.AvatarExperience.Common.AvatarExperienceState);
local l_Images_0 = v7.App.ImageSet.Images;
local l_LoadableImage_0 = v7.App.Loading.LoadableImage;
local v12 = require(l_Modules_0.AvatarExperience.Common.Components.Landing.PageButton);
local l_withLocalization_0 = require(l_CorePackages_0.Workspace.Packages.Localization).withLocalization;
local l_LoadingSpinner_0 = v7.App.Loading.LoadingSpinner;
local v15 = require(l_Modules_0.AvatarExperience.Common.Constants);
local v16 = require(l_CorePackages_0.Workspace.Packages.UserLib);
local l_Constants_0 = v16.Utils.Constants;
local l_getRbxthumbWithTypeSizeAndOptions_0 = v16.Utils.getRbxthumbWithTypeSizeAndOptions;
local l_AvatarThumbnailRequests_0 = v16.Utils.AvatarThumbnailRequests;
local v20 = require(l_CorePackages_0.Packages.t);
local v21 = nil;
local v22 = nil;
assert(l_AvatarThumbnailRequests_0.CUSTOMIZE_BUTTON ~= nil, "AvatarThumbnailRequests.CUSTOMIZE_BUTTON should exist. Silence type checker.");
assert(l_AvatarThumbnailRequests_0.CUSTOMIZE_BUTTON[1] ~= nil, "AvatarThumbnailRequests.CUSTOMIZE_BUTTON[1] should exist. Silence type checker.");
local v23 = l_AvatarThumbnailRequests_0.CUSTOMIZE_BUTTON[1];
v21 = l_Constants_0.RbxThumbnailSizeToNumberSize[v23.thumbnailSize];
v22 = l_Constants_0.RbxAvatarThumbnailTypeFromEnumToRbxthumbType[v23.thumbnailType];
local v24 = l_Images_0["icons/menu/customize_large"];
local v25 = v5.PureComponent:extend("AvatarPageButton");
v25.validateProps = v20.strictInterface({
    transparencyModifier = v20.number, 
    NextSelectionLeft = v20.optional(v20.table), 
    NextSelectionRight = v20.optional(v20.table), 
    NextSelectionUp = v20.optional(v20.table), 
    NextSelectionDown = v20.optional(v20.table), 
    onActivated = v20.callback, 
    forwardRef = v20.optional(v20.table), 
    localUserId = v20.string
});
v25.defaultProps = {
    transparencyModifier = 0
};
v25.init = function(v26) --[[ Line: 71 ]] --[[ Name: init ]]
    -- upvalues: l_NotificationService_0 (copy), v4 (copy), v5 (copy), l_LoadingSpinner_0 (copy), l_getRbxthumbWithTypeSizeAndOptions_0 (copy), v22 (ref), v21 (ref), l_LoadableImage_0 (copy), v15 (copy)
    v26.state = {
        style = string.lower(l_NotificationService_0.SelectedTheme)
    };
    v26.getLoadingImage = function(v27) --[[ Line: 76 ]]
        -- upvalues: v4 (ref), v5 (ref), l_LoadingSpinner_0 (ref)
        local v28 = v27 or {};
        v28 = v4.Dictionary.join(v28, {
            LoadingSpinner = v5.createElement(l_LoadingSpinner_0, {
                size = UDim2.fromScale(0.7, 0.7), 
                position = UDim2.fromScale(0.5, 0.5), 
                anchorPoint = Vector2.new(0.5, 0.5)
            }), 
            AspectRatioConstraint = v5.createElement("UIAspectRatioConstraint", {
                AspectRatio = 1, 
                AspectType = Enum.AspectType.ScaleWithParentSize
            })
        });
        return v5.createElement("Frame", {
            Size = UDim2.fromScale(1, 1), 
            Position = UDim2.fromScale(0.5, 0.5), 
            AnchorPoint = Vector2.new(0.5, 0.5), 
            BackgroundTransparency = 1
        }, v28);
    end;
    v26.getThumbnail = function(v29, v30, v31, v32, v33, _) --[[ Line: 99 ]]
        -- upvalues: v26 (copy), l_getRbxthumbWithTypeSizeAndOptions_0 (ref), v22 (ref), v21 (ref), v5 (ref), l_LoadableImage_0 (ref), v15 (ref)
        if v26.props.localUserId == nil or v26.props.localUserId == "" then
            return nil;
        else
            local v35 = l_getRbxthumbWithTypeSizeAndOptions_0(v26.props.localUserId, v22, v21);
            return v5.createElement(l_LoadableImage_0, {
                Position = v29, 
                Size = v30, 
                BackgroundTransparency = 1, 
                Image = v35, 
                useShimmerAnimationWhileLoading = false, 
                renderOnLoading = v26.getLoadingImage, 
                ZIndex = v33, 
                cornerRadius = UDim.new(0, v15.PageButtonCornerRadius), 
                ImageRectOffset = v31, 
                ImageRectSize = v32, 
                shouldHandleReloads = true
            });
        end;
    end;
end;
v25.render = function(v36) --[[ Line: 130 ]] --[[ Name: render ]]
    -- upvalues: l_withLocalization_0 (copy), v5 (copy), v12 (copy), v21 (ref), v24 (copy)
    local l_style_0 = v36.state.style;
    local l_transparencyModifier_0 = v36.props.transparencyModifier;
    local l_NextSelectionLeft_0 = v36.props.NextSelectionLeft;
    local l_NextSelectionRight_0 = v36.props.NextSelectionRight;
    local l_NextSelectionUp_0 = v36.props.NextSelectionUp;
    local l_NextSelectionDown_0 = v36.props.NextSelectionDown;
    local v43 = "rbxasset://textures/AvatarEditorImages/AvatarEditor_LightTheme.png";
    if l_style_0 == "dark" then
        v43 = "rbxasset://textures/AvatarEditorImages/AvatarEditor.png";
    end;
    local l_forwardRef_0 = v36.props.forwardRef;
    return l_withLocalization_0({
        avatarEditorText = "Feature.Catalog.Action.Customize"
    })(function(v45) --[[ Line: 147 ]]
        -- upvalues: v5 (ref), v12 (ref), v43 (ref), v36 (copy), v21 (ref), v24 (ref), l_transparencyModifier_0 (copy), l_NextSelectionLeft_0 (copy), l_NextSelectionRight_0 (copy), l_NextSelectionUp_0 (copy), l_NextSelectionDown_0 (copy), l_forwardRef_0 (copy)
        return v5.createElement(v12, {
            Size = UDim2.new(1, 0, 1, 0), 
            backgroundImage = v43, 
            getThumbnail = v36.getThumbnail, 
            thumbnailSize = v21, 
            thumbnailZoom = 2, 
            thumbnailImageYInsetScale = 0.05, 
            icon = v24, 
            text = v45.avatarEditorText, 
            transparencyModifier = l_transparencyModifier_0, 
            NextSelectionLeft = l_NextSelectionLeft_0, 
            NextSelectionRight = l_NextSelectionRight_0, 
            NextSelectionUp = l_NextSelectionUp_0, 
            NextSelectionDown = l_NextSelectionDown_0, 
            [v5.Ref] = l_forwardRef_0, 
            onActivated = v36.props.onActivated
        });
    end);
end;
v25.didMount = function(v46) --[[ Line: 169 ]] --[[ Name: didMount ]]
    -- upvalues: l_NotificationService_0 (copy)
    v46.themeChangedConn = l_NotificationService_0:GetPropertyChangedSignal("SelectedTheme"):Connect(function() --[[ Line: 170 ]]
        -- upvalues: v46 (copy), l_NotificationService_0 (ref)
        v46:setState({
            style = string.lower(l_NotificationService_0.SelectedTheme)
        });
    end);
end;
v25.willUnmount = function(v47) --[[ Line: 177 ]] --[[ Name: willUnmount ]]
    if v47.themeChangedConn then
        v47.themeChangedConn:Disconnect();
        v47.themeChangedConn = nil;
    end;
end;
v25 = v8.connect(function(v48) --[[ Line: 184 ]] --[[ Name: mapStateToProps ]]
    return {
        localUserId = v48.LocalUserId
    };
end)(v25);
return v5.forwardRef(function(v49, v50) --[[ Line: 192 ]]
    -- upvalues: v5 (copy), v25 (ref), v4 (copy)
    return v5.createElement(v25, v4.Dictionary.join(v49, {
        forwardRef = v50
    }));
end);