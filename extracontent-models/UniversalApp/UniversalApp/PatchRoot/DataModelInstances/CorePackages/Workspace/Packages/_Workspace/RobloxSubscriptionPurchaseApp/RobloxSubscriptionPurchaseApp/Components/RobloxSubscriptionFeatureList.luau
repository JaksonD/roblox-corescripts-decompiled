local l_script_FirstAncestor_0 = script:FindFirstAncestor("RobloxSubscriptionPurchaseApp");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_Parent_0.Foundation);
local v4 = require(l_Parent_0.LuauPolyfill);
local v5 = require(l_script_FirstAncestor_0.Store.RobloxSubscriptionStore);
local _ = require(l_script_FirstAncestor_0.Models.GetRobloxSubscriptionProductsModel);
local v7 = require(l_script_FirstAncestor_0.Hooks.usePlaceholderLocalization);
local v8 = require(l_Parent_0.SignalsReact);
local l_Array_0 = v4.Array;
local l_View_0 = v3.View;
local l_Text_0 = v3.Text;
local l_Icon_0 = v3.Icon;
local l_IconName_0 = v3.Enums.IconName;
local l_IconSize_0 = v3.Enums.IconSize;
local function v16(v15) --[[ Line: 28 ]] --[[ Name: FeatureRow ]]
    -- upvalues: v2 (copy), l_View_0 (copy), l_Icon_0 (copy), l_IconSize_0 (copy), l_Text_0 (copy)
    return v2.createElement(l_View_0, {
        tag = "row auto-y size-full-0 align-y-center align-x-left gap-medium", 
        LayoutOrder = v15.layoutOrder
    }, {
        Icon = v2.createElement(l_Icon_0, {
            name = v15.iconName, 
            size = l_IconSize_0.Small
        }), 
        FeatureText = v2.createElement(l_Text_0, {
            Text = v15.text, 
            tag = "size-full-0 auto-y text-body-medium content-default text-align-x-left"
        })
    });
end;
local function v22(v17) --[[ Line: 44 ]] --[[ Name: getVirtualTransactionDiscounts ]]
    if not v17 or not v17.VirtualTransactionDiscounts then
        return nil, nil;
    else
        local v18 = nil;
        local v19 = nil;
        for _, v21 in ipairs(v17.VirtualTransactionDiscounts) do
            if typeof(v21) == "table" and typeof(v21.PeriodIndex) == "number" then
                if v21.PeriodIndex == 0 then
                    v18 = v18 or v21;
                elseif v21.PeriodIndex > 0 and (v19 == nil or v21.PeriodIndex < v19.PeriodIndex) then
                    v19 = v21;
                end;
            end;
        end;
        return v18, v19;
    end;
end;
local function _(v23) --[[ Line: 72 ]] --[[ Name: getPrivateServerDiscount ]]
    -- upvalues: l_Array_0 (copy)
    if not v23 or not v23.PrivateServerDiscounts then
        return nil;
    else
        return l_Array_0.find(v23.PrivateServerDiscounts, function(v24) --[[ Line: 77 ]]
            local v25 = false;
            if typeof(v24) == "table" then
                v25 = false;
                if typeof(v24.PeriodIndex) == "number" then
                    v25 = v24.PeriodIndex == 0;
                end;
            end;
            return v25;
        end);
    end;
end;
return function(v27) --[[ Line: 82 ]] --[[ Name: RobloxSubscriptionFeatureList ]]
    -- upvalues: v5 (copy), v8 (copy), v22 (copy), l_Array_0 (copy), v7 (copy), v16 (copy), l_IconName_0 (copy), v2 (copy), l_View_0 (copy)
    local v28 = v5.get();
    local v29 = v8.useSignalState(v28.getRobloxSubscriptionProduct);
    local v30 = v29 and v29.PeriodType and tostring(v29.PeriodType) or "";
    local v31 = v29 and v29.ProductTypeDetails and v29.ProductTypeDetails.RobloxSubscriptionProductDetails and v29.ProductTypeDetails.RobloxSubscriptionProductDetails.FeatureConfig;
    local v32, v33 = v22(v31);
    local v36 = if v31 and v31.PrivateServerDiscounts then l_Array_0.find(v31.PrivateServerDiscounts, function(v34) --[[ Line: 77 ]]
        local v35 = false;
        if typeof(v34) == "table" then
            v35 = false;
            if typeof(v34.PeriodIndex) == "number" then
                v35 = v34.PeriodIndex == 0;
            end;
        end;
        return v35;
    end) else nil;
    local v37 = v7({
        baseVirtualTransactionDiscountText = {
            "Feature.RobloxSubscription.Label.BlackbirdVTDiscountFirst"; 
            discountPercent = v32 and v32.DiscountPercent or 0
        }, 
        nextVirtualTransactionDiscountText = {
            "Feature.RobloxSubscription.Label.BlackbirdVTDiscountSecond"; 
            discountPercent = v33 and v33.DiscountPercent or 0, 
            periodIndex = v33 and v33.PeriodIndex or 0, 
            periodType = v30
        }, 
        robuxTransfersText = "Feature.RobloxSubscription.Label.BlackbirdTr", 
        privateServerDiscountText = "Feature.RobloxSubscription.Label.BlackbirdPSDiscount"
    });
    local v38 = {};
    local function _(v39, v40) --[[ Line: 114 ]] --[[ Name: addRow ]]
        -- upvalues: v38 (copy), v16 (ref)
        table.insert(v38, v16({
            layoutOrder = #v38 + 1, 
            iconName = v39, 
            text = v40
        }));
    end;
    if v32 and typeof(v32.DiscountPercent) == "number" then
        local l_TagSparkle_0 = l_IconName_0.TagSparkle;
        local l_baseVirtualTransactionDiscountText_0 = v37.baseVirtualTransactionDiscountText;
        table.insert(v38, v16({
            layoutOrder = #v38 + 1, 
            iconName = l_TagSparkle_0, 
            text = l_baseVirtualTransactionDiscountText_0
        }));
    end;
    if v33 and typeof(v33.DiscountPercent) == "number" then
        local l_CalendarStar_0 = l_IconName_0.CalendarStar;
        local l_nextVirtualTransactionDiscountText_0 = v37.nextVirtualTransactionDiscountText;
        table.insert(v38, v16({
            layoutOrder = #v38 + 1, 
            iconName = l_CalendarStar_0, 
            text = l_nextVirtualTransactionDiscountText_0
        }));
    end;
    if v36 and typeof(v36.DiscountPercent) == "number" then
        local l_Controller_0 = l_IconName_0.Controller;
        local l_privateServerDiscountText_0 = v37.privateServerDiscountText;
        table.insert(v38, v16({
            layoutOrder = #v38 + 1, 
            iconName = l_Controller_0, 
            text = l_privateServerDiscountText_0
        }));
    end;
    if v31 and v31.IsRobuxTransferEnabled then
        local l_Robux_0 = l_IconName_0.Robux;
        local l_robuxTransfersText_0 = v37.robuxTransfersText;
        table.insert(v38, v16({
            layoutOrder = #v38 + 1, 
            iconName = l_Robux_0, 
            text = l_robuxTransfersText_0
        }));
    end;
    return v2.createElement(l_View_0, {
        tag = "col auto-y size-full-0 align-x-left gap-small padding-top-large", 
        LayoutOrder = v27.layoutOrder
    }, v38);
end;