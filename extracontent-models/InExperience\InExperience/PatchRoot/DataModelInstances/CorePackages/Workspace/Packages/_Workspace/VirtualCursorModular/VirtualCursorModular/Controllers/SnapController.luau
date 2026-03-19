local l_Parent_0 = script.Parent.Parent;
local l_TweenService_0 = game:GetService("TweenService");
local v2 = require(l_Parent_0.Enums);
local v3 = {};
v3.__index = v3;
v3.new = function() --[[ Line: 29 ]] --[[ Name: new ]]
    -- upvalues: v2 (copy), v3 (copy)
    return (setmetatable({
        _currTargetObject = nil, 
        _currTargetCenter = nil, 
        _cursorStartingPosition = nil, 
        _cursorVelocity = Vector2.zero, 
        _snapTimer = 0, 
        _strengthTable = {
            [v2.SnapAssistMethod.Friction] = 0, 
            [v2.SnapAssistMethod.Tracking] = 0, 
            [v2.SnapAssistMethod.Centering] = 0
        }
    }, v3));
end;
v3.setMethodStrength = function(v4, v5, v6) --[[ Line: 47 ]] --[[ Name: setMethodStrength ]]
    v6 = math.clamp(v6, 0, 1);
    v4._strengthTable[v5] = v6;
end;
v3.getScaledMethodStrength = function(v7, v8, v9) --[[ Line: 53 ]] --[[ Name: getScaledMethodStrength ]]
    return (math.clamp((v7._strengthTable[v8] or 0) * v9, 0, 1));
end;
v3.adjustFriction = function(v10, v11) --[[ Line: 60 ]] --[[ Name: adjustFriction ]]
    -- upvalues: v2 (copy)
    local v12 = v10:getScaledMethodStrength(v2.SnapAssistMethod.Friction, v11.strengthMultiplier);
    if not v11.targetObject or v12 <= 0 then
        return v11.cursorPosition;
    elseif v10._cursorStartingPosition then
        return v11.cursorPosition:Lerp(v10._cursorStartingPosition, v12);
    else
        return v11.cursorPosition;
    end;
end;
v3.adjustTracking = function(v13, v14) --[[ Line: 75 ]] --[[ Name: adjustTracking ]]
    -- upvalues: v2 (copy)
    local v15 = v13:getScaledMethodStrength(v2.SnapAssistMethod.Tracking, v14.strengthMultiplier);
    if not v14.targetObject or v15 <= 0 then
        return v14.cursorPosition;
    else
        local l_cursorPosition_0 = v14.cursorPosition;
        local v17 = v14.targetObject.AbsolutePosition + v14.targetObject.AbsoluteSize / 2;
        local v18 = v13._currTargetCenter or v17;
        l_cursorPosition_0 = l_cursorPosition_0 + Vector2.new(0, 0):Lerp(v17 - v18, v15);
        v13._currTargetCenter = v17;
        return l_cursorPosition_0;
    end;
end;
v3.adjustCentering = function(v19, v20) --[[ Line: 93 ]] --[[ Name: adjustCentering ]]
    -- upvalues: v2 (copy), l_TweenService_0 (copy)
    local v21 = v19:getScaledMethodStrength(v2.SnapAssistMethod.Centering, v20.strengthMultiplier);
    if not v20.targetObject or v21 <= 0 then
        return v20.cursorPosition;
    else
        local v22 = Vector2.new(math.floor(v20.targetObject.AbsoluteSize.X / 2), (math.floor(v20.targetObject.AbsoluteSize.Y / 2)));
        local v23 = v20.targetObject.AbsolutePosition + v22;
        if not v20.deltaTime then
            return (v20.cursorPosition:Lerp(v23, v21));
        else
            local v24 = 1 - v21;
            local v25, v26 = l_TweenService_0:SmoothDamp(v20.cursorPosition, v23, v19._cursorVelocity, v24, 1e999, v20.deltaTime);
            v19._cursorVelocity = v26;
            return v25;
        end;
    end;
end;
v3.adjustSnap = function(v27, v28) --[[ Line: 128 ]] --[[ Name: adjustSnap ]]
    if v28.targetObject ~= v27._currTargetObject then
        v27._currTargetObject = v28.targetObject;
        local v29 = nil;
        if v28.targetObject then
            v29 = v28.targetObject.AbsolutePosition + v28.targetObject.AbsoluteSize / 2;
        end;
        v27._currTargetCenter = v29;
        v27._cursorVelocity = Vector2.zero;
        v27._cursorStartingPosition = v28.cursorPosition;
        v27._snapTimer = tick();
    elseif v28.expiredTime and tick() - v27._snapTimer > v28.expiredTime then
        return v28.cursorPosition;
    end;
    v28.cursorPosition = v27:adjustFriction(v28);
    v28.cursorPosition = v27:adjustTracking(v28);
    v28.cursorPosition = v27:adjustCentering(v28);
    return v28.cursorPosition;
end;
return v3;