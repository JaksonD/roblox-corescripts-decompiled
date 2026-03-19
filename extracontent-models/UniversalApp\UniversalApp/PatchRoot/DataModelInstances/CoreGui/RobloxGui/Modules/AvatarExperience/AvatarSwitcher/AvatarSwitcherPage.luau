local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.Packages.React);
local v3 = require(l_CorePackages_0.Packages.RoactGamepad);
local l_Focusable_0 = v3.Focusable;
local v5 = require(l_CorePackages_0.Packages.Foundation);
local v6 = require(l_CorePackages_0.Workspace.Packages.RoactUtils);
local v7 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceUIKit);
local v8 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceCommon);
local v9 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceNavigation);
local l_useSelector_0 = v6.Hooks.RoactRodux.useSelector;
local _ = require(l_Modules_0.AvatarExperience.AvatarSwitcher.useAvatarSwitcherPageProps);
local l_useLocalization_0 = require(l_CorePackages_0.Workspace.Packages.Localization).Hooks.useLocalization;
local l_useNavigation_0 = require(l_CorePackages_0.Workspace.Packages.Navigation).useNavigation;
local v14 = require(l_Modules_0.AvatarExperience.Common.Selectors.selectIsPortrait);
local l_AvatarScreen_0 = v9.Enums.AvatarScreen;
local v16 = require(l_Modules_0.AvatarExperience.Common.Components.Scene.SceneInteractionFrame);
local v17 = require(l_Modules_0.AvatarExperience.Common.Components.GamepadFocusHandlerForPage);
local v18 = require(l_Modules_0.LuaApp.Components.TopBar.TopBar);
local v19 = require(l_Modules_0.AvatarExperience.Common.Components.AvatarExperienceView);
local l_Grid_0 = v7.GridComponents.Grid;
local v21 = require(l_Modules_0.AvatarExperience.AvatarSwitcher.AvatarSwitcherScrollingContent);
local v22 = require(l_Modules_0.AvatarExperience.AvatarSwitcher.AvatarTile.AvatarTileContainer);
local v23 = require(l_Modules_0.AvatarExperience.AvatarSwitcher.SettingsTile.SettingsTileContainer);
local l_ImpressionEnums_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceAnalytics).Enums.ImpressionEnums;
local v25 = require(l_Modules_0.AvatarExperience.Common.Components.Impressions.OrganicEventImpressionsReporter);
local v26 = require(l_Modules_0.AvatarExperience.Flags.FStringAXImpressionsEventName);
local v27 = require(l_Modules_0.AvatarExperience.SlotBasedEditor.Components.InventoryItemsList.LoadMoreButton);
local l_getUseSelectorDeepEquals_0 = v8.Utils.getUseSelectorDeepEquals;
local v29 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagAXMigrateAXFocusBehaviorRoot and game:DefineFastFlag("AXRemoveAvatarSwitcherPageGamepadBindings", false);
local l_FFlagAXMigrateAXToGlobalAutofocus_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagAXMigrateAXToGlobalAutofocus;
return function(v31) --[[ Line: 49 ]] --[[ Name: AvatarSwitcherPage ]]
    -- upvalues: l_FFlagAXMigrateAXToGlobalAutofocus_0 (copy), v3 (copy), l_useNavigation_0 (copy), v5 (copy), v2 (copy), l_useLocalization_0 (copy), l_useSelector_0 (copy), v14 (copy), l_getUseSelectorDeepEquals_0 (copy), v23 (copy), v22 (copy), l_AvatarScreen_0 (copy), l_Focusable_0 (copy), v29 (copy), v16 (copy), v19 (copy), v18 (copy), v17 (copy), v21 (copy), l_Grid_0 (copy), v25 (copy), v26 (copy), l_ImpressionEnums_0 (copy), v27 (copy)
    local v32 = if l_FFlagAXMigrateAXToGlobalAutofocus_0 then nil else v3.useRootFocusController();
    local v33 = l_useNavigation_0();
    local v34 = v5.Hooks.useTokens();
    local v35 = v3.useRefCache();
    local v36 = v2.useRef(nil);
    local v37 = v2.useRef(nil);
    local v38 = l_useLocalization_0({
        title = "Feature.Avatar.Label.Title.AvatarSwitcher"
    });
    local v39 = l_useSelector_0(v14, l_getUseSelectorDeepEquals_0());
    local v42 = v2.useCallback(function(v40) --[[ Line: 64 ]]
        -- upvalues: v31 (copy), v2 (ref), v23 (ref), v35 (copy), v22 (ref)
        local l_item_0 = v40.item;
        if v31.shouldRenderSettingsTile(l_item_0) then
            return (v2.createElement(v23, {
                itemWidth = v31.gridMetrics.itemWidth, 
                index = v40.index, 
                ref = v35[v40.index]
            }));
        else
            return v2.createElement(v22, {
                itemWidth = v31.gridMetrics.itemWidth, 
                itemId = l_item_0, 
                index = v40.index, 
                ref = v35[v40.index], 
                isSelected = v31.itemIdsToIsWearing[l_item_0], 
                hasItemFromCurrentPageEquipped = v31.hasItemFromCurrentPageEquipped, 
                impressionsTag = v31.impressionsTag, 
                impressionsSchema = "defaultItem", 
                gridInformation = v40.gridInformation
            });
        end;
    end, {
        v31.gridMetrics, 
        v31.itemIdsToIsWearing, 
        v31.shouldRenderSettingsTile
    });
    local v43 = v2.useCallback(function() --[[ Line: 87 ]]
        -- upvalues: v2 (ref), v5 (ref), v33 (copy), l_AvatarScreen_0 (ref)
        return v2.createElement(v5.IconButton, {
            size = v5.Enums.IconSize.Medium, 
            icon = "icons/common/settings", 
            onActivated = function() --[[ Line: 91 ]] --[[ Name: onActivated ]]
                -- upvalues: v33 (ref), l_AvatarScreen_0 (ref)
                v33.navigate(l_AvatarScreen_0.ManageOutfitPage);
            end
        });
    end, {});
    return v2.createElement(l_Focusable_0.Frame, {
        Size = UDim2.fromScale(1, 1), 
        BackgroundTransparency = 1, 
        focusController = if l_FFlagAXMigrateAXToGlobalAutofocus_0 then nil else v32, 
        inputBindings = if v29 then nil else {
            Back = v3.Input.onBegin(Enum.KeyCode.ButtonB, v31.onBackButtonPressed)
        }
    }, {
        AvatarSwitcherPageSceneInteractionFrame = v2.createElement(v16), 
        AvatarSwitcherExperienceView = v2.createElement(v19, {
            allowAdaptiveScrolling = true, 
            showRobuxBalance = false, 
            showUndoRedo = true, 
            showSaveButton = false, 
            isSceneFullView = v31.isSceneFullView, 
            isUIFullView = v31.isUIFullView, 
            topBar = v2.createElement(v18.Container, {
                titleText = v38.title, 
                transparentBackground = v39, 
                leftItem = v18.makeBackButton(v31.onBackButtonPressed), 
                rightItems = {
                    v43
                }, 
                ref = v36, 
                NextSelectionDown = v35[1], 
                ZIndex = 3
            })
        }, {
            GamepadFocusHandlerForPage = if l_FFlagAXMigrateAXToGlobalAutofocus_0 then nil else v2.createElement(v17, {
                focusController = v32, 
                captureFocusOnMount = true
            }), 
            AvatarSwitcherContent = v2.createElement(v5.View, {
                tag = "bg-surface-0 size-full-full", 
                onAbsoluteSizeChanged = v31.onAbsoluteSizeChanged
            }, {
                AvatarSwitcherScrollingContent = v2.createElement(v21, {
                    onThresholdReached = v31.onScrollingFrameThresholdReached, 
                    onCanvasPositionChanged = v31.onCanvasPositionChanged
                }, {
                    ListLayout = v2.createElement("UIListLayout", {
                        FillDirection = Enum.FillDirection.Vertical, 
                        SortOrder = Enum.SortOrder.LayoutOrder, 
                        HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                        Padding = UDim.new(0, v34.Gap.Medium)
                    }), 
                    AvatarSwitcherGridContainer = v2.createElement(v5.View, {
                        tag = "auto-xy size-full-0", 
                        padding = {
                            left = UDim.new(0, v34.Size.Size_400), 
                            right = UDim.new(0, v34.Size.Size_400), 
                            bottom = UDim.new(0, v34.Size.Size_1000)
                        }, 
                        LayoutOrder = 1
                    }, {
                        AvatarSwitcherGrid = v2.createElement(l_Grid_0, {
                            itemsPerRow = v31.gridMetrics.itemsPerRow, 
                            renderItem = v42, 
                            items = v31.itemIds, 
                            gapVertical = v34.Size.Size_400, 
                            gapHorizontal = v34.Size.Size_300, 
                            getItemId = function(v44) --[[ Line: 161 ]] --[[ Name: getItemId ]]
                                return v44;
                            end, 
                            ref = v37
                        })
                    }), 
                    ImpressionsReporter = v2.createElement(v25, {
                        parentRef = v37, 
                        pageFilter = v31.impressionsPageFilter, 
                        onRequestImpressionsSignal = v31.requestImpressionsSignal, 
                        eventContext = v26(), 
                        eventName = "marketplaceOrganicFELog", 
                        impressionsTag = v31.impressionsTag, 
                        impressionsSchema = "defaultItem", 
                        requestId = "", 
                        surface = l_ImpressionEnums_0.MarketplaceSurfaceType.MARKETPLACE_USER_INVENTORY, 
                        analyticsMetadata = v31.analyticsMetadata, 
                        searchUuid = v31.searchUuid
                    }), 
                    LoadMoreButton = if v31.showLoadMoreButton then v2.createElement(v27, {
                        onActivated = v31.fetchMoreOutfits, 
                        LayoutOrder = 2
                    }) else nil
                })
            })
        })
    });
end;