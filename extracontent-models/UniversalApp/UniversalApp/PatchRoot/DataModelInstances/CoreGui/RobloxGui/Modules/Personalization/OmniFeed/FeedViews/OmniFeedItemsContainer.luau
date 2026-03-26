local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Packages.React);
local v2 = require(l_CorePackages_0.Workspace.Packages.DiscoveryTypes);
local l_OmniFeedTypes_0 = v2.OmniFeedTypes;
local l_OmniFeedConstants_0 = v2.OmniFeedConstants;
local _ = require(l_CorePackages_0.Workspace.Packages.AppCommonLib);
local _ = require(l_CorePackages_0.Workspace.Packages.ServerDrivenUi);
local v7 = require(l_CorePackages_0.Packages.Cryo);
local l_useDesignTokens_0 = require(l_CorePackages_0.Workspace.Packages.Style).useDesignTokens;
local l_useStyle_0 = require(l_CorePackages_0.Packages.UIBlox).Core.Style.useStyle;
local v10 = require(l_CorePackages_0.Workspace.Packages.RobloxAppEnums);
local l_AppPage_0 = v10.AppPage;
local l_UiMode_0 = v10.UiMode;
local l_useUiModeInfo_0 = require(l_CorePackages_0.Workspace.Packages.RobloxAppHooks).useUiModeInfo;
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v15 = require(l_Modules_0.Personalization.OmniFeed.OmniFeedItem);
local v16 = require(l_Modules_0.Personalization.Flags.FFlagUpdateDividerStartBounds);
local l_Modules_1 = require(l_CorePackages_0.Workspace.Packages.DiscoveryMonolith).Modules;
local l_FeedItemModel_0 = l_Modules_1.Personalization.OmniFeed.DataStore.FeedItemModel;
local l_OmniFeedProps_0 = l_Modules_1.Personalization.OmniFeed.OmniFeedProps;
local l_CompositionTags_0 = require(l_CorePackages_0.Workspace.Packages.AppComposition).CompositionTags;
local v21 = require(l_CorePackages_0.Workspace.Packages.SharedFlags);
local l_FFlagLuaAppCompositionSupport_0 = v21.FFlagLuaAppCompositionSupport;
local l_FFlagLuaAppCompositionAlways_0 = v21.FFlagLuaAppCompositionAlways;
local l_FFlagLuaAppRemoveOmniFeedDividersAndExtraPadding_0 = v21.FFlagLuaAppRemoveOmniFeedDividersAndExtraPadding;
local l_FFlagLuaAppUseSortsWithDividersFString_0 = v21.FFlagLuaAppUseSortsWithDividersFString;
local l_isSubjectToDesktopPolicies_0 = v21.isSubjectToDesktopPolicies;
local l_FStringLuaAppSortsWithDividers_0 = v21.FStringLuaAppSortsWithDividers;
local l_FFlagUseOmniFeedDividerOverrides_0 = v21.FFlagUseOmniFeedDividerOverrides;
local l_FIntOmniFeedDividerHeightOverride_0 = v21.FIntOmniFeedDividerHeightOverride;
local l_FIntOmniFeedDividerPaddingOverride_0 = v21.FIntOmniFeedDividerPaddingOverride;
local l_FFlagLuaAppEnableRelativeGuiHomeForAll_0 = v21.FFlagLuaAppEnableRelativeGuiHomeForAll;
local l_FFlagLuaAppEnableRelativeGuiHomeWithIxp_0 = v21.FFlagLuaAppEnableRelativeGuiHomeWithIxp;
local l_FFlagLuaAppHomeFirstTileThumbnailLoadedMilestone_0 = v21.FFlagLuaAppHomeFirstTileThumbnailLoadedMilestone;
local v34 = {};
if l_FFlagLuaAppUseSortsWithDividersFString_0 then
    for v35 in l_FStringLuaAppSortsWithDividers_0:gmatch("(%w+)") do
        v34[v35] = true;
    end;
end;
local l_SORT_INDEX_SELECTION_ORDER_MULTIPLIER_0 = v2.Constants.SORT_INDEX_SELECTION_ORDER_MULTIPLIER;
local l_SORT_SELECTION_ORDER_BASE_0 = v2.Constants.SORT_SELECTION_ORDER_BASE;
local function _(v38, v39) --[[ Line: 75 ]] --[[ Name: scaleSizeForPlatform ]]
    return v38 * v39.Global.Stroke_100;
