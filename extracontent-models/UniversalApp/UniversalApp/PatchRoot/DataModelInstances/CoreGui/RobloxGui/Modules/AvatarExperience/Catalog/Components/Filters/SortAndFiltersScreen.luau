local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_GuiService_0 = game:GetService("GuiService");
local l_Modules_0 = l_CoreGui_0.RobloxGui.Modules;
local v4 = require(l_CorePackages_0.Packages.ReactUtils);
local v5 = require(l_CorePackages_0.Packages.React);
local l_useNavigation_0 = require(l_CorePackages_0.Workspace.Packages.Navigation).useNavigation;
local v7 = require(l_CorePackages_0.Packages.RoactGamepad);
local l_Focusable_0 = v7.Focusable;
local v9 = require(l_CorePackages_0.Packages.UIBlox);
local l_useInitializedValue_0 = v4.useInitializedValue;
local v11 = require(l_Modules_0.AvatarExperience.Common.Hooks.useFullView);
local v12 = require(l_Modules_0.AvatarExperience.Common.Enum.FullView);
local _ = require(l_Modules_0.AvatarExperience.Common.AvatarExperienceState);
local v14 = require(l_Modules_0.LuaApp.Components.TopBar.TopBar);
local l_PeekView_0 = require(l_CorePackages_0.Workspace.Packages.PeekView).PeekView;
local l_useSelector_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useSelector;
local v17 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.Debug.NavigationEventsLogger);
local v18 = require(l_Modules_0.AvatarExperience.Common.Constants);
local v19 = require(l_Modules_0.AvatarExperience.Common.Components.BoundInputsUpdater);
local v20 = require(l_Modules_0.LuaApp.Constants);
local v21 = require(l_Modules_0.AvatarExperience.Catalog.Components.Filters.FiltersTopBar);
local v22 = require(l_Modules_0.AvatarExperience.Catalog.Components.Filters.ResetApplyBar);
local v23 = require(l_Modules_0.AvatarExperience.Common.Components.GamepadFocusHandlerForPage);
local v24 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.NavigationUtils);
local v25 = require(l_CorePackages_0.Workspace.Packages.FocusNavigationUtils);
local v26 = require(l_CorePackages_0.Packages.ReactFocusNavigation);
local v27 = require(l_CorePackages_0.Packages.InputHandlers);
local l_FocusNavigationEventNameEnum_0 = v25.FocusNavigationEventNameEnum;
local v29 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceNavigation);
local l_AvatarScreen_0 = v29.Enums.AvatarScreen;
local l_useAvatarRoute_0 = v29.AvatarRoute.Hooks.useAvatarRoute;
local v32 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.withStackVisibilityWrapper);
local v33 = require(l_Modules_0.AvatarExperience.Catalog.Components.Filters.FilterSection);
local v34 = require(l_Modules_0.AvatarExperience.Catalog.Components.Filters.Filters);
local v35 = require(l_Modules_0.AvatarExperience.Catalog.Components.Filters.Sorts);
local v36 = require(l_Modules_0.AvatarExperience.Catalog.Hooks.useFiltersController);
local v37 = require(l_Modules_0.AvatarExperience.Catalog.Hooks.useSortsController);
local l_useLocalization_0 = require(l_CorePackages_0.Workspace.Packages.Localization).Hooks.useLocalization;
local v39 = require(l_Modules_0.AvatarExperience.Catalog.Components.Filters.FilterUtils);
local v40 = require(l_Modules_0.AvatarExperience.Common.Context.NamedRefsContext);
local v41 = require(l_Modules_0.AvatarExperience.Catalog.Hooks.useCloseFiltersSignal);
local l_PeekViewState_0 = require(l_CorePackages_0.Workspace.Packages.PeekView).PeekViewState;
local l_useStyle_0 = v9.Core.Style.useStyle;
local l_useIsGamepad_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).Hooks.useIsGamepad;
local l_useDispatch_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useDispatch;
local v46 = require(l_Modules_0.AvatarExperience.Catalog.Thunks.SendApplySortAndFiltersAnalytics);
local v47 = require(l_Modules_0.LuaApp.Hooks.useRoactService);
local v48 = require(l_Modules_0.AvatarExperience.Catalog.Services.Analytics);
local _ = require(l_Modules_0.AvatarExperience.Catalog.SearchTypes);
local v50 = require(l_Modules_0.AvatarExperience.Catalog.Thunks.NavigateToSearch);
local v51 = require(l_Modules_0.AvatarExperience.Common.Selectors.selectIsPortrait);
local v52 = require(l_Modules_0.AvatarExperience.Common.Hooks.useAvatarExperienceFocusNavigationBindings);
local v53 = require(l_Modules_0.AvatarExperience.Common.Hooks.useOverlayClosedCallback);
local v54 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceCommon);
local l_useTableWrappedCallbackRef_0 = v54.Utils.RoactGamepadMigration.useTableWrappedCallbackRef;
local l_getUseSelectorDeepEquals_0 = v54.Utils.getUseSelectorDeepEquals;
local l_FFlagAXMigrateSortAndFiltersScreenInputBindingsToFocusNavigation_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagAXMigrateSortAndFiltersScreenInputBindingsToFocusNavigation;
local l_FFlagAXMigrateAXToGlobalAutofocus_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagAXMigrateAXToGlobalAutofocus;
local v59 = l_GuiService_0:IsTenFootInterface();
local v60 = {
    [Enum.KeyCode.ButtonX] = l_FocusNavigationEventNameEnum_0.SortAndFiltersApply, 
    [Enum.KeyCode.ButtonY] = l_FocusNavigationEventNameEnum_0.SortAndFiltersReset
};
local function _(v61) --[[ Line: 94 ]] --[[ Name: getTotalSectionHeight ]]
    return v61 + 24 + 24;
