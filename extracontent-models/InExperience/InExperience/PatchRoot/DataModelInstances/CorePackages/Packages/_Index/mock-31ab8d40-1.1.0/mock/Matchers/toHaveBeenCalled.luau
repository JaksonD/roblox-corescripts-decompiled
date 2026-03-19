local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.MagicMock);
local v2 = require(l_Parent_0.Spy);
local v3 = require(l_Parent_0.getCalls);
return function(v4, v5) --[[ Line: 6 ]]
    -- upvalues: v1 (copy), v2 (copy), v3 (copy)
    if not (v1.is(v4) or v2.is(v4)) then
        return {
            pass = false, 
            message = string.format("expect(mock) must be a MagicMock or Spy when .toHaveBeenCalled is used. Given %s instead", (tostring(v4)))
        };
    else
        local v6 = #v3(v4);
        local v7 = nil;
        local v8 = nil;
        if v5 then
            local v9 = false;
            if type(v5) == "number" then
                v9 = false;
                if v5 > 0 then
                    v9 = v5 % 1 == 0;
                end;
            end;
            if v9 then
                v7 = v5 == v6;
                v8 = v7 and string.format("Expected %s to not have been called exactly %d times.", tostring(v4), v5) or string.format("Expected %s to have been called %d times. Was called %d times instead.", tostring(v4), v5, v6);
            else
                return {
                    pass = false, 
                    message = string.format("expectedTimesCalled must be a positive integer. Given %s instead.", (tostring(v5)))
                };
            end;
        else
            v7 = v6 > 0;
            v8 = v7 and string.format("Expected %s to never have been called. Was called %d times instead.", tostring(v4), v6) or string.format("Expected %s to have been called at least once.", (tostring(v4)));
        end;
        return {
            pass = v7, 
            message = v8
        };
    end;
end;