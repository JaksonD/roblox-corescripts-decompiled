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
local _ = require(script.Parent.BulkPurchaseRequestItem);
local _ = require(script.Parent.BulkPurchaseRequestOwnedItem);
local _ = require(script.Parent.BulkPurchaseRequestUnpurchasableItem);
local v40 = {
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
local function _(v41) --[[ Line: 84 ]] --[[ Name: lineItemToStatus ]]
    -- upvalues: v40 (copy)
    local v42 = v40[v41.errorReason];
    if v41.status == "SUCCEEDED" then
        return Enum.MarketplaceItemPurchaseStatus.Success;
    elseif v42 then
        return v42;
    else
        return Enum.MarketplaceItemPurchaseStatus.SystemError;
    end;
end;
local function v45(v44) --[[ Line: 95 ]] --[[ Name: getLineItemsFromPurchaseResponse ]]
    -- upvalues: v35 (copy)
    if v35 then
        if v44.fulfillmentGroups and v44.fulfillmentGroups[1] and v44.fulfillmentGroups[1].lineItems then
            return v44.fulfillmentGroups[1].lineItems;
        else
            return {};
        end;
    elseif v44.fulfillmentGroups[1] then
        return v44.fulfillmentGroups[1].lineItems;
    else
        return {};
    end;
end;
local function v50(v46) --[[ Line: 105 ]] --[[ Name: filterPurchasableItems ]]
    -- upvalues: v24 (copy)
    local v47 = {};
    for _, v49 in v46 do
        if v49.purchasableState == v24.Purchasable then
            table.insert(v47, v49);
        end;
    end;
    return v47;
end;
local function v61(v51, v52) --[[ Line: 122 ]] --[[ Name: getItemResultsFromResponse ]]
    -- upvalues: v50 (copy), v45 (copy), v40 (copy)
    local v53 = v50(v52);
    local v54 = v45(v51);
    local v55 = {};
    for v56, v57 in v53 do
        local v58 = v54[v56];
        if v58 then
            local l_id_0 = v57.id;
            local v60 = v40[v58.errorReason];
            v55[l_id_0] = if v58.status == "SUCCEEDED" then Enum.MarketplaceItemPurchaseStatus.Success else v60 or Enum.MarketplaceItemPurchaseStatus.SystemError;
        end;
    end;
    return v55;
end;
local _ = function(v62) --[[ Line: 139 ]] --[[ Name: getCommonItemStatus ]]
    local v63 = nil;
    for _, v65 in v62 do
        if v63 ~= nil and v65 ~= v63 then
            return nil;
        elseif v63 == nil then
            v63 = v65;
        end;
    end;
    return v63;
end;
local function _(v67) --[[ Line: 152 ]] --[[ Name: createOwnedItem ]]
    -- upvalues: v27 (copy)
    return {
        id = v67.id, 
        name = v67.name, 
        image = v27(v67.id, v67.type), 
        ownedCount = v67.ownedCount
    };
end;
local function _(v69) --[[ Line: 161 ]] --[[ Name: createPurchasableItem ]]
    -- upvalues: v27 (copy)
    return {
        id = v69.id, 
        cost = v69.priceRobux, 
        name = v69.name, 
        image = v27(v69.id, v69.type)
    };
end;
local function _(v71) --[[ Line: 170 ]] --[[ Name: createUnpurchasableItem ]]
    -- upvalues: v27 (copy), v26 (copy)
    return {
        id = v71.id, 
        name = v71.name, 
        image = v27(v71.id, v71.type), 
        status = v26[v71.purchasableState] or Enum.MarketplaceItemPurchaseStatus.SystemError
    };
end;
local function v76(v73, v74) --[[ Line: 180 ]] --[[ Name: handleEconomicRestrictionError ]]
    -- upvalues: l_parseErrorReasonToEconomicRestriction_0 (copy), l_default_0 (copy), l_UniversalEconomicRestrictionsCounter_0 (copy), l_EconomicRestrictionsSurface_0 (copy), v20 (copy), v23 (copy)
    local v75 = l_parseErrorReasonToEconomicRestriction_0(v73);
    l_default_0:logRobloxTelemetryCounter(l_UniversalEconomicRestrictionsCounter_0, 1, {
        surface = l_EconomicRestrictionsSurface_0.BulkPurchase, 
        failureReason = if v75.violationType then tostring(v75.violationType) else "null"
    });
    v74(v20(v23.EconomicRestriction, {
        failureReason = v75.violationType, 
        expirationTimeInMinutes = v75.timeoutMinutes
    }));
end;
local function v83(v77) --[[ Line: 194 ]] --[[ Name: selectBulkPurchaseRequestState ]]
    -- upvalues: v24 (copy), v27 (copy), v26 (copy)
    local v78 = {};
    local v79 = {};
    local v80 = {};
    if v77.itemData then
        for _, v82 in v77.itemData do
            if v82.purchasableState == v24.Purchasable then
                table.insert(v78, {
                    id = v82.id, 
                    cost = v82.priceRobux, 
                    name = v82.name, 
                    image = v27(v82.id, v82.type)
                });
                if v82.ownedCount and v82.ownedCount > 0 then
                    table.insert(v79, {
                        id = v82.id, 
                        name = v82.name, 
                        image = v27(v82.id, v82.type), 
                        ownedCount = v82.ownedCount
                    });
                end;
            else
                table.insert(v80, {
                    id = v82.id, 
                    name = v82.name, 
                    image = v27(v82.id, v82.type), 
                    status = v26[v82.purchasableState] or Enum.MarketplaceItemPurchaseStatus.SystemError
                });
            end;
        end;
    end;
    return {
        totalCost = v77.totalCost or 0, 
        items = v78, 
        ownedItems = v79, 
        unpurchasableItems = v80, 
        balance = v77.balance or 0
    };
end;
local function v85(v84) --[[ Line: 220 ]] --[[ Name: selectOptions ]]
    return v84.options;
end;
return function() --[[ Line: 224 ]] --[[ Name: useBulkPurchaseRequestProps ]]
    -- upvalues: l_useDispatch_0 (copy), l_useSelector_0 (copy), v83 (copy), v16 (copy), v17 (copy), v85 (copy), v18 (copy), l_MarketplaceService_0 (copy), v19 (copy), l_isErrorReasonContainsEconomicRestrictions_0 (copy), v76 (copy), v61 (copy), v21 (copy), v22 (copy), v20 (copy), v25 (copy), v23 (copy), v30 (copy), v29 (copy), v34 (copy), l_HttpService_0 (copy), v31 (copy), l_BrowserService_0 (copy), v33 (copy), v8 (copy), l_RunService_0 (copy), v32 (copy)
    local v86 = l_useDispatch_0();
    local v87 = l_useSelector_0(v83);
    local v88 = l_useSelector_0(v16);
    local v89 = l_useSelector_0(v17);
    local v90 = l_useSelector_0(v85);
    local v91 = l_useSelector_0(v18);
    local l_totalCost_0 = v87.totalCost;
    local l_balance_0 = v87.balance;
    local function v94() --[[ Line: 234 ]]
        -- upvalues: l_MarketplaceService_0 (ref), v88 (copy), v86 (copy), v19 (ref)
        l_MarketplaceService_0:signalPromptBulkPurchaseFinished(2, v88);
        v86(v19());
    end;
    local function v103() --[[ Line: 241 ]]
        -- upvalues: l_MarketplaceService_0 (ref), v89 (copy), v90 (copy), l_isErrorReasonContainsEconomicRestrictions_0 (ref), v76 (ref), v86 (copy), v61 (ref), v91 (copy), v21 (ref), v22 (ref), v20 (ref), v25 (ref), v23 (ref)
        local v95 = false;
        local l_status_0, l_result_0 = pcall(function() --[[ Line: 242 ]]
            -- upvalues: l_MarketplaceService_0 (ref), v89 (ref), v90 (ref)
            return l_MarketplaceService_0:PerformBulkPurchase(v89, v90);
        end);
        if l_status_0 and l_result_0 then
            if l_result_0.message and l_isErrorReasonContainsEconomicRestrictions_0(l_result_0.message) then
                v76(l_result_0.message, v86);
                return;
            else
                local v98 = v61(l_result_0, v91);
                local v99 = nil;
                local v100;
                for _, v102 in v98 do
                    if v99 ~= nil and v102 ~= v99 then
                        v100 = nil;
                        v95 = true;
                    elseif v99 == nil then
                        v99 = v102;
                    end;
                    if v95 then
                        break;
                    end;
                end;
                if not v95 then
                    v100 = v99;
                end;
                v95 = false;
                if not v100 then
                    v86(v21(v22.PartialSuccess, v98));
                    return;
                elseif v100 == Enum.MarketplaceItemPurchaseStatus.Success then
                    v86(v21(v22.Success, v98));
                    return;
                else
                    v86(v20(v25[v100]));
                    return;
                end;
            end;
        elseif string.find(l_result_0, "403") then
            v86(v20(v23.TwoStepVerificationRequired));
            return;
        else
            v86(v20(v23.Generic));
            return;
        end;
    end;
    local function v106() --[[ Line: 279 ]]
        -- upvalues: v30 (ref), v29 (ref), v34 (ref), l_HttpService_0 (ref), v31 (ref), l_BrowserService_0 (ref), v86 (copy), v19 (ref), v20 (ref), v23 (ref)
        local v104 = v30();
        if v104 == v29.Desktop or v104 == v29.Mobile then
            if v34 then
                local v105 = l_HttpService_0:JSONEncode({
                    command = "open", 
                    url = v31()
                });
                l_BrowserService_0:SendCommand(v105);
            else
                l_BrowserService_0:OpenBrowserWindow(v31());
            end;
            v86(v19());
            return;
        else
            v86(v20(v23.InsufficientRobux));
            return;
        end;
    end;
    local v107 = nil;
    local v108 = nil;
    local v109 = nil;
    if v33 then
        v107 = v8.useRef(nil);
        local v110, v111 = v8.useState(true);
        v108 = v110;
        v109 = v111;
        v8.useEffect(function() --[[ Line: 310 ]]
            -- upvalues: l_RunService_0 (ref), v107 (ref), v32 (ref), v109 (ref)
            local v114 = l_RunService_0.Heartbeat:Connect(function() --[[ Line: 311 ]]
                -- upvalues: v107 (ref), v32 (ref), v109 (ref)
                if v107.current and typeof(v107.current) == "Instance" and v107.current:IsA("GuiObject") then
                    local v112 = v32(v107.current);
                    local l_Core_0 = game.StarterGui:GetCore("DevConsoleVisible");
                    v109(v112 or l_Core_0);
                end;
            end);
            return function() --[[ Line: 322 ]]
                -- upvalues: v114 (copy)
                v114:Disconnect();
            end;
        end, {});
    end;
    return {
        currentBalance = v87.balance, 
        items = v87.items, 
        ownedItems = v87.ownedItems, 
        unpurchasableItems = v87.unpurchasableItems, 
        onClose = v94, 
        onAccept = if l_balance_0 < l_totalCost_0 then v106 else v103, 
        totalCost = v87.totalCost, 
        isDisabled = v33 and v108 or #v87.items == 0, 
        purchaseButtonRef = if v33 then v107 else nil
    };
end;