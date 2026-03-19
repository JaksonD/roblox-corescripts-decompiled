local l_script_FirstAncestor_0 = script:FindFirstAncestor("Navigation");
local _ = require(script.Parent.types);
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local l_Array_0 = require(l_Parent_0.LuauPolyfill).Array;
local function _(v4) --[[ Line: 15 ]] --[[ Name: isStackRoute ]]
    local v5 = false;
    if v4.index ~= nil then
        v5 = false;
        if v4.routes ~= nil then
            v5 = v4.isTransitioning ~= nil;
        end;
    end;
    return v5;
end;
local function v7(v8) --[[ Line: 29 ]] --[[ Name: getActiveRoutes ]]
    -- upvalues: l_Array_0 (copy), v7 (copy)
    local v9 = {};
    if v8 == nil then
        return v9;
    else
        if v8.key or v8.routeName then
            table.insert(v9, v8);
        end;
        if v8.routes and v8.index ~= nil then
            local l_routes_0 = v8.routes;
            local l_index_0 = v8.index;
            local v12 = false;
            if v8.index ~= nil then
                v12 = false;
                if v8.routes ~= nil then
                    v12 = v8.isTransitioning ~= nil;
                end;
            end;
            if v12 then
                for v13 = 1, l_index_0 - 1 do
                    local v14 = l_routes_0[v13];
                    v9 = l_Array_0.concat(v9, v7(v14));
                end;
            end;
            v12 = l_routes_0[l_index_0];
            v9 = l_Array_0.concat(v9, v7(v12));
        end;
        return v9;
    end;
end;
return v7;