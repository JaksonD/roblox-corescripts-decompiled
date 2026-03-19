local l_script_FirstAncestor_0 = script:FindFirstAncestor("RobloxSubscriptionPurchaseApp");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_Parent_0.Foundation);
local v4 = require(l_script_FirstAncestor_0.Store.RobloxSubscriptionStore);
local _ = require(l_script_FirstAncestor_0.Models.GetRobloxSubscriptionProductsModel);
local v6 = require(l_script_FirstAncestor_0.Hooks.usePlaceholderLocalization);
local v7 = require(l_Parent_0.SignalsReact);
local l_View_0 = v3.View;
local l_Text_0 = v3.Text;
local l_Icon_0 = v3.Icon;
local l_IconName_0 = v3.Enums.IconName;
local l_IconSize_0 = v3.Enums.IconSize;
local function v14(v13) --[[ Line: 25 ]] --[[ Name: FeatureRow ]]
    -- upvalues: v2 (copy), l_View_0 (copy), l_Icon_0 (copy), l_IconSize_0 (copy), l_Text_0 (copy)
    return v2.createElement(l_View_0, {
        tag = "row auto-y size-full-0 align-y-center align-x-left gap-medium", 
        LayoutOrder = v13.layoutOrder
    }, {
        Icon = v2.createElement(l_Icon_0, {
            name = v13.iconName, 
            size = l_IconSize_0.Small
        }), 
        FeatureText = v2.createElement(l_Text_0, {
            Text = v13.text, 
            tag = "size-full-0 auto-y text-body-medium content-default text-align-x-left"
        })
    });
end;
local function v20(v15) --[[ Line: 41 ]] --[[ Name: getDiscounts ]]
    if not v15 or not v15.VirtualTransactionDiscounts then
        return nil, nil;
    else
        local v16 = nil;
        local v17 = nil;
        for _, v19 in ipairs(v15.VirtualTransactionDiscounts) do
            if typeof(v19) == "table" and typeof(v19.PeriodIndex) == "number" then
                if v19.PeriodIndex == 0 then
                    v16 = v16 or v19;
                elseif v19.PeriodIndex > 0 and (v17 == nil or v19.PeriodIndex < v17.PeriodIndex) then
                    v17 = v19;
                end;
            end;
        end;
        return v16, v17;
    end;
end;
return function(v21) --[[ Line: 64 ]] --[[ Name: RobloxSubscriptionFeatureList ]]
    -- upvalues: v4 (copy), v7 (copy), v20 (copy), v6 (copy), v14 (copy), l_IconName_0 (copy), v2 (copy), l_View_0 (copy)
    local v22 = v4.get();
    local v23 = v7.useSignalState(v22.getRobloxSubscriptionProduct);
    local v24 = v23 and v23.PeriodType and tostring(v23.PeriodType) or "";
    local v25 = v23 and v23.ProductTypeDetails and v23.ProductTypeDetails.RobloxSubscriptionProductDetails and v23.ProductTypeDetails.RobloxSubscriptionProductDetails.FeatureConfig;
    local v26, v27 = v20(v25);
    local v28 = v6({
        baseDiscountText = {
            "Feature.RobloxSubscription.Label.BlackbirdDiscountFirst"; 
            discountPercent = v26 and v26.DiscountPercent or 0
        }, 
        nextDiscountText = {
            "Feature.RobloxSubscription.Label.BlackbirdDiscountSecond"; 
            discountPercent = v27 and v27.DiscountPercent or 0, 
            periodIndex = v27 and v27.PeriodIndex or 0, 
            periodType = v24
        }, 
        robuxTransfersText = "Feature.RobloxSubscription.Label.BlackbirdTr"
    });
    local v29 = {};
    local function _(v30, v31) --[[ Line: 93 ]] --[[ Name: addRow ]]
        -- upvalues: v29 (copy), v14 (ref)
        table.insert(v29, v14({
            layoutOrder = #v29 + 1, 
            iconName = v30, 
            text = v31
        }));
    end;
    if v26 and typeof(v26.DiscountPercent) == "number" then
        local l_TagSparkle_0 = l_IconName_0.TagSparkle;
        local l_baseDiscountText_0 = v28.baseDiscountText;
        table.insert(v29, v14({
            layoutOrder = #v29 + 1, 
            iconName = l_TagSparkle_0, 
            text = l_baseDiscountText_0
        }));
    end;
    if v27 and typeof(v27.DiscountPercent) == "number" then
        local l_CalendarStar_0 = l_IconName_0.CalendarStar;
        local l_nextDiscountText_0 = v28.nextDiscountText;
        table.insert(v29, v14({
            layoutOrder = #v29 + 1, 
            iconName = l_CalendarStar_0, 
            text = l_nextDiscountText_0
        }));
    end;
    if v25 and v25.IsRobuxTransferEnabled then
        local l_Robux_0 = l_IconName_0.Robux;
        local l_robuxTransfersText_0 = v28.robuxTransfersText;
        table.insert(v29, v14({
            layoutOrder = #v29 + 1, 
            iconName = l_Robux_0, 
            text = l_robuxTransfersText_0
        }));
    end;
    return v2.createElement(l_View_0, {
        tag = "col auto-y size-full-0 align-x-left gap-small padding-top-large", 
        LayoutOrder = v21.layoutOrder
    }, v29);
end;