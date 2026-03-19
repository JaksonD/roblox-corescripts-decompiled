local l_script_FirstAncestor_0 = script:FindFirstAncestor("PurchasePrompt");
local _ = l_script_FirstAncestor_0.Parent;
local v2 = require(l_script_FirstAncestor_0.Enums.RequestType);
local l_ProductTypeEnum_0 = require(l_script_FirstAncestor_0.types).ProductTypeEnum;
local v4 = {
    [v2.Asset] = l_ProductTypeEnum_0.Asset, 
    [v2.Bundle] = l_ProductTypeEnum_0.Bundle, 
    [v2.GamePass] = l_ProductTypeEnum_0.Gamepass, 
    [v2.Product] = l_ProductTypeEnum_0.Product, 
    [v2.AvatarCreationFee] = l_ProductTypeEnum_0.AvatarCreationFee, 
    [v2.Experience] = l_ProductTypeEnum_0.Experience, 
    [v2.Look] = l_ProductTypeEnum_0.Look, 
    [v2.DeveloperSubscription] = l_ProductTypeEnum_0.DeveloperSubscription
};
getProductTypeFromRequestType = function(v5) --[[ Line: 21 ]] --[[ Name: getProductTypeFromRequestType ]]
    -- upvalues: v4 (copy), l_ProductTypeEnum_0 (copy)
    return v4[v5] or l_ProductTypeEnum_0.Unknown;
end;
return getProductTypeFromRequestType;