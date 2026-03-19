local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v2 = require(l_CorePackages_0.Packages.React);
local l_useNavigation_0 = require(l_CorePackages_0.Workspace.Packages.Navigation).useNavigation;
local v4 = require(l_CorePackages_0.Packages.RoactGamepad);
local l_Focusable_0 = v4.Focusable;
local v6 = require(l_CorePackages_0.Packages.UIBlox);
local v7 = require(l_Modules_0.AvatarExperience.Common.Hooks.useFullView);
local v8 = require(l_Modules_0.AvatarExperience.Common.Enum.FullView);
local _ = require(l_Modules_0.AvatarExperience.Common.AvatarExperienceState);
local v10 = require(l_Modules_0.LuaApp.Components.TopBar.TopBar);
local l_PeekView_0 = require(l_CorePackages_0.Workspace.Packages.PeekView).PeekView;
local l_useSelector_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useSelector;
local v13 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.Debug.NavigationEventsLogger);
local v14 = require(l_Modules_0.AvatarExperience.Common.Constants);
local v15 = require(l_Modules_0.AvatarExperience.Common.Components.BoundInputsUpdater);
local v16 = require(l_Modules_0.LuaApp.Constants);
local v17 = require(l_Modules_0.AvatarExperience.Catalog.Components.Filters.FiltersTopBar);
local v18 = require(l_Modules_0.AvatarExperience.Catalog.Components.Filters.ResetApplyBar);
local v19 = require(l_Modules_0.AvatarExperience.Common.Components.GamepadFocusHandlerForPage);
local v20 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.NavigationUtils);
local l_AvatarScreen_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceNavigation).Enums.AvatarScreen;
local v22 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.withStackVisibilityWrapper);
local v23 = require(l_Modules_0.AvatarExperience.Common.Context.NamedRefsContext);
local _ = require(l_CorePackages_0.Workspace.Packages.AppCommonLib);
local v25 = require(l_CorePackages_0.Workspace.Packages.Responsive);
local l_getUseSelectorDeepEquals_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceCommon).Utils.getUseSelectorDeepEquals;
local l_PeekViewState_0 = require(l_CorePackages_0.Workspace.Packages.PeekView).PeekViewState;
local l_useStyle_0 = v6.Core.Style.useStyle;
local l_useIsGamepad_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).Hooks.useIsGamepad;
local v30 = require(l_CorePackages_0.Workspace.Packages.FocusNavigationUtils);
local v31 = require(l_CorePackages_0.Packages.ReactFocusNavigation);
local v32 = require(l_CorePackages_0.Packages.InputHandlers);
local l_FocusNavigationEventNameEnum_0 = v30.FocusNavigationEventNameEnum;
local l_useTableWrappedCallbackRef_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceCommon).Utils.RoactGamepadMigration.useTableWrappedCallbackRef;
local v35 = require(l_Modules_0.AvatarExperience.Common.Selectors.selectIsPortrait);
local v36 = require(l_Modules_0.AvatarExperience.Common.Hooks.useAvatarExperienceFocusNavigationBindings);
local v37 = require(l_Modules_0.AvatarExperience.Common.Hooks.useOverlayClosedCallback);
local l_FFlagAXMigrateFormPeekViewToFocusNavigation_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagAXMigrateFormPeekViewToFocusNavigation;
local l_FFlagAXMigrateAXToGlobalAutofocus_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagAXMigrateAXToGlobalAutofocus;
local l_FFlagAXCloseFilterOnBackgroundTap_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagAXCloseFilterOnBackgroundTap;
local v41 = {
    [Enum.KeyCode.ButtonB] = l_FocusNavigationEventNameEnum_0.NavigateBack, 
    [Enum.KeyCode.Escape] = l_FocusNavigationEventNameEnum_0.NavigateBack, 
    [Enum.KeyCode.ButtonX] = l_FocusNavigationEventNameEnum_0.FormPeekViewApply, 
    [Enum.KeyCode.ButtonY] = l_FocusNavigationEventNameEnum_0.FormPeekViewReset
};
local function v49(v42, v43, v44, v45) --[[ Line: 86 ]] --[[ Name: useFocusNavigationBindings ]]
    -- upvalues: v31 (copy), v41 (copy), v2 (copy), l_FocusNavigationEventNameEnum_0 (copy), v32 (copy)
    local v46 = v31.useEventMap(v41, v42);
    local v48 = v2.useMemo(function() --[[ Line: 93 ]]
        -- upvalues: l_FocusNavigationEventNameEnum_0 (ref), v32 (ref), v43 (copy), v44 (copy), v45 (copy)
        return {
            [l_FocusNavigationEventNameEnum_0.NavigateBack] = {
                handler = v32.onRelease(function(v47) --[[ Line: 96 ]]
                    -- upvalues: v43 (ref)
                    v47.cancelled = true;
                    v43();
                end)
            }, 
            [l_FocusNavigationEventNameEnum_0.FormPeekViewApply] = if v44 then {
                handler = v32.onRelease(v44)
            } else nil, 
            [l_FocusNavigationEventNameEnum_0.FormPeekViewReset] = if v45 then {
                handler = v32.onRelease(v45)
            } else nil
        };
    end, {
        v43, 
        v44, 
        v45
    });
    return v31.useEventHandlerMap(v48, v46);
