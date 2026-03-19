local l_Parent_0 = script.Parent.Parent;
local l_GuiService_0 = game:GetService("GuiService");
local l_GamepadService_0 = game:GetService("GamepadService");
local l_Players_0 = game:GetService("Players");
local l_CoreGui_0 = game:GetService("CoreGui");
local l_Parent_1 = script:FindFirstAncestor("VirtualCursorModular").Parent;
local l_FFlagEnableSnapInVirtualCursor_0 = require(l_Parent_1.SharedFlags).FFlagEnableSnapInVirtualCursor;
local v7 = require(l_Parent_0.Properties);
local v8 = require(l_Parent_0.Util);
local l_GetMaxSpeed_0 = v8.GetMaxSpeed;
local l_IsCircleContainedInGuiObject_0 = v8.IsCircleContainedInGuiObject;
local l_IsSelectableGuiObject_0 = v8.IsSelectableGuiObject;
local l_IsSinkingGuiObject_0 = v8.IsSinkingGuiObject;
local l_GetPointRotatedAroundObject_0 = v8.GetPointRotatedAroundObject;
local l_cos_0 = math.cos;
local l_sin_0 = math.sin;
local l_abs_0 = math.abs;
local l_max_0 = math.max;
local l_min_0 = math.min;
local l_sign_0 = math.sign;
local v20 = {};
v20.__index = v20;
v20.new = function(v21, v22, v23) --[[ Line: 56 ]] --[[ Name: new ]]
    -- upvalues: v7 (copy), v20 (copy)
    return (setmetatable({
        _isScrolling = false, 
        _selectedObject = nil, 
        _inputController = v21, 
        _cursorController = v22, 
        _snapController = v23, 
        _targetingRadius = 100, 
        _selectionRadius = v7.SelectionRadius, 
        _scrolled = {}
    }, v20));
end;
v20.processScrolling = function(v24, v25, v26, v27) --[[ Line: 71 ]] --[[ Name: processScrolling ]]
    -- upvalues: v7 (copy), l_abs_0 (copy), l_cos_0 (copy), l_sin_0 (copy), l_max_0 (copy), l_min_0 (copy), l_sign_0 (copy)
    if not v25:IsA("ScrollingFrame") then
        return false;
    elseif not v25.ScrollingEnabled then
        return false;
    elseif v24._scrolled[v25] then
        return false;
    else
        v24._scrolled[v25] = true;
        local l_ScrollVector_0 = v24._inputController:GetScrollVector();
        local v29 = v7.ScrollingSpeed * v27;
        local l_ScrollingRadius_0 = v7.ScrollingRadius;
        local l_AbsoluteCanvasSize_0 = v25.AbsoluteCanvasSize;
        local l_AbsoluteSize_0 = v25.AbsoluteSize;
        local l_ScrollingDirection_0 = v25.ScrollingDirection;
        local v34 = false;
        if l_AbsoluteCanvasSize_0.X > l_AbsoluteSize_0.X then
            v34 = true;
            if l_ScrollingDirection_0 ~= Enum.ScrollingDirection.XY then
                v34 = l_ScrollingDirection_0 == Enum.ScrollingDirection.X;
            end;
        end;
        local v35 = false;
        if l_AbsoluteCanvasSize_0.Y > l_AbsoluteSize_0.Y then
            v35 = true;
            if l_ScrollingDirection_0 ~= Enum.ScrollingDirection.XY then
                v35 = l_ScrollingDirection_0 == Enum.ScrollingDirection.Y;
            end;
        end;
        local l_AbsolutePosition_0 = v25.AbsolutePosition;
        local v37 = v25.Rotation / 180 * 3.141592653589793;
        if l_abs_0(l_ScrollVector_0.x) > v7.ThumbstickDeadzone and v34 then
            v25.CanvasPosition = v25.CanvasPosition + Vector2.new(l_ScrollVector_0.x * v29, 0);
        end;
        if l_abs_0(l_ScrollVector_0.y) > v7.ThumbstickDeadzone and v35 then
            v25.CanvasPosition = v25.CanvasPosition + Vector2.new(0, l_ScrollVector_0.y * v29);
        end;
        local v38 = Vector2.new(l_cos_0(v37), (l_sin_0(v37)));
        local v39 = Vector2.new(-l_sin_0(v37), (l_cos_0(v37)));
        local v40 = Vector2.new(v26.X, v26.Y) - l_AbsolutePosition_0;
        local v41 = v40:Dot(v38) - l_AbsoluteSize_0.X / 2;
        local v42 = v40:Dot(v39) - l_AbsoluteSize_0.Y / 2;
        local v43 = Vector2.new(l_abs_0(v41), (l_abs_0(v42))) - l_AbsoluteSize_0 / 2;
        local l_Magnitude_0 = Vector2.new(l_max_0(v43.X, 0), (l_max_0(v43.Y, 0))).Magnitude;
        if l_abs_0(l_min_0(l_max_0(v43.X, v43.Y), 0) + l_Magnitude_0) < l_ScrollingRadius_0 then
            if l_abs_0(v43.X) < l_abs_0(v43.Y) and v34 then
                v25.CanvasPosition = v25.CanvasPosition + Vector2.new(l_sign_0(v41) * v29, 0);
                v24._cursorController:SetArrow(l_sign_0(v41), 0);
                return true;
            elseif l_abs_0(v43.X) >= l_abs_0(v43.Y) and v35 then
                v25.CanvasPosition = v25.CanvasPosition + Vector2.new(0, l_sign_0(v42) * v29);
                v24._cursorController:SetArrow(0, (l_sign_0(v42)));
                return true;
            end;
        end;
        return false;
    end;
