local l_Parent_0 = script:FindFirstAncestor("Impressions").Parent;
local v1 = require(l_Parent_0.Display);
local v2 = require(l_Parent_0.React);
local v3 = require(l_Parent_0.Signals);
local v4 = require(l_Parent_0.SignalsReact);
local v5 = game:DefineFastFlag("LuaAppFixFrameBoundsImpressions", false);
local v6 = game:DefineFastInt("LuaAppUpdateImpressionsViewportBoundsPositionThreshold", 50);
local v7 = game:DefineFastFlag("LuaAppThrottleViewportBoundsScreenSize", false);
local v8 = game:DefineFastInt("LuaAppViewportBoundsScreenSizeThreshold", 50);
local function _(v9, v10) --[[ Line: 26 ]] --[[ Name: boundsEqual ]]
    local v11 = false;
    if v9.min == v10.min then
        v11 = v9.max == v10.max;
    end;
    return v11;
end;
local function v17(v13, v14) --[[ Line: 30 ]] --[[ Name: screenSizeBoundsEqual ]]
    -- upvalues: v8 (copy)
    local l_v8_0 = v8;
    local v16 = false;
    if math.abs(v13.max.X - v14.max.X) < l_v8_0 then
        v16 = false;
        if math.abs(v13.max.Y - v14.max.Y) < l_v8_0 then
            v16 = false;
            if v13.min.X == v14.min.X then
                v16 = v13.min.Y == v14.min.Y;
            end;
        end;
    end;
    return v16;
end;
local v18 = {
    min = Vector2.zero, 
    max = Vector2.zero
};
local function v28(v19, v20, v21) --[[ Line: 40 ]] --[[ Name: calculateClampedViewportBounds ]]
    -- upvalues: v5 (copy), v18 (copy)
    local v22 = v19 or Vector2.zero;
    local v23 = v22 + (v20 or Vector2.zero);
    local v24 = math.max(v21.min.X, v22.X);
    local v25 = math.min(v21.max.X, v23.X);
    local v26 = math.max(v21.min.Y, v22.Y);
    local v27 = math.min(v21.max.Y, v23.Y);
    if v5 and (v25 <= v24 or v27 <= v26) then
        return v18;
    else
        return {
            min = Vector2.new(v24, v26), 
            max = Vector2.new(v25, v27)
        };
    end;
