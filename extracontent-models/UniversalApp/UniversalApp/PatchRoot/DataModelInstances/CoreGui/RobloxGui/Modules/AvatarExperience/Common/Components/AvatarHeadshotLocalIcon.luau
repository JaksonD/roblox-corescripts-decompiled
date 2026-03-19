local l_CorePackages_0 = game:GetService("CorePackages");
local l_CoreGui_0 = game:GetService("CoreGui");
local v2 = require(l_CorePackages_0.Packages.Roact);
local v3 = require(l_CorePackages_0.Packages.t);
local v4 = require(l_CorePackages_0.Packages.UIBlox);
local v5 = require(l_CorePackages_0.Packages.RoactRodux);
local l_Modules_0 = l_CoreGui_0.RobloxGui.Modules;
local _ = require(l_Modules_0.AvatarExperience.Common.AvatarExperienceState);
local l_withStyle_0 = v4.Style.withStyle;
local l_LoadableImage_0 = v4.App.Loading.LoadableImage;
local l_ShimmerPanel_0 = v4.App.Loading.ShimmerPanel;
local v11 = require(l_Modules_0.AvatarExperience.Flags.FFlagEnableAvatarHeadshotLocalIconBackgroundFix);
local l_withNavigation_0 = require(l_CorePackages_0.Packages.RoactNavigation).withNavigation;
local v13 = require(l_CorePackages_0.Workspace.Packages.UserLib);
local l_Constants_0 = v13.Utils.Constants;
local l_getRbxthumbWithTypeSizeAndOptions_0 = v13.Utils.getRbxthumbWithTypeSizeAndOptions;
local l_LoadingStrategy_0 = v4.App.Loading.Enum.LoadingStrategy;
local v17 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.NavigationUtils);
local l_AvatarHeadShot_0 = l_Constants_0.RbxthumbTypes.AvatarHeadShot;
local v19 = v2.PureComponent:extend("AvatarHeadshotLocalIcon");
v19.defaultProps = {
    Size = 36, 
    LayoutOrder = 1
};
v19.validateProps = v3.strictInterface({
    Size = v3.optional(v3.number), 
    ZIndex = v3.number, 
    LayoutOrder = v3.optional(v3.integer), 
    BackgroundColor3 = v3.optional(v3.Color3), 
    BackgroundTransparency = v3.optional(v3.number), 
    navigation = v3.table, 
    localUserId = v3.string
});
v19.getCurrentRouteName = function(v20) --[[ Line: 48 ]] --[[ Name: getCurrentRouteName ]]
    -- upvalues: v17 (copy)
    if v20.props.navigation and v20.props.navigation.state and v20.props.navigation.state.routes and v20.props.navigation.state.routes[1] and v17.getActiveScreenNavigationState(v20.props.navigation.state.routes[1]) and v17.getActiveScreenNavigationState(v20.props.navigation.state.routes[1]).routeName then
        return v17.getActiveScreenNavigationState(v20.props.navigation.state.routes[1]).routeName;
    else
        return;
    end;
end;
v19.init = function(v21) --[[ Line: 61 ]] --[[ Name: init ]]
    -- upvalues: l_getRbxthumbWithTypeSizeAndOptions_0 (copy), l_AvatarHeadShot_0 (copy), v2 (copy), l_ShimmerPanel_0 (copy)
    v21:setState({
        currentRouteName = v21:getCurrentRouteName(), 
        imageUri = l_getRbxthumbWithTypeSizeAndOptions_0(v21.props.localUserId, l_AvatarHeadShot_0, 48, true, true)
    });
    v21.getLoadingImage = function() --[[ Line: 73 ]]
        -- upvalues: v2 (ref), l_ShimmerPanel_0 (ref)
        return v2.createElement(l_ShimmerPanel_0, {
            cornerRadius = UDim.new(0.5, 0), 
            Size = UDim2.fromScale(1, 1), 
            Position = UDim2.fromScale(0.5, 0.5), 
            AnchorPoint = Vector2.new(0.5, 0.5)
        });
    end;
end;
v19.render = function(v22) --[[ Line: 83 ]] --[[ Name: render ]]
    -- upvalues: l_withStyle_0 (copy)
    return l_withStyle_0(function(v23) --[[ Line: 84 ]]
        -- upvalues: v22 (copy)
        return v22:renderWithProviders(v23);
    end);
end;
v19.didUpdate = function(v24, v25, v26) --[[ Line: 89 ]] --[[ Name: didUpdate ]]
    -- upvalues: l_getRbxthumbWithTypeSizeAndOptions_0 (copy), l_AvatarHeadShot_0 (copy)
    local v27 = v24:getCurrentRouteName();
    if v27 and v27 ~= v26.currentRouteName or v24.props and v25 and v24.props.localUserId ~= v25.localUserId then
        v24:setState({
            currentRouteName = v27, 
            imageUri = l_getRbxthumbWithTypeSizeAndOptions_0(v24.props.localUserId, l_AvatarHeadShot_0, 48, true, true)
        });
    end;
end;
v19.makeLoadableImage = function(v28) --[[ Line: 113 ]] --[[ Name: makeLoadableImage ]]
    -- upvalues: v2 (copy), l_LoadableImage_0 (copy), l_LoadingStrategy_0 (copy)
    if v28.props.localUserId == nil or v28.props.localUserId == "" then
        return nil;
    else
        local l_imageUri_0 = v28.state.imageUri;
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
v19.renderWithProviders = function(v30, v31) --[[ Line: 133 ]] --[[ Name: renderWithProviders ]]
    -- upvalues: v2 (copy), v11 (copy)
    local l_Theme_0 = v31.Theme;
    return v2.createElement("Frame", {
        BackgroundTransparency = 1, 
        Position = UDim2.new(0.5, 0, 0.5, 0), 
        AnchorPoint = Vector2.new(0.5, 0.5), 
        Size = UDim2.fromOffset(v30.props.Size, v30.props.Size), 
        ZIndex = v30.props.ZIndex, 
        LayoutOrder = v30.props.LayoutOrder
    }, {
        Background = v2.createElement("Frame", {
            ZIndex = v30.props.ZIndex, 
            BorderSizePixel = 0, 
            BackgroundColor3 = v30.props.BackgroundColor3 or l_Theme_0.PlaceHolder.Color, 
            BackgroundTransparency = v30.props.BackgroundTransparency or if v11 then l_Theme_0.PlaceHolder.Transparency else nil, 
            Size = UDim2.new(1, 0, 1, 0), 
            Position = UDim2.fromScale(0.5, 0.5), 
            AnchorPoint = Vector2.new(0.5, 0.5)
        }, {
            UICorner = v2.createElement("UICorner", {
                CornerRadius = UDim.new(0.5, 0)
            }), 
            LoadableImage = v30:makeLoadableImage()
        })
    });
end;
local function v34(v33) --[[ Line: 163 ]] --[[ Name: mapStateToProps ]]
    return {
        localUserId = v33.LocalUserId
    };
end;
v19 = l_withNavigation_0(v19, nil);
return v5.connect(v34)(v19);