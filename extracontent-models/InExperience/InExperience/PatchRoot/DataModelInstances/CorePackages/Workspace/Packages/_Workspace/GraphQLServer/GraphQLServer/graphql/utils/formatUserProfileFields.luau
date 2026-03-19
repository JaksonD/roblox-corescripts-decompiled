local l_script_FirstAncestor_0 = script:FindFirstAncestor("GraphQLServer");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.GraphqlToolsUtils);
local v3 = require(l_Parent_0.LuauPolyfill);
local l_collectSubFields_0 = v2.collectSubFields;
local v5 = require(l_script_FirstAncestor_0.graphql.enums.UserProfileNestedFields);
return function(v6, v7) --[[ Line: 8 ]]
    -- upvalues: l_collectSubFields_0 (copy), v3 (copy), v5 (copy)
    local v8 = v7 or l_collectSubFields_0;
    local v9 = v8(v6.schema, v6.fragments, v6.variableValues, v6.returnType, v6.fieldNodes);
    local v10 = {};
    local function _(v11) --[[ Line: 20 ]]
        -- upvalues: v3 (ref)
        local v12 = true;
        if v11 ~= nil then
            v12 = true;
            if v11 ~= "id" then
                v12 = v3.String.endsWith(v11, "__typename");
            end;
        end;
        return v12;
    end;
    for _, v15 in v9 do
        local v16 = v15[1];
        if v5[v16] then
            for _, v18 in (v8(v6.schema, v6.fragments, v6.variableValues, v6.returnType, v9[v16])) do
                local v19 = ("%*.%*"):format(v16, v18[1]);
                local v20 = true;
                if v19 ~= nil then
                    v20 = true;
                    if v19 ~= "id" then
                        v20 = v3.String.endsWith(v19, "__typename");
                    end;
                end;
                if not v20 then
                    table.insert(v10, v19);
                end;
            end;
        else
            local v21 = true;
            if v16 ~= nil then
                v21 = true;
                if v16 ~= "id" then
                    v21 = v3.String.endsWith(v16, "__typename");
                end;
            end;
            if not v21 then
                table.insert(v10, v16);
            end;
        end;
    end;
    return v10;
end;