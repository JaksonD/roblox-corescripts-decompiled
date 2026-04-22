local l_UserInputService_0 = game:GetService("UserInputService");
local l_RunService_0 = game:GetService("RunService");
local l_Parent_0 = script:FindFirstAncestor("SduiSharedContent").Parent;
local v3 = require(l_Parent_0.React);
local v4 = require(l_Parent_0.Foundation);
local v5 = require(l_Parent_0.Otter);
local v6 = require(l_Parent_0.RobloxAppEvents);
local l_View_0 = v4.View;
local l_Icon_0 = v4.Icon;
return v3.memo(function(v9) --[[ Line: 38 ]] --[[ Name: PullToRefreshSpinner ]]
    -- upvalues: v3 (copy), v5 (copy), v6 (copy), l_UserInputService_0 (copy), l_RunService_0 (copy), l_View_0 (copy), l_Icon_0 (copy)
    local v10, v11 = v3.useBinding(0);
    local v12, v13 = v3.useBinding(0);
    local v14, v15 = v3.useBinding(0);
    local v16, v17 = v3.useBinding(0);
    local v18, v19 = v3.useState("idle");
    local v20 = v3.useRef("idle");
    local v21 = v3.useRef(0);
    local v22 = v3.useRef(0);
    local v23 = v3.useRef(nil);
    if v23.current == nil then
        v23.current = v5.createSingleMotor(0);
    end;
    v3.useEffect(function() --[[ Line: 61 ]]
        -- upvalues: v23 (copy), v13 (copy), v20 (copy), v19 (copy)
        local l_current_0 = v23.current;
        local v26 = l_current_0:onStep(function(v25) --[[ Line: 64 ]]
            -- upvalues: v13 (ref)
            v13(v25);
        end);
        local v27 = l_current_0:onComplete(function() --[[ Line: 67 ]]
            -- upvalues: v20 (ref), v19 (ref), v13 (ref)
            if v20.current ~= "tweenBack" then
                return;
            else
                v20.current = "idle";
                v19("idle");
                v13(0);
                return;
            end;
        end);
        return function() --[[ Line: 76 ]]
            -- upvalues: v26 (copy), v27 (copy), l_current_0 (copy)
            v26();
            v27();
            l_current_0:destroy();
        end;
    end, {});
    local v31 = v3.useCallback(function() --[[ Line: 84 ]]
        -- upvalues: v9 (copy), v20 (copy), v19 (copy), v22 (copy), v23 (copy), v5 (ref), v13 (copy), v17 (copy)
        if not v9.onRefresh or v20.current ~= "idle" then
            return;
        else
            v20.current = "refreshing";
            v19("refreshing");
            if v22.current >= -52 then
                v23.current:setGoal(v5.spring(52, {
                    dampingRatio = 0.735, 
                    frequency = 1.95
                }));
            else
                v13(52);
            end;
            local function v28() --[[ Line: 105 ]] --[[ Name: onSettled ]]
                -- upvalues: v20 (ref), v19 (ref), v17 (ref), v23 (ref), v5 (ref)
                v20.current = "tweenBack";
                v19("tweenBack");
                v17(0);
                v23.current:setGoal(v5.spring(0, {
                    dampingRatio = 0.735, 
                    frequency = 1.95, 
                    startingValue = 52
                }));
            end;
            local l_status_0, l_result_0 = pcall(v9.onRefresh);
            if not l_status_0 then
                v28();
                return;
            elseif l_result_0 and typeof(l_result_0) == "table" and l_result_0.andThen then
                l_result_0:finally(v28);
                return;
            else
                v28();
                return;
            end;
        end;
    end, {
        v9.onRefresh
    });
    v3.useEffect(function() --[[ Line: 131 ]]
        -- upvalues: v9 (copy), v6 (ref), v31 (copy)
        if not v9.appEventName then
            return nil;
        else
            local v34 = v6.ReloadPage:connect(function(v32) --[[ Line: 136 ]]
                -- upvalues: v9 (ref), v31 (ref)
                if v32 ~= v9.appEventName then
                    return;
                else
                    local l_current_1 = v9.scrollingFrameRef.current;
                    if not l_current_1 then
                        return;
                    elseif l_current_1.CanvasPosition.Y ~= 0 then
                        l_current_1:ScrollToTop();
                        return;
                    else
                        v31();
                        return;
                    end;
                end;
            end);
            return function() --[[ Line: 151 ]]
                -- upvalues: v34 (copy)
                v34:disconnect();
            end;
        end;
    end, {
        v31, 
        v9.appEventName, 
        v9.scrollingFrameRef
    });
    v3.useEffect(function() --[[ Line: 157 ]]
        -- upvalues: l_UserInputService_0 (ref), v21 (copy), v22 (copy), v20 (copy), v31 (copy)
        local v37 = l_UserInputService_0.InputBegan:Connect(function(v35) --[[ Line: 158 ]]
            -- upvalues: v21 (ref)
            if v35.UserInputType ~= Enum.UserInputType.Touch then
                return;
            else
                local l_v21_0 = v21;
                l_v21_0.current = l_v21_0.current + 1;
                return;
            end;
        end);
        local v40 = l_UserInputService_0.InputEnded:Connect(function(v38) --[[ Line: 165 ]]
            -- upvalues: v21 (ref), v22 (ref), v20 (ref), v31 (ref)
            if v38.UserInputType ~= Enum.UserInputType.Touch then
                return;
            else
                if v21.current > 0 then
                    local l_v21_1 = v21;
                    l_v21_1.current = l_v21_1.current - 1;
                end;
                if v21.current > 0 then
                    return;
                else
                    if v22.current < -52 and v20.current == "idle" then
                        v31();
                    end;
                    return;
                end;
            end;
        end);
        return function() --[[ Line: 184 ]]
            -- upvalues: v37 (copy), v40 (copy)
            v37:Disconnect();
            v40:Disconnect();
        end;
    end, {
        v31
    });
    v3.useEffect(function() --[[ Line: 191 ]]
        -- upvalues: v9 (copy), v22 (copy), v11 (copy)
        local v41 = v9.scrollingFrameRef and v9.scrollingFrameRef.current;
        if not v41 then
            return nil;
        else
            local v43 = v41:GetPropertyChangedSignal("CanvasPosition"):Connect(function() --[[ Line: 197 ]]
                -- upvalues: v9 (ref), v41 (copy), v22 (ref), v11 (ref)
                if not v9.onRefresh then
                    return;
                else
                    local l_Y_0 = v41.CanvasPosition.Y;
                    v22.current = l_Y_0;
                    v11(if l_Y_0 < 0 then l_Y_0 else 0);
                    return;
                end;
            end);
            return function() --[[ Line: 206 ]]
                -- upvalues: v43 (copy)
                v43:Disconnect();
            end;
        end;
    end, {
        v9.scrollingFrameRef, 
        v9.onRefresh
    });
    v3.useEffect(function() --[[ Line: 212 ]]
        -- upvalues: v18 (copy), l_RunService_0 (ref), v20 (copy), v15 (copy), v17 (copy)
        if v18 == "idle" then
            return nil;
        else
            local v44 = 0;
            local v46 = l_RunService_0.RenderStepped:Connect(function(v45) --[[ Line: 218 ]]
                -- upvalues: v44 (ref), v20 (ref), v15 (ref), v17 (ref)
                v44 = v44 + v45;
                if v20.current == "refreshing" then
                    v15(v44 * 540);
                    return;
                else
                    if v20.current == "tweenBack" then
                        v17(v44);
                    end;
                    return;
                end;
            end);
            return function() --[[ Line: 227 ]]
                -- upvalues: v46 (copy)
                v46:Disconnect();
            end;
        end;
    end, {
        v18
    });
    local v50 = v3.useMemo(function() --[[ Line: 233 ]]
        -- upvalues: v3 (ref), v10 (copy), v12 (copy), v20 (copy), v21 (copy)
        return v3.joinBindings({
            v10, 
            v12
        }):map(function(v47) --[[ Line: 234 ]]
            -- upvalues: v20 (ref), v21 (ref)
            local v48 = v47[1];
            local v49 = v47[2];
            if v20.current == "idle" then
                if v21.current == 0 or v48 >= 0 then
                    return UDim2.new(1, 0, 0, 0);
                else
                    return UDim2.new(1, 0, 0, (math.min(52, (math.abs(v48)))));
                end;
            elseif v20.current == "refreshing" then
                return UDim2.new(1, 0, 0, (math.max(v49, 0)));
            else
                return UDim2.new(1, 0, 0, v49);
            end;
        end);
    end, {});
    local v54 = v3.useMemo(function() --[[ Line: 251 ]]
        -- upvalues: v3 (ref), v10 (copy), v14 (copy), v20 (copy)
        return v3.joinBindings({
            v10, 
            v14
        }):map(function(v51) --[[ Line: 252 ]]
            -- upvalues: v20 (ref)
            local v52 = v51[1];
            local v53 = v51[2];
            if v20.current == "idle" then
                if v52 >= 0 or v52 <= -52 then
                    return 0;
                else
                    return math.abs(v52) * 9.6 - 240;
                end;
            elseif v20.current == "refreshing" then
                return v53;
            else
                return 0;
            end;
        end);
    end, {});
    local v59 = v3.useMemo(function() --[[ Line: 269 ]]
        -- upvalues: v3 (ref), v10 (copy), v12 (copy), v16 (copy), v20 (copy), v21 (copy)
        return v3.joinBindings({
            v10, 
            v12, 
            v16
        }):map(function(v55) --[[ Line: 270 ]]
            -- upvalues: v20 (ref), v21 (ref)
            local v56 = v55[1];
            local v57 = v55[2];
            local v58 = v55[3];
            if v20.current == "idle" then
                if v21.current == 0 or v56 >= 0 then
                    return 1;
                elseif v56 <= -52 then
                    return 0;
                else
                    return 1 - math.abs(v56) * 0.04;
                end;
            elseif v20.current == "refreshing" then
                if v57 < 52 then
                    return (math.max(0, 1 - v57 / 52));
                else
                    return 0;
                end;
            else
                return (math.min(1, 2 * v58));
            end;
        end);
    end, {});
    return v3.createElement(l_View_0, {
        Size = v50, 
        GroupTransparency = v59, 
        BackgroundTransparency = 1, 
        LayoutOrder = v9.LayoutOrder, 
        ZIndex = 2
    }, {
        Spinner = v3.createElement(l_Icon_0, {
            name = "two-arrows-spin-clockwise", 
            Rotation = v54, 
            AnchorPoint = Vector2.new(0.5, 0.5), 
            Position = UDim2.fromScale(0.5, 0.5)
        })
    });
end);