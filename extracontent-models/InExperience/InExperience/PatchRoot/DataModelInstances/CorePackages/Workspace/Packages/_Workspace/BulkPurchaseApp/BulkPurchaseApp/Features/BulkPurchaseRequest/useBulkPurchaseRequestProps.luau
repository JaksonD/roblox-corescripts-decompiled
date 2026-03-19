local l_MarketplaceService_0 = game:GetService("MarketplaceService");
local l_BrowserService_0 = game:GetService("BrowserService");
local l_HttpService_0 = game:GetService("HttpService");
local l_RunService_0 = game:GetService("RunService");
local l_script_FirstAncestor_0 = script:FindFirstAncestor("BulkPurchaseApp");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local l_useDispatch_0 = require(l_Parent_0.RoactUtils).Hooks.RoactRodux.useDispatch;
local l_useSelector_0 = require(l_Parent_0.RoactUtils).Hooks.RoactRodux.useSelector;
local v8 = require(l_Parent_0.React);
local v9 = require(l_Parent_0.IAPExperience);
local l_isErrorReasonContainsEconomicRestrictions_0 = v9.Utility.isErrorReasonContainsEconomicRestrictions;
local l_parseErrorReasonToEconomicRestriction_0 = v9.Utility.parseErrorReasonToEconomicRestriction;
local l_EconomicRestrictionsCounter_0 = v9.Counters.EconomicRestrictionsCounter;
local l_UniversalEconomicRestrictionsCounter_0 = l_EconomicRestrictionsCounter_0.UniversalEconomicRestrictionsCounter;
local l_default_0 = require(l_Parent_0.LoggingProtocol).default;
local l_EconomicRestrictionsSurface_0 = l_EconomicRestrictionsCounter_0.EconomicRestrictionsSurface;
local v16 = require(l_script_FirstAncestor_0.Store.Selectors.selectPurchaseResults);
local v17 = require(l_script_FirstAncestor_0.Store.Selectors.selectOrderRequest);
local v18 = require(l_script_FirstAncestor_0.Store.Selectors.selectItemData);
local v19 = require(l_script_FirstAncestor_0.Store.Actions.BulkPurchaseEnded);
local v20 = require(l_script_FirstAncestor_0.Store.Actions.BulkPurchaseFailed);
local v21 = require(l_script_FirstAncestor_0.Store.Actions.BulkPurchaseSucceeded);
local v22 = require(l_script_FirstAncestor_0.Enums.BulkPurchasePromptStateEnum);
local v23 = require(l_script_FirstAncestor_0.Enums.ErrorCodeEnum);
local v24 = require(l_script_FirstAncestor_0.Enums.PurchasableStateEnum);
local v25 = require(l_script_FirstAncestor_0.Enums.ItemStatusToErrorCodeMap);
local v26 = require(l_script_FirstAncestor_0.Enums.PurchasableStateToItemPurchaseStatusMap);
local v27 = require(l_script_FirstAncestor_0.Utils.getThumbnailUrl);
local _ = require(l_script_FirstAncestor_0.Store.Types);
local v29 = require(l_script_FirstAncestor_0.Enums.PaymentPlatformEnum);
local v30 = require(l_script_FirstAncestor_0.Utils.getPaymentPlatform);
local v31 = require(l_script_FirstAncestor_0.Utils.getRobuxStoreUrl);
local v32 = require(l_script_FirstAncestor_0.Utils.getGuiObjectIsObscured);
local v33 = require(l_script_FirstAncestor_0.Flags.FFlagFixVP8143);
local v34 = game:DefineFastFlag("FixBuyRobuxForAndroid", false);
local v35 = game:DefineFastFlag("BulkPurchaseHandleMissingFulfillmentGroupsKey", false);
local _ = require(script.Parent.BulkPurchaseRequest);
local v37 = {
    INSUFFICIENT_ROBUX = Enum.MarketplaceItemPurchaseStatus.InsufficientRobux, 
    QUOTA_EXCEEDED = Enum.MarketplaceItemPurchaseStatus.QuotaExceeded, 
    NOT_FOR_SALE = Enum.MarketplaceItemPurchaseStatus.NotForSale, 
    NOT_AVAILABLE_FOR_PURCHASER = Enum.MarketplaceItemPurchaseStatus.NotAvailableForPurchaser, 
    PRICE_MISMATCH = Enum.MarketplaceItemPurchaseStatus.PriceMismatch, 
    SOLD_OUT = Enum.MarketplaceItemPurchaseStatus.SoldOut, 
    PURCHASER_IS_SELLER = Enum.MarketplaceItemPurchaseStatus.PurchaserIsSeller, 
    QUANTITY_LIMIT_EXCEEDED = Enum.MarketplaceItemPurchaseStatus.QuantityLimitExceeded, 
    ALREADY_OWNED = Enum.MarketplaceItemPurchaseStatus.AlreadyOwned, 
    INSUFFICIENT_MEMBERSHIP = Enum.MarketplaceItemPurchaseStatus.InsufficientMembership, 
    PURCHASE_PLACE_INVALID = Enum.MarketplaceItemPurchaseStatus.PlaceInvalid
};
local function _(v38) --[[ Line: 81 ]] --[[ Name: lineItemToStatus ]]
    -- upvalues: v37 (copy)
    local v39 = v37[v38.errorReason];
    if v38.status == "SUCCEEDED" then
        return Enum.MarketplaceItemPurchaseStatus.Success;
    elseif v39 then
        return v39;
    else
        return Enum.MarketplaceItemPurchaseStatus.SystemError;
    end;
