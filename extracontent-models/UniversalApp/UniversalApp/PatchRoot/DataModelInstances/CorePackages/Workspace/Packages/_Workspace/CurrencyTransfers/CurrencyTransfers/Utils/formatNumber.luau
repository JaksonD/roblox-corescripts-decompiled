local v0 = {
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
local function v7(v1, v2) --[[ Line: 35 ]] --[[ Name: addGroupDelimiters ]]
    local v3 = string.format("%%1%s%%2", v2);
    local _ = nil;
    repeat
        local v5, v6 = string.gsub(v1, "^(-?%d+)(%d%d%d)", v3);
        v1 = v5;
    until v6 == 0;
    return v1;
end;
return function(v8, v9) --[[ Line: 47 ]]
    -- upvalues: v0 (copy), v7 (copy)
    local v10 = v0[v8] or ",";
    return (v7(v9, v10));
end;