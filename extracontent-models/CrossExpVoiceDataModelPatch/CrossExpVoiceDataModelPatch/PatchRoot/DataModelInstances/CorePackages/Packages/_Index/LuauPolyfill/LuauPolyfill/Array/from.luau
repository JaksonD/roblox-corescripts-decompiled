local l_Parent_0 = script.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local v2 = require(l_Parent_0.isArray);
local v3 = require(l_Parent_1.instanceof);
local v4 = require(l_Parent_1.Set);
local v5 = require(l_Parent_1.Map);
local v6 = require(script.fromString);
local v7 = require(script.fromSet);
local v8 = require(script.fromMap);
local v9 = require(script.fromArray);
local _ = require(l_Parent_1.types);
return function(v11, v12, v13) --[[ Line: 23 ]]
    -- upvalues: v2 (copy), v9 (copy), v3 (copy), v4 (copy), v7 (copy), v5 (copy), v8 (copy), v6 (copy)
    if v11 == nil then
        error("cannot create array from a nil value");
    end;
    local v14 = typeof(v11);
    local _ = nil;
    if v14 == "table" and v2(v11) then
        return (v9(v11, v12, v13));
    elseif v3(v11, v4) then
        return (v7(v11, v12, v13));
    elseif v3(v11, v5) then
        return (v8(v11, v12, v13));
    elseif v14 == "string" then
        return (v6(v11, v12, v13));
    else
        return {};
    end;
end;