end;
v20.getClosestCandidate = function(v45, v46, v47, _, v49, v50) --[[ Line: 136 ]] --[[ Name: getClosestCandidate ]]
    -- upvalues: l_IsSelectableGuiObject_0 (copy), l_GetPointRotatedAroundObject_0 (copy), l_IsSinkingGuiObject_0 (copy), l_IsCircleContainedInGuiObject_0 (copy), v7 (copy)
    local v51 = nil;
    local v52 = nil;
    local v53 = 1e999;
    if v50 then
        v51 = v50.closestCandidate;
        v52 = v50.occludingCandidate;
        v53 = v50.closestDistance;
    end;
    for _, v55 in ipairs(v46) do
        if v45:processScrolling(v55, v47, v49) then
            v45._isScrolling = true;
            return v51, v52, v53;
        else
            if l_IsSelectableGuiObject_0(v55) then
                local l_AbsolutePosition_1 = v55.AbsolutePosition;
                local v57 = v55.AbsolutePosition + v55.AbsoluteSize;
                local v58 = 0;
                local v59 = if v55.AbsoluteRotation ~= 0 then l_GetPointRotatedAroundObject_0(v47, v55) else v47;
                if v59.X < l_AbsolutePosition_1.X or v59.Y < l_AbsolutePosition_1.Y or v59.X > v57.X or v59.Y > v57.Y then
                    local v60 = if v59.X < l_AbsolutePosition_1.X then l_AbsolutePosition_1.X - v59.X else if v59.X > v57.X then v59.X - v57.X else 0;
                    local v61 = if v59.Y < l_AbsolutePosition_1.Y then l_AbsolutePosition_1.Y - v59.Y else if v59.Y > v57.Y then v59.Y - v57.Y else 0;
                    v58 = math.sqrt(math.pow(v60, 2) + math.pow(v61, 2));
                end;
                if v58 < v53 or v51 == nil then
                    v51 = v55;
                    v53 = v58;
                end;
            end;
            if l_IsSinkingGuiObject_0(v55) and l_IsCircleContainedInGuiObject_0(v47, v7.CursorRadius * v7.OcclusionRadiusScale, v55) then
                return v51, v55, v53;
            end;
        end;
    end;
    return v51, v52, v53;
end;
v20.processMoving = function(v62, v63) --[[ Line: 206 ]] --[[ Name: processMoving ]]
    -- upvalues: l_GuiService_0 (copy), l_GamepadService_0 (copy), l_GetMaxSpeed_0 (copy), v7 (copy)
    local v64 = l_GuiService_0:GetScreenResolution() + l_GuiService_0:GetGuiInset();
    local l_MoveVector_0 = v62._inputController:GetMoveVector();
    local l_l_GamepadService_0_GamepadCursorPosition_0 = l_GamepadService_0:GetGamepadCursorPosition();
    local v67 = l_MoveVector_0 * l_GetMaxSpeed_0() * (v62._selectedObject == nil and 1 or if v62._isScrolling then v7.ScrollingSlowDown else v7.SpeedAdjustmentTarget);
    if v67.Magnitude > 0 then
        local v68 = l_l_GamepadService_0_GamepadCursorPosition_0 + v67 * v63;
        l_l_GamepadService_0_GamepadCursorPosition_0 = Vector2.new(math.clamp(v68.X, 0, v64.X), (math.clamp(v68.Y, 0, v64.Y)));
    end;
    v62._cursorController:SetPosition(l_l_GamepadService_0_GamepadCursorPosition_0);
    l_GamepadService_0:SetGamepadCursorPosition(l_l_GamepadService_0_GamepadCursorPosition_0);
end;
v20.processSnapping = function(v69, v70, v71, v72) --[[ Line: 231 ]] --[[ Name: processSnapping ]]
    -- upvalues: l_FFlagEnableSnapInVirtualCursor_0 (copy), v7 (copy), l_GuiService_0 (copy), l_GamepadService_0 (copy)
    if not l_FFlagEnableSnapInVirtualCursor_0 then
        return;
    else
        local l_CursorScreenGuiOffset_0 = v69._cursorController:GetCursorScreenGuiOffset();
        local v74 = v69._snapController:adjustSnap({
            cursorPosition = v71 + l_CursorScreenGuiOffset_0, 
            strengthMultiplier = 1, 
            targetObject = v72, 
            deltaTime = v70, 
            expiredTime = v7.SnapExpireTime
        }) - l_CursorScreenGuiOffset_0;
        local v75 = l_GuiService_0:GetScreenResolution() + l_GuiService_0:GetGuiInset();
        local v76 = math.clamp(v74.X, 0, v75.X);
        local v77 = math.clamp(v74.Y, 0, v75.Y);
        local v78 = Vector2.new(v76, v77);
        v69._cursorController:SetPosition(v78);
        l_GamepadService_0:SetGamepadCursorPosition(v78);
        return;
    end;
