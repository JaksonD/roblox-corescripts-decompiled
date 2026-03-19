local l_Parent_0 = script.Parent;
local l_GuiService_0 = game:GetService("GuiService");
local l_Players_0 = game:GetService("Players");
local l_GamepadService_0 = game:GetService("GamepadService");
local l_CoreGui_0 = game:GetService("CoreGui");
local v5 = nil;
local v6 = require(l_Parent_0.Input);
local v7 = require(l_Parent_0.Interface);
local v8 = require(l_Parent_0.Properties);
local v9 = require(l_Parent_0.isCircleContainedInGuiObject);
local v10 = require(l_Parent_0.RotatePointAroundObject);
local v11 = 1;
local v12 = false;
local l_sin_0 = math.sin;
local l_cos_0 = math.cos;
local _ = math.abs;
local l_max_0 = math.max;
local l_min_0 = math.min;
local l_sign_0 = math.sign;
local l_abs_1 = math.abs;
local v20 = {};
local v21 = nil;
local v22 = nil;
local v23 = 1e999;
local function _(v24) --[[ Line: 36 ]] --[[ Name: isSelectableGuiObject ]]
    if not v24:IsA("GuiButton") and not v24:IsA("TextBox") then
        return false;
    elseif not v24.Active or not v24.Selectable then
        return false;
    elseif v24.AbsoluteSize.Magnitude == 0 then
        return false;
    else
        return true;
    end;
end;
local function _(v26, v27, v28) --[[ Line: 50 ]] --[[ Name: contains ]]
    local v29 = false;
    if v26.x >= v27.x then
        v29 = false;
        if v26.y >= v27.y then
            v29 = false;
            if v26.x <= v28.x then
                v29 = v26.y <= v28.y;
            end;
        end;
    end;
    return v29;
end;
local function v52(v31, v32, v33) --[[ Line: 54 ]] --[[ Name: handleScrollingFrame ]]
    -- upvalues: v20 (copy), v6 (copy), v8 (copy), l_abs_1 (copy), l_cos_0 (copy), l_sin_0 (copy), l_max_0 (copy), l_min_0 (copy), l_sign_0 (copy), v7 (copy)
    if not v31:IsA("ScrollingFrame") then
        return false;
    elseif not v31.ScrollingEnabled then
        return false;
    elseif v20[v31] then
        return false;
    else
        v20[v31] = true;
        local l_v6_Thumbstick2Vector_0 = v6:GetThumbstick2Vector();
        local v35 = v8.ScrollingSpeed * v33;
        local l_ScrollingRadius_0 = v8.ScrollingRadius;
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
        local l_AbsoluteSize_1 = v31.AbsoluteSize;
        local l_AbsolutePosition_0 = v31.AbsolutePosition;
        local v44 = v31.Rotation / 180 * 3.141592653589793;
        if l_abs_1(l_v6_Thumbstick2Vector_0.x) > v8.ThumbstickDeadzone and v40 then
            v31.CanvasPosition = v31.CanvasPosition + Vector2.new(l_v6_Thumbstick2Vector_0.x * v35, 0);
        end;
        if l_abs_1(l_v6_Thumbstick2Vector_0.y) > v8.ThumbstickDeadzone and v41 then
            v31.CanvasPosition = v31.CanvasPosition + Vector2.new(0, l_v6_Thumbstick2Vector_0.y * v35);
        end;
        local v45 = Vector2.new(l_cos_0(v44), (l_sin_0(v44)));
        local v46 = Vector2.new(-l_sin_0(v44), (l_cos_0(v44)));
        local v47 = Vector2.new(v32.X, v32.Y) - l_AbsolutePosition_0;
        local v48 = v47:Dot(v45) - l_AbsoluteSize_1.X / 2;
        local v49 = v47:Dot(v46) - l_AbsoluteSize_1.Y / 2;
        local v50 = Vector2.new(l_abs_1(v48), (l_abs_1(v49))) - l_AbsoluteSize_1 / 2;
        local l_Magnitude_0 = Vector2.new(l_max_0(v50.x, 0), (l_max_0(v50.y, 0))).Magnitude;
        if l_abs_1(l_min_0(l_max_0(v50.x, v50.y), 0) + l_Magnitude_0) < l_ScrollingRadius_0 then
            if l_abs_1(v50.x) < l_abs_1(v50.y) and v40 then
                v31.CanvasPosition = v31.CanvasPosition + Vector2.new(l_sign_0(v48) * v35, 0);
                v7:SetArrow(l_sign_0(v48), 0);
                return true;
            elseif l_abs_1(v50.x) >= l_abs_1(v50.y) and v41 then
                v31.CanvasPosition = v31.CanvasPosition + Vector2.new(0, l_sign_0(v49) * v35);
                v7:SetArrow(0, (l_sign_0(v49)));
                return true;
            end;
        end;
        return false;
    end;
