local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v2 = require(l_CorePackages_0.Packages.Foundation);
local v3 = require(l_CorePackages_0.Packages.React);
local v4 = require(l_CorePackages_0.Packages.RoactGamepad);
local v5 = require(l_CorePackages_0.Workspace.Packages.RoactUtils);
local v6 = require(l_CorePackages_0.Workspace.Packages.FocusNavigationUtils);
local v7 = require(l_CorePackages_0.Packages.ReactFocusNavigation);
local v8 = require(l_CorePackages_0.Packages.InputHandlers);
local l_FocusNavigationEventNameEnum_0 = v6.FocusNavigationEventNameEnum;
local l_useTableWrappedCallbackRef_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceCommon).Utils.RoactGamepadMigration.useTableWrappedCallbackRef;
local l_getSafeAreaSize_0 = require(l_CorePackages_0.Workspace.Packages.InputUi).getSafeAreaSize;
local l_useSelector_0 = v5.Hooks.RoactRodux.useSelector;
local l_useLocalization_0 = require(l_CorePackages_0.Workspace.Packages.Localization).Hooks.useLocalization;
local v14 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceControlBar);
local l_IconOnlyMenu_0 = v14.IconOnlyMenu;
local l_MenuItemEnum_0 = v14.Enums.MenuItemEnum;
local v17 = require(l_Modules_0.AvatarExperience.Common.Components.AdaptiveScrollingView);
local v18 = require(l_Modules_0.AvatarExperience.Common.Constants);
local v19 = require(l_Modules_0.AvatarExperience.Common.Components.GamepadFocusHandlerForPage);
local v20 = require(l_Modules_0.AvatarExperience.Common.Components.Scene.SceneInteractionFrame);
local v21 = require(l_Modules_0.AvatarExperience.Common.Hooks.useFullView);
local v22 = require(l_Modules_0.AvatarExperience.Common.Enum.FullView);
local v23 = require(l_Modules_0.AvatarExperience.Common.Components.BottomInsetBackground);
local v24 = require(l_Modules_0.LuaApp.Components.TopBar.TopBar);
local v25 = require(l_Modules_0.AvatarExperience.Photobooth.Components.Scenes.PhotoboothScenesContainer);
local v26 = require(l_Modules_0.AvatarExperience.Photobooth.Components.Animations.PhotoboothAnimationsContainer);
local v27 = require(l_Modules_0.AvatarExperience.Photobooth.Components.PhotoboothShareModal);
local v28 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceFlags);
local l_FFlagAXPhotoboothBugBashFixes_0 = v28.FFlagAXPhotoboothBugBashFixes;
local l_FFlagAXMigrateAXToGlobalAutofocus_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagAXMigrateAXToGlobalAutofocus;
local l_FFlagAXPhotoboothShareModal_0 = v28.FFlagAXPhotoboothShareModal;
local l_Focusable_0 = v4.Focusable;
local v33 = if l_FFlagAXPhotoboothBugBashFixes_0 then v18.PeekHeaderHeight + v18.MainNavPhotoboothHeight else v18.PeekHeaderHeight + v18.MainNavHeight + v18.SubNavHeight;
local function v35(v34) --[[ Line: 63 ]] --[[ Name: selectGlobalGuiInset ]]
    return v34.GlobalGuiInset;
end;
local function v37(v36) --[[ Line: 67 ]] --[[ Name: selectScreenSize ]]
    return v36.ScreenSize;
