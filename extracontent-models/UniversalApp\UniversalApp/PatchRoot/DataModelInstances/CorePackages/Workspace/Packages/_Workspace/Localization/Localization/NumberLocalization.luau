local v0 = require(script.Parent.RoundingBehaviour);
local v1 = require(script.Parent.Logger);
game:DefineFastFlag("AllowNumberLocalizationSigFigParam", false);
local v2 = {
    ["en-us"] = {
        decimalSeparator = ".", 
        groupDelimiter = ","; 
        {
            1, 
            ""
        }, 
        {
            1000, 
            "K"
        }, 
        {
            1000000, 
            "M"
        }, 
        {
            1000000000, 
            "B"
        }
    }, 
    ["es-es"] = {
        decimalSeparator = ",", 
        groupDelimiter = "."; 
        {
            1, 
            ""
        }, 
        {
            1000, 
            " mil"
        }, 
        {
            1000000, 
            " M"
        }
    }, 
    ["fr-fr"] = {
        decimalSeparator = ",", 
        groupDelimiter = " "; 
        {
            1, 
            ""
        }, 
        {
            1000, 
            " k"
        }, 
        {
            1000000, 
            " M"
        }, 
        {
            1000000000, 
            " Md"
        }
    }, 
    ["de-de"] = {
        decimalSeparator = ",", 
        groupDelimiter = " "; 
        {
            1, 
            ""
        }, 
        {
            1000, 
            " Tsd."
        }, 
        {
            1000000, 
            " Mio."
        }, 
        {
            1000000000, 
            " Mrd."
        }
    }, 
    ["pt-br"] = {
        decimalSeparator = ",", 
        groupDelimiter = "."; 
        {
            1, 
            ""
        }, 
        {
            1000, 
            " mil"
        }, 
        {
            1000000, 
            " mi"
        }, 
        {
            1000000000, 
            " bi"
        }
    }, 
    ["zh-cn"] = {
        decimalSeparator = ".", 
        groupDelimiter = ","; 
        {
            1, 
            ""
        }, 
        {
            1000, 
            "\229\141\131"
        }, 
        {
            10000, 
            "\228\184\135"
        }, 
        {
            100000000, 
            "\228\186\191"
        }
    }, 
    ["zh-cjv"] = {
        decimalSeparator = ".", 
        groupDelimiter = ","; 
        {
            1, 
            ""
        }, 
        {
            1000, 
            "\229\141\131"
        }, 
        {
            10000, 
            "\228\184\135"
        }, 
        {
            100000000, 
            "\228\186\191"
        }
    }, 
    ["zh-tw"] = {
        decimalSeparator = ".", 
        groupDelimiter = ","; 
        {
            1, 
            ""
        }, 
        {
            1000, 
            "\229\141\131"
        }, 
        {
            10000, 
            "\232\144\172"
        }, 
        {
            100000000, 
            "\229\132\132"
        }
    }, 
    ["ko-kr"] = {
        decimalSeparator = ".", 
        groupDelimiter = ","; 
        {
            1, 
            ""
        }, 
        {
            1000, 
            "\236\178\156"
        }, 
        {
            10000, 
            "\235\167\140"
        }, 
        {
            100000000, 
            "\236\150\181"
        }
    }, 
    ["ja-jp"] = {
        decimalSeparator = ".", 
        groupDelimiter = ","; 
        {
            1, 
            ""
        }, 
        {
            1000, 
            "\229\141\131"
        }, 
        {
            10000, 
            "\228\184\135"
        }, 
        {
            100000000, 
            "\229\132\132"
        }
    }, 
    ["it-it"] = {
        decimalSeparator = ",", 
        groupDelimiter = " "; 
        {
            1, 
            ""
        }, 
        {
            1000, 
            " mila"
        }, 
        {
            1000000, 
            " Mln"
        }, 
        {
            1000000000, 
            " Mld"
        }
    }, 
    ["ru-ru"] = {
        decimalSeparator = ",", 
        groupDelimiter = "."; 
        {
            1, 
            ""
        }, 
        {
            1000, 
            " \209\130\209\139\209\129"
        }, 
        {
            1000000, 
            " \208\188\208\187\208\189"
        }, 
        {
            1000000000, 
            " \208\188\208\187\209\128\208\180"
        }
    }, 
    ["id-id"] = {
        decimalSeparator = ",", 
        groupDelimiter = "."; 
        {
            1, 
            ""
        }, 
        {
            1000, 
            " rb"
        }, 
        {
            1000000, 
            " jt"
        }, 
        {
            1000000000, 
            " M"
        }
    }, 
    ["vi-vn"] = {
        decimalSeparator = ".", 
        groupDelimiter = " "; 
        {
            1, 
            ""
        }, 
        {
            1000, 
            " N"
        }, 
        {
            1000000, 
            " Tr"
        }, 
        {
            1000000000, 
            " T"
        }
    }, 
    ["tr-tr"] = {
        decimalSeparator = ",", 
        groupDelimiter = "."; 
        {
            1, 
            ""
        }, 
        {
            1000, 
            " B"
        }, 
        {
            1000000, 
            " Mn"
        }, 
        {
            1000000000, 
            " Mr"
        }
    }
};
v2["en-gb"] = v2["en-us"];
v2["es-mx"] = v2["es-es"];
v2["th-th"] = v2["en-us"];
local function _(v3) --[[ Line: 172 ]] --[[ Name: findDecimalPointIndex ]]
    return string.find(v3, "%.") or #v3 + 1;