end;
local function v65(_, v54, v55, v56) --[[ Line: 119 ]] --[[ Name: findClosestOrOccludingGuiObject ]]
    -- upvalues: v52 (copy), v12 (ref), v21 (ref), v10 (copy), v23 (ref), v9 (copy), v8 (copy), v22 (ref)
    for _, v58 in ipairs(v54) do
        if v52(v58, v55, v56) then
            v12 = true;
            return;
        else
            if (if not not v58:IsA("GuiButton") or v58:IsA("TextBox") then if v58.Active and v58.Selectable then v58.AbsoluteSize.Magnitude ~= 0 else false else false) and not v21 then
                v21 = v58;
            end;
            if if not not v58:IsA("GuiButton") or v58:IsA("TextBox") then if v58.Active and v58.Selectable then v58.AbsoluteSize.Magnitude ~= 0 else false else false then
                local l_AbsolutePosition_1 = v58.AbsolutePosition;
                local v60 = v58.AbsolutePosition + v58.AbsoluteSize;
                local v61 = 0;
                local v62 = if v58.AbsoluteRotation ~= 0 then v10(v55, v58) else v55;
                if v62.x < l_AbsolutePosition_1.x or v62.y < l_AbsolutePosition_1.y or v62.x > v60.x or v62.y > v60.y then
                    local v63 = if v62.x < l_AbsolutePosition_1.x then l_AbsolutePosition_1.x - v62.x else if v62.x > v60.x then v62.x - v60.x else 0;
                    local v64 = if v62.y < l_AbsolutePosition_1.y then l_AbsolutePosition_1.y - v62.y else if v62.y > v60.y then v62.y - v60.y else 0;
                    v61 = math.sqrt(math.pow(v63, 2) + math.pow(v64, 2));
                end;
                if v61 < v23 then
                    v21 = v58;
                    v23 = v61;
                end;
            end;
            if v58.Visible and v58.Active and v58.Interactable and v9(v55, v8.CursorRadius * v8.OcclusionRadiusScale, v58) then
                v22 = v58;
                return;
            end;
        end;
    end;
end;
local function v71(v66, v67, v68, v69) --[[ Line: 172 ]] --[[ Name: handleScrollingInAncestors ]]
    -- upvalues: v52 (copy), v12 (ref)
    local l_Parent_1 = v66.Parent;
    while true do
        if l_Parent_1 and l_Parent_1 ~= v67 then
            if v52(l_Parent_1, v68, v69) then
                v12 = true;
                return;
            else
                l_Parent_1 = l_Parent_1.Parent;
            end;
        else
            return;
        end;
    end;
