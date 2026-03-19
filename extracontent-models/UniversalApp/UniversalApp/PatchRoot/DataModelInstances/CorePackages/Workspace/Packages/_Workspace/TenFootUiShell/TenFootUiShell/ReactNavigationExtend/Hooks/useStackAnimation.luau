local l_script_FirstAncestor_0 = script:FindFirstAncestor("TenFootUiShell");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_Parent_0.ReactOtter);
local v4 = require(l_Parent_0.Navigation);
local l_ViewState_0 = v4.ViewState;
local l_useEarlyIsFocused_0 = v4.useEarlyIsFocused;
local l_ReactNavigationExtend_0 = l_script_FirstAncestor_0.ReactNavigationExtend;
local v8 = require(l_ReactNavigationExtend_0.Views.Constants);
local v9 = require(l_script_FirstAncestor_0.Hooks.TenFootUiScene);
local v10 = {
    FRONT_HIDDEN = -1, 
    CENTER_VISIBLE = 0, 
    BACK_HIDDEN = 1
};
local l_FRONT_HIDDEN_0 = v10.FRONT_HIDDEN;
local function _(v12) --[[ Line: 28 ]] --[[ Name: getSpringTarget ]]
    -- upvalues: v10 (copy)
    if v12 then
        return v10.CENTER_VISIBLE;
    else
        return v10.BACK_HIDDEN;
    end;
end;
return function(v14) --[[ Line: 32 ]] --[[ Name: useStackAnimation ]]
    -- upvalues: v2 (copy), v3 (copy), l_FRONT_HIDDEN_0 (copy), l_ViewState_0 (copy), v10 (copy), v8 (copy), l_useEarlyIsFocused_0 (copy), v9 (copy)
    local l_isTopOfStack_0 = v14.isTopOfStack;
    local l_totalInStack_0 = v14.totalInStack;
    local l_viewState_0 = v14.viewState;
    local v18, v19 = v2.useState(false);
    local v20 = l_isTopOfStack_0 or v18;
    local v21 = v2.useCallback(function() --[[ Line: 41 ]]
        -- upvalues: v14 (copy), v19 (copy)
        v14.onAnimationComplete();
        v19(false);
    end, {
        v14.onAnimationComplete
    });
    local v22, v23 = v3.useAnimatedBinding(l_FRONT_HIDDEN_0, v21);
    v2.useEffect(function() --[[ Line: 48 ]]
        -- upvalues: l_viewState_0 (copy), l_ViewState_0 (ref), v19 (copy), v23 (copy), v3 (ref), l_isTopOfStack_0 (copy), v10 (ref), v8 (ref)
        if l_viewState_0 == l_ViewState_0.Opening or l_viewState_0 == l_ViewState_0.Opened then
            v19(true);
            v23(v3.spring(if l_isTopOfStack_0 then v10.CENTER_VISIBLE else v10.BACK_HIDDEN, v8.Z_DIRECTION_ANIMATION_SPRING_CONFIG));
            return;
        else
            if l_viewState_0 == l_ViewState_0.Closing then
                v19(true);
                v23(v3.spring(v10.FRONT_HIDDEN, v8.Z_DIRECTION_ANIMATION_SPRING_CONFIG));
            end;
            return;
        end;
    end, {
        l_viewState_0, 
        l_isTopOfStack_0
    });
    local v24 = l_useEarlyIsFocused_0();
    v2.useEffect(function() --[[ Line: 60 ]]
        -- upvalues: v24 (copy), l_isTopOfStack_0 (copy), v8 (ref), l_totalInStack_0 (copy), v9 (ref)
        if v24 and l_isTopOfStack_0 then
            local v25 = v8.DEFAULT_SCREEN_DISTANCE_TO_CAMERA * v8.Z_DIRECTION_ZOOM_FACTOR;
            local v26 = (l_totalInStack_0 - 1) * v25;
            v9.updateZPosition(-v26);
        end;
    end, {
        v24, 
        l_isTopOfStack_0, 
        l_totalInStack_0
    });
    return v2.useMemo(function() --[[ Line: 68 ]]
        -- upvalues: v20 (copy), v22 (copy), v8 (ref)
        return {
            isVisible = v20, 
            cFrame = v22:map(function(v27) --[[ Line: 71 ]]
                -- upvalues: v8 (ref)
                local v28 = v8.DEFAULT_SCREEN_DISTANCE_TO_CAMERA * v8.Z_DIRECTION_ZOOM_FACTOR * v27;
                return CFrame.new(0, 0, -v28);
            end), 
            transparency = v22:map(function(v29) --[[ Line: 76 ]]
                return (math.abs(v29));
            end)
        };
    end, {
        v20, 
        v22
    });
end;