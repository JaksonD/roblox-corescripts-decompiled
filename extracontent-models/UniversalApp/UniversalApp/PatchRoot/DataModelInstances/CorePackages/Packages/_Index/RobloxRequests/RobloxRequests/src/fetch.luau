local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Promise);
createFetch = function(v2) --[[ Line: 9 ]] --[[ Name: createFetch ]]
    -- upvalues: v1 (copy)
    return function(v3, v4) --[[ Line: 10 ]] --[[ Name: fetch ]]
        -- upvalues: v2 (copy), v1 (ref)
        if v4 == nil then
            v4 = {};
        end;
        local v5 = v4.method or "GET";
        v4.method = nil;
        v4.data = v4.body;
        v4.body = nil;
        return v2(v5, v3, v4):andThen(function(v6) --[[ Line: 19 ]]
            -- upvalues: v1 (ref)
            local l_text_0 = v6.text;
            v6.text = function() --[[ Line: 21 ]]
                -- upvalues: v1 (ref), l_text_0 (copy)
                return v1.resolve(l_text_0);
            end;
            v6.status = v6.code;
            return v6;
        end);
    end;
end;
return createFetch;