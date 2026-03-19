local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.Packages.React);
local v3 = require(l_CorePackages_0.Packages.Roact);
local v4 = require(l_CorePackages_0.Packages.RoactGamepad);
local l_Focusable_0 = v4.Focusable;
local l_useScreenSize_0 = require(l_CorePackages_0.Workspace.Packages.RobloxAppHooks).useScreenSize;
local l_useNavigation_0 = require(l_CorePackages_0.Workspace.Packages.Navigation).useNavigation;
local l_useLocalization_0 = require(l_CorePackages_0.Workspace.Packages.Localization).Hooks.useLocalization;
local l_useSelector_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useSelector;
local v10 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceNavigation);
local l_AvatarScreen_0 = v10.Enums.AvatarScreen;
local l_useAvatarRoute_0 = v10.AvatarRoute.Hooks.useAvatarRoute;
local l_useDispatch_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useDispatch;
local v14 = require(l_Modules_0.LuaApp.Hooks.useRoactService);
local v15 = require(l_Modules_0.LuaApp.Services.RoactNetworking);
local v16 = require(l_Modules_0.AvatarExperience.AvatarEditor.Thunks.FetchMySharedAvatars);
local v17 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.withMappedNavigationParams);
local v18 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.NavigationUtils);
local v19 = require(l_Modules_0.AvatarExperience.Common.Components.withOverlayFocusHandling);
local v20 = require(l_Modules_0.AvatarExperience.Common.Components.NavOverlayContainer);
local v21 = require(l_CorePackages_0.Packages.UIBlox);
local l_Images_0 = v21.App.ImageSet.Images;
local l_ContextualMenu_0 = v21.App.Menu.ContextualMenu;
local l_MenuDirection_0 = v21.App.Menu.MenuDirection;
local v25 = require(l_Modules_0.AvatarExperience.Flags.FFlagAXRemoveCommunityAvatarEntryMenuGamepadBindings);
return (v17((v19(function(v26) --[[ Line: 53 ]] --[[ Name: CommunityAvatarEntryMenu ]]
    -- upvalues: l_useScreenSize_0 (copy), l_useNavigation_0 (copy), l_useLocalization_0 (copy), l_useDispatch_0 (copy), v14 (copy), v15 (copy), v2 (copy), l_useAvatarRoute_0 (copy), l_useSelector_0 (copy), v18 (copy), l_AvatarScreen_0 (copy), v16 (copy), v25 (copy), l_Images_0 (copy), v3 (copy), v20 (copy), l_Focusable_0 (copy), v4 (copy), l_ContextualMenu_0 (copy), l_MenuDirection_0 (copy)
    local v27 = l_useScreenSize_0();
    local v28 = l_useNavigation_0();
    local v29 = l_useLocalization_0({
        shareAvatar = "Feature.Avatar.Action.ShareAvatar", 
        mySharedAvatar = "Feature.Avatar.Action.MySharedAvatars"
    });
    local v30 = l_useDispatch_0();
    local v31 = v14(v15);
    local _, v33 = v2.createBinding(UDim2.fromOffset(0, 0));
    local v34 = l_useAvatarRoute_0();
    local v36 = l_useSelector_0(function(v35) --[[ Line: 66 ]]
        return v35.Navigation.history;
    end);
    local v37 = v2.useCallback(function() --[[ Line: 70 ]]
        -- upvalues: v18 (ref), v28 (copy), l_AvatarScreen_0 (ref), v34 (copy), v36 (copy)
        v18.closeOverlay(v28);
        v18.closeMySharedAvatars(v28);
        v18.navigateFromOverlay(v28, l_AvatarScreen_0.LookComposerPage, {
            prevNavPage = if v34 then v34.opaque.name else nil, 
            prevNavHistory = v36
        });
    end, {
        v28
    });
    local v38 = v2.useCallback(function() --[[ Line: 79 ]]
        -- upvalues: v30 (copy), v16 (ref), v31 (copy), v18 (ref), v28 (copy), l_AvatarScreen_0 (ref)
        v30(v16(v31));
        v18.navigateFromOverlay(v28, l_AvatarScreen_0.MySharedAvatars);
    end, {
        v30, 
        v28, 
        v31
    });
    local v39 = if v25 then nil else v2.useCallback(function() --[[ Line: 86 ]]
        -- upvalues: v18 (ref), v28 (copy)
        v18.closeOverlay(v28);
    end, {
        v28
    });
    local v40 = v2.useMemo(function() --[[ Line: 90 ]]
        -- upvalues: v29 (copy), l_Images_0 (ref), v37 (copy), v38 (copy)
        return {
            {
                text = v29.shareAvatar, 
                icon = l_Images_0["icons/common/plus"], 
                iconSize = 36, 
                inputBindingKey = "CommonUI.Controls.Action.Confirm", 
                onActivated = v37
            }, 
            {
                text = v29.mySharedAvatar, 
                icon = l_Images_0["icons/actions/friend_sort/my_profile"], 
                iconSize = 36, 
                inputBindingKey = "CommonUI.Controls.Action.Confirm", 
                onActivated = v38
            }
        };
    end, {
        v29, 
        v37, 
        v38
    });
    local v42 = v2.useCallback(function(v41) --[[ Line: 109 ]]
        -- upvalues: v33 (copy)
        v33(UDim2.fromOffset(-v41.AbsolutePosition.X, -v41.AbsolutePosition.Y));
    end, {});
    local v43 = UDim2.fromOffset(v26.entryButtonPosition.X - 300, 0);
    local v44 = UDim2.new(0, 324, 1, 0);
    local v45 = v26.entryButtonPosition.Y + 25;
    return v3.createElement(v20, {
        onAbsolutePositionChanged = v42
    }, {
        SizeFrame = v3.createElement(l_Focusable_0.Frame, {
            BackgroundTransparency = 1, 
            Position = v43, 
            Size = v44, 
            ref = v26.defaultChildRef, 
            inputBindings = if v25 then nil else {
                NavigateBack = v4.Input.onBegin(Enum.KeyCode.ButtonB, v39)
            }
        }, {
            PositionOffsetFrame = v3.createElement("Frame", {
                BackgroundTransparency = 1, 
                Size = UDim2.fromScale(1, 1)
            }, {
                ContextMenu = v3.createElement(l_ContextualMenu_0, {
                    buttonProps = v40, 
                    contextMenuWidthOverride = UDim.new(0, 300), 
                    open = true, 
                    menuDirection = l_MenuDirection_0.Down, 
                    openPositionY = UDim.new(0, v45), 
                    closeBackgroundVisible = true, 
                    screenSize = v27, 
                    onDismiss = if v25 then nil else v39
                })
            })
        })
    });
end))));