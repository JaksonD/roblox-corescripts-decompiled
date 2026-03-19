local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.Actions.StartPurchase);
return function(v2, v3) --[[ Line: 5 ]] --[[ Name: PurchasingStartTimeReducer ]]
    -- upvalues: v1 (copy)
    v2 = v2 or -1;
    if v3.type == v1.name then
        return v3.purchasingStartTime;
    else
        return v2;
    end;
end;