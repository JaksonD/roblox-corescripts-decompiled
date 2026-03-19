local l_Parent_0 = script.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local l_UserInputService_0 = game:GetService("UserInputService");
local v3 = require(l_Parent_1.React);
local v4 = require(l_Parent_1.ReactOtter);
local v5 = require(l_Parent_1.ReactUtils);
local v6 = require(l_Parent_0.Enums.NavigationType);
local v7 = require(l_Parent_0.Utils.isPointWithinBounds);
local l_useCallback_0 = v3.useCallback;
local l_useEffect_0 = v3.useEffect;
local l_useEventConnection_0 = v5.useEventConnection;
local l_useMotor_0 = v4.useMotor;
local l_useRef_0 = v3.useRef;
local l_useState_0 = v3.useState;
return function(v14, v15, v16, v17) --[[ Line: 26 ]] --[[ Name: useSnapScrollController ]]
    -- upvalues: l_useRef_0 (copy), l_useState_0 (copy), l_useCallback_0 (copy), l_useMotor_0 (copy), v3 (copy), v4 (copy), v6 (copy), l_useEffect_0 (copy), l_useEventConnection_0 (copy), l_UserInputService_0 (copy), v7 (copy)
    local v18 = l_useRef_0(nil);
    local v19, v20 = l_useState_0(v15);
    local v21 = l_useRef_0(nil);
    local v22 = l_useRef_0(false);
    local v23 = l_useRef_0(nil);
    local v24 = l_useRef_0(nil);
    local v25 = l_useRef_0(nil);
    local v26 = l_useRef_0(nil);
    local v27 = l_useRef_0(false);
    local v29 = l_useCallback_0(function(v28) --[[ Line: 42 ]]
        -- upvalues: v21 (copy)
        if not v21.current then
            return;
        else
            v21.current.Position = UDim2.new(0.5, 0, 0, v28);
            return;
        end;
    end, {});
    local v30 = l_useCallback_0(function() --[[ Line: 50 ]]
        -- upvalues: v22 (copy)
        v22.current = false;
    end, {});
    local v31 = l_useMotor_0((v15 - 1) * -v16.Y, v29, v30);
    local v36 = v3.useCallback(function(v32, v33) --[[ Line: 57 ]]
        -- upvalues: v14 (copy), v21 (copy), v18 (copy), v22 (copy), v27 (copy), v17 (copy), v16 (copy), v31 (copy), v4 (ref), v20 (copy)
        if not v14 or not v21.current or not v18.current or v22.current or v27.current or v17 < 1 then
            return;
        else
            assert(v21.current ~= nil, "motionRef.current is nil");
            v22.current = true;
            local v34 = math.clamp(v32, 1, v17);
            local v35 = (v34 - 1) * -v16.Y;
            if v33 then
                v31(v4.instant(v35));
            else
                v31(v4.spring(v35, {
                    frequency = 8
                }));
            end;
            v20(v34);
            return;
        end;
    end, {
        v14, 
        v16, 
        v17, 
        v31
    });
    local v39 = v3.useCallback(function(v37, v38) --[[ Line: 86 ]]
        -- upvalues: v6 (ref), v36 (copy), v19 (copy)
        if v37 == v6.Previous then
            v36(v19 - 1, v38);
            return;
        elseif v37 == v6.Next then
            v36(v19 + 1, v38);
            return;
        else
            v36(v19, v38);
            return;
        end;
    end, {
        v19, 
        v36
    });
    l_useEffect_0(function() --[[ Line: 96 ]]
        -- upvalues: v21 (copy), v23 (copy), v16 (copy), v22 (copy), v39 (copy), v6 (ref)
        if not v21.current or v23.current == v16 then
            return;
        else
            v22.current = false;
            v39(v6.Current, true);
            v23.current = v16;
            return;
        end;
    end, {
        v16, 
        v39
    });
    local v45 = v3.useCallback(function(_, _, _, v43, _) --[[ Line: 106 ]]
        -- upvalues: v39 (copy), v6 (ref), v27 (copy), v25 (copy)
        if v43 == Enum.UserInputState.Begin then
            v39(v6.Current);
            v27.current = true;
            return;
        else
            if v43 == Enum.UserInputState.End then
                v27.current = false;
                v25.current = nil;
            end;
            return;
        end;
    end, {
        v39
    });
    l_useEventConnection_0(l_UserInputService_0.TouchPinch, v45);
    local v47 = v3.useCallback(function(v46) --[[ Line: 118 ]]
        -- upvalues: v14 (copy), v21 (copy), v18 (copy), v25 (copy), v7 (ref), v24 (copy), v26 (copy), v31 (copy), v4 (ref)
        if not v14 or not v21.current or not v18.current or v25.current then
            return;
        elseif not v7(Vector2.new(v46.Position.X, v46.Position.Y), v18.current.AbsolutePosition, v18.current.AbsoluteSize) then
            return;
        else
            v24.current = v21.current.Position.Y.Offset;
            v26.current = v46.Position.Y;
            v25.current = v46;
            v31(v4.instant(v21.current.Position.Y.Offset));
            return;
        end;
    end, {
        v14, 
        v31
    });
    l_useEventConnection_0(l_UserInputService_0.TouchStarted, v47);
    local v51 = v3.useCallback(function(v48) --[[ Line: 140 ]]
        -- upvalues: v14 (copy), v21 (copy), v18 (copy), v25 (copy), v24 (copy), v26 (copy), v27 (copy), v17 (copy), v16 (copy), v31 (copy), v4 (ref)
        if not v14 or not v21.current or not v18.current or v25.current ~= v48 or not v24.current or not v26.current or v27.current then
            return;
        else
            local v49 = v48.Position.Y - v26.current;
            local v50 = math.clamp(v24.current + v49, (v17 - 1) * -v16.Y - 100, 100);
            v31(v4.instant(v50));
            return;
        end;
    end, {
        v14, 
        v16, 
        v17, 
        v31
    });
    l_useEventConnection_0(l_UserInputService_0.TouchMoved, v51);
    local v53 = v3.useCallback(function(v52) --[[ Line: 166 ]]
        -- upvalues: v14 (copy), v21 (copy), v18 (copy), v25 (copy), v27 (copy), v22 (copy), v39 (copy), v6 (ref)
        if not v14 or not v21.current or not v18.current or not v25.current or v27.current or v22.current then
            return;
        elseif v52 == Enum.SwipeDirection.Up then
            v39(v6.Next);
            return;
        elseif v52 == Enum.SwipeDirection.Down then
            v39(v6.Previous);
            return;
        else
            v39(v6.Current);
            return;
        end;
    end, {
        v14, 
        v39
    });
    l_useEventConnection_0(l_UserInputService_0.TouchSwipe, v53);
    local v56 = v3.useCallback(function(v54) --[[ Line: 190 ]]
        -- upvalues: v14 (copy), v21 (copy), v18 (copy), v25 (copy), v24 (copy), v22 (copy), v16 (copy), v39 (copy), v6 (ref)
        if not v14 or not v21.current or not v18.current or v25.current ~= v54 or not v24.current or v22.current then
            return;
        else
            local v55 = v21.current.Position.Y.Offset - v24.current;
            if -v55 > v16.Y * 0.25 then
                v39(v6.Next);
            elseif v16.Y * 0.25 < v55 then
                v39(v6.Previous);
            else
                v39(v6.Current);
            end;
            v25.current = nil;
            v24.current = nil;
            return;
        end;
    end, {
        v14, 
        v16, 
        v39
    });
    l_useEventConnection_0(l_UserInputService_0.TouchEnded, v56);
    local v59 = v3.useCallback(function(v57, v58) --[[ Line: 218 ]]
        -- upvalues: v14 (copy), v39 (copy), v6 (ref)
        if not v14 then
            return;
        elseif v57 < 0 or v58.Y < -0.1 then
            v39(v6.Next);
            return;
        else
            if v57 > 0 or v58.Y > 0.1 then
                v39(v6.Previous);
            end;
            return;
        end;
    end, {
        v14, 
        v39
    });
    l_useEventConnection_0(l_UserInputService_0.PointerAction, v59);
    return v19, v18, v21, v36, v39;
end;