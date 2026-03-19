local l_script_FirstAncestor_0 = script:FindFirstAncestor("AvatarExperienceCatalog");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_Parent_0.Foundation);
local v4 = require(l_Parent_0.tutils);
local v5 = require(l_Parent_0.Cryo);
local l_getTryOnItemReducerKey_0 = require(l_Parent_0.AvatarExperienceCommon).Utils.getTryOnItemReducerKey;
local v7 = require(l_script_FirstAncestor_0.Components.Checkout.CheckoutRowItemCard);
local v8 = require(l_script_FirstAncestor_0.Components.Checkout.CheckoutErrorBanner);
return v2.memo(function(v9) --[[ Line: 21 ]] --[[ Name: CheckoutPageBody ]]
    -- upvalues: v2 (copy), v8 (copy), l_getTryOnItemReducerKey_0 (copy), v7 (copy), v5 (copy), v3 (copy)
    local v13 = v2.useMemo(function() --[[ Line: 22 ]]
        -- upvalues: v9 (copy), v2 (ref), v8 (ref), l_getTryOnItemReducerKey_0 (ref), v7 (ref), v5 (ref)
        local v10 = {};
        if v9.erroredItemCount and v9.erroredItemCount > 0 then
            v10.ErrorBanner = v2.createElement(v8, {
                erroredItemCount = v9.erroredItemCount
            });
        end;
        for v11, v12 in v9.cartItems do
            v10[("%*"):format((l_getTryOnItemReducerKey_0(v12.itemId, v12.itemType)))] = v2.createElement(v7, v5.Dictionary.join(v12, {
                LayoutOrder = v11
            }));
        end;
        return v10;
    end, {
        v9.cartItems, 
        v9.erroredItemCount
    });
    return v2.createElement(v3.View, {
        tag = "col gap-medium padding-xxlarge", 
        Size = UDim2.fromScale(1, 1)
    }, v13);
end, v4.deepEqual);