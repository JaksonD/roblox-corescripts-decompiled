local _ = require(script.Parent.types);
return function() --[[ Line: 25 ]] --[[ Name: createSignal ]]
    local v1 = {};
    local v2 = {};
    local v3 = false;
    local function v8(_, v5) --[[ Line: 31 ]] --[[ Name: subscribe ]]
        -- upvalues: v3 (ref), v1 (copy), v2 (copy)
        local v6 = {
            callback = v5, 
            unsubscribed = false
        };
        if v3 and not v1[v5] then
            v2[v5] = v6;
        else
            v1[v5] = v6;
        end;
        return {
            unsubscribe = function(_) --[[ Line: 45 ]] --[[ Name: unsubscribe ]]
                -- upvalues: v6 (copy), v1 (ref), v5 (copy), v2 (ref)
                v6.unsubscribed = true;
                v1[v5] = nil;
                v2[v5] = nil;
            end
        };
    end;
    local function v14(v9) --[[ Line: 56 ]] --[[ Name: fire ]]
        -- upvalues: v3 (ref), v1 (copy), v2 (copy)
        v3 = true;
        for v10, v11 in v1 do
            if not v11.unsubscribed and not v2[v10] then
                v10(v9);
            end;
        end;
        v3 = false;
        for v12, v13 in v2 do
            v1[v12] = v13;
        end;
        table.clear(v2);
    end;
    return {
        subscribe = v8
    }, v14;
end;