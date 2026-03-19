local l_Parent_0 = script.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local l_Parent_2 = l_Parent_1.Parent;
local v3 = require(l_Parent_1.Set);
local v4 = require(l_Parent_1.Map.Map);
local v5 = require(l_Parent_0.isArray);
local v6 = require(l_Parent_2.InstanceOf);
local _ = require(l_Parent_2.ES7Types);
local v8 = require(script.fromString);
local v9 = require(script.fromSet);
local v10 = require(script.fromMap);
local v11 = require(script.fromArray);
return function(v12, v13, v14) --[[ Line: 37 ]]
    -- upvalues: v5 (copy), v11 (copy), v6 (copy), v3 (copy), v9 (copy), v4 (copy), v10 (copy), v8 (copy)
    if v12 == nil then
        error("cannot create array from a nil value");
    end;
    local v15 = typeof(v12);
    local _ = nil;
    if v15 == "table" and v5(v12) then
        return (v11(v12, v13, v14));
    elseif v6(v12, v3) then
        return (v9(v12, v13, v14));
    elseif v6(v12, v4) then
        return (v10(v12, v13, v14));
    elseif v15 == "string" then
        return (v8(v12, v13, v14));
    else
        return {};
    end;
end;