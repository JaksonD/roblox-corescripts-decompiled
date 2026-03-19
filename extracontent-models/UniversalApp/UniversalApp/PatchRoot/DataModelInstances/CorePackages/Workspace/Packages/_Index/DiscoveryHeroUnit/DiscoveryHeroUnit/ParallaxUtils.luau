local l_Parent_0 = script:FindFirstAncestor("DiscoveryHeroUnit").Parent;
local v1 = require(l_Parent_0.React);
local function v7(v2, v3) --[[ Line: 8 ]] --[[ Name: getNormalizedCenterPosition ]]
    if v3 and v2 then
        local l_Y_0 = v2.AbsolutePosition.Y;
        local l_Y_1 = v2.AbsoluteWindowSize.Y;
        local v6 = v3.AbsolutePosition.Y + v2.CanvasPosition.Y - l_Y_0 + v3.AbsoluteSize.Y * 0.5 - v2.CanvasPosition.Y;
        if l_Y_1 == 0 then
            return nil;
        else
            return v6 / l_Y_1;
        end;
    else
        return nil;
    end;
end;
local function v28(v8, v9) --[[ Line: 34 ]] --[[ Name: useNormalizedVerticalProgress ]]
    -- upvalues: v1 (copy)
    local v10, v11 = v1.useBinding(-1);
    v1.useEffect(function() --[[ Line: 41 ]]
        -- upvalues: v8 (copy), v9 (copy), v11 (copy)
        local v12 = {};
        if v8 and v8.current and v9.current then
            local l_current_0 = v9.current;
            local l_current_1 = v8.current;
            local l_Y_2 = l_current_1.AbsolutePosition.Y;
            local l_Y_3 = l_current_1.AbsoluteWindowSize.Y;
            do
                local l_l_Y_2_0, l_l_Y_3_0 = l_Y_2, l_Y_3;
                local function _() --[[ Line: 51 ]] --[[ Name: calculateOffset ]]
                    -- upvalues: l_current_0 (copy), l_current_1 (copy), l_l_Y_2_0 (ref)
                    return l_current_0.AbsolutePosition.Y + l_current_1.CanvasPosition.Y - l_l_Y_2_0;
                end;
                local v20 = l_current_0.AbsolutePosition.Y + l_current_1.CanvasPosition.Y - l_l_Y_2_0;
                local function v22() --[[ Line: 58 ]] --[[ Name: updateBinding ]]
                    -- upvalues: l_l_Y_3_0 (ref), v20 (ref), l_current_1 (copy), v11 (ref)
                    if l_l_Y_3_0 == 0 then
                        return;
                    else
                        local v21 = (v20 - l_current_1.CanvasPosition.Y) / l_l_Y_3_0;
                        v11(v21);
                        return;
                    end;
                end;
                local function v24() --[[ Line: 69 ]] --[[ Name: updateWindowParams ]]
                    -- upvalues: l_l_Y_2_0 (ref), l_current_1 (copy), l_l_Y_3_0 (ref), v20 (ref), l_current_0 (copy), v11 (ref)
                    l_l_Y_2_0 = l_current_1.AbsolutePosition.Y;
                    l_l_Y_3_0 = l_current_1.AbsoluteWindowSize.Y;
                    v20 = l_current_0.AbsolutePosition.Y + l_current_1.CanvasPosition.Y - l_l_Y_2_0;
                    if l_l_Y_3_0 == 0 then
                        return;
                    else
                        local v23 = (v20 - l_current_1.CanvasPosition.Y) / l_l_Y_3_0;
                        v11(v23);
                        return;
                    end;
                end;
                l_l_Y_2_0 = l_current_1.AbsolutePosition.Y;
                l_l_Y_3_0 = l_current_1.AbsoluteWindowSize.Y;
                v20 = l_current_0.AbsolutePosition.Y + l_current_1.CanvasPosition.Y - l_l_Y_2_0;
                if l_l_Y_3_0 ~= 0 then
                    local v25 = (v20 - l_current_1.CanvasPosition.Y) / l_l_Y_3_0;
                    v11(v25);
                end;
                v12 = {
                    l_current_1:GetPropertyChangedSignal("AbsolutePosition"):Connect(v24), 
                    l_current_1:GetPropertyChangedSignal("AbsoluteWindowSize"):Connect(v24), 
                    l_current_1:GetPropertyChangedSignal("AbsoluteCanvasSize"):Connect(v24), 
                    l_current_1:GetPropertyChangedSignal("CanvasPosition"):Connect(v22)
                };
            end;
        end;
        return function() --[[ Line: 85 ]]
            -- upvalues: v12 (ref)
            for _, v27 in v12 do
                v27:Disconnect();
            end;
        end;
    end, {
        v9, 
        v8
    });
    return v10;
end;
local function _(v29, v30, v31, v32, v33) --[[ Line: 102 ]] --[[ Name: customEasing ]]
    return (1 - v29) ^ 3 * v30 + 3 * (1 - v29) ^ 2 * v29 * v31 + 3 * (1 - v29) * v29 ^ 2 * v32 + v29 ^ 3 * v33;
end;
return {
    useNormalizedVerticalProgress = v28, 
    getYPositionOffsetForMotion = function(v35, v36, v37) --[[ Line: 106 ]] --[[ Name: getYPositionOffsetForMotion ]]
        local v38 = math.clamp(v35, 0, 1);
        local v39 = ((1 - v38) ^ 3 * 0.25 + 3 * (1 - v38) ^ 2 * v38 * 0.25 + 3 * (1 - v38) * v38 ^ 2 * 0.5 + v38 ^ 3 * 1 - 0.25) / 0.75;
        return v37 * v39 + v36 * (1 - v39);
    end, 
    getNormalizedCenterPosition = v7
};