local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.Enums.ItemType);
local v2 = require(l_Parent_0.Enums.PurchaseError);
local v3 = require(l_Parent_0.Symbols.Symbol);
local v4 = require(script.Parent.KeyMappings);
local v5 = {
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
local v6 = v3.named("FormattedParam");
local function _(v7) --[[ Line: 44 ]] --[[ Name: isFormattedParam ]]
    -- upvalues: v6 (copy)
    local v8 = false;
    if typeof(v7) == "table" then
        v8 = v7[v6] == true;
    end;
    return v8;
end;
local function _(v10) --[[ Line: 48 ]] --[[ Name: createFormattedParam ]]
    -- upvalues: v6 (copy)
    return {
        [v6] = true, 
        format = v10
    };
end;
local function _(v12, v13) --[[ Line: 58 ]] --[[ Name: getLocalizedString ]]
    local l_translations_0 = v12.translations;
    local l_fallbackTranslations_0 = v12.fallbackTranslations;
    if l_fallbackTranslations_0 ~= nil and l_translations_0[v13] == nil then
        return l_fallbackTranslations_0[v13];
    else
        return l_translations_0[v13];
    end;
end;
local function v23(v17, v18) --[[ Line: 81 ]] --[[ Name: addGroupDelimiters ]]
    local v19 = string.format("%%1%s%%2", v18);
    local _ = nil;
    repeat
        local v21, v22 = string.gsub(v17, "^(-?%d+)(%d%d%d)", v19);
        v17 = v21;
    until v22 == 0;
    return v17;
end;
local v27 = {
    formatNumber = function(v24, v25) --[[ Line: 95 ]] --[[ Name: formatNumber ]]
        -- upvalues: v5 (copy), v23 (copy)
        local v26 = v5[v24.locale] or ",";
        return (v23(v25, v26));
    end
};
v27.numberParam = function(v28) --[[ Line: 103 ]] --[[ Name: numberParam ]]
    -- upvalues: v27 (copy), v6 (copy)
    local function v30(v29) --[[ Line: 104 ]]
        -- upvalues: v27 (ref), v28 (copy)
        return v27.formatNumber(v29, v28);
    end;
    return {
        [v6] = true, 
        format = v30
    };
end;
v27.nestedKeyParam = function(v31) --[[ Line: 113 ]] --[[ Name: nestedKeyParam ]]
    -- upvalues: v6 (copy)
    return {
        [v6] = true, 
        format = function(v32) --[[ Line: 114 ]]
            -- upvalues: v31 (copy)
            local l_v31_0 = v31;
            local l_translations_1 = v32.translations;
            local l_fallbackTranslations_1 = v32.fallbackTranslations;
            if l_fallbackTranslations_1 ~= nil and l_translations_1[l_v31_0] == nil then
                return l_fallbackTranslations_1[l_v31_0];
            else
                return l_translations_1[l_v31_0];
            end;
        end
    };
end;
v27.getKeyFromItemType = function(v36) --[[ Line: 122 ]] --[[ Name: getKeyFromItemType ]]
    -- upvalues: v1 (copy), v4 (copy)
    assert(v1.isMember(v36) or typeof(v36) == "number" or typeof(v36) == "string", "provided item type " .. tostring(v36) .. " must be a number, string, or ItemType enum");
    local _ = nil;
    if v36 == v1.Bundle then
        return "CoreScripts.PurchasePrompt.ItemType.Bundle";
    else
        return v4.AssetTypeById[tostring(v36)];
    end;
end;
v27.getErrorKey = function(v38) --[[ Line: 146 ]] --[[ Name: getErrorKey ]]
    -- upvalues: v2 (copy), v4 (copy)
    assert(v2.isMember(v38), "provided value " .. tostring(v38) .. " is not a member of PurchaseError enum");
    return v4.PurchaseErrorKey[v38];
end;
v27.getString = function(v39, v40, v41) --[[ Line: 161 ]] --[[ Name: getString ]]
    -- upvalues: v6 (copy)
    assert(v39 ~= nil, "Must provide valid localization context");
    local l_translations_2 = v39.translations;
    local l_fallbackTranslations_2 = v39.fallbackTranslations;
    local v44 = if l_fallbackTranslations_2 ~= nil and l_translations_2[v40] == nil then l_fallbackTranslations_2[v40] else l_translations_2[v40];
    if v41 ~= nil then
        for v45, v46 in pairs(v41) do
            local l_v46_0 = v46;
            local v48 = ("{%s}"):format(v45);
            local v49 = false;
            if typeof(v46) == "table" then
                v49 = v46[v6] == true;
            end;
            if v49 then
                l_v46_0 = v46.format(v39);
            end;
            do
                local l_l_v46_0_0 = l_v46_0;
                v44 = string.gsub(v44, v48, function() --[[ Line: 175 ]]
                    -- upvalues: l_l_v46_0_0 (ref)
                    return l_l_v46_0_0;
                end);
            end;
        end;
    end;
    return v44;
end;
return v27;