end;
local function _(v41) --[[ Line: 79 ]] --[[ Name: isGridTile ]]
    -- upvalues: l_OmniFeedConstants_0 (copy)
    local v42 = v41.treatmentProps.topicLayoutData and v41.treatmentProps.topicLayoutData[l_OmniFeedConstants_0.TopicLayoutDataKeys.ComponentType];
    local v43 = true;
    if v42 ~= l_OmniFeedConstants_0.ComponentTypeDataKeys.GridTile then
        v43 = v42 == l_OmniFeedConstants_0.ComponentTypeDataKeys.EventTile;
    end;
    return v43;
end;
local function v60(v45, v46, v47, v48, v49, v50, v51) --[[ Line: 87 ]] --[[ Name: shouldAddDividerOrExtraPadding ]]
    -- upvalues: v16 (copy), l_FFlagLuaAppUseSortsWithDividersFString_0 (copy), v34 (copy), l_OmniFeedTypes_0 (copy), l_isSubjectToDesktopPolicies_0 (copy), l_OmniFeedConstants_0 (copy), l_AppPage_0 (copy)
    local v52 = false;
    local v53 = false;
    if (v16 and 0 or v51 and 0 or 1) + v45 - 1 < v47 and v47 < v46 then
        local v54 = v49[v47 - 1];
        local v55 = v49[v47];
        local v56 = v49[v47 + 1];
        if v54 and v54.pageSection ~= v55.pageSection then
            v54 = nil;
        end;
        if v56 and v56.pageSection ~= v55.pageSection then
            v56 = nil;
        end;
        if l_FFlagLuaAppUseSortsWithDividersFString_0 and (v55.itemId and v55.itemId.topicId and v34[v55.itemId.topicId] or v56 and v56.itemId and v56.itemId.topicId and v34[v56.itemId.topicId]) then
            v53 = true;
        end;
        if v48.treatmentType == l_OmniFeedTypes_0.HomeGameGrid and v56 and v56.treatmentType ~= l_OmniFeedTypes_0.HomeGameGrid or v48.treatmentType ~= l_OmniFeedTypes_0.HomeGameGrid and v54 and v54.treatmentType == l_OmniFeedTypes_0.HomeGameGrid and v56 and v56.treatmentType == l_OmniFeedTypes_0.HomeGameGrid then
            v53 = true;
        elseif v51 then
            v52 = true;
        elseif l_isSubjectToDesktopPolicies_0() then
            local v57 = false;
            if v48.treatmentType == l_OmniFeedTypes_0.Carousel then
                v57 = false;
                if v56 ~= nil then
                    v57 = false;
                    if v56.treatmentType == l_OmniFeedTypes_0.HomeGameGrid then
                        local v58 = v48.treatmentProps.topicLayoutData and v48.treatmentProps.topicLayoutData[l_OmniFeedConstants_0.TopicLayoutDataKeys.ComponentType];
                        v57 = true;
                        if v58 ~= l_OmniFeedConstants_0.ComponentTypeDataKeys.GridTile then
                            v57 = v58 == l_OmniFeedConstants_0.ComponentTypeDataKeys.EventTile;
                        end;
                        if v57 then
                            v58 = v56;
                            local v59 = v58.treatmentProps.topicLayoutData and v58.treatmentProps.topicLayoutData[l_OmniFeedConstants_0.TopicLayoutDataKeys.ComponentType];
                            v57 = true;
                            if v59 ~= l_OmniFeedConstants_0.ComponentTypeDataKeys.GridTile then
                                v57 = v59 == l_OmniFeedConstants_0.ComponentTypeDataKeys.EventTile;
                            end;
                        end;
                    end;
                end;
            end;
            v52 = v57;
        end;
    end;
    if v50 == l_AppPage_0.SearchPage and v47 < v46 then
        v53 = true;
    end;
    return v53, v52;
