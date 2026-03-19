local l_Parent_0 = script:FindFirstAncestor("ReactUtils").Parent;
local v1 = require(l_Parent_0.React);
local l_Array_0 = require(l_Parent_0.LuauPolyfill).Array;
local v3 = require(script.Parent.useForwardRef);
return function(v4, v5, v6, ...) --[[ Line: 15 ]] --[[ Name: usePropertiesBase ]]
    -- upvalues: l_Array_0 (copy), v1 (copy), v3 (copy)
    local v7 = l_Array_0.concat({}, ...);
    local v19 = v1.useCallback(function(v8) --[[ Line: 23 ]]
        -- upvalues: v5 (copy), l_Array_0 (ref), v7 (copy), v6 (copy)
        local function v10() --[[ Line: 24 ]] --[[ Name: onPropChange ]]
            -- upvalues: v5 (ref), l_Array_0 (ref), v7 (ref), v8 (copy)
            v5(table.unpack(l_Array_0.map(v7, function(v9) --[[ Line: 25 ]]
                -- upvalues: v8 (ref)
                return v8[v9];
            end)));
        end;
        local v11 = nil;
        local function v13() --[[ Line: 31 ]]
            -- upvalues: v11 (ref), v5 (ref), l_Array_0 (ref), v7 (ref), v8 (copy)
            if not v11 then
                v11 = task.defer(function() --[[ Line: 33 ]]
                    -- upvalues: v11 (ref), v5 (ref), l_Array_0 (ref), v7 (ref), v8 (ref)
                    v11 = nil;
                    v5(table.unpack(l_Array_0.map(v7, function(v12) --[[ Line: 25 ]]
                        -- upvalues: v8 (ref)
                        return v8[v12];
                    end)));
                end);
            end;
        end;
        local v15 = l_Array_0.map(v7, function(v14) --[[ Line: 39 ]]
            -- upvalues: v8 (copy), v6 (ref), v13 (copy), v10 (copy)
            return v8:GetPropertyChangedSignal(v14):Connect(if v6 then v13 else v10);
        end);
        v5(table.unpack(l_Array_0.map(v7, function(v16) --[[ Line: 25 ]]
            -- upvalues: v8 (copy)
            return v8[v16];
        end)));
        return function() --[[ Line: 45 ]]
            -- upvalues: v15 (copy), v11 (ref)
            for _, v18 in v15 do
                v18:Disconnect();
            end;
            if v11 then
                task.cancel(v11);
            end;
        end;
    end, {
        v5, 
        table.concat(v7, ",")
    });
    return v3(v4, v19);
end;