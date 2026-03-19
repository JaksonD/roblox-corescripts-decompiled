local l_Parent_0 = script.Parent.Parent;
local l_GuiService_0 = game:GetService("GuiService");
local l_GamepadService_0 = game:GetService("GamepadService");
local l_Players_0 = game:GetService("Players");
local l_CoreGui_0 = game:GetService("CoreGui");
local l_Parent_1 = script:FindFirstAncestor("VirtualCursorModular").Parent;
local v6 = require(l_Parent_1.SharedFlags);
local l_FFlagEnableSnapInVirtualCursor_0 = v6.FFlagEnableSnapInVirtualCursor;
local l_FFlagEnableMoveSnapInVirtualCursor_0 = v6.FFlagEnableMoveSnapInVirtualCursor;
local l_FIntSnapLevelInVirtualCursor_0 = v6.FIntSnapLevelInVirtualCursor;
local l_FFlagVirtualCursorSnapStopsWhenInputStops_0 = v6.FFlagVirtualCursorSnapStopsWhenInputStops;
local l_FFlagVirtualCursorSnapLevelBasedOnDirection_0 = v6.FFlagVirtualCursorSnapLevelBasedOnDirection;
local l_FFlagEnableVirtualCursorDebugging_0 = v6.FFlagEnableVirtualCursorDebugging;
local v13 = require(l_Parent_0.Properties);
local v14 = require(l_Parent_0.Util);
local l_GetMaxSpeed_0 = v14.GetMaxSpeed;
local l_IsCircleContainedInGuiObject_0 = v14.IsCircleContainedInGuiObject;
local l_IsSelectableGuiObject_0 = v14.IsSelectableGuiObject;
local l_IsSinkingGuiObject_0 = v14.IsSinkingGuiObject;
local l_GetPointRotatedAroundObject_0 = v14.GetPointRotatedAroundObject;
local l_cos_0 = math.cos;
local l_sin_0 = math.sin;
local l_abs_0 = math.abs;
local l_max_0 = math.max;
local l_min_0 = math.min;
local l_sign_0 = math.sign;
local v26 = {};
v26.__index = v26;
v26.new = function(v27, v28, v29) --[[ Line: 61 ]] --[[ Name: new ]]
    -- upvalues: v13 (copy), v26 (copy)
    return (setmetatable({
        _isScrolling = false, 
        _selectedObject = nil, 
        _inputController = v27, 
        _cursorController = v28, 
        _snapController = v29, 
        _targetingRadius = v13.SnapRadius, 
        _selectionRadius = v13.SelectionRadius, 
        _scrolled = {}
    }, v26));
