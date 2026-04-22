local l_script_FirstAncestor_0 = script:FindFirstAncestor("RobloxSubscriptionPurchaseApp");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_Parent_0.Foundation);
local v4 = require(l_Parent_0.LuauPolyfill);
local v5 = require(l_script_FirstAncestor_0.Store.RobloxSubscriptionStore);
local _ = require(l_script_FirstAncestor_0.Models.GetRobloxSubscriptionProductsModel);
local l_useLocalization_0 = require(l_Parent_0.Localization).Hooks.useLocalization;
local v8 = require(l_script_FirstAncestor_0.Utils.getPeriodTypeDisplayLabel);
local v9 = require(l_Parent_0.SignalsReact);
local v10 = game:DefineFastFlag("RobloxPlusUpdateDiscountIcons", false);
local l_Array_0 = v4.Array;
local l_View_0 = v3.View;
local l_Text_0 = v3.Text;
local l_Icon_0 = v3.Icon;
local l_IconName_0 = v3.Enums.IconName;
local l_IconSize_0 = v3.Enums.IconSize;
local function v18(v17) --[[ Line: 31 ]] --[[ Name: FeatureRow ]]
    -- upvalues: v2 (copy), l_View_0 (copy), l_Icon_0 (copy), l_IconSize_0 (copy), l_Text_0 (copy)
    return v2.createElement(l_View_0, {
        tag = "row auto-y size-full-0 align-y-center align-x-left gap-medium", 
        LayoutOrder = v17.layoutOrder
    }, {
        Icon = v2.createElement(l_Icon_0, {
            name = v17.iconName, 
            size = l_IconSize_0.Medium
        }), 
        FeatureText = v2.createElement(l_Text_0, {
            Text = v17.text, 
            tag = "size-full-0 auto-y text-body-medium content-default text-align-x-left"
        })
    });
end;
local function v24(v19) --[[ Line: 47 ]] --[[ Name: getVirtualTransactionDiscounts ]]
    if not v19 or not v19.VirtualTransactionDiscounts then
        return nil, nil;
    else
        local v20 = nil;
        local v21 = nil;
        for _, v23 in ipairs(v19.VirtualTransactionDiscounts) do
            if typeof(v23) == "table" and typeof(v23.PeriodIndex) == "number" then
                if v23.PeriodIndex == 0 then
                    v20 = v20 or v23;
                elseif v23.PeriodIndex > 0 and (v21 == nil or v23.PeriodIndex < v21.PeriodIndex) then
                    v21 = v23;
                end;
            end;
        end;
        return v20, v21;
    end;
end;
local function _(v25) --[[ Line: 75 ]] --[[ Name: getPrivateServerDiscount ]]
    -- upvalues: l_Array_0 (copy)
    if not v25 or not v25.PrivateServerDiscounts then
        return nil;
    else
        return l_Array_0.find(v25.PrivateServerDiscounts, function(v26) --[[ Line: 80 ]]
            local v27 = false;
            if typeof(v26) == "table" then
                v27 = false;
                if typeof(v26.PeriodIndex) == "number" then
                    v27 = v26.PeriodIndex == 0;
                end;
            end;
            return v27;
        end);
    end;
end;
return function(v29) --[[ Line: 85 ]] --[[ Name: RobloxSubscriptionFeatureList ]]
    -- upvalues: v5 (copy), v9 (copy), v8 (copy), l_useLocalization_0 (copy), v24 (copy), l_Array_0 (copy), v18 (copy), v10 (copy), l_IconName_0 (copy), v2 (copy), l_View_0 (copy)
    local v30 = v5.get();
    local v31 = v9.useSignalState(v30.getRobloxSubscriptionProduct);
    local v32 = v31 and v31.PeriodType and tostring(v31.PeriodType) or "";
    local v33 = v8(v32, true);
    local v34 = l_useLocalization_0({
        periodType = v33
    });
    local v35 = v31 and v31.ProductTypeDetails and v31.ProductTypeDetails.RobloxSubscriptionProductDetails and v31.ProductTypeDetails.RobloxSubscriptionProductDetails.FeatureConfig;
    local v36, v37 = v24(v35);
    local v40 = if v35 and v35.PrivateServerDiscounts then l_Array_0.find(v35.PrivateServerDiscounts, function(v38) --[[ Line: 80 ]]
        local v39 = false;
        if typeof(v38) == "table" then
            v39 = false;
            if typeof(v38.PeriodIndex) == "number" then
                v39 = v38.PeriodIndex == 0;
            end;
        end;
        return v39;
    end) else nil;
    local v41 = l_useLocalization_0({
        baseVirtualTransactionDiscountText = {
            "Feature.RobloxSubscription.Label.BlackbirdVTDiscountFirst"; 
            discountPercent = v36 and v36.DiscountPercent or 0
        }, 
        nextVirtualTransactionDiscountText = {
            "Feature.RobloxSubscription.Label.BlackbirdVTDiscountSecond"; 
            discountPercent = v37 and v37.DiscountPercent or 0, 
            periodIndex = v37 and v37.PeriodIndex or 0, 
            periodType = v34.periodType
        }, 
        robuxTransfersText = "Feature.RobloxSubscription.Label.BlackbirdTr", 
        privateServerDiscountText = "Feature.RobloxSubscription.Label.BlackbirdPSDiscount"
    });
    local v42 = {};
    local function _(v43, v44) --[[ Line: 122 ]] --[[ Name: addRow ]]
        -- upvalues: v42 (copy), v18 (ref)
        table.insert(v42, v18({
            layoutOrder = #v42 + 1, 
            iconName = v43, 
            text = v44
        }));
    end;
    if v36 and typeof(v36.DiscountPercent) == "number" then
        local v46 = if v10 then l_IconName_0.Tag else l_IconName_0.TagSparkle;
        local l_baseVirtualTransactionDiscountText_0 = v41.baseVirtualTransactionDiscountText;
        table.insert(v42, v18({
            layoutOrder = #v42 + 1, 
            iconName = v46, 
            text = l_baseVirtualTransactionDiscountText_0
        }));
    end;
    if v37 and typeof(v37.DiscountPercent) == "number" then
        local v48 = if v10 then l_IconName_0.TagArrowUp else l_IconName_0.TagSparkleArrowUp;
        local l_nextVirtualTransactionDiscountText_0 = v41.nextVirtualTransactionDiscountText;
        table.insert(v42, v18({
            layoutOrder = #v42 + 1, 
            iconName = v48, 
            text = l_nextVirtualTransactionDiscountText_0
        }));
    end;
    if v40 and typeof(v40.DiscountPercent) == "number" then
        local l_Controller_0 = l_IconName_0.Controller;
        local l_privateServerDiscountText_0 = v41.privateServerDiscountText;
        table.insert(v42, v18({
            layoutOrder = #v42 + 1, 
            iconName = l_Controller_0, 
            text = l_privateServerDiscountText_0
        }));
    end;
    if v35 and v35.IsRobuxTransferEnabled then
        local l_Robux_0 = l_IconName_0.Robux;
        local l_robuxTransfersText_0 = v41.robuxTransfersText;
        table.insert(v42, v18({
            layoutOrder = #v42 + 1, 
            iconName = l_Robux_0, 
            text = l_robuxTransfersText_0
        }));
    end;
    return v2.createElement(l_View_0, {
        tag = "col auto-y size-full-0 align-x-left gap-medium padding-top-large", 
        LayoutOrder = v29.layoutOrder
    }, v42);
end;