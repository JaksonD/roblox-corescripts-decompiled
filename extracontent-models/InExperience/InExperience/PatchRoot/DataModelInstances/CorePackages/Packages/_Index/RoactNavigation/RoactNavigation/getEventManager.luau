return function(v0) --[[ Line: 3 ]] --[[ Name: getEventManager ]]
    local v1 = {};
    local function _(v2, v3) --[[ Line: 6 ]] --[[ Name: removeListener ]]
        -- upvalues: v1 (copy), v0 (copy)
        local v4 = v1[v2];
        local v5 = if v4 then v4[v0] else nil;
        if not v5 then
            return;
        else
            local v6 = table.find(v5, v3);
            table.remove(v5, v6);
            return;
        end;
    end;
    return {
        addListener = function(v8, v9) --[[ Line: 18 ]] --[[ Name: addListener ]]
            -- upvalues: v1 (copy), v0 (copy)
            v1[v8] = v1[v8] or {};
            v1[v8][v0] = v1[v8][v0] or {};
            table.insert(v1[v8][v0], v9);
            return {
                remove = function() --[[ Line: 25 ]] --[[ Name: remove ]]
                    -- upvalues: v8 (copy), v9 (copy), v1 (ref), v0 (ref)
                    local l_v8_0 = v8;
                    local l_v9_0 = v9;
                    local v12 = v1[l_v8_0];
                    local v13 = if v12 then v12[v0] else nil;
                    if not v13 then
                        return;
                    else
                        local v14 = table.find(v13, l_v9_0);
                        table.remove(v13, v14);
                        return;
                    end;
                end
            };
        end, 
        emit = function(v15, v16) --[[ Line: 33 ]] --[[ Name: emit ]]
            -- upvalues: v1 (copy), v0 (copy)
            local v17 = v1[v15] or {};
            local v18 = if v17[v0] then table.clone(v17[v0]) else nil;
            if v18 then
                for _, v20 in v18 do
                    v20(v16);
                end;
            end;
        end
    };
end;