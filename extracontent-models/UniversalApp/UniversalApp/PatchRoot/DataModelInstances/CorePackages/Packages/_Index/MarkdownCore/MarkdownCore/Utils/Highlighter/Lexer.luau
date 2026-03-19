local v0 = {};
local v1 = require(script.Language);
local l_keyword_0 = v1.keyword;
local l_builtin_0 = v1.builtin;
local l_libraries_0 = v1.libraries;
v0.language = v1;
local v5 = {
    {
        "^[%c%s]*[%a_][%w_]*[%c%s]*", 
        "var"
    }, 
    {
        "^[%c%s]*0[xX][%da-fA-F_]+[%c%s]*", 
        "number"
    }, 
    {
        "^[%c%s]*0[bB][01_]+[%c%s]*", 
        "number"
    }, 
    {
        "^[%c%s]*%d+%.?%d*[eE][%+%-]?%d+[%c%s]*", 
        "number"
    }, 
    {
        "^[%c%s]*%d+[%._]?[%d_eE]*[%c%s]*", 
        "number"
    }, 
    {
        "^[%c%s]*(['\"])%1[%c%s]*", 
        "string"
    }, 
    {
        "^[%c%s]*(['\"])[^\n]-([^\\]%1)[%c%s]*", 
        "string"
    }, 
    {
        "^[%c%s]*(['\"]).-\n[%c%s]*", 
        "string"
    }, 
    {
        "^[%c%s]*(['\"])[^\n]*[%c%s]*", 
        "string"
    }, 
    {
        "^[%c%s]*%[(=*)%[.-%]%1%][%c%s]*", 
        "string"
    }, 
    {
        "^[%c%s]*%[=*%[.-.*[%c%s]*", 
        "string"
    }, 
    {
        "^[%c%s]*`[^\n]-`[%c%s]*", 
        "string_inter"
    }, 
    {
        "^[%c%s]*%-%-%[(=*)%[.-%]%1%][%c%s]*", 
        "comment"
    }, 
    {
        "^[%c%s]*%-%-%[=*%[.-.*[%c%s]*", 
        "comment"
    }, 
    {
        "^[%c%s]*%-%-.-\n[%c%s]*", 
        "comment"
    }, 
    {
        "^[%c%s]*%-%-.*[%c%s]*", 
        "comment"
    }, 
    {
        "^[%c%s]*[:;<>/~%*%(%)%-={},%.#%^%+%%]+[%c%s]*", 
        "operator"
    }, 
    {
        "^[%c%s]*[%[%]]+[%c%s]*", 
        "operator"
    }, 
    {
        "^[%c%s]*[%z\001-\127\194-\244][\128-\191]+[%c%s]*", 
        "iden"
    }, 
    {
        "^.", 
        "iden"
    }
};
local v6 = {};
local v7 = {};
for v8, v9 in v5 do
    v6[v8] = v9[1];
    v7[v8] = v9[2];
