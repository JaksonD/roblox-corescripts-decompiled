local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.Flags.FFlagPurchasePromptUseAppLocales);
local v2 = require(l_Parent_0.Enums.ItemType);
local v3 = require(l_Parent_0.Enums.PurchaseError);
local v4 = require(l_Parent_0.Symbols.Symbol);
local v5 = require(script.Parent.KeyMappings);
local v6 = {
    ["en-us"] = ",", 
    ["en-gb"] = ",", 
    ["es-mx"] = ",", 
    ["es-es"] = ".", 
    ["fr-fr"] = " ", 
    ["de-de"] = " ", 
    ["pt-br"] = ".", 
    ["zh-cn"] = ",", 
    ["zh-cjv"] = ",", 
    ["zh-tw"] = ",", 
    ["ko-kr"] = ",", 
    ["ja-jp"] = ",", 
    ["it-it"] = " ", 
    ["ru-ru"] = ".", 
    ["id-id"] = ".", 
    ["vi-vn"] = ".", 
    ["th-th"] = ",", 
    ["tr-tr"] = "."
};
local v7 = v4.named("FormattedParam");
local function _(v8) --[[ Line: 46 ]] --[[ Name: isFormattedParam ]]
    -- upvalues: v7 (copy)
    local v9 = false;
    if typeof(v8) == "table" then
        v9 = v8[v7] == true;
    end;
    return v9;
end;
local function _(v11) --[[ Line: 50 ]] --[[ Name: createFormattedParam ]]
    -- upvalues: v7 (copy)
    return {
        [v7] = true, 
        format = v11
    };
end;
local function _(v13, v14) --[[ Line: 60 ]] --[[ Name: getLocalizedString ]]
    local l_translations_0 = v13.translations;
    local l_fallbackTranslations_0 = v13.fallbackTranslations;
    if l_fallbackTranslations_0 ~= nil and l_translations_0[v14] == nil then
        return l_fallbackTranslations_0[v14];
    else
        return l_translations_0[v14];
    end;
end;
local function v24(v18, v19) --[[ Line: 83 ]] --[[ Name: addGroupDelimiters ]]
    local v20 = string.format("%%1%s%%2", v19);
    local _ = nil;
    repeat
        local v22, v23 = string.gsub(v18, "^(-?%d+)(%d%d%d)", v20);
        v18 = v22;
    until v23 == 0;
    return v18;
end;
local v28 = {
    formatNumber = function(v25, v26) --[[ Line: 97 ]] --[[ Name: formatNumber ]]
        -- upvalues: v1 (copy), v6 (copy), v24 (copy)
        if v1 then
            error("LocalizationService.formatNumber is deprecated. Use RobloxAppLocales.Localization:Format() instead.");
        end;
        local v27 = v6[v25.locale] or ",";
        return (v24(v26, v27));
    end
};
v28.numberParam = function(v29) --[[ Line: 108 ]] --[[ Name: numberParam ]]
    -- upvalues: v1 (copy), v28 (copy), v7 (copy)
    if v1 then
        error("LocalizationService.numberParam is deprecated. Use RobloxAppLocales.Localization:Format() instead.");
    end;
    local function v31(v30) --[[ Line: 112 ]]
        -- upvalues: v28 (ref), v29 (copy)
        return v28.formatNumber(v30, v29);
    end;
    return {
        [v7] = true, 
        format = v31
    };
end;
v28.nestedKeyParam = function(v32) --[[ Line: 121 ]] --[[ Name: nestedKeyParam ]]
    -- upvalues: v1 (copy), v7 (copy)
    if v1 then
        error("LocalizationService.nestedKeyParam is deprecated. Use RobloxAppLocales.Localization:Format() instead.");
    end;
    return {
        [v7] = true, 
        format = function(v33) --[[ Line: 125 ]]
            -- upvalues: v32 (copy)
            local l_v32_0 = v32;
            local l_translations_1 = v33.translations;
            local l_fallbackTranslations_1 = v33.fallbackTranslations;
            if l_fallbackTranslations_1 ~= nil and l_translations_1[l_v32_0] == nil then
                return l_fallbackTranslations_1[l_v32_0];
            else
                return l_translations_1[l_v32_0];
            end;
        end
    };
end;
v28.getKeyFromItemType = function(v37) --[[ Line: 133 ]] --[[ Name: getKeyFromItemType ]]
    -- upvalues: v2 (copy), v5 (copy)
    assert(v2.isMember(v37) or typeof(v37) == "number" or typeof(v37) == "string", "provided item type " .. tostring(v37) .. " must be a number, string, or ItemType enum");
    local _ = nil;
    if v37 == v2.Bundle then
        return "CoreScripts.PurchasePrompt.ItemType.Bundle";
    else
        return v5.AssetTypeById[tostring(v37)];
    end;
end;
v28.getErrorKey = function(v39) --[[ Line: 157 ]] --[[ Name: getErrorKey ]]
    -- upvalues: v3 (copy), v5 (copy)
    assert(v3.isMember(v39), "provided value " .. tostring(v39) .. " is not a member of PurchaseError enum");
    return v5.PurchaseErrorKey[v39];
end;
v28.getString = function(v40, v41, v42) --[[ Line: 172 ]] --[[ Name: getString ]]
    -- upvalues: v1 (copy), v7 (copy)
    if v1 then
        error("LocalizationService.getString is deprecated. Use RobloxAppLocales.Localization:Format() instead.");
    end;
    assert(v40 ~= nil, "Must provide valid localization context");
    local l_translations_2 = v40.translations;
    local l_fallbackTranslations_2 = v40.fallbackTranslations;
    local v45 = if l_fallbackTranslations_2 ~= nil and l_translations_2[v41] == nil then l_fallbackTranslations_2[v41] else l_translations_2[v41];
    if v42 ~= nil then
        for v46, v47 in pairs(v42) do
            local l_v47_0 = v47;
            local v49 = ("{%s}"):format(v46);
            local v50 = false;
            if typeof(v47) == "table" then
                v50 = v47[v7] == true;
            end;
            if v50 then
                l_v47_0 = v47.format(v40);
            end;
            do
                local l_l_v47_0_0 = l_v47_0;
                v45 = string.gsub(v45, v49, function() --[[ Line: 189 ]]
                    -- upvalues: l_l_v47_0_0 (ref)
                    return l_l_v47_0_0;
                end);
            end;
        end;
    end;
    return v45;
end;
return v28;