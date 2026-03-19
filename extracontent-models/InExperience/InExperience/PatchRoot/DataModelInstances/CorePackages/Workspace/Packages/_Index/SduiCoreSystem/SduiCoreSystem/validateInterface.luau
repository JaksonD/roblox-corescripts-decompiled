local l_Parent_0 = script:FindFirstAncestor("SduiCoreSystem").Parent;
local v1 = require(l_Parent_0.t);
return function(v2, v3, v4) --[[ Line: 11 ]] --[[ Name: validateInterface ]]
    -- upvalues: v1 (copy)
    if v4 == nil then
        v4 = true;
    end;
    return (if v4 then v1.interface(v3) else v1.strictInterface(v3))(v2);
end;