end;
v0.scan = function(v10) --[[ Line: 105 ]] --[[ Name: scan ]]
    -- upvalues: v6 (copy), v7 (copy), l_keyword_0 (copy), l_builtin_0 (copy), l_libraries_0 (copy), v0 (copy)
    local v11 = 1;
    local v12 = #v10;
    local v13 = "";
    local v14 = "";
    local v15 = "";
    local v16 = "";
    local v35 = coroutine.create(function() --[[ Line: 110 ]]
        -- upvalues: v11 (ref), v12 (copy), v6 (ref), v10 (copy), v7 (ref), l_keyword_0 (ref), l_builtin_0 (ref), v13 (ref), v16 (ref), v14 (ref), l_libraries_0 (ref), v15 (ref), v0 (ref)
        while true do
            if v11 <= v12 then
                local v17 = false;
                for v18, v19 in ipairs(v6) do
                    local v20, v21 = string.find(v10, v19, v11);
                    if v20 ~= nil then
                        v11 = v21 + 1;
                        v17 = true;
                        local v22 = string.sub(v10, v20, v21);
                        local v23 = v7[v18];
                        local l_v23_0 = v23;
                        if v23 == "var" then
                            local v25 = string.gsub(v22, "[%c%s]+", "");
                            if l_keyword_0[v25] then
                                l_v23_0 = "keyword";
                            elseif l_builtin_0[v25] then
                                l_v23_0 = "builtin";
                            elseif string.find(v13, "%.[%s%c]*$") and v16 ~= "comment" then
                                local v26 = l_libraries_0[string.gsub(v14, "[%c%s]+", "")];
                                l_v23_0 = (not (v26 and v26[v25]) or string.find(v15, "%.[%s%c]*$")) and "iden" or "builtin";
                            else
                                l_v23_0 = "iden";
                            end;
                        elseif v23 == "string_inter" then
                            if not string.find(v22, "[^\\]{") then
                                l_v23_0 = "string";
                            else
                                l_v23_0 = nil;
                                local v27 = true;
                                local v28 = 1;
                                local v29 = #v22;
                                while v28 <= v29 do
                                    local v30, v31 = string.find(v22, "^.-[^\\][{}]", v28);
                                    if v30 == nil then
                                        coroutine.yield("string", (string.sub(v22, v28)));
                                        break;
                                    elseif v27 then
                                        v28 = v31 + 1;
                                        coroutine.yield("string", (string.sub(v22, v30, v31)));
                                        v27 = false;
                                    else
                                        v28 = v31;
                                        local v32 = string.sub(v22, v30, v31 - 1);
                                        for v33, v34 in v0.scan(v32) do
                                            coroutine.yield(v33, v34);
                                        end;
                                        v27 = true;
                                    end;
                                end;
                            end;
                        end;
                        v15 = v14;
                        v14 = v13;
                        v13 = v22;
                        v16 = l_v23_0 or v23;
                        if l_v23_0 then
                            coroutine.yield(l_v23_0, v22);
                            break;
                        else
                            break;
                        end;
                    end;
                end;
                if not v17 then
                    return;
                end;
            else
                return;
            end;
        end;
    end);
    return function() --[[ Line: 218 ]]
        -- upvalues: v35 (copy)
        if coroutine.status(v35) == "dead" then
            return;
        else
            local v36, v37, v38 = coroutine.resume(v35);
            if v36 and v37 then
                return v37, v38;
            else
                return;
            end;
        end;
    end;
end;
v0.navigator = function() --[[ Line: 232 ]] --[[ Name: navigator ]]
    -- upvalues: v0 (copy)
    local v45 = {
        Source = "", 
        TokenCache = table.create(50), 
        _RealIndex = 0, 
        _UserIndex = 0, 
        _ScanThread = nil, 
        Destroy = function(v39) --[[ Line: 242 ]] --[[ Name: Destroy ]]
            v39.Source = nil;
            v39._RealIndex = nil;
            v39._UserIndex = nil;
            v39.TokenCache = nil;
            v39._ScanThread = nil;
        end, 
        SetSource = function(v40, v41) --[[ Line: 250 ]] --[[ Name: SetSource ]]
            -- upvalues: v0 (ref)
            v40.Source = v41;
            v40._RealIndex = 0;
            v40._UserIndex = 0;
            table.clear(v40.TokenCache);
            v40._ScanThread = coroutine.create(function() --[[ Line: 257 ]]
                -- upvalues: v0 (ref), v40 (copy)
                for v42, v43 in v0.scan(v40.Source) do
                    local l_v40_0 = v40;
                    l_v40_0._RealIndex = l_v40_0._RealIndex + 1;
                    v40.TokenCache[v40._RealIndex] = {
                        v42, 
                        v43
                    };
                    coroutine.yield(v42, v43);
                end;
            end);
        end
    };
    v45.Next = function() --[[ Line: 266 ]] --[[ Name: Next ]]
        -- upvalues: v45 (copy)
        local l_v45_0 = v45;
        l_v45_0._UserIndex = l_v45_0._UserIndex + 1;
        if v45._RealIndex >= v45._UserIndex then
            return table.unpack(v45.TokenCache[v45._UserIndex]);
        elseif coroutine.status(v45._ScanThread) == "dead" then
            return;
        else
            local v47, v48;
            l_v45_0, v47, v48 = coroutine.resume(v45._ScanThread);
            if l_v45_0 and v47 then
                return v47, v48;
            else
                return;
            end;
        end;
    end;
    v45.Peek = function(v49) --[[ Line: 289 ]] --[[ Name: Peek ]]
        -- upvalues: v45 (copy)
        local v50 = v45._UserIndex + v49;
        if v50 <= v45._RealIndex then
            if v50 > 0 then
                return table.unpack(v45.TokenCache[v50]);
            else
                return;
            end;
        elseif coroutine.status(v45._ScanThread) == "dead" then
            return;
        else
            local v51 = v50 - v45._RealIndex;
            local v52 = nil;
            local v53 = nil;
            local v54 = nil;
            for _ = 1, v51 do
                local v56, v57, v58 = coroutine.resume(v45._ScanThread);
                v52 = v56;
                v53 = v57;
                v54 = v58;
                if not v52 and not v53 then
                    break;
                end;
            end;
            return v53, v54;
        end;
    end;
    return v45;
end;
return v0;