end;
return function(v29) --[[ Line: 61 ]]
    -- upvalues: v7 (copy), v2 (copy), v3 (copy), v1 (copy), v17 (copy), v4 (copy), v18 (copy), v5 (copy), v28 (copy), v6 (copy), v8 (copy)
    local v30 = nil;
    if v7 then
        local v36 = v2.useMemo(function() --[[ Line: 65 ]]
            -- upvalues: v3 (ref), v1 (ref), v17 (ref)
            return v3.createComputed(function(v31) --[[ Line: 66 ]]
                -- upvalues: v1 (ref)
                local v32 = v1.GetDisplayStore(v31);
                local v33 = v32.getViewportSize(v31);
                local v34 = v32.getTopBarHeight(v31);
                local v35 = v32.getGuiInset(v31);
                return {
                    min = Vector2.new(0, v34), 
                    max = Vector2.new(v33.X, v33.Y - v35.bottom)
                };
            end, v17);
        end, {});
        v30 = v4.useSignalState(v36);
    else
        local v38 = v4.useSignalState(function(v37) --[[ Line: 80 ]]
            -- upvalues: v1 (ref)
            return v1.GetDisplayStore(v37).getViewportSize(v37);
        end);
        local v40 = v4.useSignalState(function(v39) --[[ Line: 83 ]]
            -- upvalues: v1 (ref)
            return v1.GetDisplayStore(v39).getTopBarHeight(v39);
        end);
        local v42 = v4.useSignalState(function(v41) --[[ Line: 86 ]]
            -- upvalues: v1 (ref)
            return v1.GetDisplayStore(v41).getGuiInset(v41);
        end);
        local l_v40_0 = v40 --[[ copy: 3 -> 5 ]];
        local l_v38_0 = v38 --[[ copy: 2 -> 6 ]];
        local l_v42_0 = v42 --[[ copy: 4 -> 7 ]];
        v30 = v2.useMemo(function() --[[ Line: 90 ]]
            -- upvalues: l_v40_0 (copy), l_v38_0 (copy), l_v42_0 (copy)
            return {
                min = Vector2.new(0, l_v40_0), 
                max = Vector2.new(l_v38_0.X, l_v38_0.Y - l_v42_0.bottom)
            };
        end, {
            v40, 
            v38, 
            v42
        });
    end;
    local v46, v47 = v2.useState(v18);
    local v52 = if v5 then v2.useCallback(function(v48) --[[ Line: 101 ]]
        -- upvalues: v47 (copy)
        v47(function(v49) --[[ Line: 102 ]]
            -- upvalues: v48 (copy)
            local l_v48_0 = v48;
            local v51 = false;
            if v49.min == l_v48_0.min then
                v51 = v49.max == l_v48_0.max;
            end;
            if v51 then
                return v49;
            else
                return v48;
            end;
        end);
    end, {}) else v47;
    v2.useEffect(function() --[[ Line: 111 ]]
        -- upvalues: v29 (copy), v5 (ref), v7 (ref), v52 (copy), v28 (ref), v30 (ref), v6 (ref), v8 (ref)
        local v53 = {};
        local v54 = nil;
        if v29 then
            v54 = v29.current;
        end;
        if v54 then
            local l_AbsolutePosition_0 = v54.AbsolutePosition;
            local l_AbsoluteSize_0 = v54.AbsoluteSize;
            local v57 = if v5 then l_AbsolutePosition_0 else nil;
            local v58 = if v7 then l_AbsoluteSize_0 else nil;
            v52((v28(l_AbsolutePosition_0, l_AbsoluteSize_0, v30)));
            do
                local l_l_AbsolutePosition_0_0, l_l_AbsoluteSize_0_0, l_v57_0, l_v58_0 = l_AbsolutePosition_0, l_AbsoluteSize_0, v57, v58;
                table.insert(v53, v54:GetPropertyChangedSignal("AbsolutePosition"):Connect(function() --[[ Line: 134 ]]
                    -- upvalues: l_l_AbsolutePosition_0_0 (ref), v54 (ref), v5 (ref), v6 (ref), l_v57_0 (ref), v52 (ref), v28 (ref), l_l_AbsoluteSize_0_0 (ref), v30 (ref)
                    l_l_AbsolutePosition_0_0 = v54.AbsolutePosition;
                    if v5 then
                        local l_v6_0 = v6;
                        local v64 = l_l_AbsolutePosition_0_0 - l_v57_0;
                        if math.abs(v64.X) < l_v6_0 and math.abs(v64.Y) < l_v6_0 then
                            return;
                        else
                            l_v57_0 = l_l_AbsolutePosition_0_0;
                        end;
                    end;
                    v52((v28(l_l_AbsolutePosition_0_0, l_l_AbsoluteSize_0_0, v30)));
                end));
                table.insert(v53, v54:GetPropertyChangedSignal("AbsoluteSize"):Connect(function() --[[ Line: 157 ]]
                    -- upvalues: l_l_AbsoluteSize_0_0 (ref), v54 (ref), v7 (ref), v8 (ref), l_v58_0 (ref), v52 (ref), v28 (ref), l_l_AbsolutePosition_0_0 (ref), v30 (ref)
                    l_l_AbsoluteSize_0_0 = v54.AbsoluteSize;
                    if v7 then
                        local l_v8_1 = v8;
                        local v66 = l_l_AbsoluteSize_0_0 - l_v58_0;
                        if math.abs(v66.X) < l_v8_1 and math.abs(v66.Y) < l_v8_1 then
                            return;
                        else
                            l_v58_0 = l_l_AbsoluteSize_0_0;
                        end;
                    end;
                    v52((v28(l_l_AbsolutePosition_0_0, l_l_AbsoluteSize_0_0, v30)));
                end));
            end;
        else
            v52(v30);
        end;
        return function() --[[ Line: 178 ]]
            -- upvalues: v53 (copy)
            for _, v68 in v53 do
                v68:Disconnect();
            end;
        end;
    end, {
        v29, 
        v30
    });
    return v46;
end;