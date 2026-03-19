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
local v20 = require(l_CorePackages_0.Workspace.Packages.SharedFlags);
local l_FFlagLuaAppRemoveOmniFeedDividersAndExtraPadding_0 = v20.FFlagLuaAppRemoveOmniFeedDividersAndExtraPadding;
local l_FFlagLuaAppUseSortsWithDividersFString_0 = v20.FFlagLuaAppUseSortsWithDividersFString;
local l_isSubjectToDesktopPolicies_0 = v20.isSubjectToDesktopPolicies;
local l_FStringLuaAppSortsWithDividers_0 = v20.FStringLuaAppSortsWithDividers;
local l_FFlagUseOmniFeedDividerOverrides_0 = v20.FFlagUseOmniFeedDividerOverrides;
local l_FIntOmniFeedDividerHeightOverride_0 = v20.FIntOmniFeedDividerHeightOverride;
local l_FIntOmniFeedDividerPaddingOverride_0 = v20.FIntOmniFeedDividerPaddingOverride;
local l_FFlagLuaAppEnableRelativeGuiHomeForAll_0 = v20.FFlagLuaAppEnableRelativeGuiHomeForAll;
local l_FFlagLuaAppEnableRelativeGuiHomeWithIxp_0 = v20.FFlagLuaAppEnableRelativeGuiHomeWithIxp;
local v30 = {};
if l_FFlagLuaAppUseSortsWithDividersFString_0 then
    for v31 in l_FStringLuaAppSortsWithDividers_0:gmatch("(%w+)") do
        v30[v31] = true;
    end;
end;
local l_SORT_INDEX_SELECTION_ORDER_MULTIPLIER_0 = v2.Constants.SORT_INDEX_SELECTION_ORDER_MULTIPLIER;
local l_SORT_SELECTION_ORDER_BASE_0 = v2.Constants.SORT_SELECTION_ORDER_BASE;
local function _(v34, v35) --[[ Line: 65 ]] --[[ Name: scaleSizeForPlatform ]]
    return v34 * v35.Global.Stroke_100;
end;
local function _(v37) --[[ Line: 69 ]] --[[ Name: isGridTile ]]
    -- upvalues: l_OmniFeedConstants_0 (copy)
    local v38 = v37.treatmentProps.topicLayoutData and v37.treatmentProps.topicLayoutData[l_OmniFeedConstants_0.TopicLayoutDataKeys.ComponentType];
    local v39 = true;
    if v38 ~= l_OmniFeedConstants_0.ComponentTypeDataKeys.GridTile then
        v39 = v38 == l_OmniFeedConstants_0.ComponentTypeDataKeys.EventTile;
    end;
    return v39;
end;
local function v56(v41, v42, v43, v44, v45, v46, v47) --[[ Line: 77 ]] --[[ Name: shouldAddDividerOrExtraPadding ]]
    -- upvalues: v16 (copy), l_FFlagLuaAppUseSortsWithDividersFString_0 (copy), v30 (copy), l_OmniFeedTypes_0 (copy), l_isSubjectToDesktopPolicies_0 (copy), l_OmniFeedConstants_0 (copy), l_AppPage_0 (copy)
    local v48 = false;
    local v49 = false;
    if (v16 and 0 or v47 and 0 or 1) + v41 - 1 < v43 and v43 < v42 then
        local v50 = v45[v43 - 1];
        local v51 = v45[v43];
        local v52 = v45[v43 + 1];
        if v50 and v50.pageSection ~= v51.pageSection then
            v50 = nil;
        end;
        if v52 and v52.pageSection ~= v51.pageSection then
            v52 = nil;
        end;
        if l_FFlagLuaAppUseSortsWithDividersFString_0 and (v51.itemId and v51.itemId.topicId and v30[v51.itemId.topicId] or v52 and v52.itemId and v52.itemId.topicId and v30[v52.itemId.topicId]) then
            v49 = true;
        end;
        if v44.treatmentType == l_OmniFeedTypes_0.HomeGameGrid and v52 and v52.treatmentType ~= l_OmniFeedTypes_0.HomeGameGrid or v44.treatmentType ~= l_OmniFeedTypes_0.HomeGameGrid and v50 and v50.treatmentType == l_OmniFeedTypes_0.HomeGameGrid and v52 and v52.treatmentType == l_OmniFeedTypes_0.HomeGameGrid then
            v49 = true;
        elseif v47 then
            v48 = true;
        elseif l_isSubjectToDesktopPolicies_0() then
            local v53 = false;
            if v44.treatmentType == l_OmniFeedTypes_0.Carousel then
                v53 = false;
                if v52 ~= nil then
                    v53 = false;
                    if v52.treatmentType == l_OmniFeedTypes_0.HomeGameGrid then
                        local v54 = v44.treatmentProps.topicLayoutData and v44.treatmentProps.topicLayoutData[l_OmniFeedConstants_0.TopicLayoutDataKeys.ComponentType];
                        v53 = true;
                        if v54 ~= l_OmniFeedConstants_0.ComponentTypeDataKeys.GridTile then
                            v53 = v54 == l_OmniFeedConstants_0.ComponentTypeDataKeys.EventTile;
                        end;
                        if v53 then
                            v54 = v52;
                            local v55 = v54.treatmentProps.topicLayoutData and v54.treatmentProps.topicLayoutData[l_OmniFeedConstants_0.TopicLayoutDataKeys.ComponentType];
                            v53 = true;
                            if v55 ~= l_OmniFeedConstants_0.ComponentTypeDataKeys.GridTile then
                                v53 = v55 == l_OmniFeedConstants_0.ComponentTypeDataKeys.EventTile;
                            end;
                        end;
                    end;
                end;
            end;
            v48 = v53;
        end;
    end;
    if v46 == l_AppPage_0.SearchPage and v43 < v42 then
        v49 = true;
    end;
    return v49, v48;
