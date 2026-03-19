local l_Parent_0 = script.Parent.Parent;
local l_TweenService_0 = game:GetService("TweenService");
local l_Parent_1 = script:FindFirstAncestor("VirtualCursorModular").Parent;
local l_FFlagEnableVirtualCursorDebugging_0 = require(l_Parent_1.SharedFlags).FFlagEnableVirtualCursorDebugging;
local v4 = require(l_Parent_0.Enums);
local v5 = require(l_Parent_0.Properties);
local function _(v6) --[[ Line: 26 ]] --[[ Name: normalizeSafe ]]
    local l_Magnitude_0 = v6.Magnitude;
    if l_Magnitude_0 > 1.0E-5 then
        return v6 / l_Magnitude_0;
    else
        return Vector2.zero;
    end;
end;
local function _(v9, v10, v11) --[[ Line: 34 ]] --[[ Name: closestPointOnRect ]]
    local l_X_0 = v10.X;
    local l_Y_0 = v10.Y;
    local v14 = v10.X + v11.X;
    local v15 = v10.Y + v11.Y;
    return Vector2.new(math.clamp(v9.X, l_X_0, v14), (math.clamp(v9.Y, l_Y_0, v15)));
end;
local function _(v17) --[[ Line: 43 ]] --[[ Name: smoothStep ]]
    return v17 * v17 * (3 - v17 * 2);
end;
local v19 = {};
v19.__index = v19;
v19.new = function() --[[ Line: 60 ]] --[[ Name: new ]]
    -- upvalues: v4 (copy), v19 (copy)
    return (setmetatable({
        _currTargetObject = nil, 
        _currTargetCenter = nil, 
        _cursorStartingPosition = nil, 
        _cursorVelocity = Vector2.zero, 
        _snapTimer = 0, 
        _strengthTable = {
            [v4.SnapAssistMethod.Friction] = 0, 
            [v4.SnapAssistMethod.Tracking] = 0, 
            [v4.SnapAssistMethod.Centering] = 0
        }
    }, v19));
end;
v19.setMethodStrength = function(v20, v21, v22) --[[ Line: 78 ]] --[[ Name: setMethodStrength ]]
    v22 = math.clamp(v22, 0, 1);
    v20._strengthTable[v21] = v22;
end;
v19.getScaledMethodStrength = function(v23, v24, v25) --[[ Line: 84 ]] --[[ Name: getScaledMethodStrength ]]
    return (math.clamp((v23._strengthTable[v24] or 0) * v25, 0, 1));
end;
v19.adjustFriction = function(v26, v27) --[[ Line: 91 ]] --[[ Name: adjustFriction ]]
    -- upvalues: v4 (copy)
    local v28 = v26:getScaledMethodStrength(v4.SnapAssistMethod.Friction, v27.strengthMultiplier);
    if not v27.targetObject or v28 <= 0 then
        return v27.cursorPosition;
    elseif v26._cursorStartingPosition then
        return v27.cursorPosition:Lerp(v26._cursorStartingPosition, v28);
    else
        return v27.cursorPosition;
    end;
end;
v19.adjustTracking = function(v29, v30) --[[ Line: 106 ]] --[[ Name: adjustTracking ]]
    -- upvalues: v4 (copy)
    local v31 = v29:getScaledMethodStrength(v4.SnapAssistMethod.Tracking, v30.strengthMultiplier);
    if not v30.targetObject or v31 <= 0 then
        return v30.cursorPosition;
    else
        local l_cursorPosition_0 = v30.cursorPosition;
        local v33 = v30.targetObject.AbsolutePosition + v30.targetObject.AbsoluteSize / 2;
        local v34 = v29._currTargetCenter or v33;
        l_cursorPosition_0 = l_cursorPosition_0 + Vector2.new(0, 0):Lerp(v33 - v34, v31);
        v29._currTargetCenter = v33;
        return l_cursorPosition_0;
    end;
end;
v19.adjustCentering = function(v35, v36) --[[ Line: 124 ]] --[[ Name: adjustCentering ]]
    -- upvalues: v4 (copy), l_TweenService_0 (copy)
    local v37 = v35:getScaledMethodStrength(v4.SnapAssistMethod.Centering, v36.strengthMultiplier);
    if not v36.targetObject or v37 <= 0 then
        return v36.cursorPosition;
    else
        local v38 = Vector2.new(math.floor(v36.targetObject.AbsoluteSize.X / 2), (math.floor(v36.targetObject.AbsoluteSize.Y / 2)));
        local v39 = v36.targetObject.AbsolutePosition + v38;
        if not v36.deltaTime then
            return (v36.cursorPosition:Lerp(v39, v37));
        else
            local v40 = 1 - v37;
            local v41, v42 = l_TweenService_0:SmoothDamp(v36.cursorPosition, v39, v35._cursorVelocity, v40, 1e999, v36.deltaTime);
            v35._cursorVelocity = v42;
            return v41;
        end;
    end;
