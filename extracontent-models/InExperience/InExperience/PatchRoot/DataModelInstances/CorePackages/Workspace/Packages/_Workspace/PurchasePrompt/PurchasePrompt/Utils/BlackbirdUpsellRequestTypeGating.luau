local l_script_FirstAncestor_0 = script:FindFirstAncestor("PurchasePrompt");
local v1 = require(l_script_FirstAncestor_0.Enums.RequestType);
local v2 = game:DefineFastString("BlackbirdUpsellHiddenRequestTypes", "");
local function _(v3) --[[ Line: 17 ]] --[[ Name: trim ]]
    return (v3:gsub("^%s+", ""):gsub("%s+$", ""));
end;
local function v10(v5, v6) --[[ Line: 24 ]] --[[ Name: matchesHiddenRequestTypeList ]]
    -- upvalues: v1 (copy)
    if v5 == nil or v5 == v1.None then
        return false;
    elseif v6 == "" then
        return false;
    else
        local v7 = string.lower((tostring(v5)));
        for v8 in string.gmatch(v6, "[^,]+") do
            local v9 = string.lower((v8:gsub("^%s+", ""):gsub("%s+$", "")));
            if v9 ~= "" and v7 == "requesttype." .. v9 then
                return true;
            end;
        end;
        return false;
    end;
end;
return {
    isRequestTypeHiddenFromBlackbirdUpsell = function(v11) --[[ Line: 45 ]] --[[ Name: isRequestTypeHiddenFromBlackbirdUpsell ]]
        -- upvalues: v10 (copy), v2 (copy)
        return (v10(v11, v2));
    end, 
    matchesHiddenRequestTypeList = v10
};