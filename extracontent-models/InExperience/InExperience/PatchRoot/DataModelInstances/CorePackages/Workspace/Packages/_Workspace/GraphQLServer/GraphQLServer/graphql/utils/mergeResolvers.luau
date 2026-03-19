local l_Parent_0 = script:FindFirstAncestor("GraphQLServer").Parent;
local v1 = require(l_Parent_0.LuauPolyfill);
local l_Array_0 = v1.Array;
local l_Boolean_0 = v1.Boolean;
local v4 = require(script.Parent.mergeDeep);
local function v5(v6, v7) --[[ Line: 14 ]] --[[ Name: mergeResolvers ]]
    -- upvalues: l_Array_0 (copy), v5 (copy), v4 (copy), l_Boolean_0 (copy)
    if not v6 or l_Array_0.isArray(v6) and #v6 == 0 then
        return {};
    elseif not l_Array_0.isArray(v6) then
        return v6;
    elseif #v6 == 1 then
        return v6[1] or {};
    else
        local v8 = {};
        for _, v10 in v6 do
            if l_Array_0.isArray(v10) then
                v10 = v5(v10);
            end;
            if type(v10) == "table" and v10 then
                table.insert(v8, v10);
            end;
        end;
        local v11 = v4(v8, true);
        if v7 and v7.exclusions then
            for _, v13 in v7.exclusions do
                local v14, v15 = table.unpack(v13:split("."), 1, 2);
                if not v15 or v15 == "*" then
                    v11[tostring(v14)] = nil;
                elseif l_Boolean_0.toJSBoolean(v11[tostring(v14)]) then
                    v11[tostring(v14)][tostring(v15)] = nil;
                end;
            end;
        end;
        return v11;
    end;
end;
return v5;