end;
return v1.memo(function(v57) --[[ Line: 162 ]]
    -- upvalues: l_useDesignTokens_0 (copy), l_useStyle_0 (copy), l_useUiModeInfo_0 (copy), l_UiMode_0 (copy), v1 (copy), l_FFlagUseOmniFeedDividerOverrides_0 (copy), l_FIntOmniFeedDividerPaddingOverride_0 (copy), l_FIntOmniFeedDividerHeightOverride_0 (copy), l_FeedItemModel_0 (copy), l_SORT_SELECTION_ORDER_BASE_0 (copy), l_SORT_INDEX_SELECTION_ORDER_MULTIPLIER_0 (copy), l_OmniFeedProps_0 (copy), v7 (copy), l_OmniFeedTypes_0 (copy), v15 (copy), l_FFlagLuaAppRemoveOmniFeedDividersAndExtraPadding_0 (copy), v56 (copy), l_FFlagLuaAppEnableRelativeGuiHomeForAll_0 (copy), l_FFlagLuaAppEnableRelativeGuiHomeWithIxp_0 (copy)
    local v58 = l_useDesignTokens_0();
    local l_Color_0 = l_useStyle_0().Theme.BackgroundContrast.Color;
    local v60 = l_useUiModeInfo_0().uiMode == l_UiMode_0.TenFoot;
    local v61 = {
        Layout = v1.createElement("UIListLayout", {
            SortOrder = Enum.SortOrder.LayoutOrder, 
            FillDirection = Enum.FillDirection.Vertical
        })
    };
    local v62 = 1;
    local v63 = v57.layoutPadding or 0;
    local l_v63_0 = v63;
    local v65 = v63 / 2;
    if l_FFlagUseOmniFeedDividerOverrides_0 then
        if l_FIntOmniFeedDividerPaddingOverride_0 >= 0 then
            l_v63_0 = l_FIntOmniFeedDividerPaddingOverride_0 * v58.Global.Stroke_100;
        end;
        if l_FIntOmniFeedDividerHeightOverride_0 >= 0 then
            v65 = l_FIntOmniFeedDividerHeightOverride_0 * v58.Global.Stroke_100;
        end;
    end;
    local l_omniFeedItems_0 = v57.omniFeedItems;
    local v67 = nil;
    local v68 = nil;
    for v69 = 1, #l_omniFeedItems_0 do
        if l_omniFeedItems_0[v69].pageSection == v57.omniFeedPageSection then
            if not v67 then
                v67 = v69;
            end;
            v68 = v69;
        end;
    end;
    v67 = v67 or 1;
    v68 = v68 or #l_omniFeedItems_0;
    local v70 = v57.numberOfItemsToBeRendered or v68 - v67 + 1;
    local v71 = 1;
    local l_pageContext_0 = v57.pageContext;
    local v73 = v57.topMargin or 0;
    local v74 = v57.bottomMargin or 0;
    local v75 = true;
    for v76, v77 in l_omniFeedItems_0 do
        if v70 >= v76 - v67 + 1 then
            local v78 = v77.treatmentProps or {};
            local v79 = l_FeedItemModel_0.getUniqueNameForAnalytics(v77);
            local v80 = l_SORT_SELECTION_ORDER_BASE_0 + v76 * l_SORT_INDEX_SELECTION_ORDER_MULTIPLIER_0;
            local v81 = l_OmniFeedProps_0.new(v76, v71, v57.onItemsUpdatedSignalRef and v57.onItemsUpdatedSignalRef.current, v57.refreshSignalRef and v57.refreshSignalRef.current, l_pageContext_0, v57.scrollingFrameRef, v57.sduiContext, v80, v57.defaultContainerSize);
            v78 = v7.Dictionary.join({
                [l_OmniFeedProps_0.key] = v81
            }, v78);
            if v71 then
                local v82 = l_FeedItemModel_0.getNumberOfRows(v77);
                if not v82 then
                    v71 = nil;
                else
                    v71 = v71 + v82;
                end;
            end;
            if v57.omniFeedPageSection == v77.pageSection then
                local v83 = not v75;
                local v84 = v83 and v77.treatmentType == l_OmniFeedTypes_0.UpsellCard;
                local v85 = if v77.itemId then v77.itemId.sortIndex else nil;
                local v86 = if v85 and v57.sortsData then v57.sortsData[v85] else nil;
                if v86 and (not v86.topic or v86.topic == "") then
                    v83 = false;
                end;
                if v83 then
                    v61["feedPaddingTop_" .. tostring(v76)] = v1.createElement("Frame", {
                        Size = if v84 then UDim2.new(1, 0, 0, v58.Global.Space_150) else UDim2.new(1, 0, 0, l_v63_0), 
                        BackgroundTransparency = 1, 
                        BorderSizePixel = 0, 
                        LayoutOrder = v62
                    });
                    v62 = v62 + 1;
                end;
                v61["feedItem_" .. tostring(v76)] = v1.createElement(v15, {
                    omniFeedItemType = v77.treatmentType, 
                    layoutOrder = v62, 
                    feedItemNameId = v79, 
                    itemProps = v78, 
                    itemIndex = v76, 
                    impressionsTag = v57.impressionsTag, 
                    zIndex = v70 - v76
                });
                v62 = v62 + 1;
                if not l_FFlagLuaAppRemoveOmniFeedDividersAndExtraPadding_0 then
                    local v87, v88 = v56(v67, v68, v76, v77, l_omniFeedItems_0, l_pageContext_0, v60);
                    if v87 or v88 then
                        v61["feedPaddingBottom_" .. tostring(v76)] = v1.createElement("Frame", {
                            Size = UDim2.new(1, 0, 0, l_v63_0), 
                            BackgroundTransparency = 1, 
                            BorderSizePixel = 0, 
                            LayoutOrder = v62
                        });
                        v62 = v62 + 1;
                    end;
                    if v87 then
                        v61["feedDivider_" .. tostring(v76)] = v1.createElement("Frame", {
                            Size = UDim2.new(1, 0, 0, v65), 
                            BackgroundTransparency = 0, 
                            BackgroundColor3 = l_Color_0, 
                            BorderSizePixel = 0, 
                            LayoutOrder = v62
                        });
                        v62 = v62 + 1;
                    end;
                end;
                if v76 - v67 + 1 == v70 and v57.hasNextPage then
                    v61["loadingBlank_" .. tostring(v76)] = v1.createElement("Frame", {
                        Size = UDim2.new(1, 0, 0, 10), 
                        BackgroundTransparency = 1, 
                        BorderSizePixel = 0, 
                        LayoutOrder = v62
                    });
                    v62 = v62 + 1;
                end;
                if v75 then
                    v75 = false;
                end;
            end;
        else
            break;
        end;
    end;
    v61.Padding = v1.createElement(v1.Fragment, nil, {
        PaddingTop = v1.createElement("Frame", {
            Size = UDim2.new(1, 0, 0, v73), 
            BackgroundTransparency = 1, 
            LayoutOrder = 0
        }), 
        PaddingBottom = v1.createElement("Frame", {
            Size = UDim2.new(1, 0, 0, v74), 
            BackgroundTransparency = 1, 
            LayoutOrder = v62
        })
    });
    local v89 = if not not l_FFlagLuaAppEnableRelativeGuiHomeForAll_0 or l_FFlagLuaAppEnableRelativeGuiHomeWithIxp_0 then v57.enableRelativeGui and "RelativeGui" or "Frame" else "Frame";
    return v1.createElement(v89, {
        Size = UDim2.new(1, 0, 0, 0), 
        AutomaticSize = Enum.AutomaticSize.Y, 
        BackgroundTransparency = 1, 
        BorderSizePixel = 0
    }, v61);
end);