end;
v19.adjustSnap = function(v43, v44) --[[ Line: 159 ]] --[[ Name: adjustSnap ]]
    -- upvalues: l_FFlagEnableVirtualCursorDebugging_0 (copy)
    if v44.targetObject ~= v43._currTargetObject then
        v43._currTargetObject = v44.targetObject;
        local v45 = nil;
        if v44.targetObject then
            v45 = v44.targetObject.AbsolutePosition + v44.targetObject.AbsoluteSize / 2;
        end;
        v43._currTargetCenter = v45;
        v43._cursorVelocity = Vector2.zero;
        v43._cursorStartingPosition = v44.cursorPosition;
        v43._snapTimer = tick();
        if l_FFlagEnableVirtualCursorDebugging_0 then
            print("New target detected, cursorPos", v44.cursorPosition, "targetPos", v43.currTargetCenter);
        end;
    elseif v44.expiredTime and tick() - v43._snapTimer > v44.expiredTime then
        if l_FFlagEnableVirtualCursorDebugging_0 then
            print("Snap expired");
        end;
        return v44.cursorPosition;
    end;
    v44.cursorPosition = v43:adjustFriction(v44);
    v44.cursorPosition = v43:adjustTracking(v44);
    v44.cursorPosition = v43:adjustCentering(v44);
    return v44.cursorPosition;
end;
v19.isSnapCandidate = function(_, v47, v48) --[[ Line: 192 ]] --[[ Name: isSnapCandidate ]]
    if not v47.Visible or not v47.Selectable then
        return false;
    elseif v47.AbsolutePosition.X + v47.AbsoluteSize.X < 0 or v47.AbsolutePosition.Y + v47.AbsoluteSize.Y < 0 or v47.AbsolutePosition.X > v48.X or v47.AbsolutePosition.Y > v48.Y then
        return false;
    else
        return true;
    end;
end;
v19.adjustMove = function(_, v50, v51) --[[ Line: 210 ]] --[[ Name: adjustMove ]]
    -- upvalues: v5 (copy), l_FFlagEnableVirtualCursorDebugging_0 (copy)
    local l_cursorPosition_1 = v51.cursorPosition;
    local l_candidates_0 = v51.candidates;
    local l_strengthMultiplier_0 = v51.strengthMultiplier;
    if l_strengthMultiplier_0 <= 0 or not l_candidates_0 or #l_candidates_0 == 0 then
        return v50;
    elseif v50.Magnitude < 1.0E-5 then
        return Vector2.zero;
    else
        local l_Magnitude_1 = v50.Magnitude;
        local v56 = if l_Magnitude_1 > 1.0E-5 then v50 / l_Magnitude_1 else Vector2.zero;
        l_Magnitude_1 = 0;
        local l_zero_0 = Vector2.zero;
        for _, v59 in l_candidates_0 do
            local l_AbsolutePosition_0 = v59.AbsolutePosition;
            local l_AbsoluteSize_0 = v59.AbsoluteSize;
            local l_X_1 = l_AbsolutePosition_0.X;
            local l_Y_1 = l_AbsolutePosition_0.Y;
            local v64 = l_AbsolutePosition_0.X + l_AbsoluteSize_0.X;
            local v65 = l_AbsolutePosition_0.Y + l_AbsoluteSize_0.Y;
            l_AbsolutePosition_0 = Vector2.new(math.clamp(l_cursorPosition_1.X, l_X_1, v64), (math.clamp(l_cursorPosition_1.Y, l_Y_1, v65))) - l_cursorPosition_1;
            l_AbsoluteSize_0 = l_AbsolutePosition_0.Magnitude;
            if l_AbsoluteSize_0 < v5.SnapRadius then
                l_Y_1 = l_AbsolutePosition_0.Magnitude;
                l_X_1 = if l_Y_1 > 1.0E-5 then l_AbsolutePosition_0 / l_Y_1 else Vector2.zero;
                l_Y_1 = v56:Dot(l_X_1);
                if l_Y_1 > 0.25 then
                    v64 = math.clamp(1 - l_AbsoluteSize_0 / v5.SnapRadius, 0, 1);
                    v65 = v64 * v64 * (3 - v64 * 2) * l_Y_1;
                    if l_Magnitude_1 < v65 then
                        l_Magnitude_1 = v65;
                        l_zero_0 = l_X_1;
                    end;
                end;
            end;
        end;
        local l_v56_0 = v56;
        if l_Magnitude_1 > 0 then
            local v67 = v56 + l_zero_0 * (l_Magnitude_1 * l_strengthMultiplier_0);
            local l_Magnitude_2 = v67.Magnitude;
            l_v56_0 = if l_Magnitude_2 > 1.0E-5 then v67 / l_Magnitude_2 else Vector2.zero;
        end;
        if (l_v56_0 - v50).Magnitude > 0 and l_FFlagEnableVirtualCursorDebugging_0 then
            print("Move input adjusted from", v50, "to", l_v56_0);
        end;
        return l_v56_0;
    end;
end;
return v19;