end;
return v1.memo(function(v61) --[[ Line: 172 ]]
    -- upvalues: l_useDesignTokens_0 (copy), l_useStyle_0 (copy), l_useUiModeInfo_0 (copy), l_UiMode_0 (copy), v1 (copy), l_FFlagUseOmniFeedDividerOverrides_0 (copy), l_FIntOmniFeedDividerPaddingOverride_0 (copy), l_FIntOmniFeedDividerHeightOverride_0 (copy), l_FeedItemModel_0 (copy), l_SORT_SELECTION_ORDER_BASE_0 (copy), l_SORT_INDEX_SELECTION_ORDER_MULTIPLIER_0 (copy), l_OmniFeedProps_0 (copy), l_FFlagLuaAppCompositionSupport_0 (copy), l_FFlagLuaAppHomeFirstTileThumbnailLoadedMilestone_0 (copy), v7 (copy), l_OmniFeedTypes_0 (copy), v15 (copy), l_FFlagLuaAppRemoveOmniFeedDividersAndExtraPadding_0 (copy), v60 (copy), l_FFlagLuaAppEnableRelativeGuiHomeForAll_0 (copy), l_FFlagLuaAppEnableRelativeGuiHomeWithIxp_0 (copy), l_FFlagLuaAppCompositionAlways_0 (copy), l_CompositionTags_0 (copy)
    local v62 = l_useDesignTokens_0();
    local l_Color_0 = l_useStyle_0().Theme.BackgroundContrast.Color;
    local v64 = l_useUiModeInfo_0().uiMode == l_UiMode_0.TenFoot;
    local v65 = {
        Layout = v1.createElement("UIListLayout", {
            SortOrder = Enum.SortOrder.LayoutOrder, 
            FillDirection = Enum.FillDirection.Vertical
        })
    };
    local v66 = 1;
    local v67 = v61.layoutPadding or 0;
    local l_v67_0 = v67;
    local v69 = v67 / 2;
    if l_FFlagUseOmniFeedDividerOverrides_0 then
        if l_FIntOmniFeedDividerPaddingOverride_0 >= 0 then
            l_v67_0 = l_FIntOmniFeedDividerPaddingOverride_0 * v62.Global.Stroke_100;
        end;
        if l_FIntOmniFeedDividerHeightOverride_0 >= 0 then
            v69 = l_FIntOmniFeedDividerHeightOverride_0 * v62.Global.Stroke_100;
        end;
    end;
    local l_omniFeedItems_0 = v61.omniFeedItems;
    local v71 = nil;
    local v72 = nil;
    for v73 = 1, #l_omniFeedItems_0 do
        if l_omniFeedItems_0[v73].pageSection == v61.omniFeedPageSection then
            if not v71 then
                v71 = v73;
            end;
            v72 = v73;
        end;
    end;
    v71 = v71 or 1;
    v72 = v72 or #l_omniFeedItems_0;
    local v74 = v61.numberOfItemsToBeRendered or v72 - v71 + 1;
    local v75 = 1;
    local l_pageContext_0 = v61.pageContext;
    local v77 = v61.topMargin or 0;
    local v78 = v61.bottomMargin or 0;
    local v79 = true;
    for v80, v81 in l_omniFeedItems_0 do
        if v74 >= v80 - v71 + 1 then
            local v82 = v81.treatmentProps or {};
            local v83 = l_FeedItemModel_0.getUniqueNameForAnalytics(v81);
            local v84 = l_SORT_SELECTION_ORDER_BASE_0 + v80 * l_SORT_INDEX_SELECTION_ORDER_MULTIPLIER_0;
            local v85 = l_OmniFeedProps_0.new(v80, v75, v61.onItemsUpdatedSignalRef and v61.onItemsUpdatedSignalRef.current, v61.refreshSignalRef and v61.refreshSignalRef.current, l_pageContext_0, v61.scrollingFrameRef, v61.sduiContext, v84, v61.defaultContainerSize, if l_FFlagLuaAppCompositionSupport_0 then v61.appCompositionEnabled else nil, if l_FFlagLuaAppHomeFirstTileThumbnailLoadedMilestone_0 then v61.onTileImageLoaded else nil);
            v82 = v7.Dictionary.join({
                [l_OmniFeedProps_0.key] = v85
            }, v82);
            if v75 then
                local v86 = l_FeedItemModel_0.getNumberOfRows(v81);
                if not v86 then
                    v75 = nil;
                else
                    v75 = v75 + v86;
                end;
            end;
            if v61.omniFeedPageSection == v81.pageSection then
                local v87 = not v79;
                local v88 = v87 and v81.treatmentType == l_OmniFeedTypes_0.UpsellCard;
                local v89 = if v81.itemId then v81.itemId.sortIndex else nil;
                local v90 = if v89 and v61.sortsData then v61.sortsData[v89] else nil;
                if v90 and (not v90.topic or v90.topic == "") then
                    v87 = false;
                end;
                if v87 then
                    v65["feedPaddingTop_" .. tostring(v80)] = v1.createElement("Frame", {
                        Size = if v88 then UDim2.new(1, 0, 0, v62.Global.Space_150) else UDim2.new(1, 0, 0, l_v67_0), 
                        BackgroundTransparency = 1, 
                        BorderSizePixel = 0, 
                        LayoutOrder = v66
                    });
                    v66 = v66 + 1;
                end;
                v65["feedItem_" .. tostring(v80)] = v1.createElement(v15, {
                    omniFeedItemType = v81.treatmentType, 
                    layoutOrder = v66, 
                    feedItemNameId = v83, 
                    itemProps = v82, 
                    itemIndex = v80, 
                    impressionsTag = v61.impressionsTag, 
                    zIndex = v74 - v80
                });
                v66 = v66 + 1;
                if not l_FFlagLuaAppRemoveOmniFeedDividersAndExtraPadding_0 then
                    local v91, v92 = v60(v71, v72, v80, v81, l_omniFeedItems_0, l_pageContext_0, v64);
                    if v91 or v92 then
                        v65["feedPaddingBottom_" .. tostring(v80)] = v1.createElement("Frame", {
                            Size = UDim2.new(1, 0, 0, l_v67_0), 
                            BackgroundTransparency = 1, 
                            BorderSizePixel = 0, 
                            LayoutOrder = v66
                        });
                        v66 = v66 + 1;
                    end;
                    if v91 then
                        v65["feedDivider_" .. tostring(v80)] = v1.createElement("Frame", {
                            Size = UDim2.new(1, 0, 0, v69), 
                            BackgroundTransparency = 0, 
                            BackgroundColor3 = l_Color_0, 
                            BorderSizePixel = 0, 
                            LayoutOrder = v66
                        });
                        v66 = v66 + 1;
                    end;
                end;
                if v80 - v71 + 1 == v74 and v61.hasNextPage then
                    v65["loadingBlank_" .. tostring(v80)] = v1.createElement("Frame", {
                        Size = UDim2.new(1, 0, 0, 10), 
                        BackgroundTransparency = 1, 
                        BorderSizePixel = 0, 
                        LayoutOrder = v66
                    });
                    v66 = v66 + 1;
                end;
                if v79 then
                    v79 = false;
                end;
            end;
        else
            break;
        end;
    end;
    v65.Padding = v1.createElement(v1.Fragment, nil, {
        PaddingTop = v1.createElement("Frame", {
            Size = UDim2.new(1, 0, 0, v77), 
            BackgroundTransparency = 1, 
            LayoutOrder = 0
        }), 
        PaddingBottom = v1.createElement("Frame", {
            Size = UDim2.new(1, 0, 0, v78), 
            BackgroundTransparency = 1, 
            LayoutOrder = v66
        })
    });
    local v93 = if not not l_FFlagLuaAppEnableRelativeGuiHomeForAll_0 or l_FFlagLuaAppEnableRelativeGuiHomeWithIxp_0 then v61.enableRelativeGui and "RelativeGui" or "Frame" else "Frame";
    return v1.createElement(v93, {
        Size = UDim2.new(1, 0, 0, 0), 
        AutomaticSize = Enum.AutomaticSize.Y, 
        BackgroundTransparency = 1, 
        BorderSizePixel = 0, 
        [v1.Tag] = if not not l_FFlagLuaAppCompositionAlways_0 or l_FFlagLuaAppCompositionSupport_0 and v61.appCompositionEnabled then v61.contentTag or l_CompositionTags_0.ContentRegion.Body else nil
    }, v65);
end);