end;
v26.processScrolling = function(v30, v31, v32, v33) --[[ Line: 76 ]] --[[ Name: processScrolling ]]
    -- upvalues: v13 (copy), l_abs_0 (copy), l_cos_0 (copy), l_sin_0 (copy), l_max_0 (copy), l_min_0 (copy), l_sign_0 (copy)
    if not v31:IsA("ScrollingFrame") then
        return false;
    elseif not v31.ScrollingEnabled then
        return false;
    elseif v30._scrolled[v31] then
        return false;
    else
        v30._scrolled[v31] = true;
        local l_ScrollVector_0 = v30._inputController:GetScrollVector();
        local v35 = v13.ScrollingSpeed * v33;
        local l_ScrollingRadius_0 = v13.ScrollingRadius;
        local l_AbsoluteCanvasSize_0 = v31.AbsoluteCanvasSize;
        local l_AbsoluteSize_0 = v31.AbsoluteSize;
        local l_ScrollingDirection_0 = v31.ScrollingDirection;
        local v40 = false;
        if l_AbsoluteCanvasSize_0.X > l_AbsoluteSize_0.X then
            v40 = true;
            if l_ScrollingDirection_0 ~= Enum.ScrollingDirection.XY then
                v40 = l_ScrollingDirection_0 == Enum.ScrollingDirection.X;
            end;
        end;
        local v41 = false;
        if l_AbsoluteCanvasSize_0.Y > l_AbsoluteSize_0.Y then
            v41 = true;
            if l_ScrollingDirection_0 ~= Enum.ScrollingDirection.XY then
                v41 = l_ScrollingDirection_0 == Enum.ScrollingDirection.Y;
            end;
        end;
        local l_AbsolutePosition_0 = v31.AbsolutePosition;
        local v43 = v31.Rotation / 180 * 3.141592653589793;
        if l_abs_0(l_ScrollVector_0.x) > v13.ThumbstickDeadzone and v40 then
            v31.CanvasPosition = v31.CanvasPosition + Vector2.new(l_ScrollVector_0.x * v35, 0);
        end;
        if l_abs_0(l_ScrollVector_0.y) > v13.ThumbstickDeadzone and v41 then
            v31.CanvasPosition = v31.CanvasPosition + Vector2.new(0, l_ScrollVector_0.y * v35);
        end;
        local v44 = Vector2.new(l_cos_0(v43), (l_sin_0(v43)));
        local v45 = Vector2.new(-l_sin_0(v43), (l_cos_0(v43)));
        local v46 = Vector2.new(v32.X, v32.Y) - l_AbsolutePosition_0;
        local v47 = v46:Dot(v44) - l_AbsoluteSize_0.X / 2;
        local v48 = v46:Dot(v45) - l_AbsoluteSize_0.Y / 2;
        local v49 = Vector2.new(l_abs_0(v47), (l_abs_0(v48))) - l_AbsoluteSize_0 / 2;
        local l_Magnitude_0 = Vector2.new(l_max_0(v49.X, 0), (l_max_0(v49.Y, 0))).Magnitude;
        if l_abs_0(l_min_0(l_max_0(v49.X, v49.Y), 0) + l_Magnitude_0) < l_ScrollingRadius_0 then
            if l_abs_0(v49.X) < l_abs_0(v49.Y) and v40 then
                v31.CanvasPosition = v31.CanvasPosition + Vector2.new(l_sign_0(v47) * v35, 0);
                v30._cursorController:SetArrow(l_sign_0(v47), 0);
                return true;
            elseif l_abs_0(v49.X) >= l_abs_0(v49.Y) and v41 then
                v31.CanvasPosition = v31.CanvasPosition + Vector2.new(0, l_sign_0(v48) * v35);
                v30._cursorController:SetArrow(0, (l_sign_0(v48)));
                return true;
            end;
        end;
        return false;
    end;
end;
v26.getClosestCandidate = function(v51, v52, v53, _, v55, v56) --[[ Line: 141 ]] --[[ Name: getClosestCandidate ]]
    -- upvalues: l_IsSelectableGuiObject_0 (copy), l_GetPointRotatedAroundObject_0 (copy), l_IsSinkingGuiObject_0 (copy), l_IsCircleContainedInGuiObject_0 (copy), v13 (copy)
    local v57 = nil;
    local v58 = nil;
    local v59 = 1e999;
    if v56 then
        v57 = v56.closestCandidate;
        v58 = v56.occludingCandidate;
        v59 = v56.closestDistance;
    end;
    for _, v61 in ipairs(v52) do
        if v51:processScrolling(v61, v53, v55) then
            v51._isScrolling = true;
            return v57, v58, v59;
        else
            if l_IsSelectableGuiObject_0(v61) then
                local l_AbsolutePosition_1 = v61.AbsolutePosition;
                local v63 = v61.AbsolutePosition + v61.AbsoluteSize;
                local v64 = 0;
                local v65 = if v61.AbsoluteRotation ~= 0 then l_GetPointRotatedAroundObject_0(v53, v61) else v53;
                if v65.X < l_AbsolutePosition_1.X or v65.Y < l_AbsolutePosition_1.Y or v65.X > v63.X or v65.Y > v63.Y then
                    local v66 = if v65.X < l_AbsolutePosition_1.X then l_AbsolutePosition_1.X - v65.X else if v65.X > v63.X then v65.X - v63.X else 0;
                    local v67 = if v65.Y < l_AbsolutePosition_1.Y then l_AbsolutePosition_1.Y - v65.Y else if v65.Y > v63.Y then v65.Y - v63.Y else 0;
                    v64 = math.sqrt(math.pow(v66, 2) + math.pow(v67, 2));
                end;
                if v64 < v59 or v57 == nil then
                    v57 = v61;
                    v59 = v64;
                end;
            end;
            if l_IsSinkingGuiObject_0(v61) and l_IsCircleContainedInGuiObject_0(v53, v13.CursorRadius * v13.OcclusionRadiusScale, v61) then
                return v57, v61, v59;
            end;
        end;
    end;
    return v57, v58, v59;
