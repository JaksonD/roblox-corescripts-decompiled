local l_Parent_0 = script.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local v2 = require(l_Parent_1.CapturesCommon);
local v3 = require(l_Parent_1.React);
local v4 = require(l_Parent_1.ReactOtter);
local l_useAnimatedBinding_0 = v4.useAnimatedBinding;
local l_useCallback_0 = v3.useCallback;
local l_useDeviceInsets_0 = require(l_Parent_1.Responsive).useDeviceInsets;
local l_useEffect_0 = v3.useEffect;
local l_useGuiInset_0 = v2.Hooks.useGuiInset;
local l_useRef_0 = v3.useRef;
local l_useState_0 = v3.useState;
local v12 = require(l_Parent_0.Utils.CaptureControlsConfiguration);
local v13 = require(l_Parent_0.Enums.SnapDirection);
local v14 = require(l_Parent_0.Flags.FFlagCapturesDragEdgeOffsetEnabled);
local v15 = game:DefineFastFlag("UpdateCaptureControlsForFoundationStyling", false);
local l_game_EngineFeature_0 = game:GetEngineFeature("UIDragDetectorFixEventPositionEnabled");
local v17 = {
    x = 0.5, 
    y = 0.5
};
local v18 = {
    xOffset = -100, 
    yOffset = -100
};
local v19 = Vector2.new(1, 0.5);
local l_Right_0 = v13.Right;
local v21 = {
    duration = 0.4, 
    easingStyle = {
        0.19, 
        1, 
        0.22, 
        1
    }
};
local function v25(v22) --[[ Line: 35 ]] --[[ Name: validateRefs ]]
    -- upvalues: v15 (copy)
    for _, v24 in v22 do
        if v24.current == nil then
            return false;
        elseif v15 and (v24.current.AbsoluteSize.X <= 0 or v24.current.AbsoluteSize.Y <= 0) then
            return false;
        end;
    end;
    return true;
end;
local function v36(v26, v27, v28, v29, v30) --[[ Line: 52 ]] --[[ Name: clampItemPosition ]]
    -- upvalues: v14 (copy)
    local v31 = v26 - v28;
    local v32 = v14 and 50 or 0;
    local v33 = if v14 then v30.Y else 0;
    if not v14 and v31.X + v27.X < v30.X and v31.Y < v30.Y then
        v33 = v30.Y;
    elseif not v14 and v31.Y < v30.Y then
        v32 = v30.X;
    end;
    local l_v32_0 = v32;
    local l_v33_0 = v33;
    if v29.X - v32 > v27.X then
        l_v32_0 = math.clamp(v31.X, v32, v29.X - v27.X - (v14 and 50 or 0));
    end;
    if v29.Y - v33 > v27.Y then
        l_v33_0 = math.clamp(v31.Y, v33, v29.Y - v27.Y);
    end;
    return Vector2.new(l_v32_0, l_v33_0);
end;
local function v44(v37, v38, v39, v40, v41, v42) --[[ Line: 92 ]] --[[ Name: getSnapPosition ]]
    -- upvalues: v36 (copy)
    local v43 = Vector2.new(v40.X * v41.X, v40.Y * v41.Y) - Vector2.new(v37.X * v38.X, v37.Y * v38.Y) + v39;
    return (v36(v43, v37, v39, v40, v42));
end;
local function v55(v45, v46, v47, v48) --[[ Line: 119 ]] --[[ Name: getSnapAnchorPoint ]]
    local v49 = v45 - v46;
    local v50 = {
        Vector2.new(0, (math.max(v49.Y, v48.Y))), 
        Vector2.new(v47.X, v49.Y), 
        Vector2.new(math.max(v49.X, v48.X), 0), 
        Vector2.new(v49.X, v47.Y)
    };
    table.sort(v50, function(v51, v52) --[[ Line: 134 ]]
        -- upvalues: v49 (copy)
        return (v51 - v49).Magnitude < (v52 - v49).Magnitude;
    end);
    local v53 = v50[1];
    local l_Magnitude_0 = (v53 - v49).Magnitude;
    return v53 / v47, l_Magnitude_0;
end;
local function _(v56) --[[ Line: 143 ]] --[[ Name: getSnapDirectionFromAnchorPoint ]]
    -- upvalues: v13 (copy)
    if v56.X == 0 then
        return v13.Left;
    elseif v56.X == 1 then
        return v13.Right;
    elseif v56.Y == 0 then
        return v13.Top;
    else
        return v13.Bottom;
    end;
end;
local function _(v58, v59) --[[ Line: 155 ]] --[[ Name: getShouldRotate ]]
    local v60 = true;
    if v59.X ~= 0 then
        v60 = v59.X == 1;
    end;
    local v61 = true;
    if v59.Y ~= 0 then
        v61 = v59.Y == 1;
    end;
    local v62 = false;
    if v60 and v61 then
        return false;
    elseif v61 and not v58 then
        return true;
    else
        if v60 and v58 then
            v62 = true;
        end;
        return v62;
    end;
