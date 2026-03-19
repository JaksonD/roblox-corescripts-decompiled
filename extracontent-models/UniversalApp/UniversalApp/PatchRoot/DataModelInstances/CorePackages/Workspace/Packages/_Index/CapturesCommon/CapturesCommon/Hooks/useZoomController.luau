local l_Parent_0 = script.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local l_UserInputService_0 = game:GetService("UserInputService");
local v3 = require(l_Parent_1.React);
local v4 = require(l_Parent_1.ReactOtter);
local v5 = require(l_Parent_1.ReactUtils);
local v6 = require(l_Parent_0.Utils.isPointWithinBounds);
local l_useMotor_0 = v4.useMotor;
local l_useCallback_0 = v3.useCallback;
local l_useEffect_0 = v3.useEffect;
local l_useEventConnection_0 = v5.useEventConnection;
local l_useRef_0 = v3.useRef;
local l_useState_0 = v3.useState;
local v13 = {
    dampingRatio = 1, 
    frequency = 4
};
return function(v14) --[[ Line: 28 ]] --[[ Name: useZoomController ]]
    -- upvalues: l_useState_0 (copy), l_useRef_0 (copy), l_useCallback_0 (copy), l_useMotor_0 (copy), l_useEffect_0 (copy), v4 (copy), v13 (copy), v6 (copy), l_useEventConnection_0 (copy), l_UserInputService_0 (copy)
    local v15, v16 = l_useState_0(false);
    local v17 = l_useRef_0(nil);
    local v18 = l_useRef_0(nil);
    local v19 = l_useRef_0(nil);
    local v21 = l_useCallback_0(function(v20) --[[ Line: 35 ]]
        -- upvalues: v17 (copy)
        if not v17.current then
            return;
        else
            v17.current.AnchorPoint = Vector2.new(v20.xAnchor, v20.yAnchor);
            v17.current.Position = UDim2.fromScale(v20.xPos, v20.yPos);
            v17.current.Size = UDim2.fromScale(v20.scale, v20.scale);
            return;
        end;
    end, {});
    local v22 = l_useMotor_0({
        scale = 1, 
        xAnchor = 0.5, 
        yAnchor = 0.5, 
        xPos = 0.5, 
        yPos = 0.5
    }, v21);
    l_useEffect_0(function() --[[ Line: 53 ]]
        -- upvalues: v17 (copy), v14 (copy), v18 (copy), v19 (copy)
        if not v17.current then
            return;
        elseif v14 then
            v18.current = v17.current.AbsolutePosition;
            v19.current = v17.current.AbsoluteSize;
            return;
        else
            v18.current = nil;
            v19.current = nil;
            v17.current.AnchorPoint = Vector2.new(0.5, 0.5);
            v17.current.Position = UDim2.fromScale(0.5, 0.5);
            v17.current.Size = UDim2.fromScale(1, 1);
            return;
        end;
    end, {
        v14
    });
    local v41 = l_useCallback_0(function(v23, v24, _, v26, _) --[[ Line: 71 ]]
        -- upvalues: v14 (copy), v17 (copy), v15 (copy), v22 (copy), v4 (ref), v13 (ref), v18 (copy), v19 (copy), v16 (copy), v6 (ref)
        if not v14 or not v17.current then
            return;
        elseif v26 == Enum.UserInputState.End and v15 or #v23 < 2 then
            v22({
                scale = v4.spring(1, v13), 
                xPos = v4.spring(v17.current.AnchorPoint.X, v13), 
                yPos = v4.spring(v17.current.AnchorPoint.Y, v13)
            });
            v18.current = nil;
            v19.current = nil;
            v16(false);
            return;
        else
            if v26 == Enum.UserInputState.Begin then
                local v28 = v23[1];
                local v29 = v23[2];
                local l_AbsolutePosition_0 = v17.current.AbsolutePosition;
                local l_AbsoluteSize_0 = v17.current.AbsoluteSize;
                if not v6(v28, l_AbsolutePosition_0, l_AbsoluteSize_0) or not v6(v29, l_AbsolutePosition_0, l_AbsoluteSize_0) then
                    return;
                else
                    v18.current = l_AbsolutePosition_0;
                    v19.current = l_AbsoluteSize_0;
                    local v32 = l_AbsolutePosition_0 + l_AbsoluteSize_0 / 2;
                    local v33 = (v28 + v29) / 2 - v32;
                    local v34 = v33.X / l_AbsoluteSize_0.X + 0.5;
                    local v35 = v33.Y / l_AbsoluteSize_0.Y + 0.5;
                    v22({
                        xAnchor = v4.instant(v34), 
                        yAnchor = v4.instant(v35), 
                        xPos = v4.instant(v34), 
                        yPos = v4.instant(v35)
                    });
                    v16(true);
                end;
            end;
            if not v15 then
                return;
            elseif not v18.current or not v19.current then
                return;
            else
                local v36 = math.clamp(v24, 0.5, 3);
                local v37 = v18.current + v19.current / 2;
                local v38 = (v23[1] + v23[2]) / 2 - v37;
                local v39 = v38.X / v19.current.X + 0.5;
                local v40 = v38.Y / v19.current.Y + 0.5;
                v22({
                    scale = v4.instant(v36), 
                    xPos = v4.instant(v39), 
                    yPos = v4.instant(v40)
                });
                return;
            end;
        end;
    end, {
        v14, 
        v15, 
        v22
    });
    l_useEventConnection_0(l_UserInputService_0.TouchPinch, v41);
    return v15, v17;
end;