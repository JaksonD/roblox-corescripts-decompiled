local l_Parent_0 = script:FindFirstAncestor("Impressions").Parent;
local v1 = require(l_Parent_0.Display);
local v2 = require(l_Parent_0.React);
local v3 = require(l_Parent_0.SignalsReact);
local function v13(v4, v5, v6) --[[ Line: 19 ]] --[[ Name: calculateClampedViewportBounds ]]
    local v7 = v4 or Vector2.zero;
    local v8 = v7 + (v5 or Vector2.zero);
    local v9 = math.max(v6.min.X, v7.X);
    local v10 = math.min(v6.max.X, v8.X);
    local v11 = math.max(v6.min.Y, v7.Y);
    local v12 = math.min(v6.max.Y, v8.Y);
    return {
        min = Vector2.new(v9, v11), 
        max = Vector2.new(v10, v12)
    };
end;
return function(v14) --[[ Line: 34 ]]
    -- upvalues: v3 (copy), v1 (copy), v2 (copy), v13 (copy)
    local v15 = nil;
    local v17 = v3.useSignalState(function(v16) --[[ Line: 36 ]]
        -- upvalues: v1 (ref)
        return v1.GetDisplayStore(v16).getViewportSize(v16);
    end);
    local v19 = v3.useSignalState(function(v18) --[[ Line: 39 ]]
        -- upvalues: v1 (ref)
        return v1.GetDisplayStore(v18).getTopBarHeight(v18);
    end);
    local v21 = v3.useSignalState(function(v20) --[[ Line: 42 ]]
        -- upvalues: v1 (ref)
        return v1.GetDisplayStore(v20).getGuiInset(v20);
    end);
    v15 = v2.useMemo(function() --[[ Line: 46 ]]
        -- upvalues: v19 (copy), v17 (copy), v21 (copy)
        return {
            min = Vector2.new(0, v19), 
            max = Vector2.new(v17.X, v17.Y - v21.bottom)
        };
    end, {
        v19, 
        v17, 
        v21
    });
    local v22, v23 = v2.useState({
        min = Vector2.zero, 
        max = Vector2.zero
    });
    v2.useEffect(function() --[[ Line: 58 ]]
        -- upvalues: v14 (copy), v23 (copy), v13 (ref), v15 (ref)
        local v24 = {};
        local v25 = nil;
        if v14 then
            v25 = v14.current;
        end;
        if v25 then
            local l_AbsolutePosition_0 = v25.AbsolutePosition;
            local l_AbsoluteSize_0 = v25.AbsoluteSize;
            v23((v13(l_AbsolutePosition_0, l_AbsoluteSize_0, v15)));
            do
                local l_l_AbsolutePosition_0_0, l_l_AbsoluteSize_0_0 = l_AbsolutePosition_0, l_AbsoluteSize_0;
                table.insert(v24, v25:GetPropertyChangedSignal("AbsolutePosition"):Connect(function() --[[ Line: 75 ]]
                    -- upvalues: l_l_AbsolutePosition_0_0 (ref), v25 (ref), v23 (ref), v13 (ref), l_l_AbsoluteSize_0_0 (ref), v15 (ref)
                    l_l_AbsolutePosition_0_0 = v25.AbsolutePosition;
                    v23((v13(l_l_AbsolutePosition_0_0, l_l_AbsoluteSize_0_0, v15)));
                end));
                table.insert(v24, v25:GetPropertyChangedSignal("AbsoluteSize"):Connect(function() --[[ Line: 88 ]]
                    -- upvalues: l_l_AbsoluteSize_0_0 (ref), v25 (ref), v23 (ref), v13 (ref), l_l_AbsolutePosition_0_0 (ref), v15 (ref)
                    l_l_AbsoluteSize_0_0 = v25.AbsoluteSize;
                    v23((v13(l_l_AbsolutePosition_0_0, l_l_AbsoluteSize_0_0, v15)));
                end));
            end;
        else
            v23(v15);
        end;
        return function() --[[ Line: 97 ]]
            -- upvalues: v24 (copy)
            for _, v31 in v24 do
                v31:Disconnect();
            end;
        end;
    end, {
        v14, 
        v15
    });
    return v22;
end;