end;
return function(v64, v65) --[[ Line: 171 ]] --[[ Name: useCaptureControlsController ]]
    -- upvalues: l_useRef_0 (copy), v12 (copy), l_useState_0 (copy), v19 (copy), l_Right_0 (copy), l_useGuiInset_0 (copy), l_useDeviceInsets_0 (copy), l_useCallback_0 (copy), l_useAnimatedBinding_0 (copy), v17 (copy), v18 (copy), l_useEffect_0 (copy), v25 (copy), v13 (copy), v4 (copy), v21 (copy), v44 (copy), v36 (copy), l_game_EngineFeature_0 (copy), v55 (copy)
    local v66 = l_useRef_0(v65);
    local v67 = l_useRef_0(nil);
    local v68 = l_useRef_0(nil);
    local v69 = l_useRef_0(nil);
    local v70 = l_useRef_0(false);
    local v71 = l_useRef_0(nil);
    local v72 = l_useRef_0(v12.getStoredSnapAnchorPoint());
    local v73, v74 = l_useState_0(v19);
    local v75, v76 = l_useState_0(false);
    local v77, v78 = l_useState_0(false);
    local v79, v80 = l_useState_0(l_Right_0);
    local v81 = l_useGuiInset_0();
    local v82 = l_useDeviceInsets_0();
    local v83 = l_useCallback_0(function() --[[ Line: 188 ]]
        -- upvalues: v70 (copy)
        v70.current = false;
    end, {});
    local v84, v85 = l_useAnimatedBinding_0(v17);
    local v86, v87 = l_useAnimatedBinding_0(v18, v83);
    l_useEffect_0(function() --[[ Line: 199 ]]
        -- upvalues: v64 (copy), v25 (ref), v69 (copy), v67 (copy), v66 (copy), v65 (copy), v72 (copy), v74 (copy), v80 (copy), v13 (ref), v77 (copy), v85 (copy), v4 (ref), v21 (ref), v78 (copy), v44 (ref), v87 (copy)
        if not v64 or not v25({
            v69, 
            v67
        }) then
            return;
        else
            assert(v69.current ~= nil, "dragItemRef is nil");
            assert(v67.current ~= nil, "dragContainerRef is nil");
            v66.current = v65;
            local l_current_0 = v72.current;
            v74(l_current_0);
            v80(if l_current_0.X == 0 then v13.Left else if l_current_0.X == 1 then v13.Right else if l_current_0.Y == 0 then v13.Top else v13.Bottom);
            local l_AbsoluteSize_0 = v69.current.AbsoluteSize;
            local l_AnchorPoint_0 = v69.current.AnchorPoint;
            local l_v77_0 = v77;
            local v92 = true;
            if l_current_0.X ~= 0 then
                v92 = l_current_0.X == 1;
            end;
            local v93 = true;
            if l_current_0.Y ~= 0 then
                v93 = l_current_0.Y == 1;
            end;
            local v94 = false;
            if v92 and v93 then
                v94 = false;
            elseif v93 and not l_v77_0 then
                v94 = true;
            elseif v92 and l_v77_0 then
                v94 = true;
            end;
            if v94 then
                l_AbsoluteSize_0 = Vector2.new(l_AbsoluteSize_0.Y, l_AbsoluteSize_0.X);
                l_AnchorPoint_0 = Vector2.new(l_AnchorPoint_0.Y, l_AnchorPoint_0.X);
                v85({
                    x = v4.ease(l_AnchorPoint_0.X, v21), 
                    y = v4.ease(l_AnchorPoint_0.Y, v21)
                });
                v78(not v77);
            end;
            l_v77_0 = v44(l_AbsoluteSize_0, l_AnchorPoint_0, v67.current.AbsolutePosition, v67.current.AbsoluteSize, l_current_0, v65);
            v92 = Vector2.new(l_AbsoluteSize_0.X * l_AnchorPoint_0.X, l_AbsoluteSize_0.Y * l_AnchorPoint_0.Y);
            v87({
                xOffset = v4.instant(l_v77_0.X + v92.X), 
                yOffset = v4.instant(l_v77_0.Y + v92.Y)
            });
            return;
        end;
    end, {
        v64, 
        v65, 
        v85, 
        v87
    });
    local v99 = l_useCallback_0(function() --[[ Line: 255 ]]
        -- upvalues: v64 (copy), v70 (copy), v25 (ref), v69 (copy), v67 (copy), v44 (ref), v73 (copy), v65 (copy), v87 (copy), v4 (ref)
        if not v64 or v70.current or not v25({
            v69, 
            v67
        }) then
            return;
        else
            assert(v69.current ~= nil, "dragItemRef is nil");
            assert(v67.current ~= nil, "dragContainerRef is nil");
            local l_AbsoluteSize_1 = v69.current.AbsoluteSize;
            local l_AnchorPoint_1 = v69.current.AnchorPoint;
            local v97 = v44(l_AbsoluteSize_1, l_AnchorPoint_1, v67.current.AbsolutePosition, v67.current.AbsoluteSize, v73, v65);
            local v98 = Vector2.new(l_AbsoluteSize_1.X * l_AnchorPoint_1.X, l_AbsoluteSize_1.Y * l_AnchorPoint_1.Y);
            v87({
                xOffset = v4.instant(v97.X + v98.X), 
                yOffset = v4.instant(v97.Y + v98.Y)
            });
            return;
        end;
    end, {
        v64, 
        v65, 
        v73, 
        v75, 
        v87
    });
    local v107 = l_useCallback_0(function(v100) --[[ Line: 293 ]]
        -- upvalues: v64 (copy), v75 (copy), v25 (ref), v67 (copy), v69 (copy), v81 (copy), v82 (copy), v76 (copy), v36 (ref), v65 (copy), v77 (copy), l_game_EngineFeature_0 (ref), v85 (copy), v4 (ref), v87 (copy)
        if not v64 or v75 or not v25({
            v67, 
            v69
        }) then
            return;
        else
            assert(v69.current ~= nil, "dragItemRef is nil");
            assert(v67.current ~= nil, "dragContainerRef is nil");
            local v101 = v100 - Vector2.new(v81.left + v82.left, v81.top + v82.top);
            v76(true);
            local l_AbsoluteSize_2 = v69.current.AbsoluteSize;
            local l_AbsolutePosition_0 = v69.current.AbsolutePosition;
            local l_AnchorPoint_2 = v69.current.AnchorPoint;
            local v105 = v36(l_AbsolutePosition_0, l_AbsoluteSize_2, v67.current.AbsolutePosition, v67.current.AbsoluteSize, v65);
            l_AnchorPoint_2 = Vector2.new(if v77 then ((if l_game_EngineFeature_0 then v100 else v101).X - l_AbsolutePosition_0.X) / l_AbsoluteSize_2.X else 0.5, v77 and 0.5 or ((if l_game_EngineFeature_0 then v100 else v101).Y - l_AbsolutePosition_0.Y) / l_AbsoluteSize_2.Y);
            v85({
                x = v4.instant(l_AnchorPoint_2.X), 
                y = v4.instant(l_AnchorPoint_2.Y)
            });
            local v106 = Vector2.new(l_AbsoluteSize_2.X * l_AnchorPoint_2.X, l_AbsoluteSize_2.Y * l_AnchorPoint_2.Y);
            v87({
                xOffset = v4.instant(v105.X + v106.X), 
                yOffset = v4.instant(v105.Y + v106.Y)
            });
            return;
        end;
    end, {
        v64, 
        v65, 
        v36, 
        if l_game_EngineFeature_0 then nil else v82, 
        if l_game_EngineFeature_0 then nil else v81, 
        v75, 
        v77, 
        v87, 
        v85
    });
    local v123 = l_useCallback_0(function(v108, v109) --[[ Line: 359 ]]
        -- upvalues: v25 (ref), v69 (copy), v67 (copy), v81 (copy), v82 (copy), v55 (ref), l_game_EngineFeature_0 (ref), v65 (copy), v77 (copy), v85 (copy), v4 (ref), v78 (copy), v44 (ref), v36 (ref), v87 (copy), v70 (copy), v21 (ref), v74 (copy), v80 (copy), v13 (ref), v12 (ref), v72 (copy)
        if not v25({
            v69, 
            v67
        }) then
            return;
        else
            assert(v69.current ~= nil, "dragItemRef is nil");
            assert(v67.current ~= nil, "dragContainerRef is nil");
            local v110 = v108 - Vector2.new(v81.left + v82.left, v81.top + v82.top);
            local l_AbsolutePosition_1 = v67.current.AbsolutePosition;
            local l_AbsoluteSize_3 = v67.current.AbsoluteSize;
            local v113, v114 = v55(if l_game_EngineFeature_0 then v108 else v110, l_AbsolutePosition_1, l_AbsoluteSize_3, v65);
            local v115 = true;
            if v114 >= 70 then
                v115 = not v109;
            end;
            local l_AbsoluteSize_4 = v69.current.AbsoluteSize;
            local l_AnchorPoint_3 = v69.current.AnchorPoint;
            local l_v77_1 = v77;
            local v119 = true;
            if v113.X ~= 0 then
                v119 = v113.X == 1;
            end;
            local v120 = true;
            if v113.Y ~= 0 then
                v120 = v113.Y == 1;
            end;
            local v121 = false;
            if v119 and v120 then
                v121 = false;
            elseif v120 and not l_v77_1 then
                v121 = true;
            elseif v119 and l_v77_1 then
                v121 = true;
            end;
            local l_v121_0 = v121;
            if v115 and l_v121_0 then
                l_AbsoluteSize_4 = Vector2.new(l_AbsoluteSize_4.Y, l_AbsoluteSize_4.X);
                l_AnchorPoint_3 = Vector2.new(l_AnchorPoint_3.Y, l_AnchorPoint_3.X);
                v85({
                    x = v4.instant(l_AnchorPoint_3.X), 
                    y = v4.instant(l_AnchorPoint_3.Y)
                });
                v78(not v77);
            end;
            l_v77_1 = Vector2.new(l_AbsoluteSize_4.X * l_AnchorPoint_3.X, l_AbsoluteSize_4.Y * l_AnchorPoint_3.Y);
            v119 = nil;
            v119 = if v115 then v44(l_AbsoluteSize_4, l_AnchorPoint_3, l_AbsolutePosition_1, l_AbsoluteSize_3, v113, v65) else v36((if l_game_EngineFeature_0 then v108 else v110) - l_v77_1, l_AbsoluteSize_4, l_AbsolutePosition_1, l_AbsoluteSize_3, v65);
            if v109 then
                v87({
                    xOffset = v4.instant(v119.X + l_v77_1.X), 
                    yOffset = v4.instant(v119.Y + l_v77_1.Y)
                });
                return;
            else
                v70.current = true;
                v87({
                    xOffset = v4.ease(v119.X + l_v77_1.X, v21), 
                    yOffset = v4.ease(v119.Y + l_v77_1.Y, v21)
                });
                v74(v113);
                v80(if v113.X == 0 then v13.Left else if v113.X == 1 then v13.Right else if v113.Y == 0 then v13.Top else v13.Bottom);
                v12.setStoredSnapAnchorPoint(v113);
                v72.current = v113;
                return;
            end;
        end;
    end, {
        v65, 
        if l_game_EngineFeature_0 then nil else v82, 
        if l_game_EngineFeature_0 then nil else v81, 
        v77, 
        v87, 
        v85
    });
    local v125 = l_useCallback_0(function(v124) --[[ Line: 450 ]]
        -- upvalues: v64 (copy), v75 (copy), v123 (copy)
        if not v64 or not v75 then
            return;
        else
            v123(v124, true);
            return;
        end;
    end, {
        v64, 
        v123, 
        v75
    });
    local v127 = l_useCallback_0(function(v126) --[[ Line: 458 ]]
        -- upvalues: v64 (copy), v75 (copy), v123 (copy), v76 (copy)
        if not v64 or not v75 then
            return;
        else
            v123(v126, false);
            v76(false);
            return;
        end;
    end, {
        v64, 
        v123, 
        v75
    });
    l_useEffect_0(function() --[[ Line: 467 ]]
        -- upvalues: v64 (copy), v66 (copy), v65 (copy), v99 (copy)
        if not v64 then
            return;
        else
            if v66.current ~= v65 then
                v66.current = v65;
                v99();
            end;
            return;
        end;
    end, {
        v64, 
        v65, 
        v99
    });
    l_useEffect_0(function() --[[ Line: 478 ]]
        -- upvalues: v64 (copy), v68 (copy), v107 (copy), v125 (copy), v127 (copy), v67 (copy), v99 (copy), v69 (copy)
        if not v64 then
            return;
        else
            local v128 = {};
            if v68.current ~= nil then
                table.insert(v128, v68.current.DragStart:Connect(v107));
                table.insert(v128, v68.current.DragContinue:Connect(v125));
                table.insert(v128, v68.current.DragEnd:Connect(v127));
            end;
            if v67.current ~= nil then
                table.insert(v128, v67.current:GetPropertyChangedSignal("AbsoluteSize"):Connect(v99));
            end;
            if v69.current ~= nil then
                table.insert(v128, v69.current:GetPropertyChangedSignal("AbsoluteSize"):Connect(v99));
            end;
            return function() --[[ Line: 504 ]]
                -- upvalues: v128 (copy)
                for _, v130 in v128 do
                    v130:Disconnect();
                end;
            end;
        end;
    end, {
        v64, 
        v107, 
        v125, 
        v127, 
        v99
    });
    return {
        dragContainerRef = v67, 
        dragDetectorRef = v68, 
        dragItemAnchorPointBinding = v84, 
        dragItemPositionBinding = v86, 
        dragItemRef = v69, 
        isItemHorizontal = v77, 
        screenshotButtonRef = v71, 
        snapDirection = v79
    };
end;