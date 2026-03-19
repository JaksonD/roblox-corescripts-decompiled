local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.utils.getSceneIndicesForInterpolationInputRange);
local v2 = require(l_Parent_0.utils.lerp);
local function v6(v3) --[[ Line: 33 ]] --[[ Name: forInitial ]]
    local v4 = v3.initialPositionValue ~= v3.scene.index;
    local v5 = v4 and 1000000 or 0;
    return {
        forceHidden = v4, 
        initialPosition = UDim2.new(0, v5, 0, v5), 
        positionStep = nil
    };
end;
return {
    forHorizontal = function(v7) --[[ Line: 48 ]] --[[ Name: forHorizontal ]]
        -- upvalues: v6 (copy), v1 (copy), v2 (copy)
        local l_initialPositionValue_0 = v7.initialPositionValue;
        local l_layout_0 = v7.layout;
        local l_scene_0 = v7.scene;
        if not l_layout_0.isMeasured then
            return (v6(v7));
        else
            local v11 = v1(v7);
            if not v11 then
                return {
                    forceHidden = true, 
                    initialPosition = UDim2.new(0, 100000, 0, 100000), 
                    positionStep = nil
                };
            else
                local l_first_0 = v11.first;
                local l_last_0 = v11.last;
                local l_index_0 = l_scene_0.index;
                local l_initWidth_0 = l_layout_0.initWidth;
                local function _(v16) --[[ Line: 75 ]] --[[ Name: calculate ]]
                    -- upvalues: l_first_0 (copy), l_initWidth_0 (copy), l_index_0 (copy), v2 (ref), l_last_0 (copy)
                    if v16 < l_first_0 then
                        return l_initWidth_0;
                    elseif v16 < l_index_0 then
                        return v2(l_initWidth_0, 0, (v16 - l_first_0) / (l_index_0 - l_first_0));
                    elseif v16 == l_index_0 then
                        return 0;
                    elseif v16 < l_last_0 then
                        return v2(0, -l_initWidth_0, (v16 - l_index_0) / (l_last_0 - l_index_0));
                    else
                        return -l_initWidth_0;
                    end;
                end;
                local function v22(v18, v19) --[[ Line: 90 ]] --[[ Name: stepper ]]
                    -- upvalues: l_first_0 (copy), l_initWidth_0 (copy), l_index_0 (copy), v2 (ref), l_last_0 (copy)
                    local l_current_0 = v18.current;
                    if not l_current_0 then
                        return;
                    else
                        local l_Position_0 = l_current_0.Position;
                        l_current_0.Position = UDim2.new(l_Position_0.X.Scale, if v19 < l_first_0 then l_initWidth_0 else if v19 < l_index_0 then v2(l_initWidth_0, 0, (v19 - l_first_0) / (l_index_0 - l_first_0)) else v19 == l_index_0 and 0 or if v19 < l_last_0 then v2(0, -l_initWidth_0, (v19 - l_index_0) / (l_last_0 - l_index_0)) else -l_initWidth_0, l_Position_0.Y.Scale, l_Position_0.Y.Offset);
                        return;
                    end;
                end;
                return {
                    initialPosition = UDim2.new(0, if l_initialPositionValue_0 < l_first_0 then l_initWidth_0 else if l_initialPositionValue_0 < l_index_0 then v2(l_initWidth_0, 0, (l_initialPositionValue_0 - l_first_0) / (l_index_0 - l_first_0)) else l_initialPositionValue_0 == l_index_0 and 0 or if l_initialPositionValue_0 < l_last_0 then v2(0, -l_initWidth_0, (l_initialPositionValue_0 - l_index_0) / (l_last_0 - l_index_0)) else -l_initWidth_0, 0, 0), 
                    positionStep = v22
                };
            end;
        end;
    end, 
    forVertical = function(v23) --[[ Line: 110 ]] --[[ Name: forVertical ]]
        -- upvalues: v6 (copy), v1 (copy), v2 (copy)
        local l_initialPositionValue_1 = v23.initialPositionValue;
        local l_layout_1 = v23.layout;
        local l_scene_1 = v23.scene;
        if not l_layout_1.isMeasured then
            return (v6(v23));
        else
            local v27 = v1(v23);
            if not v27 then
                return {
                    forceHidden = true, 
                    initialPosition = UDim2.new(0, 100000, 0, 100000), 
                    positionStep = nil
                };
            else
                local l_first_1 = v27.first;
                local l_index_1 = l_scene_1.index;
                local l_initHeight_0 = l_layout_1.initHeight;
                local function v32(v31) --[[ Line: 133 ]] --[[ Name: calculate ]]
                    -- upvalues: l_first_1 (copy), l_initHeight_0 (copy), l_index_1 (copy), v2 (ref)
                    if v31 < l_first_1 then
                        return l_initHeight_0;
                    elseif v31 < l_index_1 then
                        return v2(l_initHeight_0, 0, (v31 - l_first_1) / (l_index_1 - l_first_1));
                    else
                        return 0;
                    end;
                end;
                return {
                    initialPosition = UDim2.new(0, 0, 0, v32(l_initialPositionValue_1)), 
                    positionStep = function(v33, v34) --[[ Line: 144 ]] --[[ Name: stepper ]]
                        -- upvalues: v32 (copy)
                        local l_current_1 = v33.current;
                        if not l_current_1 then
                            return;
                        else
                            local l_Position_1 = l_current_1.Position;
                            l_current_1.Position = UDim2.new(l_Position_1.X.Scale, l_Position_1.X.Offset, l_Position_1.Y.Scale, v32(v34));
                            return;
                        end;
                    end
                };
            end;
        end;
    end, 
    forFade = function(v37) --[[ Line: 165 ]] --[[ Name: forFade ]]
        -- upvalues: v6 (copy), v1 (copy)
        local l_initialPositionValue_2 = v37.initialPositionValue;
        local l_layout_2 = v37.layout;
        local l_scene_2 = v37.scene;
        if not l_layout_2.isMeasured then
            return (v6(v37));
        elseif not v1(v37) then
            return {
                forceHidden = true, 
                initialPosition = UDim2.new(0, 100000, 0, 100000), 
                positionStep = nil
            };
        else
            local l_index_2 = l_scene_2.index;
            local function _(v42) --[[ Line: 186 ]] --[[ Name: calculate ]]
                -- upvalues: l_index_2 (copy)
                return l_index_2 - 0.5 <= v42;
            end;
            return {
                forceHidden = not (l_index_2 - 0.5 <= l_initialPositionValue_2), 
                initialPosition = UDim2.new(0, 0, 0, 0), 
                positionStep = function(v44, v45) --[[ Line: 190 ]] --[[ Name: stepper ]]
                    -- upvalues: l_index_2 (copy)
                    local l_current_2 = v44.current;
                    if not l_current_2 then
                        return;
                    else
                        l_current_2.Visible = l_index_2 - 0.5 <= v45;
                        return;
                    end;
                end
            };
        end;
    end
};