end;
v20.getCandidates = function(_, v80, v81) --[[ Line: 258 ]] --[[ Name: getCandidates ]]
    -- upvalues: l_Players_0 (copy), l_CoreGui_0 (copy)
    local l_PlayerGui_0 = l_Players_0.LocalPlayer:FindFirstChildOfClass("PlayerGui");
    local v83 = if l_PlayerGui_0 then l_PlayerGui_0:GetGuiObjectsInCircle(v80, v81) else {};
    local l_l_CoreGui_0_GuiObjectsInCircle_0 = l_CoreGui_0:GetGuiObjectsInCircle(v80, v81);
    return {
        {
            l_CoreGui_0, 
            l_l_CoreGui_0_GuiObjectsInCircle_0
        }, 
        {
            l_PlayerGui_0, 
            v83
        }
    };
end;
v20.processAncestors = function(v85, v86, v87, v88, v89) --[[ Line: 266 ]] --[[ Name: processAncestors ]]
    local l_Parent_2 = v86.Parent;
    while true do
        if l_Parent_2 and l_Parent_2 ~= v87 then
            if v85:processScrolling(l_Parent_2, v88, v89) then
                v85._isScrolling = true;
                return;
            else
                l_Parent_2 = l_Parent_2.Parent;
            end;
        else
            return;
        end;
    end;
end;
v20.processCandidates = function(v91, v92, v93, v94) --[[ Line: 277 ]] --[[ Name: processCandidates ]]
    -- upvalues: l_GuiService_0 (copy)
    v92 = v92 - l_GuiService_0:GetGuiInset();
    local v95 = v91:getCandidates(v92, v93);
    local v96 = nil;
    local v97 = nil;
    local v98 = 1e999;
    v91._scrolled = {};
    v91._isScrolling = false;
    for _, v100 in ipairs(v95) do
        local v101 = v100[1];
        local v102, v103, v104 = v91:getClosestCandidate(v100[2], v92, v93, v94, {
            closestCandidate = v96, 
            occludingCandidate = v97, 
            closestDistance = v98
        });
        v96 = v102;
        v97 = v103;
        v98 = v104;
        if v91._isScrolling then
            return nil, 1e999;
        else
            if v96 then
                v91:processAncestors(v96, v101, v92, v94);
            end;
            if v91._isScrolling then
                return nil, 1e999;
            else
                if v97 and v97 ~= v96 then
                    v91:processAncestors(v97, v101, v92, v94);
                end;
                if v91._isScrolling then
                    return nil, 1e999;
                elseif v97 then
                    return v96, v98;
                end;
            end;
        end;
    end;
    return v96, v98;
end;
v20.onRenderStep = function(v105, v106) --[[ Line: 324 ]] --[[ Name: onRenderStep ]]
    -- upvalues: l_GamepadService_0 (copy), l_FFlagEnableSnapInVirtualCursor_0 (copy), l_Players_0 (copy), l_CoreGui_0 (copy), l_GuiService_0 (copy)
    v105:processMoving(v106);
    local l_l_GamepadService_0_GamepadCursorPosition_1 = l_GamepadService_0:GetGamepadCursorPosition();
    local v108, v109 = v105:processCandidates(l_l_GamepadService_0_GamepadCursorPosition_1, v105._targetingRadius, v106);
    if v105._selectionRadius < v109 then
        v108 = nil;
    end;
    if l_FFlagEnableSnapInVirtualCursor_0 then
        v105:processSnapping(v106, l_l_GamepadService_0_GamepadCursorPosition_1, v108);
    end;
    if v108 ~= v105._selectedObject then
        local l_PlayerGui_1 = l_Players_0.LocalPlayer:FindFirstChildOfClass("PlayerGui");
        if v108 then
            v105._cursorController:SetHighlight(true);
            if v108:IsDescendantOf(l_CoreGui_0) then
                l_GuiService_0.SelectedCoreObject = v108;
                l_GuiService_0.SelectedObject = nil;
            elseif l_PlayerGui_1 and v108:IsDescendantOf(l_PlayerGui_1) then
                l_GuiService_0.SelectedObject = v108;
                l_GuiService_0.SelectedCoreObject = nil;
            end;
        else
            v105._cursorController:SetHighlight(false);
            l_GuiService_0.SelectedObject = nil;
            l_GuiService_0.SelectedCoreObject = nil;
        end;
        v105._selectedObject = v108;
    end;
end;
return v20;