end;
local function v42(v41) --[[ Line: 92 ]] --[[ Name: getLineItemsFromPurchaseResponse ]]
    -- upvalues: v35 (copy)
    if v35 then
        if v41.fulfillmentGroups and v41.fulfillmentGroups[1] and v41.fulfillmentGroups[1].lineItems then
            return v41.fulfillmentGroups[1].lineItems;
        else
            return {};
        end;
    elseif v41.fulfillmentGroups[1] then
        return v41.fulfillmentGroups[1].lineItems;
    else
        return {};
    end;
end;
local function v47(v43) --[[ Line: 102 ]] --[[ Name: filterPurchasableItems ]]
    -- upvalues: v24 (copy)
    local v44 = {};
    for _, v46 in v43 do
        if v46.purchasableState == v24.Purchasable then
            table.insert(v44, v46);
        end;
    end;
    return v44;
end;
local function v58(v48, v49) --[[ Line: 119 ]] --[[ Name: getItemResultsFromResponse ]]
    -- upvalues: v47 (copy), v42 (copy), v37 (copy)
    local v50 = v47(v49);
    local v51 = v42(v48);
    local v52 = {};
    for v53, v54 in v50 do
        local v55 = v51[v53];
        if v55 then
            local l_id_0 = v54.id;
            local v57 = v37[v55.errorReason];
            v52[l_id_0] = if v55.status == "SUCCEEDED" then Enum.MarketplaceItemPurchaseStatus.Success else v57 or Enum.MarketplaceItemPurchaseStatus.SystemError;
        end;
    end;
    return v52;
end;
local _ = function(v59) --[[ Line: 136 ]] --[[ Name: getCommonItemStatus ]]
    local v60 = nil;
    for _, v62 in v59 do
        if v60 ~= nil and v62 ~= v60 then
            return nil;
        elseif v60 == nil then
            v60 = v62;
        end;
    end;
    return v60;
end;
local function _(v64) --[[ Line: 149 ]] --[[ Name: createOwnedItem ]]
    -- upvalues: v27 (copy)
    return {
        id = v64.id, 
        name = v64.name, 
        image = v27(v64.id, v64.type), 
        ownedCount = v64.ownedCount
    };
end;
local function _(v66) --[[ Line: 158 ]] --[[ Name: createPurchasableItem ]]
    -- upvalues: v27 (copy)
    return {
        id = v66.id, 
        cost = v66.priceRobux, 
        name = v66.name, 
        image = v27(v66.id, v66.type)
    };
