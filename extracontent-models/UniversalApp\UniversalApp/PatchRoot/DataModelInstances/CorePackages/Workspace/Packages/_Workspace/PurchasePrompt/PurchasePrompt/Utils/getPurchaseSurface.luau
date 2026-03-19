local l_script_FirstAncestor_0 = script:FindFirstAncestor("PurchasePrompt");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_script_FirstAncestor_0.Utils.AppContext);
local l_ProductPurchaseSurface_0 = require(l_Parent_0.PurchasePromptLite).Enums.ProductPurchaseSurface;
return function(v4) --[[ Line: 6 ]] --[[ Name: getPurchaseSurface ]]
    -- upvalues: v2 (copy), l_ProductPurchaseSurface_0 (copy)
    local _ = nil;
    if v4 and v4.surface then
        return v4.surface;
    elseif v2.get() == v2.Enum.IN_EXPERIENCE then
        return l_ProductPurchaseSurface_0.InExperience;
    else
        return l_ProductPurchaseSurface_0.Unknown;
    end;
end;