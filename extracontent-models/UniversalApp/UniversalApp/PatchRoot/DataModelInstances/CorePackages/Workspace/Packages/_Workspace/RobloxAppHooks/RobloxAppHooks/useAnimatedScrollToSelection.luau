local l_Parent_0 = script:FindFirstAncestor("RobloxAppHooks").Parent;
local v1 = require(l_Parent_0.React);
local v2 = require(l_Parent_0.ReactOtter);
local v3 = {
    dampingRatio = 1, 
    frequency = 3
};
local function _(v4, v5, v6, v7, v8) --[[ Line: 10 ]] --[[ Name: calculateTargetScrollOffset ]]
    local v9 = if v6 == Enum.ScrollingDirection.X then v4.CanvasPosition.X + (v5.AbsolutePosition.X - v4.AbsolutePosition.X) else v4.CanvasPosition.Y + (v5.AbsolutePosition.Y - v4.AbsolutePosition.Y);
    if v9 < v8 then
        return 0;
    else
        return (math.max(v9 - v7, 0));
    end;
end;
return function(v11, v12, v13, v14) --[[ Line: 28 ]] --[[ Name: useAnimatedScrollToSelection ]]
    -- upvalues: v3 (copy), v2 (copy), v1 (copy)
    local v15 = v12 or 0;
    local v16 = v13 or 0;
    local v17 = v14 or v3;
    local v18, v19 = v2.useAnimatedBinding(0);
    local v29 = v1.useCallback(function(v20, v21, _, v23) --[[ Line: 41 ]]
        -- upvalues: v11 (copy), v15 (copy), v16 (copy), v19 (copy), v2 (ref), v17 (copy)
        if v21 then
            return;
        else
            if v23 and v23:IsDescendantOf(v20) then
                local l_v11_0 = v11;
                local l_v15_0 = v15;
                local l_v16_0 = v16;
                local v27 = if l_v11_0 == Enum.ScrollingDirection.X then v20.CanvasPosition.X + (v23.AbsolutePosition.X - v20.AbsolutePosition.X) else v20.CanvasPosition.Y + (v23.AbsolutePosition.Y - v20.AbsolutePosition.Y);
                local v28 = v27 < l_v16_0 and 0 or math.max(v27 - l_v15_0, 0);
                v19(v2.spring(v28, v17));
            end;
            return;
        end;
    end, {
        v15, 
        v11, 
        v16, 
        v17
    });
    return v1.useMemo(function() --[[ Line: 59 ]]
        -- upvalues: v18 (copy), v11 (copy)
        return v18:map(function(v30) --[[ Line: 60 ]]
            -- upvalues: v11 (ref)
            if v11 == Enum.ScrollingDirection.X then
                return (Vector2.new(v30, 0));
            else
                return (Vector2.new(0, v30));
            end;
        end);
    end, {
        v11
    }), v29;
end;