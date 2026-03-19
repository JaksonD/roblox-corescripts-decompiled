local l_Parent_0 = script.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local l_Parent_2 = l_Parent_1.Parent.Parent;
local l_Parent_3 = l_Parent_2.Parent;
local v4 = require(l_Parent_3.React);
local l_Portal_0 = require(l_Parent_3.Roact).Portal;
local v6 = require(l_Parent_3.LuauPolyfill);
local _ = require(l_Parent_0.Types);
local v8 = require(l_Parent_0.Constants);
local v9 = require(l_Parent_2.Core.Animation.withAnimation);
local v10 = require(l_Parent_0.TooltipCallout);
local v11 = require(l_Parent_1.Tooltip.Enum.TooltipOrientation);
local function v17(v12, v13) --[[ Line: 19 ]] --[[ Name: argmax ]]
    local v14 = nil;
    for v15, v16 in pairs(v12) do
        if not v13[v15] and (v14 == nil or v12[v14] < v16) then
            v14 = v15;
        end;
    end;
    return v14;
end;
local function v20(v18, v19) --[[ Line: 32 ]] --[[ Name: getDistances ]]
    -- upvalues: v11 (copy), v8 (copy)
    return {
        [v11.Top] = v18.Y - v8.SCREEN_MARGIN, 
        [v11.Bottom] = v19.Y - v18.Y - v8.SCREEN_MARGIN, 
        [v11.Left] = v18.X - v8.SCREEN_MARGIN, 
        [v11.Right] = v19.X - v18.X - v8.SCREEN_MARGIN
    };
end;
getOrientationAndContentOffset = function(v21, v22, v23, v24) --[[ Line: 43 ]] --[[ Name: getOrientationAndContentOffset ]]
    -- upvalues: v17 (copy), v11 (copy), v8 (copy)
    local v25 = {};
    local l_zero_0 = Vector2.zero;
    while true do
        if not v21 or v25[v21] then
            local v27 = v17(v22, v25);
            if v27 then
                v21 = v27;
            else
                break;
            end;
        end;
        if v21 == v11.Top or v21 == v11.Bottom then
            if v23.Y + v8.DISTANCE_TO_CONTENT + v24.Y <= v22[v21] then
                local l_Left_0 = v11.Left;
                if v22[v11.Right] < v22[v11.Left] then
                    l_Left_0 = v11.Right;
                end;
                local v29 = v22[l_Left_0];
                if v8.MIN_DISTANCE_TO_CARET_MIDDLE <= v29 then
                    l_zero_0 = math.max(0, v24.X / 2 - v29) * -1 * v8.ORIENTATION_VECTOR[l_Left_0];
                    break;
                else
                    v25[v8.OPPOSITE_ORIENTATION[v21]] = true;
                end;
            end;
        elseif v23.X + v8.DISTANCE_TO_CONTENT + v24.X <= v22[v21] then
            local l_Top_0 = v11.Top;
            if v22[v11.Bottom] < v22[v11.Top] then
                l_Top_0 = v11.Bottom;
            end;
            local v31 = v22[l_Top_0];
            if v8.MIN_DISTANCE_TO_CARET_MIDDLE <= v31 then
                l_zero_0 = math.max(0, v24.Y / 2 - v31) * -1 * v8.ORIENTATION_VECTOR[l_Top_0];
                break;
            else
                v25[v8.OPPOSITE_ORIENTATION[v21]] = true;
            end;
        end;
        v25[v21] = true;
        v21 = v8.OPPOSITE_ORIENTATION[v21];
    end;
    return v21, l_zero_0;
end;
return function(v32) --[[ Line: 106 ]] --[[ Name: TooltipController ]]
    -- upvalues: v4 (copy), v11 (copy), v20 (copy), v8 (copy), v6 (copy), v10 (copy), l_Portal_0 (copy), v9 (copy)
    local v33, v34 = v4.useState(Vector2.zero);
    local v35, v36 = v4.useState(Vector2.zero);
    local v37, v38 = v4.useState(Vector2.zero);
    local v39, v40 = v4.useState(Vector2.zero);
    local v41, v42 = v4.useState(Vector2.zero);
    local v44 = v4.useCallback(function(v43) --[[ Line: 113 ]]
        -- upvalues: v34 (copy), v36 (copy)
        v34(v43.AbsolutePosition);
        v36(v43.AbsoluteSize);
    end);
    local function v46(v45) --[[ Line: 119 ]]
        -- upvalues: v40 (copy), v38 (copy)
        if v45 then
            v40(v45.AbsolutePosition);
            v38(v45.AbsoluteSize);
        end;
    end;
    local v47 = v35 / 2;
    local v48 = v33 + v47 - v39;
    local v49 = v32.preferredOrientation or v11.Top;
    local v51, v52 = v4.useMemo(function() --[[ Line: 131 ]]
        -- upvalues: v20 (ref), v48 (copy), v37 (copy), v49 (copy), v47 (copy), v41 (copy)
        local v50 = v20(v48, v37);
        return getOrientationAndContentOffset(v49, v50, v47, v41);
    end, {
        v49, 
        v37, 
        v48, 
        v47, 
        v41
    });
    local v53 = if not v32.disabled and v32.active then v8.ACTIVE_ANIMATION_TARGETS else v8.INACTIVE_ANIMATION_TARGETS;
    local v59 = v9(v53, function(v54) --[[ Line: 142 ]] --[[ Name: renderWithAnimation ]]
        -- upvalues: v51 (copy), v48 (copy), v47 (copy), v52 (copy), v42 (copy), v6 (ref), v32 (copy), v4 (ref), v10 (ref), v46 (copy), l_Portal_0 (ref)
        if v54.transparency == 1 then
            return nil;
        else
            local v55 = {
                orientation = v51, 
                triggerPointCenter = v48, 
                triggerPointRadius = v47, 
                contentOffsetVector = v52, 
                onContentSizeChanged = v42, 
                distanceOffset = v54.distanceOffset, 
                transparency = v54.transparency
            };
            local v56 = v6.Object.assign({}, v32.tooltipProps, v55);
            local v57 = {
                Tooltip = v4.createElement(v10, v56)
            };
            local v58 = if v32.DEBUG_useTargetDirectly then v4.createElement("Frame", {
                ZIndex = v32.DisplayOrder, 
                Size = UDim2.fromScale(1, 1), 
                BackgroundTransparency = 1, 
                [v4.Change.AbsoluteSize] = v46, 
                [v4.Change.AbsolutePosition] = v46, 
                ref = v46
            }, v57) else v4.createElement("ScreenGui", {
                ZIndexBehavior = Enum.ZIndexBehavior.Sibling, 
                IgnoreGuiInset = true, 
                DisplayOrder = v32.DisplayOrder, 
                [v4.Change.AbsoluteSize] = v46, 
                [v4.Change.AbsolutePosition] = v46, 
                ref = v46
            }, v57);
            return v4.createElement(l_Portal_0, {
                target = v32.guiTarget
            }, {
                TooltipLayer = v58
            });
        end;
    end, v8.ANIMATION_OPTIONS);
    local v60 = v32.triggerPointName or "TriggerPoint";
    return v4.createElement(v4.Fragment, nil, {
        Portal = v59, 
        [v60] = v32.renderTriggerPoint(v44)
    });
end;