end;
local function _(v68) --[[ Line: 167 ]] --[[ Name: createUnpurchasableItem ]]
    -- upvalues: v27 (copy), v26 (copy)
    return {
        id = v68.id, 
        name = v68.name, 
        image = v27(v68.id, v68.type), 
        status = v26[v68.purchasableState] or Enum.MarketplaceItemPurchaseStatus.SystemError
    };
end;
local function v73(v70, v71) --[[ Line: 177 ]] --[[ Name: handleEconomicRestrictionError ]]
    -- upvalues: l_parseErrorReasonToEconomicRestriction_0 (copy), l_default_0 (copy), l_UniversalEconomicRestrictionsCounter_0 (copy), l_EconomicRestrictionsSurface_0 (copy), v20 (copy), v23 (copy)
    local v72 = l_parseErrorReasonToEconomicRestriction_0(v70);
    l_default_0:logRobloxTelemetryCounter(l_UniversalEconomicRestrictionsCounter_0, 1, {
        surface = l_EconomicRestrictionsSurface_0.BulkPurchase, 
        failureReason = if v72.violationType then tostring(v72.violationType) else "null"
    });
    v71(v20(v23.EconomicRestriction, {
        failureReason = v72.violationType, 
        expirationTimeInMinutes = v72.timeoutMinutes
    }));
end;
local function v80(v74) --[[ Line: 191 ]] --[[ Name: selectBulkPurchaseRequestState ]]
    -- upvalues: v24 (copy), v27 (copy), v26 (copy)
    local v75 = {};
    local v76 = {};
    local v77 = {};
    if v74.itemData then
        for _, v79 in v74.itemData do
            if v79.purchasableState == v24.Purchasable then
                table.insert(v75, {
                    id = v79.id, 
                    cost = v79.priceRobux, 
                    name = v79.name, 
                    image = v27(v79.id, v79.type)
                });
                if v79.ownedCount and v79.ownedCount > 0 then
                    table.insert(v76, {
                        id = v79.id, 
                        name = v79.name, 
                        image = v27(v79.id, v79.type), 
                        ownedCount = v79.ownedCount
                    });
                end;
            else
                table.insert(v77, {
                    id = v79.id, 
                    name = v79.name, 
                    image = v27(v79.id, v79.type), 
                    status = v26[v79.purchasableState] or Enum.MarketplaceItemPurchaseStatus.SystemError
                });
            end;
        end;
    end;
    return {
        totalCost = v74.totalCost or 0, 
        items = v75, 
        ownedItems = v76, 
        unpurchasableItems = v77, 
        balance = v74.balance or 0
    };
end;
local function v82(v81) --[[ Line: 217 ]] --[[ Name: selectOptions ]]
    return v81.options;
