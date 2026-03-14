local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.Enums.RequestType);
isMultiItemPurchase = function(v2) --[[ Line: 4 ]] --[[ Name: isMultiItemPurchase ]]
    -- upvalues: v1 (copy)
    return v2 == v1.Look;
end;
return isMultiItemPurchase;