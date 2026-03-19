local l_Parent_0 = script.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local l_inspect_0 = require(l_Parent_1.LuauPolyfill).util.inspect;
local v3 = require(l_Parent_0.luaUtils.arrayContains);
return function(v4, v5, v6) --[[ Line: 20 ]] --[[ Name: toArrayContains ]]
    -- upvalues: v3 (copy), l_inspect_0 (copy)
    local v7 = v3(v4, v5, v6);
    local v8 = "";
    if not v7 then
        v8 = "received tbl: " .. l_inspect_0(v5) .. " expected item to be in table: " .. l_inspect_0(v4);
    end;
    return {
        pass = v7, 
        message = v8
    };
end;