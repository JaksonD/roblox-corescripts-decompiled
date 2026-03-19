local l_Parent_0 = script:FindFirstAncestor("GuiObjectUtils").Parent;
local v1 = require(l_Parent_0.React);
local function _(v2) --[[ Line: 10 ]] --[[ Name: getRefValue ]]
    if typeof(v2) == "table" then
        return v2.current;
    else
        return v2;
    end;
end;
return function(v4, v5) --[[ Line: 47 ]] --[[ Name: useProperty ]]
    -- upvalues: v1 (copy)
    local v6 = if typeof(v4) == "table" then v4.current else v4;
    local v7, v8 = v1.useState(function() --[[ Line: 50 ]]
        -- upvalues: v6 (copy), v5 (copy)
        if v6 then
            return v6[v5];
        else
            return nil;
        end;
    end);
    local v11 = v1.useCallback(function() --[[ Line: 55 ]]
        -- upvalues: v4 (copy), v5 (copy), v8 (copy)
        local l_v4_0 = v4;
        local v10 = if typeof(l_v4_0) == "table" then l_v4_0.current else l_v4_0;
        if v10 then
            l_v4_0 = v10[v5];
            v8(l_v4_0);
        end;
    end, {
        v4, 
        v5
    });
    v1.useEffect(function() --[[ Line: 66 ]]
        -- upvalues: v4 (copy), v5 (copy), v11 (copy)
        local v12 = nil;
        local l_v4_1 = v4;
        local v14 = if typeof(l_v4_1) == "table" then l_v4_1.current else l_v4_1;
        if v14 then
            v12 = v14:GetPropertyChangedSignal(v5):Connect(v11);
            v11();
        end;
        return function() --[[ Line: 76 ]]
            -- upvalues: v12 (ref)
            if v12 then
                v12:Disconnect();
            end;
        end;
    end, {
        v6, 
        v5, 
        v11
    });
    return v7;
end;