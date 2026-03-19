local l_Parent_0 = script.Parent;
local _ = require(l_Parent_0.Types);
local v2 = require(l_Parent_0.append);
local v3 = require(l_Parent_0.assign);
local v4 = require(l_Parent_0.cycles);
local v5 = require(l_Parent_0.includes);
local v6 = require(l_Parent_0.join);
local v7 = require(l_Parent_0.map);
local v8 = require(l_Parent_0.keys);
local v9 = require(l_Parent_0.slice);
local l_concat_0 = table.concat;
local l_insert_0 = table.insert;
local l_sort_0 = table.sort;
local function v16(v13, v14) --[[ Line: 38 ]] --[[ Name: indentLines ]]
    -- upvalues: v7 (copy)
    return v7(v13, function(v15) --[[ Line: 39 ]]
        -- upvalues: v14 (copy)
        return v14 .. v15;
    end);
end;
local function _(v17) --[[ Line: 44 ]] --[[ Name: sortObjectKeys ]]
    -- upvalues: v8 (copy), l_sort_0 (copy)
    local v18 = v8(v17);
    l_sort_0(v18, function(v19, v20) --[[ Line: 46 ]]
        if type(v19) == "number" and type(v20) == "number" then
            return v19 < v20;
        else
            return tostring(v19) < tostring(v20);
        end;
    end);
    return v18;
end;
local function v24(v22, v23) --[[ Line: 56 ]] --[[ Name: constructValueOptions ]]
    -- upvalues: v3 (copy), v4 (copy)
    return (v3({
        visited = {}, 
        indent = "\t", 
        depth = 2
    }, v22, {
        depth = v22.depth and v22.depth - 1 or nil, 
        cycles = v22.cycles or v4(v23, v22.depth, {
            visited = {}, 
            refs = {}, 
            nextRef = 0, 
            depth = v22.depth, 
            omit = v22.omit or {}
        })
    }));
end;
local function _(v25, v26, v27) --[[ Line: 78 ]] --[[ Name: insertClosedBracket ]]
    -- upvalues: l_insert_0 (copy)
    if v26 then
        if v27 then
            v25[#v25] = v25[#v25] .. "}";
            return;
        else
            l_insert_0(v25, "}");
            return;
        end;
    else
        v25[#v25] = ("%s}"):format(v25[#v25]);
        return;
    end;
end;
local v29 = nil;
local function v30(v31, v32) --[[ Line: 93 ]] --[[ Name: prettyLines ]]
    -- upvalues: v24 (copy), v6 (copy), v8 (copy), l_sort_0 (copy), v5 (copy), v2 (copy), v16 (copy), v30 (copy), v7 (copy), v9 (copy), v29 (ref), l_insert_0 (copy)
    local v33 = v32 or {};
    if type(v31) == "table" then
        local v34 = v24(v33, v31);
        if v34.depth == -1 then
            return {
                "..."
            };
        elseif v34.visited[v31] then
            return {
                "&" .. v34.cycles.refs[v31]
            };
        else
            v34.visited[v31] = true;
            local l_multiline_0 = v34.multiline;
            local v36 = l_multiline_0 and "," or ", ";
            local v37 = v34.cycles.refs[v31];
            local v38 = {
                (v37 and ("<%s>"):format(v37) or "") .. "{"
            };
            local v39 = v6(v34, {
                noQuotes = true, 
                multiline = false
            });
            local v40 = 0;
            local v41 = true;
            local v42 = v8(v31);
            l_sort_0(v42, function(v43, v44) --[[ Line: 46 ]]
                if type(v43) == "number" and type(v44) == "number" then
                    return v43 < v44;
                else
                    return tostring(v43) < tostring(v44);
                end;
            end);
            local l_v42_0 = v42;
            if #v31 > 0 and v34.arrayLength then
                v38[1] = ("#%d %s"):format(#v31, v38[1]);
            end;
            for _, v47 in ipairs(l_v42_0) do
                if type(v47) == "number" and v47 == v40 + 1 then
                    v40 = v47;
                end;
                if not v34.omit or not v5(v34.omit, v47) then
                    local v48 = v31[v47];
                    local v49 = false;
                    if type(v47) == "number" then
                        v49 = false;
                        if v47 >= 1 then
                            v49 = v47 <= v40;
                        end;
                    end;
                    if v41 then
                        v41 = false;
                    else
                        v38[#v38] = v38[#v38] .. v36;
                    end;
                    if l_multiline_0 then
                        if v49 then
                            v2(v38, v16(v30(v48, v34), v34.indent));
                        else
                            local v50 = v30(v47, v39);
                            local l_indent_0 = v34.indent;
                            local l_l_indent_0_0 = l_indent_0 --[[ copy: 22 -> 26 ]];
                            local v54 = v7(v50, function(v53) --[[ Line: 39 ]]
                                -- upvalues: l_l_indent_0_0 (copy)
                                return l_l_indent_0_0 .. v53;
                            end);
                            l_indent_0 = v30(v48, v34);
                            local v55 = v9(l_indent_0, 2);
                            local l_indent_1 = v34.indent;
                            local v58 = v7(v55, function(v57) --[[ Line: 39 ]]
                                -- upvalues: l_indent_1 (copy)
                                return l_indent_1 .. v57;
                            end);
                            v54[#v54] = ("%s = %s"):format(v54[#v54], l_indent_0[1]);
                            v2(v38, v54);
                            v2(v38, v58);
                        end;
                    elseif v49 then
                        v38[#v38] = v38[#v38] .. v29(v48, v34);
                    else
                        v38[#v38] = v38[#v38] .. v29(v47, v39) .. " = " .. v29(v48, v34);
                    end;
                end;
            end;
            v42 = v41;
            if l_multiline_0 then
                if v42 then
                    v38[#v38] = v38[#v38] .. "}";
                    return v38;
                else
                    l_insert_0(v38, "}");
                    return v38;
                end;
            else
                v38[#v38] = ("%s}"):format(v38[#v38]);
                return v38;
            end;
        end;
    elseif type(v31) == "string" and v33 and not v33.noQuotes then
        return {
            ("\"%s\""):format(v31)
        };
    else
        return {
            (tostring(v31))
        };
    end;
end;
v29 = function(v59, v60) --[[ Line: 199 ]]
    -- upvalues: l_concat_0 (copy), v30 (copy)
    return l_concat_0(v30(v59, v60), "\n");
end;
return v29;