end;
v26.processMoving = function(v68, v69) --[[ Line: 211 ]] --[[ Name: processMoving ]]
    -- upvalues: l_GuiService_0 (copy), l_GamepadService_0 (copy), l_FFlagEnableMoveSnapInVirtualCursor_0 (copy), l_FIntSnapLevelInVirtualCursor_0 (copy), v13 (copy), l_GetMaxSpeed_0 (copy)
    local v70 = l_GuiService_0:GetScreenResolution() + l_GuiService_0:GetGuiInset();
    local l_MoveVector_0 = v68._inputController:GetMoveVector();
    local l_l_GamepadService_0_GamepadCursorPosition_0 = l_GamepadService_0:GetGamepadCursorPosition();
    if l_FFlagEnableMoveSnapInVirtualCursor_0 and not v68._isScrolling then
        local l_CursorScreenGuiOffset_0 = v68._cursorController:GetCursorScreenGuiOffset();
        l_MoveVector_0 = v68._snapController:adjustMove(l_MoveVector_0, {
            cursorPosition = l_l_GamepadService_0_GamepadCursorPosition_0 + l_CursorScreenGuiOffset_0, 
            strengthMultiplier = l_FIntSnapLevelInVirtualCursor_0 / 100, 
            candidates = v68:getSnapCandidateList(l_l_GamepadService_0_GamepadCursorPosition_0, v13.SnapRadius)
        });
    end;
    local v74 = l_MoveVector_0 * l_GetMaxSpeed_0() * (v68._selectedObject == nil and 1 or if v68._isScrolling then v13.ScrollingSlowDown else v13.SpeedAdjustmentTarget);
    if v74.Magnitude > 0 then
        local v75 = l_l_GamepadService_0_GamepadCursorPosition_0 + v74 * v69;
        l_l_GamepadService_0_GamepadCursorPosition_0 = Vector2.new(math.clamp(v75.X, 0, v70.X), (math.clamp(v75.Y, 0, v70.Y)));
    end;
    v68._cursorController:SetPosition(l_l_GamepadService_0_GamepadCursorPosition_0);
    l_GamepadService_0:SetGamepadCursorPosition(l_l_GamepadService_0_GamepadCursorPosition_0);
