local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.Packages.React);
local v3 = require(l_CorePackages_0.Packages.RoactGamepad);
local v4 = require(l_CorePackages_0.Packages.Foundation);
local l_Focusable_0 = v3.Focusable;
local v6 = require(l_CorePackages_0.Workspace.Packages.Responsive);
local v7 = require(l_CorePackages_0.Workspace.Packages.RoactUtils);
local v8 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceCommon);
local v9 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceNavigation);
local l_AvatarScreen_0 = v9.Enums.AvatarScreen;
local l_useAvatarRoute_0 = v9.AvatarRoute.Hooks.useAvatarRoute;
local _ = require(l_Modules_0.AvatarExperience.EditEmotes.useEditEmotesPageProps);
local l_useLocalization_0 = require(l_CorePackages_0.Workspace.Packages.Localization).Hooks.useLocalization;
local l_useSelector_0 = v7.Hooks.RoactRodux.useSelector;
local v15 = require(l_Modules_0.AvatarExperience.Common.Selectors.selectIsPortrait);
local v16 = require(l_Modules_0.AvatarExperience.AvatarEditor.Constants);
local v17 = require(l_CorePackages_0.Workspace.Packages.FocusNavigationUtils);
local v18 = require(l_CorePackages_0.Packages.ReactFocusNavigation);
local v19 = require(l_CorePackages_0.Packages.InputHandlers);
local l_FocusNavigationEventNameEnum_0 = v17.FocusNavigationEventNameEnum;
local l_useTableWrappedCallbackRef_0 = v8.Utils.RoactGamepadMigration.useTableWrappedCallbackRef;
local v22 = require(l_Modules_0.AvatarExperience.Common.Components.AvatarExperienceView);
local v23 = require(l_Modules_0.LuaApp.Components.TopBar.TopBar);
local v24 = require(l_Modules_0.AvatarExperience.Common.Components.GamepadFocusHandlerForPage);
local v25 = require(l_Modules_0.AvatarExperience.Common.Components.Scene.SceneInteractionFrame);
local v26 = require(l_Modules_0.AvatarExperience.AvatarEditor.Components.EquipSlots);
local v27 = require(l_Modules_0.AvatarExperience.EditEmotes.EditEmotesScrollingContent);
local v28 = require(l_Modules_0.AvatarExperience.EditEmotes.EmoteTile.EmoteTileContainer);
local l_Grid_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceUIKit).GridComponents.Grid;
local l_ImpressionEnums_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceAnalytics).Enums.ImpressionEnums;
local v31 = require(l_Modules_0.AvatarExperience.Common.Components.Impressions.OrganicEventImpressionsReporter);
local v32 = require(l_Modules_0.AvatarExperience.Flags.FStringAXImpressionsEventName);
local v33 = require(l_Modules_0.AvatarExperience.Common.Components.RecommendedItems);
local v34 = require(l_Modules_0.AvatarExperience.SlotBasedEditor.Components.InventoryItemsList.LoadMoreButton);
local l_FFlagAXMigrateEditEmotesPageInputBindingsToFocusNavigation_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagAXMigrateEditEmotesPageInputBindingsToFocusNavigation;
local l_FFlagAXMigrateAXToGlobalAutofocus_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagAXMigrateAXToGlobalAutofocus;
local v37 = {
    [Enum.KeyCode.ButtonB] = l_FocusNavigationEventNameEnum_0.NavigateBack, 
    [Enum.KeyCode.Escape] = l_FocusNavigationEventNameEnum_0.NavigateBack
};
local function v43(v38, v39) --[[ Line: 61 ]] --[[ Name: useEditEmotesPageFocusNavigationBindings ]]
    -- upvalues: v18 (copy), v37 (copy), v2 (copy), l_FocusNavigationEventNameEnum_0 (copy), v19 (copy)
    local v40 = v18.useEventMap(v37, v38);
    local v42 = v2.useMemo(function() --[[ Line: 63 ]]
        -- upvalues: l_FocusNavigationEventNameEnum_0 (ref), v19 (ref), v39 (copy)
        return {
            [l_FocusNavigationEventNameEnum_0.NavigateBack] = {
                handler = v19.onRelease(function(v41) --[[ Line: 66 ]]
                    -- upvalues: v39 (ref)
                    v41.cancelled = true;
                    v39();
                end)
            }
        };
    end, {
        v39
    });
    return v18.useEventHandlerMap(v42, v40);
