local l_Number_0 = require(script.Parent.Parent.Parent.LuauPolyfill).Number;
return function(v1) --[[ Line: 17 ]] --[[ Name: toBeNaN ]]
    -- upvalues: l_Number_0 (copy)
    local v2 = l_Number_0.isNaN(v1);
    if v2 then
        return {
            pass = v2
        };
    else
        return {
            pass = false, 
            message = ("expected: NaN (number), got: \"%s\" (%s) instead"):format(tostring(v1), (typeof(v1)))
        };
    end;
end;