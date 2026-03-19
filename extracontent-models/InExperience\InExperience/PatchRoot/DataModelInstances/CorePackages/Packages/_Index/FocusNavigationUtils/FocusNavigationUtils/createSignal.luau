return function(v0) --[[ Line: 29 ]] --[[ Name: createSignal ]]
    local v1 = {};
    local v2 = {};
    local l_v0_0 = v0;
    local v4 = false;
    local function v9(_, v6) --[[ Line: 36 ]] --[[ Name: subscribe ]]
        -- upvalues: v4 (ref), v1 (copy), v2 (copy)
        local v7 = {
            callback = v6, 
            unsubscribed = false
        };
        if v4 and not v1[v6] then
            v2[v6] = v7;
        else
            v1[v6] = v7;
        end;
        return {
            unsubscribe = function(_) --[[ Line: 50 ]] --[[ Name: unsubscribe ]]
                -- upvalues: v7 (copy), v1 (ref), v6 (copy), v2 (ref)
                v7.unsubscribed = true;
                v1[v6] = nil;
                v2[v6] = nil;
            end
        };
    end;
    local function v11(_) --[[ Line: 61 ]] --[[ Name: getValue ]]
        -- upvalues: l_v0_0 (ref)
        return l_v0_0;
    end;
    local function v17(v12) --[[ Line: 65 ]] --[[ Name: fire ]]
        -- upvalues: l_v0_0 (ref), v4 (ref), v1 (copy), v2 (copy)
        l_v0_0 = v12;
        v4 = true;
        for v13, v14 in v1 do
            if not v14.unsubscribed and not v2[v13] then
                v13(v12);
            end;
        end;
        v4 = false;
        for v15, v16 in v2 do
            v1[v15] = v16;
        end;
        table.clear(v2);
    end;
    return {
        subscribe = v9, 
        getValue = v11
    }, v17;
end;