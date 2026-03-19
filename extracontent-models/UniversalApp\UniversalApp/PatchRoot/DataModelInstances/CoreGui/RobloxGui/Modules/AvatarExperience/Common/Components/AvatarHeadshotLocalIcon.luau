local l_CorePackages_0 = game:GetService("CorePackages");
local l_CoreGui_0 = game:GetService("CoreGui");
local v2 = require(l_CorePackages_0.Packages.Roact);
local v3 = require(l_CorePackages_0.Packages.t);
local v4 = require(l_CorePackages_0.Packages.UIBlox);
local v5 = require(l_CorePackages_0.Packages.Foundation);
local l_Radius_0 = v5.Enums.Radius;
local l_Skeleton_0 = v5.Skeleton;
local v8 = require(l_CorePackages_0.Packages.RoactRodux);
local l_Modules_0 = l_CoreGui_0.RobloxGui.Modules;
local _ = require(l_Modules_0.AvatarExperience.Common.AvatarExperienceState);
local l_withStyle_0 = v4.Style.withStyle;
local l_LoadableImage_0 = v4.App.Loading.LoadableImage;
local v13 = require(l_Modules_0.AvatarExperience.Flags.FFlagEnableAvatarHeadshotLocalIconBackgroundFix);
local l_withNavigation_0 = require(l_CorePackages_0.Packages.RoactNavigation).withNavigation;
local v15 = require(l_CorePackages_0.Workspace.Packages.UserLib);
local l_Constants_0 = v15.Utils.Constants;
local l_getRbxthumbWithTypeSizeAndOptions_0 = v15.Utils.getRbxthumbWithTypeSizeAndOptions;
local l_LoadingStrategy_0 = v4.App.Loading.Enum.LoadingStrategy;
local v19 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.NavigationUtils);
local l_AvatarHeadShot_0 = l_Constants_0.RbxthumbTypes.AvatarHeadShot;
local v21 = v2.PureComponent:extend("AvatarHeadshotLocalIcon");
v21.defaultProps = {
    Size = 36, 
    LayoutOrder = 1
};
v21.validateProps = v3.strictInterface({
    Size = v3.optional(v3.number), 
    ZIndex = v3.number, 
    LayoutOrder = v3.optional(v3.integer), 
    BackgroundColor3 = v3.optional(v3.Color3), 
    BackgroundTransparency = v3.optional(v3.number), 
    navigation = v3.table, 
    localUserId = v3.string
});
v21.getCurrentRouteName = function(v22) --[[ Line: 51 ]] --[[ Name: getCurrentRouteName ]]
    -- upvalues: v19 (copy)
    if v22.props.navigation and v22.props.navigation.state and v22.props.navigation.state.routes and v22.props.navigation.state.routes[1] and v19.getActiveScreenNavigationState(v22.props.navigation.state.routes[1]) and v19.getActiveScreenNavigationState(v22.props.navigation.state.routes[1]).routeName then
        return v19.getActiveScreenNavigationState(v22.props.navigation.state.routes[1]).routeName;
    else
        return;
    end;
end;
v21.init = function(v23) --[[ Line: 64 ]] --[[ Name: init ]]
    -- upvalues: l_getRbxthumbWithTypeSizeAndOptions_0 (copy), l_AvatarHeadShot_0 (copy), v2 (copy), l_Skeleton_0 (copy), l_Radius_0 (copy)
    v23:setState({
        currentRouteName = v23:getCurrentRouteName(), 
        imageUri = l_getRbxthumbWithTypeSizeAndOptions_0(v23.props.localUserId, l_AvatarHeadShot_0, 48, true, true)
    });
    v23.getLoadingImage = function() --[[ Line: 76 ]]
        -- upvalues: v2 (ref), l_Skeleton_0 (ref), l_Radius_0 (ref)
        return v2.createElement(l_Skeleton_0, {
            radius = l_Radius_0.Circle, 
            Size = UDim2.fromScale(1, 1), 
            Position = UDim2.fromScale(0.5, 0.5), 
            AnchorPoint = Vector2.new(0.5, 0.5)
        });
    end;
