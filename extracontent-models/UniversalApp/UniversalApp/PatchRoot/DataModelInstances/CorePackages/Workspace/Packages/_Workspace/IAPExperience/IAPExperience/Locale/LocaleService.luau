local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.Flags.FFlagIAPExperienceUseAppLocales);
local v2 = require(l_Parent_0.Symbols.Symbol).named("FormattedParam");
local function _(v3) --[[ Line: 17 ]] --[[ Name: isFormattedParam ]]
    -- upvalues: v2 (copy)
    local v4 = false;
    if typeof(v3) == "table" then
        v4 = v3[v2] == true;
    end;
    return v4;
end;
local function _(v6) --[[ Line: 21 ]] --[[ Name: createFormattedParam ]]
    -- upvalues: v2 (copy)
    return {
        [v2] = true, 
        format = v6
    };
end;
local function _(v8, v9) --[[ Line: 31 ]] --[[ Name: getLocalizedString ]]
    local l_translations_0 = v8.translations;
    local l_fallbackTranslations_0 = v8.fallbackTranslations;
    if l_fallbackTranslations_0 ~= nil and l_translations_0[v9] == nil then
        return l_fallbackTranslations_0[v9];
    else
        return l_translations_0[v9];
    end;
end;
return {
    nestedKeyParam = function(v13) --[[ Line: 52 ]] --[[ Name: nestedKeyParam ]]
        -- upvalues: v1 (copy), v2 (copy)
        if v1 then
            error("LocaleService.nestedKeyParam is deprecated. Use RobloxAppLocales.Localization:Format() instead.");
        end;
        return {
            [v2] = true, 
            format = function(v14) --[[ Line: 56 ]]
                -- upvalues: v13 (copy)
                local l_v13_0 = v13;
                local l_translations_1 = v14.translations;
                local l_fallbackTranslations_1 = v14.fallbackTranslations;
                if l_fallbackTranslations_1 ~= nil and l_translations_1[l_v13_0] == nil then
                    return l_fallbackTranslations_1[l_v13_0];
                else
                    return l_translations_1[l_v13_0];
                end;
            end
        };
    end, 
    getString = function(v18, v19, v20) --[[ Line: 67 ]] --[[ Name: getString ]]
        -- upvalues: v1 (copy), v2 (copy)
        if v1 then
            error("LocaleService.getString is deprecated. Use RobloxAppLocales.Localization:Format() instead.");
        end;
        assert(v18 ~= nil, "Must provide valid localization context");
        local l_translations_2 = v18.translations;
        local l_fallbackTranslations_2 = v18.fallbackTranslations;
        local v23 = if l_fallbackTranslations_2 ~= nil and l_translations_2[v19] == nil then l_fallbackTranslations_2[v19] else l_translations_2[v19];
        assert(v23 ~= nil, "Unable to find localization with key: " .. v19);
        if v23 and v20 ~= nil then
            for v24, v25 in pairs(v20) do
                local l_v25_0 = v25;
                local v27 = ("{%s}"):format(v24);
                local v28 = false;
                if typeof(v25) == "table" then
                    v28 = v25[v2] == true;
                end;
                if v28 then
                    l_v25_0 = v25.format(v18);
                end;
                do
                    local l_l_v25_0_0 = l_v25_0;
                    v23 = string.gsub(v23, v27, function() --[[ Line: 83 ]]
                        -- upvalues: l_l_v25_0_0 (ref)
                        return l_l_v25_0_0;
                    end);
                end;
            end;
        end;
        return v23;
    end
};