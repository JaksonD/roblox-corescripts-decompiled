local l_Parent_0 = script:FindFirstAncestor("PurchasePrompt").Parent;
local l_DiscountType_0 = require(l_Parent_0.IAPExperience).DiscountType;
local v2 = {
    [l_DiscountType_0.BlackbirdSubscription] = true
};
local function _(v3) --[[ Line: 13 ]] --[[ Name: isValidRawDiscount ]]
    if type(v3) ~= "table" then
        return false;
    elseif type(v3.Type) ~= "string" or v3.Type == "" then
        return false;
    elseif type(v3.AmountInRobux) ~= "number" then
        return false;
    elseif type(v3.Percent) ~= "number" then
        return false;
    else
        return true;
    end;
end;
return function(v5) --[[ Line: 29 ]] --[[ Name: normalizePriceDiscountDetails ]]
    -- upvalues: v2 (copy), l_DiscountType_0 (copy)
    if type(v5) ~= "table" or #v5 == 0 then
        return {};
    else
        local v6 = {};
        for _, v8 in ipairs(v5) do
            if not (type(v8) == "table" and type(v8.Type) == "string" and not (v8.Type == "") and not (type(v8.AmountInRobux) ~= "number") and type(v8.Percent) == "number") then
                return {};
            else
                table.insert(v6, {
                    type = if v2[v8.Type] then v8.Type else l_DiscountType_0.Uncategorized, 
                    amountInRobux = v8.AmountInRobux, 
                    percent = v8.Percent
                });
            end;
        end;
        return v6;
    end;
end;