end;
local v38 = {
    [Enum.KeyCode.ButtonB] = l_FocusNavigationEventNameEnum_0.NavigateBack, 
    [Enum.KeyCode.Escape] = l_FocusNavigationEventNameEnum_0.NavigateBack
};
local function v44(v39, v40) --[[ Line: 96 ]] --[[ Name: useFocusNavigationBindings ]]
    -- upvalues: v7 (copy), v38 (copy), v3 (copy), l_FocusNavigationEventNameEnum_0 (copy), v8 (copy)
    local v41 = v7.useEventMap(v38, v39);
    local v43 = v3.useMemo(function() --[[ Line: 98 ]]
        -- upvalues: l_FocusNavigationEventNameEnum_0 (ref), v8 (ref), v40 (copy)
        return {
            [l_FocusNavigationEventNameEnum_0.NavigateBack] = {
                handler = v8.onRelease(function(v42) --[[ Line: 101 ]]
                    -- upvalues: v40 (ref)
                    v42.cancelled = true;
                    v40();
                end)
            }
        };
    end, {
        v40
    });
    return v7.useEventHandlerMap(v43, v41);
end;
return function(v45) --[[ Line: 111 ]] --[[ Name: PhotoboothPage ]]
    -- upvalues: l_FFlagAXMigrateAXToGlobalAutofocus_0 (copy), v3 (copy), l_useLocalization_0 (copy), v21 (copy), l_FFlagAXPhotoboothBugBashFixes_0 (copy), v22 (copy), l_useSelector_0 (copy), v35 (copy), v37 (copy), l_getSafeAreaSize_0 (copy), v18 (copy), l_MenuItemEnum_0 (copy), v44 (copy), l_useTableWrappedCallbackRef_0 (copy), v17 (copy), v33 (copy), v2 (copy), v26 (copy), v25 (copy), l_Focusable_0 (copy), v19 (copy), v24 (copy), v20 (copy), l_IconOnlyMenu_0 (copy), v23 (copy), l_FFlagAXPhotoboothShareModal_0 (copy), v27 (copy)
    local l_tokens_0 = v45.tokens;
    local v47 = if l_FFlagAXMigrateAXToGlobalAutofocus_0 then nil else v45.focusController;
    local v48 = v3.useRef(nil);
    local v49 = l_useLocalization_0({
        Photobooth = "Feature.Avatar.Label.Photobooth"
    });
    local _, v51 = v21();
    local v52 = v3.useCallback(function() --[[ Line: 124 ]]
        -- upvalues: l_FFlagAXPhotoboothBugBashFixes_0 (ref), v45 (copy), v51 (copy), v22 (ref)
        if l_FFlagAXPhotoboothBugBashFixes_0 and v45.isPortrait then
            v51(v22.None);
        end;
    end, {
        v51, 
        v45.isPortrait
    });
    local v53 = l_useSelector_0(v35);
    local v54 = l_useSelector_0(v37);
    local v55 = v3.useMemo(function() --[[ Line: 134 ]]
        -- upvalues: v54 (copy), v53 (copy), v45 (copy)
        return v54.Y - v53.bottom - v45.topBarHeight;
    end, {
        v54.Y, 
        v53.bottom, 
        v45.topBarHeight
    });
    local v56 = v55 - v3.useMemo(function() --[[ Line: 138 ]]
        -- upvalues: l_getSafeAreaSize_0 (ref), v54 (copy), v53 (copy), v18 (ref)
        return l_getSafeAreaSize_0(v54, v53).Y.Offset * v18.PortraitSceneHeight;
    end, {
        v54, 
        v53
    });
    local v57, v58 = v3.useState(Vector2.new(0, 0));
    local v60 = v3.useCallback(function(v59) --[[ Line: 149 ]]
        -- upvalues: v58 (copy)
        v58(Vector2.new(v59.AbsoluteSize.X, v59.AbsoluteSize.Y));
    end, {});
    local v61 = v3.useCallback(function() --[[ Line: 153 ]]
        -- upvalues: v45 (copy)
        v45.onBackButtonPressed();
    end, {
        v45.onBackButtonPressed
    });
    v3.useEffect(function() --[[ Line: 158 ]]
        -- upvalues: l_FFlagAXPhotoboothBugBashFixes_0 (ref), v45 (copy), v51 (copy), v22 (ref), l_MenuItemEnum_0 (ref)
        if l_FFlagAXPhotoboothBugBashFixes_0 and not v45.isPortrait then
            v51(v22.SceneFullView);
            return;
        elseif v45.activeMenuItemId == "" then
            v51(v22.SceneFullView);
            return;
        else
            if l_FFlagAXPhotoboothBugBashFixes_0 and (v45.activeMenuItemId == l_MenuItemEnum_0.Photobooth.Animations or v45.activeMenuItemId == l_MenuItemEnum_0.Photobooth.Scenes) and v45.isPortrait then
                v51(v22.None);
            end;
            return;
        end;
    end, {
        v45.activeMenuItemId, 
        v45.isPortrait
    });
    local v62 = v44(nil, v61);
    local v63 = l_useTableWrappedCallbackRef_0(v62);
    local v64 = l_FFlagAXPhotoboothBugBashFixes_0 and v45.isPortrait and v53.bottom > 0 and v45.activeMenuItemId ~= "";
    local v65 = v3.useMemo(function() --[[ Line: 181 ]]
        -- upvalues: v45 (copy), l_MenuItemEnum_0 (ref), v3 (ref), v17 (ref), v55 (copy), v56 (copy), v33 (ref), l_FFlagAXPhotoboothBugBashFixes_0 (ref), v2 (ref), l_tokens_0 (copy), v26 (ref), v52 (copy), v25 (ref), v57 (copy)
        if v45.isPortrait then
            if v45.activeMenuItemId == l_MenuItemEnum_0.Photobooth.Animations then
                return (v3.createElement(v17, {
                    fullHeight = v55, 
                    midHeight = v56, 
                    alwaysShowingHeight = v33, 
                    topBarHeight = v45.topBarHeight, 
                    fullHeightOptions = {
                        opaqueBackground = true, 
                        draggerToDivider = not l_FFlagAXPhotoboothBugBashFixes_0 or false
                    }
                }, {
                    AnimationContent = v3.createElement(v2.View, {
                        tag = "padding-x-large col gap-small", 
                        backgroundStyle = {
                            Color3 = l_tokens_0.Color.OverMedia.OverMedia_0.Color3, 
                            Transparency = 0
                        }, 
                        Size = UDim2.new(1, 0, 1, 0)
                    }, {
                        PhotoboothAnimationsContainer = v3.createElement(v26, {
                            Position = UDim2.fromOffset(0, 0), 
                            onTileClicked = v52
                        })
                    })
                }));
            elseif v45.activeMenuItemId == l_MenuItemEnum_0.Photobooth.Scenes then
                return (v3.createElement(v17, {
                    fullHeight = v55, 
                    midHeight = v56, 
                    alwaysShowingHeight = v33, 
                    topBarHeight = v45.topBarHeight, 
                    fullHeightOptions = {
                        opaqueBackground = true, 
                        draggerToDivider = not l_FFlagAXPhotoboothBugBashFixes_0 or false
                    }
                }, {
                    ScenesContent = v3.createElement(v2.View, {
                        tag = "padding-x-large col gap-small", 
                        backgroundStyle = {
                            Color3 = l_tokens_0.Color.OverMedia.OverMedia_0.Color3, 
                            Transparency = 0
                        }, 
                        Size = UDim2.new(1, 0, 1, 0)
                    }, {
                        ScenesContainer = v3.createElement(v25, {
                            Position = UDim2.fromOffset(0, 0), 
                            onTileClicked = v52
                        })
                    })
                }));
            end;
        elseif v45.activeMenuItemId == l_MenuItemEnum_0.Photobooth.Animations then
            return (v3.createElement(v2.View, {
                tag = "padding-y-medium padding-x-large radius-medium col gap-small", 
                backgroundStyle = l_tokens_0.Color.OverMedia.OverMedia_0, 
                Size = UDim2.new(0.4, 0, 0.7, 0), 
                Position = UDim2.fromOffset(v57.X + (l_tokens_0.Size.Size_500 + l_tokens_0.Size.Size_300), v45.topBarHeight)
            }, {
                AnimationContent = v3.createElement(v26, {
                    Position = UDim2.fromOffset(0, 0), 
                    onTileClicked = v52
                })
            }));
        elseif v45.activeMenuItemId == l_MenuItemEnum_0.Photobooth.Scenes then
            return (v3.createElement(v2.View, {
                tag = "padding-y-medium padding-x-large radius-medium col gap-small", 
                backgroundStyle = l_tokens_0.Color.OverMedia.OverMedia_0, 
                Size = UDim2.new(0.4, 0, 0.7, 0), 
                Position = UDim2.fromOffset(v57.X + (l_tokens_0.Size.Size_500 + l_tokens_0.Size.Size_300), v45.topBarHeight)
            }, {
                ScenesContent = v3.createElement(v25, {
                    Position = UDim2.fromOffset(0, 0), 
                    onTileClicked = v52
                })
            }));
        end;
        return (v3.createElement(v2.View, {}));
    end, {
        v45.activeMenuItemId, 
        v45.isPortrait, 
        v57, 
        v45.topBarHeight, 
        l_tokens_0
    });
    return v3.createElement(l_Focusable_0.Frame, {
        Size = UDim2.fromScale(1, 1), 
        BackgroundTransparency = 1, 
        focusController = if l_FFlagAXMigrateAXToGlobalAutofocus_0 then nil else v47, 
        defaultChild = v48, 
        ref = v63
    }, {
        GamepadFocusHandlerForPage = if l_FFlagAXMigrateAXToGlobalAutofocus_0 then nil else v3.createElement(v19, {
            focusController = v47, 
            captureFocusOnMount = true
        }), 
        PhotoboothTopBar = v3.createElement(v24.Container, {
            titleText = v49.Photobooth, 
            transparentBackground = true, 
            leftItem = v24.makeBackButton(v45.onBackButtonPressed), 
            ref = v48, 
            ZIndex = 4
        }), 
        SceneInteraction = v3.createElement(v20), 
        PBControlBarContainer = v3.createElement(v2.View, {
            tag = "auto-xy col gap-small", 
            ZIndex = 2, 
            Position = UDim2.fromOffset(l_tokens_0.Size.Size_500, v45.topBarHeight), 
            onAbsoluteSizeChanged = v60
        }, {
            FirstMenu = v3.createElement(l_IconOnlyMenu_0, {
                items = v45.firstMenuItems, 
                direction = "vertical", 
                activeItemId = v45.activeMenuItemId, 
                onItemActivated = v45.onMenuItemActivated, 
                LayoutOrder = 1
            }), 
            SecondMenu = v3.createElement(l_IconOnlyMenu_0, {
                items = v45.secondMenuItems, 
                direction = "vertical", 
                activeItemId = v45.activeMenuItemId, 
                onItemActivated = v45.onMenuItemActivated, 
                LayoutOrder = 2
            })
        }), 
        FlashOverlay = v3.createElement("Frame", {
            Size = UDim2.fromScale(1, 1), 
            Position = UDim2.fromScale(0, 0), 
            BackgroundColor3 = l_tokens_0.Color.OverMedia.OverMedia_0.Color3, 
            BackgroundTransparency = 1, 
            BorderSizePixel = 0, 
            ZIndex = 10000, 
            Visible = true, 
            ref = v45.flashRef
        }), 
        ActiveComponent = v3.createElement(v2.View, {
            tag = "size-full-full", 
            ZIndex = 3
        }, {
            Content = v65
        }), 
        BottomInsetBackground = if l_FFlagAXPhotoboothBugBashFixes_0 and v64 then v3.createElement(v23, {
            globalGuiInset = v53
        }) else nil, 
        ShareModal = if l_FFlagAXPhotoboothShareModal_0 and v45.isShareModalVisible and v45.onShareModalClose then v3.createElement(v27, {
            isVisible = v45.isShareModalVisible or false, 
            screenshotPath = v45.screenshotPath, 
            onClose = v45.onShareModalClose
        }) else nil
    });
end;