end;
return function(v44) --[[ Line: 76 ]] --[[ Name: EditEmotesPage ]]
    -- upvalues: v4 (copy), l_useLocalization_0 (copy), l_useSelector_0 (copy), v15 (copy), l_useAvatarRoute_0 (copy), v6 (copy), l_AvatarScreen_0 (copy), v3 (copy), l_FFlagAXMigrateAXToGlobalAutofocus_0 (copy), v2 (copy), l_FFlagAXMigrateEditEmotesPageInputBindingsToFocusNavigation_0 (copy), v43 (copy), l_useTableWrappedCallbackRef_0 (copy), v28 (copy), l_Focusable_0 (copy), v25 (copy), v22 (copy), v23 (copy), v24 (copy), v26 (copy), v16 (copy), v27 (copy), l_Grid_0 (copy), v34 (copy), v33 (copy), v31 (copy), v32 (copy), l_ImpressionEnums_0 (copy)
    local v45 = v4.Hooks.useTokens();
    local v46 = l_useLocalization_0({
        title = "Feature.Avatar.Label.Title.Emotes"
    });
    local v47 = l_useSelector_0(v15);
    local v48 = l_useAvatarRoute_0();
    local v49 = v6.usePreferredInput() == v6.Input.Directional and v48.current.name == l_AvatarScreen_0.ItemDetails;
    local v50 = v3.useRefCache();
    local v51 = if l_FFlagAXMigrateAXToGlobalAutofocus_0 then nil else v3.useRootFocusController();
    local v52 = v2.useRef(nil);
    local v53 = v2.useRef(nil);
    local v54 = v2.useRef(nil);
    local v55 = v2.useRef(nil);
    local v56 = v2.useRef(nil);
    local v57 = nil;
    if l_FFlagAXMigrateEditEmotesPageInputBindingsToFocusNavigation_0 then
        local v58 = v2.useCallback(v44.onBackButtonPressed, {
            v44.onBackButtonPressed
        });
        local v59 = v43(nil, v58);
        v57 = l_useTableWrappedCallbackRef_0(v59);
    end;
    local v62 = v2.useCallback(function(v60) --[[ Line: 107 ]]
        -- upvalues: v2 (ref), v28 (ref), v44 (copy), v50 (copy)
        local l_item_0 = v60.item;
        return v2.createElement(v28, {
            itemWidth = v44.gridMetrics.itemWidth, 
            itemId = l_item_0, 
            index = v60.index, 
            ref = v50[v60.index], 
            impressionsTag = v44.impressionsTag, 
            impressionsSchema = "defaultItem", 
            gridInformation = v60.gridInformation
        });
    end, {
        v44.gridMetrics
    });
    return v2.createElement(l_Focusable_0.Frame, {
        Size = UDim2.fromScale(1, 1), 
        BackgroundTransparency = 1, 
        focusController = if l_FFlagAXMigrateAXToGlobalAutofocus_0 then nil else v51, 
        inputBindings = if l_FFlagAXMigrateEditEmotesPageInputBindingsToFocusNavigation_0 then nil else {
            Back = v3.Input.onBegin(Enum.KeyCode.ButtonB, function() --[[ Line: 127 ]]
                -- upvalues: v44 (copy)
                v44.onBackButtonPressed();
            end)
        }, 
        ref = if l_FFlagAXMigrateEditEmotesPageInputBindingsToFocusNavigation_0 then v57 else nil
    }, {
        EditEmotesPageSceneInteractionFrame = v2.createElement(v25), 
        AvatarExperienceView = v2.createElement(v22, {
            allowAdaptiveScrolling = true, 
            showUndoRedo = true, 
            isSceneFullView = v44.isSceneFullView, 
            isUIFullView = v44.isUIFullView, 
            topBar = v2.createElement(v23.Container, {
                titleText = v46.title, 
                transparentBackground = v47, 
                leftItem = v23.makeBackButton(v44.onBackButtonPressed), 
                ref = v53, 
                NextSelectionDown = v50[1], 
                ZIndex = 2
            })
        }, {
            GamepadFocusHandlerForPage = if l_FFlagAXMigrateAXToGlobalAutofocus_0 then nil else v2.createElement(v24, {
                focusController = v51, 
                captureFocusOnMount = true
            }), 
            EditEmotesContent = v2.createElement(v4.View, {
                tag = "size-full-full bg-surface-0 col gap-medium", 
                ref = v52, 
                onAbsoluteSizeChanged = v44.onAbsoluteSizeChanged, 
                padding = {
                    bottom = UDim.new(0, v45.Size.Size_2500)
                }
            }, {
                EquipSlots = v2.createElement(v26, {
                    slotsCount = v16.EmoteSlotsCount, 
                    onActivated = v44.onSlotActivated, 
                    itemsListRef = v54, 
                    ref = v55, 
                    darkenItemsGrid = v49
                }), 
                EditEmotesScrollingContent = v2.createElement(v27, {
                    onCanvasPositionChanged = v44.onCanvasPositionChanged, 
                    onThresholdReached = v44.onScrollingFrameThresholdReached
                }, {
                    ListLayout = v2.createElement("UIListLayout", {
                        FillDirection = Enum.FillDirection.Vertical, 
                        SortOrder = Enum.SortOrder.LayoutOrder, 
                        HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                        Padding = UDim.new(0, v45.Gap.Medium)
                    }), 
                    EditEmotesGridContainer = v2.createElement(v4.View, {
                        tag = "auto-xy size-full-0", 
                        padding = {
                            left = UDim.new(0, v45.Size.Size_400), 
                            right = UDim.new(0, v45.Size.Size_400)
                        }, 
                        LayoutOrder = 1
                    }, {
                        EditEmotesGrid = v2.createElement(l_Grid_0, {
                            itemsPerRow = v44.gridMetrics.itemsPerRow, 
                            renderItem = v62, 
                            items = v44.itemIds, 
                            gapVertical = v45.Size.Size_400, 
                            gapHorizontal = v45.Size.Size_300, 
                            getItemId = function(v63) --[[ Line: 194 ]] --[[ Name: getItemId ]]
                                return v63;
                            end, 
                            ref = v56
                        })
                    }), 
                    LoadMoreButton = if v44.showLoadMoreButton then v2.createElement(v34, {
                        onActivated = v44.fetchMoreItems, 
                        LayoutOrder = 2
                    }) else nil, 
                    RecommendedItems = if v44.showRecommendedItems then v2.createElement(v33, {
                        LayoutOrder = 3, 
                        categoryInfo = v44.emotesCategory, 
                        sendShopForMoreAnalytics = v44.sendShopForMoreAnalytics, 
                        itemDetailsPeekViewRefs = v54, 
                        listFrameRef = v52
                    }) else nil, 
                    ImpressionsReporter = v2.createElement(v31, {
                        parentRef = v56, 
                        pageFilter = v44.impressionsPageFilter, 
                        onRequestImpressionsSignal = v44.requestImpressionsSignal, 
                        eventContext = v32(), 
                        eventName = "marketplaceOrganicFELog", 
                        impressionsTag = v44.impressionsTag, 
                        impressionsSchema = "defaultItem", 
                        requestId = "", 
                        surface = l_ImpressionEnums_0.MarketplaceSurfaceType.MARKETPLACE_USER_INVENTORY, 
                        analyticsMetadata = v44.analyticsMetadata, 
                        searchUuid = v44.searchUuid
                    })
                })
            })
        })
    });
end;