end;
v26.processSnapping = function(v76, v77, v78, v79, v80) --[[ Line: 244 ]] --[[ Name: processSnapping ]]
    -- upvalues: l_FFlagEnableSnapInVirtualCursor_0 (copy), l_FFlagVirtualCursorSnapStopsWhenInputStops_0 (copy), l_FFlagEnableVirtualCursorDebugging_0 (copy), l_FIntSnapLevelInVirtualCursor_0 (copy), v13 (copy), l_GuiService_0 (copy), l_FFlagVirtualCursorSnapLevelBasedOnDirection_0 (copy), l_GamepadService_0 (copy)
    if not l_FFlagEnableSnapInVirtualCursor_0 then
        return;
    else
        local v81 = (v78 - v79) / v77;
        if v81.Magnitude <= 0 and l_FFlagVirtualCursorSnapStopsWhenInputStops_0 then
            if l_FFlagEnableVirtualCursorDebugging_0 then
                print("Cursor is not moving, skipping snap processing");
            end;
            return;
        else
            local l_CursorScreenGuiOffset_1 = v76._cursorController:GetCursorScreenGuiOffset();
            local v83 = v76._snapController:adjustSnap({
                cursorPosition = v78 + l_CursorScreenGuiOffset_1, 
                strengthMultiplier = l_FIntSnapLevelInVirtualCursor_0 / 100, 
                targetObject = v80, 
                deltaTime = v77, 
                expiredTime = v13.SnapExpireTime
            }) - l_CursorScreenGuiOffset_1;
            local v84 = l_GuiService_0:GetScreenResolution() + l_GuiService_0:GetGuiInset();
            local v85 = math.clamp(v83.X, 0, v84.X);
            local v86 = math.clamp(v83.Y, 0, v84.Y);
            local v87 = Vector2.new(v85, v86);
            if (v87 - v78):Dot(v81) <= 0 and l_FFlagVirtualCursorSnapLevelBasedOnDirection_0 then
                if l_FFlagEnableVirtualCursorDebugging_0 then
                    print("Snap position is behind cursor movement, skipping snap");
                end;
                return;
            else
                v76._cursorController:SetPosition(v87);
                l_GamepadService_0:SetGamepadCursorPosition(v87);
                return;
            end;
        end;
    end;
end;
v26.getCandidates = function(_, v89, v90) --[[ Line: 292 ]] --[[ Name: getCandidates ]]
    -- upvalues: l_Players_0 (copy), l_CoreGui_0 (copy)
    local l_PlayerGui_0 = l_Players_0.LocalPlayer:FindFirstChildOfClass("PlayerGui");
    local v92 = if l_PlayerGui_0 then l_PlayerGui_0:GetGuiObjectsInCircle(v89, v90) else {};
    local l_l_CoreGui_0_GuiObjectsInCircle_0 = l_CoreGui_0:GetGuiObjectsInCircle(v89, v90);
    return {
        {
            l_CoreGui_0, 
            l_l_CoreGui_0_GuiObjectsInCircle_0
        }, 
        {
            l_PlayerGui_0, 
            v92
        }
    };
end;
v26.processAncestors = function(v94, v95, v96, v97, v98) --[[ Line: 300 ]] --[[ Name: processAncestors ]]
    local l_Parent_2 = v95.Parent;
    while true do
        if l_Parent_2 and l_Parent_2 ~= v96 then
            if v94:processScrolling(l_Parent_2, v97, v98) then
                v94._isScrolling = true;
                return;
            else
                l_Parent_2 = l_Parent_2.Parent;
            end;
        else
            return;
        end;
    end;
end;
v26.processCandidates = function(v100, v101, v102, v103) --[[ Line: 311 ]] --[[ Name: processCandidates ]]
    -- upvalues: l_GuiService_0 (copy)
    v101 = v101 - l_GuiService_0:GetGuiInset();
    local v104 = v100:getCandidates(v101, v102);
    local v105 = nil;
    local v106 = nil;
    local v107 = 1e999;
    v100._scrolled = {};
    v100._isScrolling = false;
    for _, v109 in ipairs(v104) do
        local v110 = v109[1];
        local v111, v112, v113 = v100:getClosestCandidate(v109[2], v101, v102, v103, {
            closestCandidate = v105, 
            occludingCandidate = v106, 
            closestDistance = v107
        });
        v105 = v111;
        v106 = v112;
        v107 = v113;
        if v100._isScrolling then
            return nil, 1e999;
        else
            if v105 then
                v100:processAncestors(v105, v110, v101, v103);
            end;
            if v100._isScrolling then
                return nil, 1e999;
            else
                if v106 and v106 ~= v105 then
                    v100:processAncestors(v106, v110, v101, v103);
                end;
                if v100._isScrolling then
                    return nil, 1e999;
                elseif v106 then
                    return v105, v107;
                end;
            end;
        end;
    end;
    return v105, v107;