end;
local function v81(v72, v73, v74) --[[ Line: 183 ]] --[[ Name: processCursorPosition ]]
    -- upvalues: v20 (copy), v21 (ref), v22 (ref), v23 (ref), l_GuiService_0 (copy), v5 (ref), l_Players_0 (copy), l_CoreGui_0 (copy), v12 (ref), v65 (copy), v71 (copy)
    table.clear(v20);
    v21 = nil;
    v22 = nil;
    v23 = 1e999;
    v72 = v72 - l_GuiService_0:GetGuiInset();
    if v5 == nil then
        v5 = l_Players_0.LocalPlayer:FindFirstChildOfClass("PlayerGui");
    end;
    local v75 = if v5 then v5:GetGuiObjectsInCircle(v72, v73) else {};
    local l_l_CoreGui_0_GuiObjectsInCircle_0 = l_CoreGui_0:GetGuiObjectsInCircle(v72, v73);
    v12 = false;
    for _, v78 in ipairs({
        {
            l_CoreGui_0, 
            l_l_CoreGui_0_GuiObjectsInCircle_0
        }, 
        {
            v5, 
            v75
        }
    }) do
        local v79 = v78[1];
        local v80 = v78[2];
        v65(v79, v80, v72, v74);
        if v12 then
            return nil;
        else
            if v21 then
                v71(v21, v79, v72, v74);
            end;
            if v12 then
                return nil;
            else
                if v22 and v22 ~= v21 then
                    v71(v22, v79, v72, v74);
                end;
                if v12 then
                    return nil;
                elseif v22 then
                    return v21;
                end;
            end;
        end;
    end;
    return v21;
end;
local function _() --[[ Line: 248 ]] --[[ Name: getMaxSpeed ]]
    -- upvalues: l_GuiService_0 (copy), v8 (copy)
    return l_GuiService_0:GetScreenResolution().Magnitude * v8.MaxSpeedRelative;
end;
return function(v83, v84) --[[ Line: 253 ]]
    -- upvalues: l_GuiService_0 (copy), v6 (copy), l_GamepadService_0 (copy), v11 (ref), v7 (copy), v12 (ref), v8 (copy), v81 (copy), l_CoreGui_0 (copy), v5 (ref)
    local v85 = l_GuiService_0:GetScreenResolution() + l_GuiService_0:GetGuiInset();
    local l_v6_ThumbstickVector_0 = v6:GetThumbstickVector();
    local l_l_GamepadService_0_GamepadCursorPosition_0 = l_GamepadService_0:GetGamepadCursorPosition();
    local v88 = nil;
    local _ = Vector2.new();
    if v83.SelectedObject == nil then
        v11 = 1;
        v7:SetCursorHighlight(false);
    end;
    if v12 then
        v11 = v8.ScrollingSlowDown;
    end;
    v88 = l_v6_ThumbstickVector_0 * (l_GuiService_0:GetScreenResolution().Magnitude * v8.MaxSpeedRelative) * v11;
    if v88.Magnitude > 0 then
        local v90 = l_l_GamepadService_0_GamepadCursorPosition_0 + v88 * v84;
        local v91 = math.clamp(v90.x, 0, v85.x);
        local v92 = math.clamp(v90.y, 0, v85.y);
        l_l_GamepadService_0_GamepadCursorPosition_0 = Vector2.new(v91, v92);
    end;
    v7:SetCursorPosition(l_l_GamepadService_0_GamepadCursorPosition_0);
    l_GamepadService_0:SetGamepadCursorPosition(l_l_GamepadService_0_GamepadCursorPosition_0);
    v83.CursorPosition = l_l_GamepadService_0_GamepadCursorPosition_0;
    local v93 = v81(l_l_GamepadService_0_GamepadCursorPosition_0, v8.SelectionRadius, v84);
    if v93 ~= v83.PreviouslySelectedObject then
        v83.PreviouslySelectedObject = v93;
        v7:SetCursorHighlight(v93 ~= nil);
        if v93 then
            if v93 ~= v83.SelectedObject then
                v83.SelectedObject = v93;
                v11 = v8.SpeedAdjustmentTarget;
            end;
        else
            v83.SelectedObject = nil;
            v11 = 1;
        end;
        if v83.SelectedObject == nil then
            l_GuiService_0.SelectedObject = nil;
            l_GuiService_0.SelectedCoreObject = nil;
            return;
        elseif v83.SelectedObject:IsDescendantOf(l_CoreGui_0) then
            l_GuiService_0.SelectedCoreObject = v83.SelectedObject;
            l_GuiService_0.SelectedObject = nil;
            return;
        elseif v83.SelectedObject:IsDescendantOf(v5) then
            l_GuiService_0.SelectedObject = v83.SelectedObject;
            l_GuiService_0.SelectedCoreObject = nil;
        end;
    end;
end;