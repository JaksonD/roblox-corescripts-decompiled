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
local l_FFlagUseNavigationSelectors_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagUseNavigationSelectors;
local l_Selectors_0 = require(l_CorePackages_0.Workspace.Packages.NavigationRodux).Selectors;
local v12 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceNavigation);
local l_AvatarScreen_0 = v12.Enums.AvatarScreen;
local l_useAvatarRoute_0 = v12.AvatarRoute.Hooks.useAvatarRoute;
local l_useDispatch_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useDispatch;
local v16 = require(l_Modules_0.LuaApp.Hooks.useRoactService);
local v17 = require(l_Modules_0.LuaApp.Services.RoactNetworking);
local v18 = require(l_Modules_0.AvatarExperience.AvatarEditor.Thunks.FetchMySharedAvatars);
local v19 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.withMappedNavigationParams);
local v20 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.NavigationUtils);
local v21 = require(l_Modules_0.AvatarExperience.Common.Components.withOverlayFocusHandling);
local v22 = require(l_Modules_0.AvatarExperience.Common.Components.NavOverlayContainer);
local v23 = require(l_CorePackages_0.Packages.UIBlox);
local l_Images_0 = v23.App.ImageSet.Images;
local l_ContextualMenu_0 = v23.App.Menu.ContextualMenu;
local l_MenuDirection_0 = v23.App.Menu.MenuDirection;
local v27 = require(l_Modules_0.AvatarExperience.Flags.FFlagAXRemoveCommunityAvatarEntryMenuGamepadBindings);
return (v19((v21(function(v28) --[[ Line: 55 ]] --[[ Name: CommunityAvatarEntryMenu ]]
    -- upvalues: l_useScreenSize_0 (copy), l_useNavigation_0 (copy), l_useLocalization_0 (copy), l_useDispatch_0 (copy), v16 (copy), v17 (copy), v2 (copy), l_useAvatarRoute_0 (copy), l_useSelector_0 (copy), l_FFlagUseNavigationSelectors_0 (copy), l_Selectors_0 (copy), v20 (copy), l_AvatarScreen_0 (copy), v18 (copy), v27 (copy), l_Images_0 (copy), v3 (copy), v22 (copy), l_Focusable_0 (copy), v4 (copy), l_ContextualMenu_0 (copy), l_MenuDirection_0 (copy)
    local v29 = l_useScreenSize_0();
    local v30 = l_useNavigation_0();
    local v31 = l_useLocalization_0({
        shareAvatar = "Feature.Avatar.Action.ShareAvatar", 
        mySharedAvatar = "Feature.Avatar.Action.MySharedAvatars"
    });
    local v32 = l_useDispatch_0();
    local v33 = v16(v17);
    local _, v35 = v2.createBinding(UDim2.fromOffset(0, 0));
    local v36 = l_useAvatarRoute_0();
    local v38 = l_useSelector_0(function(v37) --[[ Line: 68 ]]
        -- upvalues: l_FFlagUseNavigationSelectors_0 (ref), l_Selectors_0 (ref)
        if l_FFlagUseNavigationSelectors_0 then
            return l_Selectors_0.selectLegacyHistory(v37);
        else
            return v37.Navigation.history;
        end;
    end);
    local v39 = v2.useCallback(function() --[[ Line: 75 ]]
        -- upvalues: v20 (ref), v30 (copy), l_AvatarScreen_0 (ref), v36 (copy), v38 (copy)
        v20.closeOverlay(v30);
        v20.closeMySharedAvatars(v30);
        v20.navigateFromOverlay(v30, l_AvatarScreen_0.LookComposerPage, {
            prevNavPage = if v36 then v36.opaque.name else nil, 
            prevNavHistory = v38
        });
    end, {
        v30
    });
    local v40 = v2.useCallback(function() --[[ Line: 84 ]]
        -- upvalues: v32 (copy), v18 (ref), v33 (copy), v20 (ref), v30 (copy), l_AvatarScreen_0 (ref)
        v32(v18(v33));
        v20.navigateFromOverlay(v30, l_AvatarScreen_0.MySharedAvatars);
    end, {
        v32, 
        v30, 
        v33
    });
    local v41 = if v27 then nil else v2.useCallback(function() --[[ Line: 91 ]]
        -- upvalues: v20 (ref), v30 (copy)
        v20.closeOverlay(v30);
    end, {
        v30
    });
    local v42 = v2.useMemo(function() --[[ Line: 95 ]]
        -- upvalues: v31 (copy), l_Images_0 (ref), v39 (copy), v40 (copy)
        return {
            {
                text = v31.shareAvatar, 
                icon = l_Images_0["icons/common/plus"], 
                iconSize = 36, 
                inputBindingKey = "CommonUI.Controls.Action.Confirm", 
                onActivated = v39
            }, 
            {
                text = v31.mySharedAvatar, 
                icon = l_Images_0["icons/actions/friend_sort/my_profile"], 
                iconSize = 36, 
                inputBindingKey = "CommonUI.Controls.Action.Confirm", 
                onActivated = v40
            }
        };
    end, {
        v31, 
        v39, 
        v40
    });
    local v44 = v2.useCallback(function(v43) --[[ Line: 114 ]]
        -- upvalues: v35 (copy)
        v35(UDim2.fromOffset(-v43.AbsolutePosition.X, -v43.AbsolutePosition.Y));
    end, {});
    local v45 = UDim2.fromOffset(v28.entryButtonPosition.X - 300, 0);
    local v46 = UDim2.new(0, 324, 1, 0);
    local v47 = v28.entryButtonPosition.Y + 25;
    return v3.createElement(v22, {
        onAbsolutePositionChanged = v44
    }, {
        SizeFrame = v3.createElement(l_Focusable_0.Frame, {
            BackgroundTransparency = 1, 
            Position = v45, 
            Size = v46, 
            ref = v28.defaultChildRef, 
            inputBindings = if v27 then nil else {
                NavigateBack = v4.Input.onBegin(Enum.KeyCode.ButtonB, v41)
            }
        }, {
            PositionOffsetFrame = v3.createElement("Frame", {
                BackgroundTransparency = 1, 
                Size = UDim2.fromScale(1, 1)
            }, {
                ContextMenu = v3.createElement(l_ContextualMenu_0, {
                    buttonProps = v42, 
                    contextMenuWidthOverride = UDim.new(0, 300), 
                    open = true, 
                    menuDirection = l_MenuDirection_0.Down, 
                    openPositionY = UDim.new(0, v47), 
                    closeBackgroundVisible = true, 
                    screenSize = v29, 
                    onDismiss = if v27 then nil else v41
                })
            })
        })
    });
end))));