end;
local function _(v5) --[[ Line: 177 ]] --[[ Name: findDecimalOffset ]]
    if v5 == 0 then
        return 0;
    else
        return -(math.floor((math.log10((math.abs(v5))))) + 1);
    end;
end;
local _ = function(v7, v8, v9) --[[ Line: 186 ]] --[[ Name: roundToSignificantDigits ]]
    -- upvalues: v0 (copy)
    local v10 = 10 ^ (v8 + (v7 == 0 and 0 or -(math.floor((math.log10((math.abs(v7))))) + 1)));
    local _ = nil;
    return (if v9 == v0.Truncate then math.modf(v7 * v10) else math.floor(v7 * v10 + 0.5)) / v10;
end;
local function v19(v13, v14) --[[ Line: 198 ]] --[[ Name: addGroupDelimiters ]]
    local l_v13_0 = v13;
    local v16 = string.format("%%1%s%%2", v14);
    repeat
        local v17, v18 = string.gsub(l_v13_0, "^(-?%d+)(%d%d%d)", v16);
        l_v13_0 = v17;
    until v18 == 0;
    return l_v13_0;
end;
local function v28(v20, v21, v22) --[[ Line: 211 ]] --[[ Name: findDenominationEntry ]]
    -- upvalues: v0 (copy)
    local v23 = v20[1];
    local v24 = math.abs(v21);
    for v25 = #v20, 2, -1 do
        local v26 = v20[v25];
        local _ = nil;
        if (if v22 == v0.Truncate then v26[1] else v26[1] - v20[v25 - 1][1] / 2) <= v24 then
            return v26;
        end;
    end;
    return v23;
end;
return {
    localize = function(v29, v30) --[[ Line: 232 ]] --[[ Name: localize ]]
        -- upvalues: v2 (copy), v1 (copy), v19 (copy)
        if v29 == 0 then
            return "0";
        else
            local v31 = v2[v30];
            if not v31 then
                v31 = v2["en-us"];
                v1:warning(string.format("Warning: Locale not found: '%s', reverting to '%s' instead.", tostring(v30), "en-us"));
            end;
            if v31.groupDelimiter then
                return (v19(v29, v31.groupDelimiter));
            else
                return v29;
            end;
        end;
    end, 
    abbreviate = function(v32, v33, v34, v35) --[[ Line: 257 ]] --[[ Name: abbreviate ]]
        -- upvalues: v0 (copy), v2 (copy), v1 (copy), v28 (copy), v19 (copy)
        if v32 == 0 then
            return "0";
        else
            if v34 == nil then
                v34 = v0.RoundToClosest;
            end;
            if game:GetFastFlag("AllowNumberLocalizationSigFigParam") then
                if v35 == nil then
                    v35 = 3;
                end;
            else
                v35 = 3;
            end;
            local v36 = v2[v33];
            if not v36 then
                v36 = v2["en-us"];
                v1:warning(string.format("Warning: Locale not found: '%s', reverting to '%s' instead.", tostring(v33), "en-us"));
            end;
            local v37 = v28(v36, v32, v34);
            local v38 = v37[1];
            local v39 = v37[2];
            local v40 = v32 / v38;
            local l_v35_0 = v35;
            local l_v34_0 = v34;
            local v43 = 10 ^ (l_v35_0 + (v40 == 0 and 0 or -(math.floor((math.log10((math.abs(v40))))) + 1)));
            local _ = nil;
            local v45 = (if l_v34_0 == v0.Truncate then math.modf(v40 * v43) else math.floor(v40 * v43 + 0.5)) / v43;
            v40 = nil;
            l_v35_0 = tostring(if v34 == v0.Truncate then math.modf(v45 * 10) / 10 else math.floor(v45 * 10 + 0.5) / 10);
            l_v34_0 = string.find(l_v35_0, "%.") or #l_v35_0 + 1;
            local v46 = string.sub(l_v35_0, 1, l_v34_0 - 1);
            v43 = string.sub(l_v35_0, l_v34_0 + 1, #l_v35_0);
            if v36.groupDelimiter then
                v46 = v19(v46, v36.groupDelimiter);
            end;
            if #v43 > 0 then
                return v46 .. v36.decimalSeparator .. v43 .. v39;
            else
                return v46 .. v39;
            end;
        end;
    end, 
    logger = v1
};