local l_script_FirstAncestor_0 = script:FindFirstAncestor("CommercePurchaseApp");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.Rodux);
local _ = require(l_script_FirstAncestor_0.Enums.ErrorCodeEnum);
return v2.makeActionCreator("CommercePurchaseFailed", function(v4) --[[ Line: 12 ]]
    return {
        errorCode = v4
    };
end);