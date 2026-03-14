local l_script_FirstAncestor_0 = script:FindFirstAncestor("Navigation");
local _ = require(script.Parent.types);
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local l_Array_0 = require(l_Parent_0.LuauPolyfill).Array;
local function v4(v5) --[[ Line: 10 ]] --[[ Name: getFocusedRoutes ]]
    -- upvalues: l_Array_0 (copy), v4 (copy)
    local v6 = {};
    if v5 == nil then
        return v6;
    else
        if v5.key or v5.routeName then
            table.insert(v6, v5);
        end;
        if v5.routes and v5.index ~= nil then
            local v7 = v5.routes[v5.index];
            v6 = l_Array_0.concat(v6, v4(v7));
        end;
        return v6;
    end;
end;
return v4;