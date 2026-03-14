local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.Symbols.Symbol).named("FormattedParam");
local function _(v2) --[[ Line: 13 ]] --[[ Name: isFormattedParam ]]
    -- upvalues: v1 (copy)
    local v3 = false;
    if typeof(v2) == "table" then
        v3 = v2[v1] == true;
    end;
    return v3;
end;
local function _(v5) --[[ Line: 17 ]] --[[ Name: createFormattedParam ]]
    -- upvalues: v1 (copy)
    return {
        [v1] = true, 
        format = v5
    };
end;
local function _(v7, v8) --[[ Line: 27 ]] --[[ Name: getLocalizedString ]]
    local l_translations_0 = v7.translations;
    local l_fallbackTranslations_0 = v7.fallbackTranslations;
    if l_fallbackTranslations_0 ~= nil and l_translations_0[v8] == nil then
        return l_fallbackTranslations_0[v8];
    else
        return l_translations_0[v8];
    end;
end;
return {
    nestedKeyParam = function(v12) --[[ Line: 48 ]] --[[ Name: nestedKeyParam ]]
        -- upvalues: v1 (copy)
        return {
            [v1] = true, 
            format = function(v13) --[[ Line: 49 ]]
                -- upvalues: v12 (copy)
                local l_v12_0 = v12;
                local l_translations_1 = v13.translations;
                local l_fallbackTranslations_1 = v13.fallbackTranslations;
                if l_fallbackTranslations_1 ~= nil and l_translations_1[l_v12_0] == nil then
                    return l_fallbackTranslations_1[l_v12_0];
                else
                    return l_translations_1[l_v12_0];
                end;
            end
        };
    end, 
    getString = function(v17, v18, v19) --[[ Line: 60 ]] --[[ Name: getString ]]
        -- upvalues: v1 (copy)
        assert(v17 ~= nil, "Must provide valid localization context");
        local l_translations_2 = v17.translations;
        local l_fallbackTranslations_2 = v17.fallbackTranslations;
        local v22 = if l_fallbackTranslations_2 ~= nil and l_translations_2[v18] == nil then l_fallbackTranslations_2[v18] else l_translations_2[v18];
        assert(v22 ~= nil, "Unable to find localization with key: " .. v18);
        if v22 and v19 ~= nil then
            for v23, v24 in pairs(v19) do
                local l_v24_0 = v24;
                local v26 = ("{%s}"):format(v23);
                local v27 = false;
                if typeof(v24) == "table" then
                    v27 = v24[v1] == true;
                end;
                if v27 then
                    l_v24_0 = v24.format(v17);
                end;
                do
                    local l_l_v24_0_0 = l_v24_0;
                    v22 = string.gsub(v22, v26, function() --[[ Line: 73 ]]
                        -- upvalues: l_l_v24_0_0 (ref)
                        return l_l_v24_0_0;
                    end);
                end;
            end;
        end;
        return v22;
    end
};