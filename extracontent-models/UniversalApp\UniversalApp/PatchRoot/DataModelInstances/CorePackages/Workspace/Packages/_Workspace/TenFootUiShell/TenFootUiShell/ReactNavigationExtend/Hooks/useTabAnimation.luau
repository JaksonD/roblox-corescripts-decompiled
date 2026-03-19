local l_script_FirstAncestor_0 = script:FindFirstAncestor("TenFootUiShell");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_Parent_0.ReactOtter);
local l_ReactNavigationExtend_0 = l_script_FirstAncestor_0.ReactNavigationExtend;
local v5 = require(l_ReactNavigationExtend_0.Views.Constants);
local v6 = require(l_script_FirstAncestor_0.Hooks.TenFootUiScene);
local v7 = require(script.Parent.TabAnimationStateEnum);
local l_useCameraFacingGeometry_0 = require(l_Parent_0.SceneManagement).useCameraFacingGeometry;
local function _(v9, v10) --[[ Line: 35 ]] --[[ Name: makeGetTabCFrame ]]
    -- upvalues: v7 (copy)
    local v11 = true;
    if v9 ~= v7.TabOpening then
        v11 = v9 == v7.TabOpened;
    end;
    local function _(v12) --[[ Line: 39 ]] --[[ Name: getCenterX ]]
        -- upvalues: v10 (copy), v11 (copy)
        if v10 == 0 then
            return 0;
        elseif v11 then
            if v10 < 0 then
                return -v12;
            else
                return v12;
            end;
        elseif v10 < 0 then
            return v12;
        else
            return -v12;
        end;
    end;
    return function(v14) --[[ Line: 50 ]]
        -- upvalues: v10 (copy), v11 (copy)
        local l_step_0 = v14.step;
        local v16 = v14.viewportFillDimensions.X * 0.3333;
        local v17 = (1 - l_step_0) * v16;
        local v18 = v10 == 0 and 0 or if v11 then if v10 < 0 then -v17 else v17 else if v10 < 0 then v17 else -v17;
        return CFrame.new(v18, 0, 0);
    end;
end;
local function v24(v20) --[[ Line: 63 ]] --[[ Name: useAnimationState ]]
    -- upvalues: v2 (copy), v7 (copy)
    local v21, v22 = v2.useState(v7.TabClosed);
    v2.useEffect(function() --[[ Line: 66 ]]
        -- upvalues: v22 (copy), v20 (copy), v7 (ref)
        v22(function(v23) --[[ Line: 67 ]]
            -- upvalues: v20 (ref), v7 (ref)
            if v20 and (v23 == v7.TabClosed or v23 == v7.TabClosing) then
                return v7.TabOpening;
            elseif not v20 and (v23 == v7.TabOpened or v23 == v7.TabOpening) then
                return v7.TabClosing;
            else
                return v23;
            end;
        end);
    end, {
        v20
    });
    return v21, v22;
end;
return function(v25) --[[ Line: 86 ]] --[[ Name: useTabAnimation ]]
    -- upvalues: v24 (copy), l_useCameraFacingGeometry_0 (copy), v5 (copy), v2 (copy), v7 (copy), v3 (copy), v6 (copy)
    local l_currentTabIndex_0 = v25.currentTabIndex;
    local v27 = l_currentTabIndex_0 - v25.previousTabIndex;
    local v28, v29 = v24(v25.isActiveTab);
    local v30 = l_useCameraFacingGeometry_0(v5.DEFAULT_SCREEN_DISTANCE_TO_CAMERA);
    local v32 = v2.useCallback(function() --[[ Line: 95 ]]
        -- upvalues: v29 (copy), v7 (ref)
        v29(function(v31) --[[ Line: 96 ]]
            -- upvalues: v7 (ref)
            if v31 == v7.TabOpening then
                return v7.TabOpened;
            elseif v31 == v7.TabClosing then
                return v7.TabClosed;
            else
                return v31;
            end;
        end);
    end, {});
    local v33, v34 = v3.useAnimatedBinding(0, v32);
    v2.useEffect(function() --[[ Line: 108 ]]
        -- upvalues: v28 (copy), v7 (ref), v34 (copy), v3 (ref), v5 (ref)
        if v28 == v7.TabOpening then
            v34(v3.spring(1, v5.X_DIRECTION_ANIMATION_SPRING_CONFIG));
            return;
        else
            if v28 == v7.TabClosing then
                v34(v3.spring(0, v5.X_DIRECTION_ANIMATION_SPRING_CONFIG));
            end;
            return;
        end;
    end, {
        v28
    });
    v2.useEffect(function() --[[ Line: 116 ]]
        -- upvalues: v28 (copy), v7 (ref), v30 (copy), l_currentTabIndex_0 (copy), v6 (ref)
        if v28 == v7.TabOpening or v28 == v7.TabOpened then
            local v35 = v30.viewportFillDimensions:getValue().X * 0.1634 * (l_currentTabIndex_0 - 1);
            v6.updateXPosition(-v35);
        end;
    end, {
        v28, 
        v30.viewportFillDimensions, 
        l_currentTabIndex_0
    });
    return v2.useMemo(function() --[[ Line: 125 ]]
        -- upvalues: v28 (copy), v27 (copy), v7 (ref), v2 (ref), v33 (copy), v30 (copy)
        local l_v28_0 = v28;
        local l_v27_0 = v27;
        local v38 = true;
        if l_v28_0 ~= v7.TabOpening then
            v38 = l_v28_0 == v7.TabOpened;
        end;
        local function _(v39) --[[ Line: 39 ]] --[[ Name: getCenterX ]]
            -- upvalues: l_v27_0 (copy), v38 (copy)
            if l_v27_0 == 0 then
                return 0;
            elseif v38 then
                if l_v27_0 < 0 then
                    return -v39;
                else
                    return v39;
                end;
            elseif l_v27_0 < 0 then
                return v39;
            else
                return -v39;
            end;
        end;
        return {
            isVisible = v28 ~= v7.TabClosed, 
            cFrame = v2.joinBindings({
                step = v33, 
                viewportFillDimensions = v30.viewportFillDimensions
            }):map(function(v41) --[[ Line: 50 ]]
                -- upvalues: l_v27_0 (copy), v38 (copy)
                local l_step_1 = v41.step;
                local v43 = v41.viewportFillDimensions.X * 0.3333;
                local v44 = (1 - l_step_1) * v43;
                local v45 = l_v27_0 == 0 and 0 or if v38 then if l_v27_0 < 0 then -v44 else v44 else if l_v27_0 < 0 then v44 else -v44;
                return CFrame.new(v45, 0, 0);
            end), 
            transparency = v33:map(function(v46) --[[ Line: 133 ]]
                return 1 - v46;
            end)
        };
    end, {
        v33, 
        v30, 
        v28, 
        v27
    });
end;