end;
v26.getSnapCandidateList = function(v114, v115, v116) --[[ Line: 358 ]] --[[ Name: getSnapCandidateList ]]
    -- upvalues: l_GuiService_0 (copy), l_Players_0 (copy), l_CoreGui_0 (copy)
    local v117 = {};
    v115 = v115 - l_GuiService_0:GetGuiInset();
    local v118 = l_GuiService_0:GetScreenResolution() + l_GuiService_0:GetGuiInset();
    local l_LocalPlayer_0 = l_Players_0.LocalPlayer;
    local v120 = if l_LocalPlayer_0 then l_LocalPlayer_0:FindFirstChildOfClass("PlayerGui") else nil;
    local v121 = if v120 then v120:GetGuiObjectsInCircle(v115, v116) else {};
    local l_l_CoreGui_0_GuiObjectsInCircle_1 = l_CoreGui_0:GetGuiObjectsInCircle(v115, v116);
    for _, v124 in v121 do
        if v124:IsA("GuiObject") and v114._snapController:isSnapCandidate(v124, v118) then
            table.insert(v117, v124);
        end;
    end;
    for _, v126 in l_l_CoreGui_0_GuiObjectsInCircle_1 do
        if v126:IsA("GuiObject") and v114._snapController:isSnapCandidate(v126, v118) then
            table.insert(v117, v126);
        end;
    end;
    return v117;
end;
v26.onRenderStep = function(v127, v128) --[[ Line: 385 ]] --[[ Name: onRenderStep ]]
    -- upvalues: l_GamepadService_0 (copy), l_FFlagEnableSnapInVirtualCursor_0 (copy), l_FFlagEnableMoveSnapInVirtualCursor_0 (copy), l_Players_0 (copy), l_CoreGui_0 (copy), l_GuiService_0 (copy)
    local l_l_GamepadService_0_GamepadCursorPosition_1 = l_GamepadService_0:GetGamepadCursorPosition();
    v127:processMoving(v128);
    local l_l_GamepadService_0_GamepadCursorPosition_2 = l_GamepadService_0:GetGamepadCursorPosition();
    local v131, v132 = v127:processCandidates(l_l_GamepadService_0_GamepadCursorPosition_2, v127._targetingRadius, v128);
    if v127._selectionRadius < v132 then
        v131 = nil;
    end;
    if l_FFlagEnableSnapInVirtualCursor_0 and not l_FFlagEnableMoveSnapInVirtualCursor_0 then
        v127:processSnapping(v128, l_l_GamepadService_0_GamepadCursorPosition_2, l_l_GamepadService_0_GamepadCursorPosition_1, v131);
    end;
    if v131 ~= v127._selectedObject then
        local l_PlayerGui_1 = l_Players_0.LocalPlayer:FindFirstChildOfClass("PlayerGui");
        if v131 then
            v127._cursorController:SetHighlight(true);
            if v131:IsDescendantOf(l_CoreGui_0) then
                l_GuiService_0.SelectedCoreObject = v131;
                l_GuiService_0.SelectedObject = nil;
            elseif l_PlayerGui_1 and v131:IsDescendantOf(l_PlayerGui_1) then
                l_GuiService_0.SelectedObject = v131;
                l_GuiService_0.SelectedCoreObject = nil;
            end;
        else
            v127._cursorController:SetHighlight(false);
            l_GuiService_0.SelectedObject = nil;
            l_GuiService_0.SelectedCoreObject = nil;
        end;
        v127._selectedObject = v131;
    end;
end;
return v26;