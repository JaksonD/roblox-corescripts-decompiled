local l_Parent_0 = script:FindFirstAncestor("ServerDrivenUi").Parent;
local v1 = require(l_Parent_0.React);
return function(v2) --[[ Line: 21 ]] --[[ Name: useUniformItemHeight ]]
    -- upvalues: v1 (copy)
    local v3 = v1.useRef({});
    local v4 = v1.useRef(false);
    local v5 = v1.useRef(0);
    local v6, v7 = v1.useState(nil);
    local v8, v9 = v1.useBinding(nil);
    local v17 = v1.useCallback(function(v10, v11) --[[ Line: 29 ]]
        -- upvalues: v2 (copy), v5 (copy), v3 (copy), v7 (copy), v9 (copy), v4 (copy)
        if not v2 then
            return;
        else
            local l_X_0 = v11.AbsoluteSize.X;
            local l_Y_0 = v11.AbsoluteSize.Y;
            if v5.current > 0 and math.abs(l_X_0 - v5.current) > 1 then
                v5.current = l_X_0;
                v3.current = {};
                v7(nil);
                v9(nil);
                return;
            else
                v5.current = l_X_0;
                if l_Y_0 <= 0 or v3.current[v10] == l_Y_0 then
                    return;
                else
                    v3.current[v10] = l_Y_0;
                    if not v4.current then
                        v4.current = true;
                        task.defer(function() --[[ Line: 53 ]]
                            -- upvalues: v4 (ref), v3 (ref), v9 (ref), v7 (ref)
                            v4.current = false;
                            local v14 = 0;
                            for _, v16 in v3.current do
                                v14 = math.max(v14, v16);
                            end;
                            if v14 > 0 then
                                v9(v14);
                                v7(v14);
                            end;
                        end);
                    end;
                    return;
                end;
            end;
        end;
    end, {
        v2
    });
    return {
        measuredMaxHeight = if v2 then v6 else nil, 
        measuredMaxHeightBinding = if v2 then v8 else nil, 
        onItemSizeChanged = if v2 then v17 else nil
    };
end;