end;
local function v66() --[[ Line: 98 ]] --[[ Name: useSearchParameters ]]
    -- upvalues: l_useAvatarRoute_0 (copy), l_AvatarScreen_0 (copy), l_useSelector_0 (copy), l_getUseSelectorDeepEquals_0 (copy)
    local v63 = l_useAvatarRoute_0();
    local v64 = if v63.opaque.name == l_AvatarScreen_0.CatalogSearch then v63.opaque.params.detail else nil;
    return (l_useSelector_0(function(v65) --[[ Line: 103 ]]
        -- upvalues: v64 (copy)
        if v64 then
            return v65.SearchesParameters[v64];
        else
            return nil;
        end;
    end, l_getUseSelectorDeepEquals_0()));
end;
local function v74(v67, v68, v69) --[[ Line: 110 ]] --[[ Name: useSortAndFiltersScreenFocusNavigationBindings ]]
    -- upvalues: v26 (copy), v60 (copy), v5 (copy), l_FocusNavigationEventNameEnum_0 (copy), v27 (copy)
    local v70 = v26.useEventMap(v60, v67);
    local v73 = v5.useMemo(function() --[[ Line: 116 ]]
        -- upvalues: l_FocusNavigationEventNameEnum_0 (ref), v68 (copy), v27 (ref), v69 (copy)
        return {
            [l_FocusNavigationEventNameEnum_0.SortAndFiltersApply] = if v68 then {
                handler = v27.onRelease(function(_) --[[ Line: 120 ]]
                    -- upvalues: v68 (ref)
                    v68();
                end)
            } else nil, 
            [l_FocusNavigationEventNameEnum_0.SortAndFiltersReset] = if v69 then {
                handler = v27.onRelease(function(_) --[[ Line: 127 ]]
                    -- upvalues: v69 (ref)
                    v69();
                end)
            } else nil
        };
    end, {
        v68, 
        v69
    });
    return v26.useEventHandlerMap(v73, v70);
