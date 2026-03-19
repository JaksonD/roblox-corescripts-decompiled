local l_Parent_0 = script.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local l_UserInputService_0 = game:GetService("UserInputService");
local v3 = require(l_Parent_1.AppCommonLib);
local v4 = require(l_Parent_1.CapturesCommon);
local v5 = require(l_Parent_1.React);
local v6 = require(l_Parent_1.RobloxAppHooks);
local v7 = require(l_Parent_1.ReactUtils);
local v8 = require(l_Parent_1.Otter);
local l_Signal_0 = v3.Signal;
local v10 = require(l_Parent_0.Enums.FeedDirectionType);
local v11 = require(l_Parent_0.Enums.NavigationType);
local l_useEventConnection_0 = v7.useEventConnection;
local l_useGuiInset_0 = v4.Hooks.useGuiInset;
local l_useRef_0 = v5.useRef;
local l_useScreenSize_0 = v6.useScreenSize;
local function v22(v16, v17, v18, v19, v20) --[[ Line: 27 ]]
    -- upvalues: v8 (copy)
    local v21 = v8.createSingleMotor(v16);
    v21:onStep(v18);
    v21:onComplete(v19);
    v20.current = true;
    v21:setGoal(v8.spring(v17, {
        frequency = 8
    }));
end;
return function(v23, v24, v25, v26) --[[ Line: 41 ]] --[[ Name: useFeedMotionController ]]
    -- upvalues: l_useScreenSize_0 (copy), l_useGuiInset_0 (copy), l_useRef_0 (copy), l_Signal_0 (copy), l_useEventConnection_0 (copy), l_UserInputService_0 (copy), v11 (copy), v22 (copy), v5 (copy), v10 (copy)
    local v27 = l_useScreenSize_0();
    local v28 = l_useGuiInset_0();
    local v29 = l_useRef_0(nil);
    local v30 = l_useRef_0(false);
    local v31 = l_useRef_0(false);
    local v32 = l_useRef_0(nil);
    local v33 = l_useRef_0(nil);
    local v34 = l_useRef_0(nil);
    local v35 = l_useRef_0(l_Signal_0.new());
    local function _(v36, v37) --[[ Line: 58 ]]
        -- upvalues: v28 (copy)
        local v38 = v36 % v37;
        if v37 / 2 < v38 then
            return math.min(v36 + (v37 - v38), 0) - v28.top;
        else
            return v36 - v38 - v28.top;
        end;
    end;
    l_useEventConnection_0(l_UserInputService_0.TouchPinch, function(_, _, _, v43, _) --[[ Line: 69 ]]
        -- upvalues: v31 (copy)
        if v43 == Enum.UserInputState.Begin then
            v31.current = true;
        end;
    end);
    l_useEventConnection_0(l_UserInputService_0.TouchStarted, function(v45) --[[ Line: 76 ]]
        -- upvalues: v30 (copy), v32 (copy), v29 (copy), v34 (copy), v26 (copy), v33 (copy)
        v30.current = false;
        if v32.current == nil and v29.current and v34.current == nil and not v26 then
            v32.current = v29.current.Position.Y.Offset;
            v33.current = v45.Position.Y;
            v34.current = v45;
        end;
    end);
    l_useEventConnection_0(l_UserInputService_0.TouchMoved, function(v46) --[[ Line: 90 ]]
        -- upvalues: v29 (copy), v31 (copy), v32 (copy), v33 (copy), v34 (copy), v26 (copy), v23 (copy), v24 (copy)
        if v29.current and not v31.current and v32.current ~= nil and v33.current ~= nil and v46 == v34.current and not v26 then
            local v47 = v46.Position.Y - v33.current;
            if v23 then
                v47 = math.min(v47, 100);
            end;
            if v24 then
                v47 = math.max(v47, -100);
            end;
            v29.current.Position = UDim2.fromOffset(0, v32.current + v47);
        end;
    end);
    l_useEventConnection_0(l_UserInputService_0.TouchSwipe, function(v48) --[[ Line: 113 ]]
        -- upvalues: v29 (copy), v30 (copy), v31 (copy), v26 (copy), v23 (copy), v24 (copy), v27 (copy), v11 (ref), v28 (copy), v25 (copy), v35 (copy), v22 (ref)
        if not v29.current or v30.current or v31.current or v26 then
            return;
        else
            assert(v29.current ~= nil, "feedMotionRef.current is nil");
            if v23 and v48 == Enum.SwipeDirection.Down then
                return;
            elseif v24 and v48 == Enum.SwipeDirection.Up then
                return;
            else
                local v49 = 0;
                if v48 == Enum.SwipeDirection.Up and v29.current.Position.Y.Offset % v27.Y > v27.Y / 2 then
                    v49 = v27.Y;
                elseif v48 == Enum.SwipeDirection.Down and v29.current.Position.Y.Offset % v27.Y < v27.Y / 2 then
                    v49 = -v27.Y;
                end;
                local v50 = if v48 == Enum.SwipeDirection.Up then v11.NavigatedToPreviousItem else v11.NavigatedToNextItem;
                local l_Offset_0 = v29.current.Position.Y.Offset;
                local v52 = v29.current.Position.Y.Offset - v49;
                local l_Y_0 = v27.Y;
                local v54 = v52 % l_Y_0;
                local v55 = math.clamp(if l_Y_0 / 2 < v54 then math.min(v52 + (l_Y_0 - v54), 0) - v28.top else v52 - v54 - v28.top, -(v25 - 1) * v27.Y - v28.top, 0);
                v22(l_Offset_0, v55, function(v56) --[[ Line: 152 ]]
                    -- upvalues: v29 (ref)
                    if not v29.current then
                        return;
                    else
                        v29.current.Position = UDim2.fromOffset(0, v56);
                        return;
                    end;
                end, function() --[[ Line: 158 ]]
                    -- upvalues: l_Offset_0 (copy), v55 (copy), v30 (ref), v35 (ref), v50 (copy)
                    if math.abs(l_Offset_0 - v55) < 2 then
                        return;
                    else
                        v30.current = false;
                        v35.current:fire(v50);
                        return;
                    end;
                end, v30);
                return;
            end;
        end;
    end);
    l_useEventConnection_0(l_UserInputService_0.TouchEnded, function(v57) --[[ Line: 169 ]]
        -- upvalues: v34 (copy), v29 (copy), v32 (copy), v30 (copy), v26 (copy), v27 (copy), v28 (copy), v31 (copy), v11 (ref), v35 (copy), v22 (ref)
        if v34.current == v57 then
            v34.current = nil;
        end;
        if not v29.current or not v32.current or v30.current or v34.current ~= nil or v26 then
            return;
        else
            assert(v29.current ~= nil, "feedMotionRef.current is nil");
            assert(v32.current ~= nil, "feedStartPositionYOffset.current is nil");
            local v58 = nil;
            local l_current_0 = v32.current;
            local l_Y_1 = v27.Y;
            local v61 = l_current_0 % l_Y_1;
            local v62 = if l_Y_1 / 2 < v61 then math.min(l_current_0 + (l_Y_1 - v61), 0) - v28.top else l_current_0 - v61 - v28.top;
            l_Y_1 = v29.current.Position.Y.Offset;
            v61 = v27.Y;
            local v63 = l_Y_1 % v61;
            l_current_0 = if v61 / 2 < v63 then math.min(l_Y_1 + (v61 - v63), 0) - v28.top else l_Y_1 - v63 - v28.top;
            v58 = if v31.current then v11.NavigatedToCurrentItem else if v62 < l_current_0 then v11.NavigatedToPreviousItem else if l_current_0 < v62 then v11.NavigatedToNextItem else v11.NavigatedToCurrentItem;
            v32.current = nil;
            l_Y_1 = v29.current.Position.Y.Offset;
            task.wait();
            v31.current = false;
            if not v29.current then
                return;
            elseif l_Y_1 ~= v29.current.Position.Y.Offset then
                return;
            else
                v63 = v29.current.Position.Y.Offset;
                v22(v63, l_current_0, function(v64) --[[ Line: 219 ]]
                    -- upvalues: v29 (ref)
                    if not v29.current then
                        return;
                    else
                        v29.current.Position = UDim2.fromOffset(0, v64);
                        return;
                    end;
                end, function() --[[ Line: 225 ]]
                    -- upvalues: v30 (ref), v58 (ref), v35 (ref)
                    v30.current = false;
                    if v58 then
                        v35.current:fire(v58);
                    end;
                end, v30);
                return;
            end;
        end;
    end);
    local v74 = v5.useCallback(function(v65) --[[ Line: 235 ]]
        -- upvalues: v29 (copy), v30 (copy), v10 (ref), v27 (copy), v28 (copy), v25 (copy), v35 (copy), v11 (ref), v22 (ref)
        if not v29.current or v30.current then
            return;
        else
            assert(v29.current ~= nil, "feedMotionRef.current is nil");
            local v66 = 0;
            if v65 == v10.Up then
                v66 = -v27.Y;
            elseif v65 == v10.Down then
                v66 = v27.Y;
            end;
            local l_Offset_1 = v29.current.Position.Y.Offset;
            local v68 = v29.current.Position.Y.Offset - v66;
            local l_Y_2 = v27.Y;
            local v70 = v68 % l_Y_2;
            local v71 = math.clamp(if l_Y_2 / 2 < v70 then math.min(v68 + (l_Y_2 - v70), 0) - v28.top else v68 - v70 - v28.top, -(v25 - 1) * v27.Y, 0);
            local function v73(v72) --[[ Line: 255 ]]
                -- upvalues: v71 (copy), v29 (ref)
                if v71 - v72 < 2 and v71 - v72 > -2 then
                    v29.current.Position = UDim2.fromOffset(0, v71);
                    return;
                else
                    v29.current.Position = UDim2.fromOffset(0, v72);
                    return;
                end;
            end;
            v68 = function() --[[ Line: 262 ]]
                -- upvalues: v30 (ref), v65 (copy), v10 (ref), v35 (ref), v11 (ref)
                v30.current = false;
                if v65 == v10.Down then
                    v35.current:fire(v11.NavigatedToPreviousItem);
                    return;
                else
                    if v65 == v10.Up then
                        v35.current:fire(v11.NavigatedToNextItem);
                    end;
                    return;
                end;
            end;
            v30.current = true;
            v22(l_Offset_1, v71, v73, v68, v30);
            return;
        end;
    end, {
        v25, 
        v27
    });
    local v76 = v5.useCallback(function(v75) --[[ Line: 275 ]]
        -- upvalues: v26 (copy), v23 (copy), v74 (copy), v10 (ref), v24 (copy)
        if v26 then
            return;
        elseif v75 > 0 and not v23 then
            v74(v10.Up);
            return;
        else
            if v75 < 0 and not v24 then
                v74(v10.Down);
            end;
            return;
        end;
    end, {
        v26, 
        v23, 
        v24, 
        v74
    });
    l_useEventConnection_0(l_UserInputService_0.PointerAction, v76);
    return v29, v35.current, v74;
end;