end;
return v22(function(v50) --[[ Line: 116 ]] --[[ Name: FormPeekView ]]
    -- upvalues: v7 (copy), v8 (copy), l_useSelector_0 (copy), v35 (copy), l_getUseSelectorDeepEquals_0 (copy), l_FFlagAXMigrateAXToGlobalAutofocus_0 (copy), v4 (copy), v2 (copy), v23 (copy), l_useNavigation_0 (copy), v14 (copy), v10 (copy), l_useStyle_0 (copy), l_useIsGamepad_0 (copy), v25 (copy), v16 (copy), l_FFlagAXCloseFilterOnBackgroundTap_0 (copy), l_FFlagAXMigrateFormPeekViewToFocusNavigation_0 (copy), v49 (copy), l_useTableWrappedCallbackRef_0 (copy), l_Focusable_0 (copy), l_AvatarScreen_0 (copy), v20 (copy), v19 (copy), v13 (copy), v15 (copy), v17 (copy), l_PeekView_0 (copy), l_PeekViewState_0 (copy), v18 (copy), v37 (copy), v36 (copy)
    local v51 = v7() == v8.SceneFullView;
    local v52 = l_useSelector_0(v35, l_getUseSelectorDeepEquals_0());
    local v53 = if l_FFlagAXMigrateAXToGlobalAutofocus_0 then nil else v4.useRootFocusController();
    local v54 = v2.useContext(v23);
    local v55 = v4.useRefCache();
    local v56 = l_useNavigation_0();
    local v57 = nil;
    local v58 = nil;
    if v52 then
        v57 = UDim2.fromScale(0, 0);
        v58 = UDim2.fromScale(1, 1);
    else
        v57 = UDim2.fromScale(v14.LandscapeNavWidth, 0);
        v58 = UDim2.fromScale(v14.LandscapeSceneWidth, 1);
    end;
    local v59 = l_useSelector_0(v10.selectTopBarHeight, l_getUseSelectorDeepEquals_0());
    local l_Theme_0 = l_useStyle_0().Theme;
    local v61 = v2.useRef(nil);
    local v62 = l_useIsGamepad_0();
    local v63 = 80;
    local v64 = v25.usePreferredInput() == v25.Input.Directional;
    if v62 and v64 then
        v63 = v63 + v16.GAMEPAD_BOTTOM_BAR_SIZE;
    end;
    local function v68(v65) --[[ Line: 146 ]] --[[ Name: updatePeekViewContentFrameSize ]]
        -- upvalues: v61 (copy)
        local l_current_0 = v61.current;
        if v65 and l_current_0 then
            local l_Y_0 = v65.AbsoluteSize.Y;
            l_current_0.AutomaticSize = Enum.AutomaticSize.None;
            l_current_0.Size = UDim2.new(1, 0, 0, l_Y_0);
        end;
    end;
    local v69 = nil;
    if l_FFlagAXCloseFilterOnBackgroundTap_0 then
        v69 = v2.useCallback(function() --[[ Line: 157 ]]
            -- upvalues: v50 (copy)
            v50.closePeekViewSignal:fire();
        end, {
            v50.closePeekViewSignal
        });
    end;
    local v70 = nil;
    local v71 = nil;
    local v72 = nil;
    if l_FFlagAXMigrateFormPeekViewToFocusNavigation_0 then
        local v73 = v2.useCallback(function() --[[ Line: 166 ]]
            -- upvalues: v50 (copy)
            v50.closePeekViewSignal:fire();
        end, {
            v50.closePeekViewSignal
        });
        local v74 = v49(v55.SortAndFiltersContent, v73, if v50.canApply then v50.onApply else nil, if v50.canReset then v50.onReset else nil);
        local v75 = v49(v55.FiltersTopBar, v73, if v50.canApply then v50.onApply else nil, if v50.canReset then v50.onReset else nil);
        local v76 = v49(v55.BottomBar, v73, if v50.canApply then v50.onApply else nil, if v50.canReset then v50.onReset else nil);
        v70 = l_useTableWrappedCallbackRef_0(v74);
        v71 = l_useTableWrappedCallbackRef_0(v75);
        v72 = l_useTableWrappedCallbackRef_0(v76);
    end;
    local v79 = v2.createElement(l_FFlagAXMigrateAXToGlobalAutofocus_0 and "Frame" or l_Focusable_0.Frame, {
        BackgroundTransparency = 1, 
        BorderSizePixel = 0, 
        Size = UDim2.new(1, 0, 1, 0), 
        Visible = not v51, 
        restorePreviousChildFocus = not l_FFlagAXMigrateAXToGlobalAutofocus_0 or nil, 
        focusController = if l_FFlagAXMigrateAXToGlobalAutofocus_0 then nil else v53, 
        defaultChild = if l_FFlagAXMigrateAXToGlobalAutofocus_0 then nil else v55.SortAndFiltersContent, 
        ref = v54[l_AvatarScreen_0.SortAndFilters], 
        NextSelectionLeft = if l_FFlagAXMigrateAXToGlobalAutofocus_0 then nil else v54[l_AvatarScreen_0.Catalog], 
        inputBindings = if l_FFlagAXMigrateFormPeekViewToFocusNavigation_0 then nil else {
            NavigateBack = v4.Input.onBegin(Enum.KeyCode.ButtonB, function() --[[ Line: 206 ]]
                -- upvalues: v20 (ref), v56 (copy)
                v20.closeFocusedScreen(v56);
            end)
        }
    }, {
        GamepadFocusHandlerForPage = if l_FFlagAXMigrateAXToGlobalAutofocus_0 then nil else v2.createElement(v19, {
            focusController = v53, 
            captureFocusOnMount = true
        }), 
        NavigationEventsLogger = v2.createElement(v13), 
        BoundInputsUpdater = if l_FFlagAXMigrateAXToGlobalAutofocus_0 then nil else v2.createElement(v15), 
        Content = v2.createElement(l_FFlagAXMigrateAXToGlobalAutofocus_0 and "Frame" or l_Focusable_0.Frame, {
            BackgroundTransparency = 1, 
            BorderSizePixel = 0, 
            Size = v58, 
            Position = v57, 
            restorePreviousChildFocus = not l_FFlagAXMigrateAXToGlobalAutofocus_0 or nil, 
            inputBindings = if not not l_FFlagAXMigrateAXToGlobalAutofocus_0 or l_FFlagAXMigrateFormPeekViewToFocusNavigation_0 then nil else {
                Close = v4.Input.onBegin(Enum.KeyCode.ButtonB, function() --[[ Line: 232 ]]
                    -- upvalues: v50 (copy)
                    v50.closePeekViewSignal:fire();
                end, {
                    key = "CommonUI.Controls.Action.Back"
                }), 
                Apply = if v50.canApply then v4.Input.onBegin(Enum.KeyCode.ButtonX, v50.onApply, {
                    key = "CommonUI.Messages.Action.Apply"
                }) else nil, 
                Reset = if v50.canReset then v4.Input.onBegin(Enum.KeyCode.ButtonY, v50.onReset, {
                    key = "CommonUI.Messages.Action.Reset"
                }) else nil
            }
        }, {
            Background = v2.createElement("TextButton", {
                BackgroundTransparency = v52 and l_Theme_0.Overlay.Transparency or 1, 
                BackgroundColor3 = l_Theme_0.Overlay.Color, 
                Size = UDim2.new(1, 0, 1, v59), 
                Position = UDim2.fromOffset(0, -v59), 
                ZIndex = 1, 
                Text = "", 
                AutoButtonColor = false, 
                [v2.Event.Activated] = if l_FFlagAXCloseFilterOnBackgroundTap_0 then v69 else nil
            }), 
            FiltersTopBar = v2.createElement(v17, {
                buttonRef = if l_FFlagAXMigrateFormPeekViewToFocusNavigation_0 then v71 else v55.FiltersTopBar, 
                NextSelectionDown = v55.SortAndFiltersContent, 
                closePeekViewSignal = v50.closePeekViewSignal
            }), 
            PeekViewContainer = v2.createElement("Frame", {
                BackgroundTransparency = 1, 
                ClipsDescendants = true, 
                Position = UDim2.fromOffset(0, v59), 
                Size = UDim2.new(1, 0, 1, -v59), 
                ZIndex = 2
            }, {
                PeekView = v2.createElement(l_PeekView_0, {
                    briefViewContentHeight = UDim.new(0, 0), 
                    mountAnimation = true, 
                    mountAsFullView = true, 
                    canDragFullViewToBrief = false, 
                    showDraggerInClosedState = false, 
                    returnToFullView = true, 
                    thumbstickScrollEnabled = true, 
                    contentFrameRef = v61, 
                    closeSignal = v50.closePeekViewSignal, 
                    viewStateChanged = function(v77, _) --[[ Line: 288 ]] --[[ Name: viewStateChanged ]]
                        -- upvalues: l_PeekViewState_0 (ref), v56 (copy)
                        if v77 == l_PeekViewState_0.Closed then
                            v56.goBack();
                        end;
                    end, 
                    bottomDockedContainerHeight = v63, 
                    bottomDockedContainerContent = v2.createElement(v18, {
                        height = v63, 
                        canReset = v50.canReset, 
                        canApply = v50.canApply, 
                        onReset = v50.onReset, 
                        onApply = v50.onApply, 
                        frameRef = if l_FFlagAXMigrateFormPeekViewToFocusNavigation_0 then v72 else v55.BottomBar, 
                        NextSelectionUp = v55.SortAndFiltersContent
                    }), 
                    backgroundColor3 = l_Theme_0.BackgroundDefault.Color, 
                    backgroundTransparency = l_Theme_0.BackgroundUIDefault.Transparency, 
                    peekHeaderClose = true, 
                    isScrollingEnabled = true
                }, {
                    SortAndFiltersContent = v2.createElement(l_FFlagAXMigrateAXToGlobalAutofocus_0 and "Frame" or l_Focusable_0.Frame, {
                        Size = v50.totalSize, 
                        AutomaticSize = if v50.useAutomaticSize then Enum.AutomaticSize.Y else nil, 
                        BorderSizePixel = 0, 
                        BackgroundTransparency = 1, 
                        ref = if l_FFlagAXMigrateFormPeekViewToFocusNavigation_0 then v70 else v55.SortAndFiltersContent, 
                        NextSelectionUp = if l_FFlagAXMigrateAXToGlobalAutofocus_0 then nil else if l_FFlagAXMigrateFormPeekViewToFocusNavigation_0 then v71 else v55.FiltersTopBar, 
                        NextSelectionDown = if l_FFlagAXMigrateAXToGlobalAutofocus_0 then nil else v55.BottomBar, 
                        [v2.Change.AbsoluteSize] = v68, 
                        defaultChild = if l_FFlagAXMigrateAXToGlobalAutofocus_0 then nil else v55.Filters, 
                        restorePreviousChildFocus = not l_FFlagAXMigrateAXToGlobalAutofocus_0 or nil
                    }, {
                        Layout = v2.createElement("UIListLayout", {
                            SortOrder = Enum.SortOrder.LayoutOrder, 
                            FillDirection = Enum.FillDirection.Vertical
                        }), 
                        Children = v2.createElement(v2.Fragment, {}, v50.children)
                    })
                })
            })
        })
    });
    local v80 = v37(if l_FFlagAXMigrateAXToGlobalAutofocus_0 then nil else v53);
    local v81 = v36({
        overlayClosedCallback = v80
    });
    return v2.createElement("Frame", {
        ref = v81, 
        BackgroundTransparency = 1, 
        BorderSizePixel = 0, 
        Size = UDim2.fromScale(1, 1), 
        Visible = not v51
    }, v79);
end);