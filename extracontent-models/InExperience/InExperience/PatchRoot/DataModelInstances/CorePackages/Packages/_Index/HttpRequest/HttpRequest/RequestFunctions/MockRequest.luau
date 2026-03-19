local l_Parent_0 = script:FindFirstAncestor("HttpRequest").Parent;
local v1 = require(l_Parent_0.Cryo);
return function(v2, v3, v4) --[[ Line: 4 ]]
    -- upvalues: v1 (copy)
    return {
        Start = function(_, v6) --[[ Line: 6 ]] --[[ Name: Start ]]
            -- upvalues: v4 (copy), v1 (ref), v2 (copy), v3 (copy)
            local v7 = {};
            if type(v4.mockResponse) == "function" then
                v7 = v4.mockResponse();
            elseif v4.mockResponse then
                v7 = v4.mockResponse;
            end;
            local v8 = v1.Dictionary.join({
                Url = v2, 
                Method = v3
            }, v7);
            v6(v4.success, v8);
        end, 
        Cancel = function() --[[ Line: 21 ]] --[[ Name: Cancel ]]
            -- upvalues: v4 (copy)
            if v4.cancel then
                v4.cancel();
            end;
        end
    };
end;