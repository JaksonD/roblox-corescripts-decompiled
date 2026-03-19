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
local _ = require(l_script_FirstAncestor_0.Components.Common.ResponsivePanelLayout);
local v14 = require(l_script_FirstAncestor_0.Components.ItemsView.AvatarItemsViewLayout);
local v15 = require(l_script_FirstAncestor_0.Components.ItemDetails.ItemDetailsLayout);
local v16 = require(l_script_FirstAncestor_0.Components.ItemsView.ViewportLayout);
local v17 = require(l_script_FirstAncestor_0.Enums.ViewType);
local _ = require(l_script_FirstAncestor_0.Types);
local v19 = require(l_script_FirstAncestor_0.Hooks.useRemoteBulkPurchaseEvent);
local _ = require(l_script_FirstAncestor_0.Components.Common.BuyActionBar);
local v21 = require(l_script_FirstAncestor_0.Utils.getItemThumbnailUrl);
local v22 = require(l_script_FirstAncestor_0.Components.usePurchaseButtonProps);
local v23 = require(l_script_FirstAncestor_0.Hooks.useInspectPlayer);
local l_useTokens_0 = require(l_Parent_0.Foundation).Hooks.useTokens;
local l_FFlagAXFixBulkPurchaseFreeItems_0 = require(l_Parent_0.AvatarExperienceFlags).FFlagAXFixBulkPurchaseFreeItems;
local l_FFlagIBV2Attribution_0 = require(l_Parent_0.SharedFlags).FFlagIBV2Attribution;
local v27 = require(l_Parent_0.AvatarExperienceFlags);
local l_FFlagAXReportTryOnAnalyticsIaB_0 = v27.FFlagAXReportTryOnAnalyticsIaB;
local v31 = if v27.FFlagAXFormatPDPPriceLabel then require(l_script_FirstAncestor_0.Utils.formatNumber) else function(v29) --[[ Line: 55 ]]
    -- upvalues: l_NumberLocalization_0 (copy), l_LocalizationService_0 (copy)
    local v30 = string.format("%.0f", v29 or 0);
    return l_NumberLocalization_0.localize(v30, l_LocalizationService_0.RobloxLocaleId);
end;
local function v33(v32) --[[ Line: 60 ]] --[[ Name: selectView ]]
    return v32.view;
end;
local function v35(v34) --[[ Line: 64 ]] --[[ Name: selectInspectPreviewDetails ]]
    return v34.avatarPreviewDetails;
end;
local function _(v36, v37) --[[ Line: 75 ]] --[[ Name: shouldRenderSecondPanel ]]
    -- upvalues: v17 (copy)
    if v36 == v17.WideLandscape then
        return true;
    elseif v36 == v17.Wide or v36 == v17.Compact then
        return not v37;
    else
        return false;
    end;
