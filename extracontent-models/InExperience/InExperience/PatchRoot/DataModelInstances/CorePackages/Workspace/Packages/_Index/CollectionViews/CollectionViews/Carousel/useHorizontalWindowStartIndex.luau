local l_Parent_0 = script:FindFirstAncestor("CollectionViews").Parent;
local v1 = require(l_Parent_0.React);
return function(v2, v3, v4, v5) --[[ Line: 8 ]] --[[ Name: useHorizontalWindowStartIndex ]]
    -- upvalues: v1 (copy)
    local v6, v7 = v1.useState(1);
    local v11 = v1.useCallback(function() --[[ Line: 18 ]]
        -- upvalues: v5 (copy), v2 (copy), v3 (copy), v4 (copy), v7 (copy)
        if v5 then
            if v2.current ~= nil then
                local l_X_0 = v3:getValue().X;
                local l_X_1 = v2.current.CanvasPosition.X;
                local v10 = l_X_0 + v4;
                if v10 > 0 then
                    v7((math.max(1, (math.floor(l_X_1 / v10)))));
                    return;
                else
                    v7(1);
                    return;
                end;
            end;
        else
            v7(1);
        end;
    end, {
        v5, 
        v2, 
        v3, 
        v4
    });
    v1.useEffect(function() --[[ Line: 43 ]]
        -- upvalues: v11 (copy)
        v11();
    end, {
        v11
    });
    v1.useEffect(function() --[[ Line: 51 ]]
        -- upvalues: v5 (copy), v2 (copy), v11 (copy)
        if not v5 then
            return nil;
        else
            local v12 = {};
            if v2.current ~= nil then
                v11();
                table.insert(v12, v2.current:GetPropertyChangedSignal("CanvasPosition"):Connect(v11));
                table.insert(v12, v2.current:GetPropertyChangedSignal("AbsoluteCanvasSize"):Connect(v11));
            end;
            return function() --[[ Line: 67 ]]
                -- upvalues: v12 (copy)
                for _, v14 in v12 do
                    v14:Disconnect();
                end;
            end;
        end;
    end, {
        v2, 
        v11, 
        v5
    });
    return v6;
end;