local l_script_FirstAncestor_0 = script:FindFirstAncestor("AvatarExperienceInspectAndBuy");
local l_MarketplaceService_0 = game:GetService("MarketplaceService");
local l_LocalizationService_0 = game:GetService("LocalizationService");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v4 = require(l_Parent_0.tutils);
local v5 = require(l_Parent_0.React);
local v6 = require(l_Parent_0.RoactUtils);
local l_useEventConnection_0 = require(l_Parent_0.ReactUtils).useEventConnection;
local l_useSelector_0 = v6.Hooks.RoactRodux.useSelector;
local v9 = require(l_Parent_0.VerifiedBadges);
local v10 = require(l_Parent_0.Localization);
local l_NumberLocalization_0 = v10.NumberLocalization;
local l_useLocalization_0 = v10.Hooks.useLocalization;
local l_useItemSelectionStore_0 = require(l_script_FirstAncestor_0.Contexts.ItemSelectionStoreContext).useItemSelectionStore;
local _ = require(l_script_FirstAncestor_0.Stores.createItemSelectionStore);
local l_FFlagAXEnableIaBTimedOptionsBulkPurchase_0 = require(l_Parent_0.AvatarExperienceFlags).FFlagAXEnableIaBTimedOptionsBulkPurchase;
local _ = require(l_script_FirstAncestor_0.Components.Common.ResponsivePanelLayout);
local v17 = require(l_script_FirstAncestor_0.Components.ItemsView.AvatarItemsViewLayout);
local v18 = require(l_script_FirstAncestor_0.Components.ItemDetails.ItemDetailsLayout);
local v19 = require(l_script_FirstAncestor_0.Components.ItemsView.ViewportLayout);
local v20 = require(l_script_FirstAncestor_0.Enums.ViewType);
local _ = require(l_script_FirstAncestor_0.Types);
local v22 = require(l_script_FirstAncestor_0.Hooks.useRemoteBulkPurchaseEvent);
local _ = require(l_script_FirstAncestor_0.Components.Common.BuyActionBar);
local v24 = require(l_script_FirstAncestor_0.Utils.getItemThumbnailUrl);
local v25 = require(l_script_FirstAncestor_0.Components.usePurchaseButtonProps);
local v26 = require(l_script_FirstAncestor_0.Hooks.useInspectPlayer);
local l_useTokens_0 = require(l_Parent_0.Foundation).Hooks.useTokens;
local l_FFlagAXFixBulkPurchaseFreeItems_0 = require(l_Parent_0.AvatarExperienceFlags).FFlagAXFixBulkPurchaseFreeItems;
local l_FFlagIBV2Attribution_0 = require(l_Parent_0.SharedFlags).FFlagIBV2Attribution;
local v30 = require(l_Parent_0.AvatarExperienceFlags);
local l_FFlagAXReportTryOnAnalyticsIaB_0 = v30.FFlagAXReportTryOnAnalyticsIaB;
local v34 = if v30.FFlagAXFormatPDPPriceLabel then require(l_script_FirstAncestor_0.Utils.formatNumber) else function(v32) --[[ Line: 61 ]]
    -- upvalues: l_NumberLocalization_0 (copy), l_LocalizationService_0 (copy)
    local v33 = string.format("%.0f", v32 or 0);
    return l_NumberLocalization_0.localize(v33, l_LocalizationService_0.RobloxLocaleId);
end;
local function v36(v35) --[[ Line: 66 ]] --[[ Name: selectView ]]
    return v35.view;
end;
local function v38(v37) --[[ Line: 70 ]] --[[ Name: selectInspectPreviewDetails ]]
    return v37.avatarPreviewDetails;
end;
local function _(v39, v40) --[[ Line: 81 ]] --[[ Name: shouldRenderSecondPanel ]]
    -- upvalues: v20 (copy)
    if v39 == v20.WideLandscape then
        return true;
    elseif v39 == v20.Wide or v39 == v20.Compact then
        return not v40;
    else
        return false;
    end;
