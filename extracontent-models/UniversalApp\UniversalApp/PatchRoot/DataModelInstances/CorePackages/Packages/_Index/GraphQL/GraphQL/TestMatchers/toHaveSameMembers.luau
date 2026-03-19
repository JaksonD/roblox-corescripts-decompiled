local l_Parent_0 = script.Parent.Parent.Parent;
local l_inspect_0 = require(l_Parent_0.LuauPolyfill).util.inspect;
local v2 = require(script.Parent.Parent.luaUtils.arrayContains);
return function(v3, v4, v5) --[[ Line: 20 ]] --[[ Name: toHaveSameMembers ]]
    -- upvalues: v2 (copy), l_inspect_0 (copy)
    if not (#v3 == #v4) then
        return {
            pass = false, 
            message = ("Received array length %s / expected length %s"):format(tostring(#v3), (tostring(#v4)))
        };
    else
        for _, v7 in ipairs(v4) do
            if not v2(v3, v7, v5) then
                return {
                    pass = false, 
                    message = ("Expected item %s to be in Array %s"):format(l_inspect_0(v7), l_inspect_0(v3))
                };
            end;
        end;
        return {
            pass = true, 
            message = ""
        };
    end;
end;