end;
return v32(function(_) --[[ Line: 139 ]] --[[ Name: SortAndFiltersScreen ]]
    -- upvalues: v36 (copy), v37 (copy), l_useNavigation_0 (copy), v5 (copy), v40 (copy), v7 (copy), l_useDispatch_0 (copy), v47 (copy), v48 (copy), v41 (copy), v66 (copy), v46 (copy), v50 (copy), v11 (copy), v12 (copy), l_useSelector_0 (copy), v51 (copy), l_getUseSelectorDeepEquals_0 (copy), l_FFlagAXMigrateAXToGlobalAutofocus_0 (copy), v18 (copy), l_useIsGamepad_0 (copy), v14 (copy), l_useStyle_0 (copy), v59 (copy), v20 (copy), l_useLocalization_0 (copy), l_FFlagAXMigrateSortAndFiltersScreenInputBindingsToFocusNavigation_0 (copy), v74 (copy), l_useTableWrappedCallbackRef_0 (copy), v39 (copy), l_useInitializedValue_0 (copy), l_Focusable_0 (copy), l_AvatarScreen_0 (copy), v24 (copy), v23 (copy), v17 (copy), v19 (copy), v21 (copy), l_PeekView_0 (copy), l_PeekViewState_0 (copy), v22 (copy), v33 (copy), v34 (copy), v35 (copy), v53 (copy), v52 (copy)
    local v76 = v36();
    local v77 = v37();
    local v78 = l_useNavigation_0();
    local v79 = v5.useContext(v40);
    local v80 = v7.useRefCache();
    local v81 = v76.canApply or v77.canApply;
    local v82 = v76.canReset or v77.canReset;
    local v83 = l_useDispatch_0();
    local v84 = v47(v48);
    local v85 = v41();
    local v86 = v66();
    local function v87() --[[ Line: 157 ]] --[[ Name: apply ]]
        -- upvalues: v76 (copy), v77 (copy), v85 (copy), v83 (copy), v46 (ref), v84 (copy), v86 (copy), v50 (ref), v78 (copy)
        v76.apply();
        v77.apply();
        v85:fire();
        v83(v46(v84));
        if v86 then
            v83(v50(v78, v86));
        end;
    end;
    local function v88() --[[ Line: 168 ]] --[[ Name: reset ]]
        -- upvalues: v76 (copy), v77 (copy)
        v76.reset();
        v77.reset();
    end;
    local v89 = v11() == v12.SceneFullView;
    local v90 = l_useSelector_0(v51, l_getUseSelectorDeepEquals_0());
    local v91 = if l_FFlagAXMigrateAXToGlobalAutofocus_0 then nil else v7.useRootFocusController();
    local v92 = nil;
    local v93 = nil;
    if v90 then
        v92 = UDim2.fromScale(0, 0);
        v93 = UDim2.fromScale(1, 1);
    else
        v92 = UDim2.fromScale(v18.LandscapeNavWidth, 0);
        v93 = UDim2.fromScale(v18.LandscapeSceneWidth, 1);
    end;
    local v94 = l_useIsGamepad_0();
    local v95 = l_useSelector_0(v14.selectTopBarHeight, l_getUseSelectorDeepEquals_0());
    local l_Theme_0 = l_useStyle_0().Theme;
    local v97 = 80;
    if v94 and v59 then
        v97 = v97 + v20.GAMEPAD_BOTTOM_BAR_SIZE;
    end;
    local v98 = l_useLocalization_0({
        sorts = "Feature.Catalog.Label.Filter.Sorts", 
        filters = "Feature.Catalog.Label.Filter.Filters"
    });
    local v99 = nil;
    if l_FFlagAXMigrateSortAndFiltersScreenInputBindingsToFocusNavigation_0 then
        local v100 = v5.useCallback(function() --[[ Line: 205 ]]
            -- upvalues: v87 (copy)
            v87();
        end, {
            v87
        });
        local v101 = v5.useCallback(function() --[[ Line: 208 ]]
            -- upvalues: v76 (copy), v77 (copy)
            v76.reset();
            v77.reset();
        end, {
            v88
        });
        v99 = v74(v80.SortAndFiltersContent, if v81 then v100 else nil, if v82 then v101 else nil);
        v99 = l_useTableWrappedCallbackRef_0(v99);
    end;
    local v102, v103 = v5.useBinding(0);
    local v104 = v102:map(v39.mapHeightToSize);
    local v105, v106 = v5.useBinding(0);
    local v107 = v105:map(v39.mapHeightToSize);
    local v108 = v5.useRef(nil);
    local function v112(v109) --[[ Line: 227 ]] --[[ Name: updatePeekViewContentFrameSize ]]
        -- upvalues: v108 (copy)
        local l_current_0 = v108.current;
        if v109 and l_current_0 then
            local l_Y_0 = v109.AbsoluteSize.Y;
            l_current_0.AutomaticSize = Enum.AutomaticSize.None;
            l_current_0.Size = UDim2.new(1, 0, 0, l_Y_0);
        end;
    end;
    local v117 = l_useInitializedValue_0(function() --[[ Line: 236 ]]
        -- upvalues: v5 (ref), v102 (copy), v105 (copy)
        return v5.joinBindings({
            v102, 
            v105
        }):map(function(v113) --[[ Line: 240 ]]
            local v114 = v113[1];
            local v115 = v113[2];
            local v116 = v114 + 24 + 24 + (v115 + 24 + 24);
            return UDim2.new(1, 0, 0, v116);
        end);
    end);
    local v122 = v5.createElement(l_Focusable_0.Frame, {
        BackgroundTransparency = 1, 
        BorderSizePixel = 0, 
        Size = UDim2.new(1, 0, 1, 0), 
        Visible = not v89, 
        restorePreviousChildFocus = true, 
        focusController = if l_FFlagAXMigrateAXToGlobalAutofocus_0 then nil else v91, 
        defaultChild = v80.SortAndFiltersContent, 
        ref = v79[l_AvatarScreen_0.SortAndFilters], 
        NextSelectionLeft = v79[l_AvatarScreen_0.Catalog], 
        inputBindings = if l_FFlagAXMigrateSortAndFiltersScreenInputBindingsToFocusNavigation_0 then nil else {
            NavigateBack = v7.Input.onBegin(Enum.KeyCode.ButtonB, function() --[[ Line: 261 ]]
                -- upvalues: v24 (ref), v78 (copy)
                v24.closeFocusedScreen(v78);
            end)
        }
    }, {
        GamepadFocusHandlerForPage = if l_FFlagAXMigrateAXToGlobalAutofocus_0 then nil else v5.createElement(v23, {
            focusController = v91, 
            captureFocusOnMount = true
        }), 
        NavigationEventsLogger = v5.createElement(v17), 
        BoundInputsUpdater = if l_FFlagAXMigrateAXToGlobalAutofocus_0 then nil else v5.createElement(v19), 
        Content = v5.createElement(l_Focusable_0.Frame, {
            BackgroundTransparency = 1, 
            BorderSizePixel = 0, 
            Size = v93, 
            Position = v92, 
            restorePreviousChildFocus = true, 
            inputBindings = if l_FFlagAXMigrateSortAndFiltersScreenInputBindingsToFocusNavigation_0 then nil else {
                Close = v7.Input.onBegin(Enum.KeyCode.ButtonB, function() --[[ Line: 286 ]]
                    -- upvalues: v85 (copy)
                    v85:fire();
                end, {
                    key = "CommonUI.Controls.Action.Back"
                }), 
                Apply = if v81 then v7.Input.onBegin(Enum.KeyCode.ButtonX, v87, {
                    key = "CommonUI.Messages.Action.Apply"
                }) else nil, 
                Reset = if v82 then v7.Input.onBegin(Enum.KeyCode.ButtonY, v88, {
                    key = "CommonUI.Messages.Action.Reset"
                }) else nil
            }
        }, {
            Background = v5.createElement("TextButton", {
                BackgroundTransparency = v90 and l_Theme_0.Overlay.Transparency or 1, 
                BackgroundColor3 = l_Theme_0.Overlay.Color, 
                Size = UDim2.new(1, 0, 1, v95), 
                Position = UDim2.fromOffset(0, -v95), 
                ZIndex = 1, 
                Text = "", 
                AutoButtonColor = false
            }), 
            FiltersTopBar = v5.createElement(v21, {
                buttonRef = v80.FiltersTopBar, 
                NextSelectionDown = v80.SortAndFiltersContent, 
                closePeekViewSignal = v85
            }), 
            PeekViewContainer = v5.createElement("Frame", {
                BackgroundTransparency = 1, 
                ClipsDescendants = true, 
                Position = UDim2.fromOffset(0, v95), 
                Size = UDim2.new(1, 0, 1, -v95), 
                ZIndex = 2
            }, {
                PeekView = v5.createElement(l_PeekView_0, {
                    briefViewContentHeight = UDim.new(0, 0), 
                    mountAnimation = true, 
                    mountAsFullView = true, 
                    canDragFullViewToBrief = false, 
                    showDraggerInClosedState = false, 
                    returnToFullView = true, 
                    thumbstickScrollEnabled = true, 
                    contentFrameRef = v108, 
                    closeSignal = v85, 
                    viewStateChanged = function(v118, _) --[[ Line: 339 ]] --[[ Name: viewStateChanged ]]
                        -- upvalues: l_PeekViewState_0 (ref), v78 (copy)
                        if v118 == l_PeekViewState_0.Closed then
                            v78.goBack();
                        end;
                    end, 
                    bottomDockedContainerHeight = v97, 
                    bottomDockedContainerContent = v5.createElement(v22, {
                        height = v97, 
                        canReset = v82, 
                        canApply = v81, 
                        onReset = v88, 
                        onApply = v87, 
                        frameRef = v80.BottomBar, 
                        NextSelectionUp = v80.SortAndFiltersContent
                    }), 
                    backgroundColor3 = l_Theme_0.BackgroundDefault.Color, 
                    backgroundTransparency = l_Theme_0.BackgroundUIDefault.Transparency, 
                    peekHeaderClose = true, 
                    isScrollingEnabled = true, 
                    shouldCaptureFocus = not l_FFlagAXMigrateAXToGlobalAutofocus_0 and nil
                }, {
                    SortAndFiltersContent = v5.createElement(l_Focusable_0.Frame, {
                        Size = v117, 
                        BorderSizePixel = 0, 
                        BackgroundTransparency = 1, 
                        ref = if l_FFlagAXMigrateSortAndFiltersScreenInputBindingsToFocusNavigation_0 then v99 else v80.SortAndFiltersContent, 
                        NextSelectionUp = v80.FiltersTopBar, 
                        NextSelectionDown = v80.BottomBar, 
                        [v5.Change.AbsoluteSize] = v112, 
                        defaultChild = v80.Filters, 
                        restorePreviousChildFocus = true
                    }, {
                        Layout = v5.createElement("UIListLayout", {
                            SortOrder = Enum.SortOrder.LayoutOrder, 
                            FillDirection = Enum.FillDirection.Vertical
                        }), 
                        FiltersSection = v5.createElement(v33, {
                            title = v98.filters, 
                            Size = v102:map(function(v120) --[[ Line: 381 ]]
                                return UDim2.new(1, 0, 0, v120 + 24 + 24);
                            end), 
                            contentSize = v104
                        }, {
                            Filters = v5.createElement(v34, {
                                Size = v104, 
                                filtersController = v76, 
                                frameRef = v80.Filters, 
                                NextSelectionDown = v80.Sorts, 
                                onHeightChanged = v103
                            })
                        }), 
                        SortsSection = v5.createElement(v33, {
                            title = v98.sorts, 
                            Size = v105:map(function(v121) --[[ Line: 396 ]]
                                return UDim2.new(1, 0, 0, v121 + 24 + 24);
                            end), 
                            contentSize = v107
                        }, {
                            Sorts = v5.createElement(v35, {
                                Size = v107, 
                                sortsController = v77, 
                                frameRef = v80.Sorts, 
                                NextSelectionUp = v80.Filters, 
                                onHeightChanged = v106
                            })
                        })
                    })
                })
            })
        })
    });
    local v123 = v53(if l_FFlagAXMigrateAXToGlobalAutofocus_0 then nil else v91);
    local v124 = v52({
        overlayClosedCallback = v123
    });
    return v5.createElement("Frame", {
        ref = v124, 
        BackgroundTransparency = 1, 
        BorderSizePixel = 0, 
        Size = UDim2.fromScale(1, 1), 
        Visible = not v89
    }, v122);
end);