local l_Parent_0 = script:FindFirstAncestor("GraphQLServer").Parent;
local v1 = require(l_Parent_0.LuauPolyfill);
local l_Object_0 = v1.Object;
local l_Array_0 = v1.Array;
local function _(v4) --[[ Line: 9 ]] --[[ Name: isObject ]]
    -- upvalues: l_Array_0 (copy)
    local v5 = false;
    if typeof(v4) == "table" then
        v5 = not (l_Array_0.isArray(v4) and #v4 > 0);
    end;
    return v5;
end;
local function v7(v8, v9) --[[ Line: 13 ]] --[[ Name: mergeDeep ]]
    -- upvalues: l_Array_0 (copy), l_Object_0 (copy), v7 (copy)
    local v10 = v8[1] or {};
    local v11 = {};
    for _, v13 in v8 do
        local v14 = false;
        if typeof(v10) == "table" then
            v14 = not (l_Array_0.isArray(v10) and #v10 > 0);
        end;
        if v14 then
            v14 = false;
            if typeof(v13) == "table" then
                v14 = not (l_Array_0.isArray(v13) and #v13 > 0);
            end;
            if v14 then
                for v15, v16 in v13 do
                    if type(v16) == "table" then
                        if v11[v15] == nil then
                            l_Object_0.assign(v11, {
                                [v15] = v16
                            });
                        else
                            v11[v15] = v7({
                                v11[v15], 
                                v16
                            }, v9);
                        end;
                    else
                        l_Object_0.assign(v11, {
                            [v15] = v16
                        });
                    end;
                end;
            end;
        end;
    end;
    return v11;
end;
return v7;