end;
local v39 = {
    [v17.WideLandscape] = {
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
    [v17.Wide] = {
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
    [v17.Compact] = {
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
return function(v40) --[[ Line: 137 ]]
    -- upvalues: l_useSelector_0 (copy), v33 (copy), v4 (copy), v17 (copy), v5 (copy), v35 (copy), v19 (copy), v23 (copy), v31 (copy), l_useTokens_0 (copy), l_useLocalization_0 (copy), v9 (copy), l_FFlagAXReportTryOnAnalyticsIaB_0 (copy), v22 (copy), l_FFlagAXFixBulkPurchaseFreeItems_0 (copy), l_useEventConnection_0 (copy), l_MarketplaceService_0 (copy), v15 (copy), l_FFlagIBV2Attribution_0 (copy), v14 (copy), v16 (copy), v21 (copy), v39 (copy)
    local v41 = l_useSelector_0(v33, v4.deepEqual);
    local v42 = v41 == v17.WideLandscape;
    local v43, v44 = v5.useState(nil);
    local v45, v46 = v5.useState({
        isTryOnEnabled = false, 
        tryOnItem = {}
    });
    local l_items_0 = l_useSelector_0(v35, v4.deepEqual).items;
    local v48, v49, v50 = v19(l_items_0, v40.analytics);
    local v51 = v23();
    local v52 = v31(v50);
    local v53 = l_useTokens_0();
    local v54 = v5.useRef(nil);
    local v55 = v5.useRef(0);
    local v56 = l_useLocalization_0({
        bulkPurchaseButtonText = "Feature.Catalog.Label.BuyItems", 
        headerText = if v51.hasVerifiedBadge then {
            "InGame.InspectMenu.Label.VerifiedAvatar"; 
            PLAYER_NAME = v51.playerName, 
            VERIFIED_BADGE = v9.emoji.verified
        } else {
            "InGame.InspectMenu.Label.Avatar"; 
            PLAYER_NAME = v51.playerName
        }, 
        totalItems = if l_items_0 then {
            "Feature.Catalog.Feature.Catalog.Label.TotalItemsParenthesis"; 
            itemCount = #l_items_0
        } else nil, 
        total = "Feature.Catalog.Label.TotalUnformatted"
    });
    local v61 = v5.useCallback(function(v57) --[[ Line: 179 ]]
        -- upvalues: v46 (copy), l_FFlagAXReportTryOnAnalyticsIaB_0 (ref), v40 (copy)
        v46(function(v58) --[[ Line: 180 ]]
            -- upvalues: v57 (copy), l_FFlagAXReportTryOnAnalyticsIaB_0 (ref), v40 (ref)
            local l_v57_0 = v57;
            local v60 = not v58.isTryOnEnabled;
            if l_FFlagAXReportTryOnAnalyticsIaB_0 and v60 then
                v40.analytics.reportTryOnButtonClicked(v57.itemType, v57.itemId);
            end;
            if not v60 then
                l_v57_0 = {};
            end;
            return {
                isTryOnEnabled = v60, 
                tryOnItem = l_v57_0
            };
        end);
    end, if l_FFlagAXReportTryOnAnalyticsIaB_0 then {
        v40.analytics
    } else {});
    local v62 = v22({
        purchaseButtonText = v56.bulkPurchaseButtonText, 
        onBulkPurchase = v48, 
        isDisabled = if l_FFlagAXFixBulkPurchaseFreeItems_0 then not v49 else l_items_0 == nil or v50 == 0 or not v49, 
        selectedItem = v43, 
        localizedStrings = v56, 
        formattedTotalPrice = v52, 
        onPromptPurchase = v40.onPromptPurchase
    });
    l_useEventConnection_0(l_MarketplaceService_0.PromptBulkPurchaseFinished, v40.onBulkPurchaseFinished);
    v5.useEffect(function() --[[ Line: 221 ]]
        -- upvalues: v54 (copy), v55 (copy)
        if v54.current then
            v54.current.CanvasPosition = Vector2.new(0, v55.current);
        end;
    end, {
        v43
    });
    v5.useEffect(function() --[[ Line: 228 ]]
        -- upvalues: v43 (copy), v40 (copy)
        if v43 then
            v40.onItemDetailsOpened(v43);
        end;
    end, {
        v43, 
        v40.onItemDetailsOpened
    });
    local function v64() --[[ Line: 235 ]]
        -- upvalues: v43 (copy), v5 (ref), v15 (ref), v41 (copy), v44 (copy), v46 (copy), v40 (copy), l_FFlagIBV2Attribution_0 (ref), v17 (ref), v62 (copy), v61 (copy), v45 (copy), v31 (ref), v14 (ref), l_items_0 (copy), v56 (copy), v54 (copy), v55 (copy), v52 (copy)
        if v43 then
            return (v5.createElement(v15, {
                itemDetailsViewProps = {
                    view = v41, 
                    item = v43, 
                    onItemDetailsClosed = function() --[[ Line: 241 ]] --[[ Name: onItemDetailsClosed ]]
                        -- upvalues: v44 (ref), v46 (ref)
                        v44(nil);
                        v46({
                            isTryOnEnabled = false, 
                            tryOnItem = {}
                        });
                    end, 
                    onToggleFavorite = v40.onToggleFavorite, 
                    openAttributionOverlay = if l_FFlagIBV2Attribution_0 then v40.openAttributionOverlay else nil, 
                    purchaseButtonProps = if v41 == v17.Wide then v62.purchaseButtonProps else nil, 
                    onToggleTryOn = v61, 
                    renderTryOnViewport = v40.renderTryOnViewport, 
                    tryOnState = v45, 
                    localPlayerModel = v40.localPlayerModel, 
                    formatNumber = v31
                }, 
                buyActionBarProps = v62, 
                view = v41
            }));
        else
            return (v5.createElement(v14, {
                view = v41, 
                items = l_items_0, 
                headerText = v56.headerText, 
                onInspectMenuClosed = v40.onInspectMenuClosed, 
                onItemCardActivated = function(v63) --[[ Line: 267 ]] --[[ Name: onItemCardActivated ]]
                    -- upvalues: v54 (ref), v55 (ref), v44 (ref)
                    if v54.current then
                        v55.current = v54.current.CanvasPosition.Y;
                    end;
                    v44(v63);
                end, 
                subheaderText = {
                    leftSlotLabel = v56.totalItems or "", 
                    rightSlotPrice = v52
                }, 
                buyActionBarProps = v62, 
                ref = v54
            }));
        end;
    end;
    local function v65() --[[ Line: 283 ]]
        -- upvalues: v5 (ref), v16 (ref), v41 (copy), v43 (copy), v21 (ref), v51 (copy), v44 (copy), v40 (copy), v42 (copy), v62 (copy), v45 (copy), v53 (copy)
        return v5.createElement(v16, {
            view = v41, 
            thumbnailUrl = if v43 then v21(v43) or "" else "rbxthumb://type=Avatar&id=" .. tostring(v51.playerId) .. "&w=420&h=420", 
            backButtonProps = {
                onBackButtonClick = v43 and function() --[[ Line: 291 ]]
                    -- upvalues: v44 (ref)
                    v44(nil);
                end or v40.onInspectMenuClosed
            }, 
            viewportProps = {
                ScaleType = Enum.ScaleType.Crop, 
                Size = if v42 then UDim2.new(1, 0, 0, 0) else UDim2.new(1, 0, 1, 0), 
                AspectRatio = 1
            }, 
            buyActionBarProps = v62, 
            Size = UDim2.new(1, 0, 1, 0), 
            renderTryOnViewport = v40.renderTryOnViewport, 
            tryOnState = v45, 
            thumbnailPadding = if v43 then {
                left = UDim.new(0, v53.Padding.XXLarge), 
                right = UDim.new(0, v53.Padding.XXLarge), 
                top = UDim.new(0, v53.Padding.XXLarge), 
                bottom = UDim.new(0, v53.Padding.XXLarge)
            } else nil
        });
    end;
    return {
        view = v41, 
        renderFirstPanel = v64, 
        renderSecondPanel = if v41 == v17.WideLandscape or (not (v41 ~= v17.Wide) or v41 == v17.Compact) and not v43 then v65 else nil, 
        panelConfig = v39[v41] or v39[v17.Wide]
    };
end;