end;
local v42 = {
    [v20.WideLandscape] = {
        tag = "size-full row align-y-center align-x-center", 
        layoutOrder = {
            first = 1, 
            second = 2
        }, 
        panelSizes = {
            first = UDim2.new(0.65, 0, 1, 0), 
            second = UDim2.new(0.35, 0, 1, 0)
        }, 
        showRightBorder = true
    }, 
    [v20.Wide] = {
        tag = "size-full col align-y-center align-x-center", 
        layoutOrder = {
            first = 2, 
            second = 1
        }, 
        panelSizes = {
            first = UDim2.new(1, 0, 0.65, 0), 
            second = UDim2.new(1, 0, 0.35, 0)
        }, 
        showRightBorder = false
    }, 
    [v20.Compact] = {
        tag = "size-full col align-y-center align-x-center", 
        layoutOrder = {
            first = 2, 
            second = 1
        }, 
        panelSizes = {
            first = UDim2.new(1, 0, 0.7, 0), 
            second = UDim2.new(1, 0, 0.3, 0)
        }, 
        showRightBorder = false
    }
};
return function(v43) --[[ Line: 143 ]]
    -- upvalues: l_useSelector_0 (copy), v36 (copy), v4 (copy), v20 (copy), v5 (copy), v38 (copy), v22 (copy), v26 (copy), v34 (copy), l_useTokens_0 (copy), l_FFlagAXEnableIaBTimedOptionsBulkPurchase_0 (copy), l_useItemSelectionStore_0 (copy), l_useLocalization_0 (copy), v9 (copy), l_FFlagAXReportTryOnAnalyticsIaB_0 (copy), v25 (copy), l_FFlagAXFixBulkPurchaseFreeItems_0 (copy), l_useEventConnection_0 (copy), l_MarketplaceService_0 (copy), v18 (copy), l_FFlagIBV2Attribution_0 (copy), v17 (copy), v19 (copy), v24 (copy), v42 (copy)
    local v44 = l_useSelector_0(v36, v4.deepEqual);
    local v45 = v44 == v20.WideLandscape;
    local v46, v47 = v5.useState(nil);
    local v48, v49 = v5.useState({
        isTryOnEnabled = false, 
        tryOnItem = {}
    });
    local l_items_0 = l_useSelector_0(v38, v4.deepEqual).items;
    local v51, v52, v53 = v22(l_items_0, v43.analytics);
    local v54 = v26();
    local v55 = v34(v53);
    local v56 = l_useTokens_0();
    local v57 = if l_FFlagAXEnableIaBTimedOptionsBulkPurchase_0 then l_useItemSelectionStore_0() else nil;
    local v58 = v5.useRef(nil);
    local v59 = v5.useRef(0);
    local v60 = l_useLocalization_0({
        bulkPurchaseButtonText = "Feature.Catalog.Label.BuyItems", 
        headerText = if v54.hasVerifiedBadge then {
            "InGame.InspectMenu.Label.VerifiedAvatar"; 
            PLAYER_NAME = v54.playerName, 
            VERIFIED_BADGE = v9.emoji.verified
        } else {
            "InGame.InspectMenu.Label.Avatar"; 
            PLAYER_NAME = v54.playerName
        }, 
        totalItems = if l_items_0 then {
            "Feature.Catalog.Feature.Catalog.Label.TotalItemsParenthesis"; 
            itemCount = #l_items_0
        } else nil, 
        total = "Feature.Catalog.Label.TotalUnformatted"
    });
    local v65 = v5.useCallback(function(v61) --[[ Line: 189 ]]
        -- upvalues: v49 (copy), l_FFlagAXReportTryOnAnalyticsIaB_0 (ref), v43 (copy)
        v49(function(v62) --[[ Line: 190 ]]
            -- upvalues: v61 (copy), l_FFlagAXReportTryOnAnalyticsIaB_0 (ref), v43 (ref)
            local l_v61_0 = v61;
            local v64 = not v62.isTryOnEnabled;
            if l_FFlagAXReportTryOnAnalyticsIaB_0 and v64 then
                v43.analytics.reportTryOnButtonClicked(v61.itemType, v61.itemId);
            end;
            if not v64 then
                l_v61_0 = {};
            end;
            return {
                isTryOnEnabled = v64, 
                tryOnItem = l_v61_0
            };
        end);
    end, if l_FFlagAXReportTryOnAnalyticsIaB_0 then {
        v43.analytics
    } else {});
    local v66 = v25({
        purchaseButtonText = v60.bulkPurchaseButtonText, 
        onBulkPurchase = v51, 
        isDisabled = if l_FFlagAXFixBulkPurchaseFreeItems_0 then not v52 else l_items_0 == nil or v53 == 0 or not v52, 
        selectedItem = v46, 
        localizedStrings = v60, 
        formattedTotalPrice = v55, 
        onPromptPurchase = v43.onPromptPurchase
    });
    l_useEventConnection_0(l_MarketplaceService_0.PromptBulkPurchaseFinished, v43.onBulkPurchaseFinished);
    v5.useEffect(function() --[[ Line: 231 ]]
        -- upvalues: v58 (copy), v59 (copy)
        if v58.current then
            v58.current.CanvasPosition = Vector2.new(0, v59.current);
        end;
    end, {
        v46
    });
    v5.useEffect(function() --[[ Line: 238 ]]
        -- upvalues: v46 (copy), v43 (copy)
        if v46 then
            v43.onItemDetailsOpened(v46);
        end;
    end, {
        v46, 
        v43.onItemDetailsOpened
    });
    local v67 = if l_FFlagAXEnableIaBTimedOptionsBulkPurchase_0 then v5.useCallback(function() --[[ Line: 245 ]]
        -- upvalues: v57 (copy), v43 (copy)
        v57.clearAll();
        v43.onInspectMenuClosed();
    end, {
        v57, 
        v43.onInspectMenuClosed
    }) else nil;
    local function v69() --[[ Line: 252 ]]
        -- upvalues: v46 (copy), v5 (ref), v18 (ref), v44 (copy), v47 (copy), v49 (copy), v43 (copy), l_FFlagIBV2Attribution_0 (ref), v20 (ref), v66 (copy), v65 (copy), v48 (copy), v34 (ref), v17 (ref), l_items_0 (copy), v60 (copy), l_FFlagAXEnableIaBTimedOptionsBulkPurchase_0 (ref), v67 (copy), v58 (copy), v59 (copy), v55 (copy)
        if v46 then
            return (v5.createElement(v18, {
                itemDetailsViewProps = {
                    view = v44, 
                    item = v46, 
                    onItemDetailsClosed = function() --[[ Line: 258 ]] --[[ Name: onItemDetailsClosed ]]
                        -- upvalues: v47 (ref), v49 (ref)
                        v47(nil);
                        v49({
                            isTryOnEnabled = false, 
                            tryOnItem = {}
                        });
                    end, 
                    onToggleFavorite = v43.onToggleFavorite, 
                    openAttributionOverlay = if l_FFlagIBV2Attribution_0 then v43.openAttributionOverlay else nil, 
                    purchaseButtonProps = if v44 == v20.Wide then v66.purchaseButtonProps else nil, 
                    onToggleTryOn = v65, 
                    renderTryOnViewport = v43.renderTryOnViewport, 
                    tryOnState = v48, 
                    localPlayerModel = v43.localPlayerModel, 
                    formatNumber = v34
                }, 
                buyActionBarProps = v66, 
                view = v44
            }));
        else
            return (v5.createElement(v17, {
                view = v44, 
                items = l_items_0, 
                headerText = v60.headerText, 
                onInspectMenuClosed = if l_FFlagAXEnableIaBTimedOptionsBulkPurchase_0 and v67 then v67 else v43.onInspectMenuClosed, 
                onItemCardActivated = function(v68) --[[ Line: 286 ]] --[[ Name: onItemCardActivated ]]
                    -- upvalues: v58 (ref), v59 (ref), v47 (ref)
                    if v58.current then
                        v59.current = v58.current.CanvasPosition.Y;
                    end;
                    v47(v68);
                end, 
                subheaderText = {
                    leftSlotLabel = v60.totalItems or "", 
                    rightSlotPrice = v55
                }, 
                buyActionBarProps = v66, 
                ref = v58
            }));
        end;
    end;
    local function v70() --[[ Line: 302 ]]
        -- upvalues: v5 (ref), v19 (ref), v44 (copy), v46 (copy), v24 (ref), v54 (copy), v47 (copy), v43 (copy), v45 (copy), v66 (copy), v48 (copy), v56 (copy)
        return v5.createElement(v19, {
            view = v44, 
            thumbnailUrl = if v46 then v24(v46) or "" else "rbxthumb://type=Avatar&id=" .. tostring(v54.playerId) .. "&w=420&h=420", 
            backButtonProps = {
                onBackButtonClick = v46 and function() --[[ Line: 310 ]]
                    -- upvalues: v47 (ref)
                    v47(nil);
                end or v43.onInspectMenuClosed
            }, 
            viewportProps = {
                ScaleType = Enum.ScaleType.Crop, 
                Size = if v45 then UDim2.new(1, 0, 0, 0) else UDim2.new(1, 0, 1, 0), 
                AspectRatio = 1
            }, 
            buyActionBarProps = v66, 
            Size = UDim2.new(1, 0, 1, 0), 
            renderTryOnViewport = v43.renderTryOnViewport, 
            tryOnState = v48, 
            thumbnailPadding = if v46 then {
                left = UDim.new(0, v56.Padding.XXLarge), 
                right = UDim.new(0, v56.Padding.XXLarge), 
                top = UDim.new(0, v56.Padding.XXLarge), 
                bottom = UDim.new(0, v56.Padding.XXLarge)
            } else nil
        });
    end;
    return {
        view = v44, 
        renderFirstPanel = v69, 
        renderSecondPanel = if v44 == v20.WideLandscape or (not (v44 ~= v20.Wide) or v44 == v20.Compact) and not v46 then v70 else nil, 
        panelConfig = v42[v44] or v42[v20.Wide]
    };
end;