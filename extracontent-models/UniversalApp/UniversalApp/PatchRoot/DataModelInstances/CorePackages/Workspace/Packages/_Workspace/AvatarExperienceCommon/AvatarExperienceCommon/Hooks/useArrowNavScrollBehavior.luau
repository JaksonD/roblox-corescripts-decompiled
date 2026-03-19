local l_script_FirstAncestor_0 = script:FindFirstAncestor("AvatarExperienceCommon");
local l_RunService_0 = game:GetService("RunService");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v3 = require(l_Parent_0.Otter);
local v4 = require(l_Parent_0.React);
local v5 = require(l_script_FirstAncestor_0.Constants);
local v6 = {
    dampingRatio = 1, 
    frequency = 3.5
};
return function(v7) --[[ Line: 42 ]] --[[ Name: useArrowNavScrollBehavior ]]
    -- upvalues: v4 (copy), v3 (copy), v5 (copy), v6 (copy), l_RunService_0 (copy)
    local v8 = v4.useRef(nil);
    local v9 = v4.useRef(nil);
    local v10 = v4.useRef(0);
    if v7.defaultUseProps then
        if v7.defaultUseProps.buttonRefs ~= nil then
            if v7.defaultUseProps.buttonWidth ~= nil then
                error("Cannot set both buttonWidth and buttonRefs");
            end;
            if v7.defaultUseProps.numButtons ~= nil then
                error("Cannot set both numButtons and buttonRefs");
            end;
        end;
        if v7.defaultUseProps.buttonWidth ~= nil and v7.defaultUseProps.numButtons == nil then
            error("If setting buttonWidth must also set numButtons");
        end;
        if v7.defaultUseProps.buttonWidth == nil and v7.defaultUseProps.numButtons ~= nil then
            error("If setting numButtons must also set buttonWidth");
        end;
        if v7.defaultUseProps.buttonRefs == nil and v7.defaultUseProps.buttonWidth == nil and v7.defaultUseProps.numButtons == nil then
            error("Must set either buttonRefs or (buttonWidth and numButtons)");
        end;
    end;
    local function v11() --[[ Line: 79 ]] --[[ Name: disconnectHoldConn ]]
        -- upvalues: v8 (copy)
        if v8.current then
            v8.current:Disconnect();
            v8.current = nil;
        end;
    end;
    local function _(v12) --[[ Line: 86 ]] --[[ Name: getNewCanvasPosition ]]
        -- upvalues: v7 (copy)
        return v7.defaultUseProps.scrollingFrameRef.current.CanvasPosition + Vector2.new(v12, 0);
    end;
    local function v17(v14) --[[ Line: 91 ]] --[[ Name: setMotor ]]
        -- upvalues: v9 (copy), v3 (ref), v7 (copy)
        if v9.current then
            v9.current:destroy();
        end;
        v9.current = v3.createSingleMotor(v14);
        if v9.current then
            v9.current:onStep(function(v15) --[[ Line: 97 ]]
                -- upvalues: v7 (ref)
                v7.defaultUseProps.updateCanvasPosition(Vector2.new(v15, 0));
            end);
            v9.current:onComplete(function(v16) --[[ Line: 100 ]]
                -- upvalues: v7 (ref)
                v7.defaultUseProps.updateCanvasPosition(Vector2.new(v16, 0));
            end);
        end;
    end;
    local function v43(v18) --[[ Line: 106 ]] --[[ Name: getScrollToLocation ]]
        -- upvalues: v7 (copy), v5 (ref)
        local v19 = {};
        local l_buttonRefs_0 = v7.defaultUseProps.buttonRefs;
        local l_buttonWidth_0 = v7.defaultUseProps.buttonWidth;
        local l_numButtons_0 = v7.defaultUseProps.numButtons;
        if l_buttonWidth_0 and l_numButtons_0 then
            v19 = table.create(l_numButtons_0, l_buttonWidth_0);
        elseif l_buttonRefs_0 then
            for _, v24 in l_buttonRefs_0 do
                if v24 and v24.current then
                    local v25 = v24.current.Size.X.Offset or 0;
                    if v25 == 0 then
                        v25 = v24.current.AbsoluteSize.X;
                    end;
                    table.insert(v19, v25);
                end;
            end;
        end;
        local l_current_0 = v7.defaultUseProps.scrollingFrameRef.current;
        local l_buttonPadding_0 = v7.defaultUseProps.buttonPadding;
        local _ = 0;
        if v18 == v5.NAVIGATION_DIRECTION.IS_LEFT then
            local v29 = 0;
            local v30 = 0;
            for _, v32 in v19 do
                if v29 + v32 + l_buttonPadding_0 <= l_current_0.CanvasPosition.X then
                    v29 = v29 + v32 + l_buttonPadding_0;
                else
                    break;
                end;
            end;
            v30 = v29;
            local v33 = 0;
            for _, v35 in v19 do
                if v33 + v35 + l_buttonPadding_0 <= l_current_0.AbsoluteSize.X * 0.8 then
                    v33 = v33 + v35 + l_buttonPadding_0;
                    v30 = v30 - v35 - l_buttonPadding_0;
                else
                    break;
                end;
            end;
            return (math.max(0, v30));
        else
            local v36 = 0;
            local v37 = 0;
            for _, v39 in v19 do
                if v36 + v39 + l_buttonPadding_0 <= l_current_0.CanvasPosition.X then
                    v36 = v36 + v39 + l_buttonPadding_0;
                else
                    break;
                end;
            end;
            v37 = v36;
            local v40 = 0;
            for _, v42 in v19 do
                if v40 + v42 + l_buttonPadding_0 <= l_current_0.AbsoluteSize.X * 0.8 then
                    v40 = v40 + v42 + l_buttonPadding_0;
                    v37 = v37 + v42 + l_buttonPadding_0;
                else
                    break;
                end;
            end;
            return v37;
        end;
    end;
    local function v45(v44) --[[ Line: 193 ]] --[[ Name: getGoal ]]
        -- upvalues: v3 (ref), v43 (copy), v6 (ref)
        return v3.spring(v43(v44), v6);
    end;
    local function v52(v46, v47) --[[ Line: 197 ]] --[[ Name: onPressHoldInputBegan ]]
        -- upvalues: v10 (copy), v8 (copy), l_RunService_0 (ref), v5 (ref), v7 (copy)
        if v46.UserInputState ~= Enum.UserInputState.Begin then
            return;
        else
            v10.current = tick();
            if v8.current then
                v8.current:Disconnect();
                v8.current = nil;
            end;
            v8.current = l_RunService_0.RenderStepped:Connect(function(v48) --[[ Line: 203 ]]
                -- upvalues: v10 (ref), v5 (ref), v47 (copy), v7 (ref)
                local v49 = tick() - v10.current;
                local v50 = (v5.NAVIGATION_DIRECTION.IS_LEFT == v47 and -1 or 1) * 500 * v48 * v49 ^ 2;
                local v51 = v7.defaultUseProps.scrollingFrameRef.current.CanvasPosition + Vector2.new(v50, 0);
                v7.defaultUseProps.updateCanvasPosition(v51);
            end);
            return;
        end;
    end;
    local function v56(v53, v54) --[[ Line: 212 ]] --[[ Name: onPressHoldInputEnded ]]
        -- upvalues: v7 (copy), v10 (copy), v9 (copy), v17 (copy), v45 (copy), v3 (ref), v8 (copy)
        if v53.UserInputState ~= Enum.UserInputState.End then
            return;
        else
            local l_current_1 = v7.defaultUseProps.scrollingFrameRef.current;
            if tick() - v10.current <= 0.5 then
                if v9.current then
                    v9.current:destroy();
                end;
                v17(l_current_1.CanvasPosition.X);
                if v9.current then
                    v9.current:setGoal(v45(v54));
                end;
            elseif v9.current then
                v9.current:setGoal(v3.instant(l_current_1.CanvasPosition.X));
            end;
            if v8.current then
                v8.current:Disconnect();
                v8.current = nil;
            end;
            return;
        end;
    end;
    local function v60(_, v58) --[[ Line: 233 ]] --[[ Name: handleInputBegan ]]
        -- upvalues: v7 (copy), v52 (copy)
        local v59 = v7.onPressHoldInputBegan or v52;
        if v59 then
            v59(v58, v7.navDirection or "");
        end;
    end;
    local function v64(_, v62) --[[ Line: 240 ]] --[[ Name: handleInputEnded ]]
        -- upvalues: v7 (copy), v56 (copy)
        local v63 = v7.onPressHoldInputEnded or v56;
        if v63 then
            v63(v62, v7.navDirection or "");
        end;
    end;
    v4.useEffect(function() --[[ Line: 248 ]]
        -- upvalues: v7 (copy), v17 (copy), v8 (copy), v9 (copy)
        if v7.defaultUseProps then
            v17(0);
        end;
        return function() --[[ Line: 254 ]]
            -- upvalues: v8 (ref), v9 (ref)
            if v8.current then
                v8.current:Disconnect();
                v8.current = nil;
            end;
            if v9.current then
                v9.current:destroy();
                v9.current = nil;
            end;
        end;
    end, {});
    return {
        holdConnRef = v8, 
        motorRef = v9, 
        timeOfInputBeganRef = v10, 
        handleInputBegan = v60, 
        handleInputEnded = v64, 
        disconnectHoldConn = v11
    };
end;