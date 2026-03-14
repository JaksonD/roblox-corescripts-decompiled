local v0 = {
    ["zh-cn"] = "zh-cn", 
    zh_cn = "zh-cn", 
    ["zh-cjv"] = "zh-cn", 
    zh_cjv = "zh-cn", 
    ["zh-hans"] = "zh-cn", 
    zh_hans = "zh-cn", 
    ["zh-tw"] = "zh-tw", 
    zh_tw = "zh-tw", 
    ["zh-hant"] = "zh-tw", 
    zh_hant = "zh-tw", 
    ["en-us"] = "en-us", 
    en_us = "en-us", 
    en = "en-us", 
    ["en-gb"] = "en-gb", 
    en_gb = "en-gb", 
    ["fr-ca"] = "fr-ca", 
    fr_ca = "fr-ca", 
    nb = "no", 
    ["nb-no"] = "no", 
    nb_no = "no"
};
local function v4(v1) --[[ Line: 24 ]]
    -- upvalues: v0 (copy)
    if v0[v1] then
        return v0[v1];
    else
        local v2 = {};
        for v3 in v1:gmatch("([^%-_]+)") do
            table.insert(v2, v3);
        end;
        if v2[1] then
            return v2[1];
        else
            return "en-us";
        end;
    end;
end;
local function _(v5) --[[ Line: 42 ]]
    return v5 and string.match(v5, "^[%w%-_]+$") ~= nil;
end;
local function _(v7) --[[ Line: 47 ]]
    return v7 and string.match(v7, "^[a-zA-Z0-9]+$") ~= nil;
end;
return function(v9, v10, v11) --[[ Line: 52 ]] --[[ Name: getZendeskUrl ]]
    -- upvalues: v4 (copy)
    return (("%*/%*/%*"):format(v9 or "https://en.help.roblox.com/hc", if v10 and string.match(v10, "^[%w%-_]+$") ~= nil then v4(v10) else "en-us", if v11 and string.match(v11, "^[a-zA-Z0-9]+$") ~= nil then ("articles/%*"):format(v11) else ""));
end;