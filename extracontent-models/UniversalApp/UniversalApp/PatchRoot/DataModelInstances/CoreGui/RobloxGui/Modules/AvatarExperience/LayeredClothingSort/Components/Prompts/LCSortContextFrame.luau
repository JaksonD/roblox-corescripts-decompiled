local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.Packages.Roact);
local v3 = require(l_CorePackages_0.Packages.RoactRodux);
local v4 = require(l_CorePackages_0.Packages.UIBlox);
local v5 = require(l_CorePackages_0.Packages.t);
local l_ContextualMenu_0 = v4.App.Menu.ContextualMenu;
local l_MenuDirection_0 = v4.App.Menu.MenuDirection;
local l_AvatarScreen_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceNavigation).Enums.AvatarScreen;
local v9 = require(l_Modules_0.AvatarExperience.Common.Components.withOverlayFocusHandling);
local v10 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.withAvatarRoute);
local l_withLocalization_0 = require(l_CorePackages_0.Workspace.Packages.Localization).withLocalization;
local v12 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.withMappedNavigationParams);
local v13 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.NavigationUtils);
local v14 = require(l_Modules_0.AvatarExperience.Common.Constants);
local v15 = require(l_Modules_0.AvatarExperience.AvatarRefinement.Constants);
local v16 = require(l_Modules_0.AvatarExperience.Common.Selectors.selectIsPortrait);
local l_IsVRAppBuild_0 = require(l_CorePackages_0.Workspace.Packages.AppCommonLib).IsVRAppBuild;
local v18 = l_IsVRAppBuild_0() and 120 or 0;
local v19 = v2.PureComponent:extend("LCSortContextFrame");
v19.validateProps = v5.strictInterface({
    navigation = v5.table, 
    asset = v5.table, 
    onUnequip = v5.optional(v5.callback), 
    tilePositionY = v5.number, 
    avatarRoute = v5.table, 
    screenSize = v5.Vector2, 
    isPortrait = v5.boolean, 
    globalGuiInset = v5.table, 
    focusController = v5.optional(v5.table), 
    defaultChildRef = v5.optional(v5.table)
});
v19.init = function(v20) --[[ Line: 56 ]] --[[ Name: init ]]
    -- upvalues: v2 (copy), v13 (copy), l_AvatarScreen_0 (copy)
    local v21, v22 = v2.createBinding(UDim2.fromScale(1, 1));
    v20.contextMenuSize = v21;
    v20.updateContextMenuSize = v22;
    v20.openUnequipPrompt = function() --[[ Line: 59 ]]
        -- upvalues: v13 (ref), v20 (copy), l_AvatarScreen_0 (ref)
        v13.navigateToNextOverlay(v20.props.navigation, l_AvatarScreen_0.RemoveItemPrompt, {
            asset = v20.props.asset, 
            onUnequip = v20.props.onUnequip
        });
    end;
    v20.closePrompt = function() --[[ Line: 66 ]]
        -- upvalues: v13 (ref), v20 (copy)
        v13.closeOverlay(v20.props.navigation);
    end;
end;
v19.renderLocalized = function(v23, v24) --[[ Line: 71 ]] --[[ Name: renderLocalized ]]
    -- upvalues: v14 (copy), l_IsVRAppBuild_0 (copy), v15 (copy), v18 (copy), v2 (copy), l_ContextualMenu_0 (copy), l_MenuDirection_0 (copy)
    local l_closePrompt_0 = v23.closePrompt;
    local l_screenSize_0 = v23.props.screenSize;
    local v27 = {};
    table.insert(v27, {
        icon = nil, 
        text = v24.unequip, 
        onActivated = function() --[[ Line: 80 ]] --[[ Name: onActivated ]]
            -- upvalues: v23 (copy)
            v23.openUnequipPrompt();
        end
    });
    local l_isPortrait_0 = v23.props.isPortrait;
    local v29 = l_isPortrait_0 and 0 or v14.LandscapeNavWidth;
    local v30 = l_isPortrait_0 and 1 or v14.LandscapeSceneWidth;
    local v31 = if l_IsVRAppBuild_0() then v15.VerticalList.Width + v15.Tile.ContextWidth else 0;
    local v32 = UDim2.new(v29, v31, 0, 0);
    local v33 = UDim2.fromScale(v30, 1);
    local v34 = v23.props.tilePositionY - v23.props.screenSize.Y + v15.Tile.SelectedSize + 56 + 11 + v23.props.globalGuiInset.bottom + v18;
    return v2.createElement("Frame", {
        BackgroundTransparency = 1, 
        Position = v32, 
        Size = v33
    }, {
        SizeFrame = v2.createElement("Frame", {
            BackgroundTransparency = 1, 
            Position = UDim2.fromScale(0.5, 0), 
            AnchorPoint = Vector2.new(0.5, 0), 
            Size = v23.contextMenuSize
        }, {
            ContextMenu = v2.createElement(l_ContextualMenu_0, {
                buttonProps = v27, 
                open = true, 
                menuDirection = l_MenuDirection_0.Up, 
                openPositionY = UDim.new(1, v34), 
                closeBackgroundVisible = not l_IsVRAppBuild_0() or false, 
                screenSize = l_screenSize_0, 
                onDismiss = l_closePrompt_0
            })
        })
    });
end;
v19.render = function(v35) --[[ Line: 130 ]] --[[ Name: render ]]
    -- upvalues: l_withLocalization_0 (copy)
    return l_withLocalization_0({
        unequip = "Feature.Avatar.Action.Unequip"
    })(function(v36) --[[ Line: 133 ]]
        -- upvalues: v35 (copy)
        return v35:renderLocalized(v36);
    end);
end;
return (v12((v10((v9((v3.connect(function(v37, _) --[[ Line: 138 ]]
    -- upvalues: v16 (copy)
    return {
        screenSize = v37.ScreenSize, 
        globalGuiInset = v37.GlobalGuiInset, 
        isPortrait = v16(v37)
    };
end, nil)(v19))))))));