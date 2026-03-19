local l_Parent_0 = script.Parent.Parent.Parent;
local l_Array_0 = require(l_Parent_0.LuauPolyfill).Array;
local v2 = require(l_Parent_0.RegExp);
local function v8(v3, v4) --[[ Line: 11 ]] --[[ Name: stringMatch ]]
    local v5 = v4:exec(v3);
    local v6 = {};
    while v5 do
        local v7 = v5[1];
        table.insert(v6, v7);
        v5 = v4:exec((v5.input:sub(v5.index + v7:len())));
    end;
    return v6;
end;
local function _(v9) --[[ Line: 25 ]] --[[ Name: TypeError ]]
    return v9;
end;
local v11 = v2("(%[a-fA-F0-9]{2})+", "i");
local function v18(v12) --[[ Line: 33 ]] --[[ Name: decodeURIComponent ]]
    -- upvalues: v11 (copy)
    local v13 = v11:exec(v12);
    local l_v12_0 = v12;
    if v13 then
        local v15 = {};
        for v16 in v13[1]:gmatch("%%(%x%x)") do
            local v17 = tonumber(v16, 16);
            if v17 >= 128 then
                error("malformed URI sequence");
            end;
            table.insert(v15, v17);
        end;
        l_v12_0 = utf8.char(unpack(v15));
    end;
    return l_v12_0;
end;
local v19 = v2("%[a-fA-F0-9]{2}", "i");
local v20 = v2("(%[a-fA-F0-9]{2})+", "i");
local function v21(v22, v23) --[[ Line: 61 ]] --[[ Name: decodeComponents ]]
    -- upvalues: v18 (copy), l_Array_0 (copy), v21 (copy)
    local l_status_0, l_result_0 = pcall(v18, table.concat(v22, ""));
    if l_status_0 then
        return l_result_0;
    elseif #v22 == 1 then
        return v22;
    else
        v23 = v23 or 1;
        local v26 = l_Array_0.slice(v22, 1, v23 + 1);
        local v27 = l_Array_0.slice(v22, v23 + 1);
        return l_Array_0.concat(v21(v26), v21(v27));
    end;
end;
local function v33(v28) --[[ Line: 83 ]] --[[ Name: decode ]]
    -- upvalues: v18 (copy), v8 (copy), v19 (copy), v21 (copy)
    local l_status_1, l_result_1 = pcall(v18, v28);
    if l_status_1 then
        return l_result_1;
    else
        local v31 = v8(v28, v19);
        local v32 = 2;
        while v31[v32] do
            v28 = table.concat(v21(v31, v32), "");
            v31 = v8(v28, v19);
            v32 = v32 + 1;
        end;
        return v28;
    end;
end;
local function _(v34) --[[ Line: 107 ]] --[[ Name: escapePercent ]]
    return (v34:gsub("%%", "%%%%"));
end;
local function v49(v36) --[[ Line: 112 ]] --[[ Name: customDecodeURIComponent ]]
    -- upvalues: v20 (copy), v18 (copy), v33 (copy)
    local v37 = utf8.char(65533);
    local v38 = {
        ["%FE%FF"] = v37 .. v37, 
        ["%FF%FE"] = v37 .. v37
    };
    local v39 = {
        "%FE%FF", 
        "%FF%FE"
    };
    local v40 = v20:exec(v36);
    while v40 do
        local v41 = v40[1];
        local v44, v45 = xpcall(v18, function(_) --[[ Line: 130 ]]
            -- upvalues: v33 (ref), v41 (copy), v38 (copy), v39 (copy)
            local v43 = v33(v41);
            if v43 ~= v41 then
                if v38[v41] == nil then
                    table.insert(v39, v41);
                end;
                v38[v41] = v43;
            end;
        end, v41);
        if v44 then
            if v38[v41] == nil then
                table.insert(v39, v41);
            end;
            v38[v41] = v45;
        end;
        local v46 = v40.input:sub(v40.index + v41:len());
        v40 = v20:exec(v46);
    end;
    v38["%C2"] = v37;
    table.insert(v39, "%C2");
    for _, v48 in v39 do
        v36 = string.gsub(v36, v48:gsub("%%", "%%%%"), (v38[v48]:gsub("%%", "%%%%")));
    end;
    return v36;
end;
return function(v50) --[[ Line: 172 ]] --[[ Name: decodeComponent ]]
    -- upvalues: v49 (copy)
    if type(v50) ~= "string" then
        error("Expected `encodedURI` to be of type `string`, got `" .. typeof(v50) .. "`");
    end;
    v50 = v50:gsub("%+", " ");
    return (v49(v50));
end;