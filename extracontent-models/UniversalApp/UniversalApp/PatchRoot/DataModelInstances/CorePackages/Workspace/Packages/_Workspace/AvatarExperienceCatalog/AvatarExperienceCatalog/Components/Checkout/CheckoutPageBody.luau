local l_script_FirstAncestor_0 = script:FindFirstAncestor("AvatarExperienceCatalog");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_Parent_0.Foundation);
local v4 = require(l_Parent_0.tutils);
local v5 = require(l_Parent_0.Cryo);
local l_useLocalization_0 = require(l_Parent_0.Localization).Hooks.useLocalization;
local v7 = require(l_Parent_0.AvatarExperienceCommon);
local l_getTryOnItemReducerKey_0 = v7.Utils.getTryOnItemReducerKey;
local l_Constants_0 = v7.Constants;
local v10 = require(l_script_FirstAncestor_0.Components.Checkout.CheckoutRowItemCard);
local v11 = require(l_script_FirstAncestor_0.Components.Checkout.CheckoutErrorBanner);
local function v18(v12, v13) --[[ Line: 23 ]] --[[ Name: filterCartItems ]]
    -- upvalues: l_getTryOnItemReducerKey_0 (copy), v2 (copy), v10 (copy), v5 (copy)
    local v14 = {};
    local v15 = 0;
    for _, v17 in v12 do
        if v13(v17) then
            v15 = v15 + 1;
            v14[("%*"):format((l_getTryOnItemReducerKey_0(v17.itemId, v17.itemType)))] = v2.createElement(v10, v5.Dictionary.join(v17, {
                LayoutOrder = v15
            }));
        end;
    end;
    return v14;
end;
return v2.memo(function(v19) --[[ Line: 43 ]] --[[ Name: CheckoutPageBody ]]
    -- upvalues: l_useLocalization_0 (copy), v2 (copy), v18 (copy), l_Constants_0 (copy), v4 (copy), v3 (copy), v11 (copy)
    local v20 = l_useLocalization_0({
        makeupTitle = "Feature.Catalog.Label.Makeup", 
        allItemsTitle = "Feature.Catalog.Label.AllItems", 
        makeupCartDescriptionText = "Feature.Catalog.Label.MakeupCartDescriptionText"
    });
    local v22 = v2.useMemo(function() --[[ Line: 50 ]]
        -- upvalues: v18 (ref), v19 (copy), l_Constants_0 (ref)
        return (v18(v19.cartItems, function(v21) --[[ Line: 51 ]]
            -- upvalues: l_Constants_0 (ref)
            return l_Constants_0.MAKEUP_LOOK_ASSET_TYPES[v21.itemSubType] ~= nil;
        end));
    end, {
        v19.cartItems
    });
    local v24 = v2.useMemo(function() --[[ Line: 56 ]]
        -- upvalues: v18 (ref), v19 (copy), l_Constants_0 (ref)
        return (v18(v19.cartItems, function(v23) --[[ Line: 57 ]]
            -- upvalues: l_Constants_0 (ref)
            return not l_Constants_0.MAKEUP_LOOK_ASSET_TYPES[v23.itemSubType];
        end));
    end, {
        v19.cartItems
    });
    local v25 = v4.fieldCount(v22) > 0;
    local v26 = v4.fieldCount(v24) > 0;
    return v2.createElement(v3.View, {
        tag = "col", 
        Size = UDim2.fromScale(1, 1)
    }, {
        CheckoutErrorBannerView = if v19.erroredItemCount and v19.erroredItemCount > 0 then v2.createElement(v3.View, {
            tag = "auto-xy padding-x-xxlarge padding-y-medium", 
            Size = UDim2.fromScale(1, 0), 
            LayoutOrder = 1
        }, {
            CheckoutErrorBanner = v2.createElement(v11, {
                erroredItemCount = v19.erroredItemCount
            })
        }) else nil, 
        MakeupText = if v25 then v2.createElement(v3.Text, {
            tag = "auto-xy text-title-medium content-emphasis padding-x-xxlarge", 
            Text = v20.makeupTitle .. " (" .. v4.fieldCount(v22) .. "/8)", 
            LayoutOrder = 2
        }) else nil, 
        MakeupDescriptionText = if v25 then v2.createElement(v3.Text, {
            tag = "auto-xy text-body-small padding-x-xxlarge padding-y-xxsmall", 
            Text = v20.makeupCartDescriptionText, 
            LayoutOrder = 3
        }) else nil, 
        MakeupItemsView = if v25 then v2.createElement(v3.View, {
            tag = "col auto-y gap-medium padding-x-xxlarge padding-y-medium", 
            Size = UDim2.fromScale(1, 0), 
            LayoutOrder = 4
        }, v22) else nil, 
        AllItemsText = if v26 then v2.createElement(v3.Text, {
            tag = "auto-xy text-title-medium content-emphasis padding-x-xxlarge", 
            Text = v20.allItemsTitle, 
            LayoutOrder = 5
        }) else nil, 
        AllItemsView = if v26 then v2.createElement(v3.View, {
            tag = "col auto-y gap-medium padding-x-xxlarge padding-y-medium", 
            Size = UDim2.fromScale(1, 0), 
            LayoutOrder = 6
        }, v24) else nil
    });
end, v4.deepEqual);