end;
v21.render = function(v24) --[[ Line: 86 ]] --[[ Name: render ]]
    -- upvalues: l_withStyle_0 (copy)
    return l_withStyle_0(function(v25) --[[ Line: 87 ]]
        -- upvalues: v24 (copy)
        return v24:renderWithProviders(v25);
    end);
end;
v21.didUpdate = function(v26, v27, v28) --[[ Line: 92 ]] --[[ Name: didUpdate ]]
    -- upvalues: l_getRbxthumbWithTypeSizeAndOptions_0 (copy), l_AvatarHeadShot_0 (copy)
    local v29 = v26:getCurrentRouteName();
    if v29 and v29 ~= v28.currentRouteName or v26.props and v27 and v26.props.localUserId ~= v27.localUserId then
        v26:setState({
            currentRouteName = v29, 
            imageUri = l_getRbxthumbWithTypeSizeAndOptions_0(v26.props.localUserId, l_AvatarHeadShot_0, 48, true, true)
        });
    end;
end;
v21.makeLoadableImage = function(v30) --[[ Line: 116 ]] --[[ Name: makeLoadableImage ]]
    -- upvalues: v2 (copy), l_LoadableImage_0 (copy), l_LoadingStrategy_0 (copy)
    if v30.props.localUserId == nil or v30.props.localUserId == "" then
        return nil;
    else
        local l_imageUri_0 = v30.state.imageUri;
        return v2.createElement(l_LoadableImage_0, {
            AnchorPoint = Vector2.new(0.5, 0.5), 
            Position = UDim2.fromScale(0.5, 0.5), 
            Size = UDim2.fromScale(1, 1), 
            BackgroundTransparency = 1, 
            Image = l_imageUri_0, 
            useShimmerAnimationWhileLoading = true, 
            cornerRadius = UDim.new(0.5, 0), 
            shouldHandleReloads = true, 
            loadingStrategy = l_LoadingStrategy_0.Eager
        });
    end;
end;
v21.renderWithProviders = function(v32, v33) --[[ Line: 136 ]] --[[ Name: renderWithProviders ]]
    -- upvalues: v2 (copy), v13 (copy)
    local l_Theme_0 = v33.Theme;
    return v2.createElement("Frame", {
        BackgroundTransparency = 1, 
        Position = UDim2.new(0.5, 0, 0.5, 0), 
        AnchorPoint = Vector2.new(0.5, 0.5), 
        Size = UDim2.fromOffset(v32.props.Size, v32.props.Size), 
        ZIndex = v32.props.ZIndex, 
        LayoutOrder = v32.props.LayoutOrder
    }, {
        Background = v2.createElement("Frame", {
            ZIndex = v32.props.ZIndex, 
            BorderSizePixel = 0, 
            BackgroundColor3 = v32.props.BackgroundColor3 or l_Theme_0.PlaceHolder.Color, 
            BackgroundTransparency = v32.props.BackgroundTransparency or if v13 then l_Theme_0.PlaceHolder.Transparency else nil, 
            Size = UDim2.new(1, 0, 1, 0), 
            Position = UDim2.fromScale(0.5, 0.5), 
            AnchorPoint = Vector2.new(0.5, 0.5)
        }, {
            UICorner = v2.createElement("UICorner", {
                CornerRadius = UDim.new(0.5, 0)
            }), 
            LoadableImage = v32:makeLoadableImage()
        })
    });
end;
local function v36(v35) --[[ Line: 166 ]] --[[ Name: mapStateToProps ]]
    return {
        localUserId = v35.LocalUserId
    };
end;
v21 = l_withNavigation_0(v21, nil);
return v8.connect(v36)(v21);