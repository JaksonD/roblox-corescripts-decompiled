local l_Parent_0 = script.Parent.Parent.Parent;
local l_inspect_0 = require(l_Parent_0.LuauPolyfill).util.inspect;
local v2 = require(script.Parent.Parent.luaUtils.deepContains);
return function(v3, v4) --[[ Line: 20 ]] --[[ Name: toObjectContain ]]
    -- upvalues: v2 (copy), l_inspect_0 (copy)
    local v5 = v2(v3, v4);
    local v6 = "";
    if not v5 then
        v6 = "received tbl: " .. l_inspect_0(v4) .. " expected item to be in table: " .. l_inspect_0(v3);
    end;
    return {
        pass = v5, 
        message = v6
    };
end;