end;
return function() --[[ Line: 221 ]] --[[ Name: useBulkPurchaseRequestProps ]]
    -- upvalues: l_useDispatch_0 (copy), l_useSelector_0 (copy), v80 (copy), v16 (copy), v17 (copy), v82 (copy), v18 (copy), l_MarketplaceService_0 (copy), v19 (copy), l_isErrorReasonContainsEconomicRestrictions_0 (copy), v73 (copy), v58 (copy), v21 (copy), v22 (copy), v20 (copy), v25 (copy), v23 (copy), v30 (copy), v29 (copy), v34 (copy), l_HttpService_0 (copy), v31 (copy), l_BrowserService_0 (copy), v33 (copy), v8 (copy), l_RunService_0 (copy), v32 (copy)
    local v83 = l_useDispatch_0();
    local v84 = l_useSelector_0(v80);
    local v85 = l_useSelector_0(v16);
    local v86 = l_useSelector_0(v17);
    local v87 = l_useSelector_0(v82);
    local v88 = l_useSelector_0(v18);
    local l_totalCost_0 = v84.totalCost;
    local l_balance_0 = v84.balance;
    local function v91() --[[ Line: 231 ]]
        -- upvalues: l_MarketplaceService_0 (ref), v85 (copy), v83 (copy), v19 (ref)
        l_MarketplaceService_0:signalPromptBulkPurchaseFinished(2, v85);
        v83(v19());
    end;
    local function v100() --[[ Line: 238 ]]
        -- upvalues: l_MarketplaceService_0 (ref), v86 (copy), v87 (copy), l_isErrorReasonContainsEconomicRestrictions_0 (ref), v73 (ref), v83 (copy), v58 (ref), v88 (copy), v21 (ref), v22 (ref), v20 (ref), v25 (ref), v23 (ref)
        local v92 = false;
        local l_status_0, l_result_0 = pcall(function() --[[ Line: 239 ]]
            -- upvalues: l_MarketplaceService_0 (ref), v86 (ref), v87 (ref)
            return l_MarketplaceService_0:PerformBulkPurchase(v86, v87);
        end);
        if l_status_0 and l_result_0 then
            if l_result_0.message and l_isErrorReasonContainsEconomicRestrictions_0(l_result_0.message) then
                v73(l_result_0.message, v83);
                return;
            else
                local v95 = v58(l_result_0, v88);
                local v96 = nil;
                local v97;
                for _, v99 in v95 do
                    if v96 ~= nil and v99 ~= v96 then
                        v97 = nil;
                        v92 = true;
                    elseif v96 == nil then
                        v96 = v99;
                    end;
                    if v92 then
                        break;
                    end;
                end;
                if not v92 then
                    v97 = v96;
                end;
                v92 = false;
                if not v97 then
                    v83(v21(v22.PartialSuccess, v95));
                    return;
                elseif v97 == Enum.MarketplaceItemPurchaseStatus.Success then
                    v83(v21(v22.Success, v95));
                    return;
                else
                    v83(v20(v25[v97]));
                    return;
                end;
            end;
        elseif string.find(l_result_0, "403") then
            v83(v20(v23.TwoStepVerificationRequired));
            return;
        else
            v83(v20(v23.Generic));
            return;
        end;
    end;
    local function v103() --[[ Line: 276 ]]
        -- upvalues: v30 (ref), v29 (ref), v34 (ref), l_HttpService_0 (ref), v31 (ref), l_BrowserService_0 (ref), v83 (copy), v19 (ref), v20 (ref), v23 (ref)
        local v101 = v30();
        if v101 == v29.Desktop or v101 == v29.Mobile then
            if v34 then
                local v102 = l_HttpService_0:JSONEncode({
                    command = "open", 
                    url = v31()
                });
                l_BrowserService_0:SendCommand(v102);
            else
                l_BrowserService_0:OpenBrowserWindow(v31());
            end;
            v83(v19());
            return;
        else
            v83(v20(v23.InsufficientRobux));
            return;
        end;
    end;
    local v104 = nil;
    local v105 = nil;
    local v106 = nil;
    if v33 then
        v104 = v8.useRef(nil);
        local v107, v108 = v8.useState(true);
        v105 = v107;
        v106 = v108;
        v8.useEffect(function() --[[ Line: 307 ]]
            -- upvalues: l_RunService_0 (ref), v104 (ref), v32 (ref), v106 (ref)
            local v111 = l_RunService_0.Heartbeat:Connect(function() --[[ Line: 308 ]]
                -- upvalues: v104 (ref), v32 (ref), v106 (ref)
                if v104.current and typeof(v104.current) == "Instance" and v104.current:IsA("GuiObject") then
                    local v109 = v32(v104.current);
                    local l_Core_0 = game.StarterGui:GetCore("DevConsoleVisible");
                    v106(v109 or l_Core_0);
                end;
            end);
            return function() --[[ Line: 319 ]]
                -- upvalues: v111 (copy)
                v111:Disconnect();
            end;
        end, {});
    end;
    return {
        currentBalance = v84.balance, 
        items = v84.items, 
        ownedItems = v84.ownedItems, 
        unpurchasableItems = v84.unpurchasableItems, 
        onClose = v91, 
        onAccept = if l_balance_0 < l_totalCost_0 then v103 else v100, 
        totalCost = v84.totalCost, 
        isDisabled = v33 and v105 or #v84.items == 0, 
        purchaseButtonRef = if v33 then v104 else nil
    };
end;