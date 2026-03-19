local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_UserInputService_0 = game:GetService("UserInputService");
local l_Modules_0 = l_CoreGui_0.RobloxGui.Modules;
local v4 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceCommon);
local v5 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceFlags);
local v6 = require(l_Modules_0.AvatarExperience.Common.Constants);
local v7 = require(l_CorePackages_0.Packages.React);
local v8 = require(l_CorePackages_0.Packages.UIBlox);
local v9 = require(l_CorePackages_0.Packages.Foundation);
local l_useStyle_0 = v8.Core.Style.useStyle;
local v11 = require(l_Modules_0.AvatarExperience.Common.Context.AdaptiveScrollingContext);
local v12 = require(l_Modules_0.AvatarExperience.Common.Enum.FullView);
local v13 = require(l_Modules_0.AvatarExperience.Common.Hooks.useFullView);
local l_ExternalEventConnection_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).ExternalEventConnection;
local v15 = require(l_CorePackages_0.Packages.Otter);
local l_useAnimatedVisibility_0 = v4.Stores.AnimatedVisibilityStore.useAnimatedVisibility;
local v17 = require(l_Modules_0.AvatarExperience.Flags.GetFFlagAXEnableSlotBasedEditor);
local v18 = game:DefineFastFlag("AXAdaptiveScrollingEnableViewModeTransitionProp2", false) and v17();
local v19 = game:DefineFastFlag("AXDefaultNewAdaptiveScrollingTransitions", false);
local v20 = game:DefineFastInt("AXAdaptiveScrollingOverscrollThreshold", 20);
local v21 = game:DefineFastFlag("AXFixAdaptiveScrollingDraggerColor", false);
local l_FFlagAXExpandPeekViewOnFirstScroll_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceFlags).FFlagAXExpandPeekViewOnFirstScroll;
local l_FFlagAXSlotsPeekViewScrollFix_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceFlags).FFlagAXSlotsPeekViewScrollFix;
local v24 = game:DefineFastInt("AXMaxScrollDirectionChangeAttempts", 2);
local l_FFlagAXHideMenuOnScroll_0 = v5.FFlagAXHideMenuOnScroll;
local l_FFlagAXAdaptiveScrollingViewBanner_0 = v5.FFlagAXAdaptiveScrollingViewBanner;
local v27 = {
    dampingRatio = 1, 
    frequency = 5
};
local v28 = game:DefineFastInt("AXAdaptiveScrollingJustSelectedMillis", 500) / 1000;
local v29 = {
    NONE = 0, 
    UP = 1, 
    DOWN = -1
};
local l_SceneFullView_0 = v12.SceneFullView;
local l_None_0 = v12.None;
local l_UIFullView_0 = v12.UIFullView;
local function _(v33, v34) --[[ Line: 138 ]] --[[ Name: nearlyEquals ]]
    return math.abs(v33 - v34) < 1.0E-4;
end;
local function _(v36, v37, v38) --[[ Line: 142 ]] --[[ Name: withinThreshold ]]
    return math.abs(v36 - v37) < v38;
end;
return function(v40) --[[ Line: 149 ]] --[[ Name: AdaptiveScrollingView ]]
    -- upvalues: v7 (copy), l_FFlagAXHideMenuOnScroll_0 (copy), l_useAnimatedVisibility_0 (copy), v9 (copy), v19 (copy), l_UIFullView_0 (copy), l_None_0 (copy), l_FFlagAXExpandPeekViewOnFirstScroll_0 (copy), l_useStyle_0 (copy), l_SceneFullView_0 (copy), v13 (copy), v29 (copy), v28 (copy), v6 (copy), v15 (copy), v27 (copy), v20 (copy), v24 (copy), l_FFlagAXAdaptiveScrollingViewBanner_0 (copy), l_FFlagAXSlotsPeekViewScrollFix_0 (copy), v18 (copy), v21 (copy), v11 (copy), l_ExternalEventConnection_0 (copy), l_UserInputService_0 (copy)
    local l_fullHeight_0 = v40.fullHeight;
    local l_midHeight_0 = v40.midHeight;
    local l_alwaysShowingHeight_0 = v40.alwaysShowingHeight;
    local v44 = l_fullHeight_0 - l_alwaysShowingHeight_0;
    local v45 = v7.useRef(nil);
    local v46 = v7.useRef(nil);
    local v47, v48 = v7.useBinding(false);
    local v49 = nil;
    local v50 = nil;
    local v51 = nil;
    local v52 = nil;
    if l_FFlagAXHideMenuOnScroll_0 then
        local v53 = l_useAnimatedVisibility_0();
        if v53 then
            v49 = v53.animatedMenusStore;
        end;
        v50 = v7.useRef(0);
        v51 = v7.useRef(nil);
        v52 = v7.useRef(false);
    end;
    local v54 = v7.useRef(nil);
    local v55 = v7.useRef(nil);
    local v56 = v9.Hooks.useTokens();
    local v57 = v40.topBarHeight or 0;
    local l_Size_900_0 = v56.Size.Size_900;
    local l_Size_100_0 = v56.Size.Size_100;
    local v60 = v40.fullHeightOptions or if v19 then {
        opaqueBackground = true, 
        draggerToDivider = true
    } else {};
    local v61, v62 = v7.useState({
        instance = nil, 
        time = 0
    });
    local v65 = v7.useCallback(function(v63) --[[ Line: 196 ]]
        -- upvalues: l_UIFullView_0 (ref), l_None_0 (ref)
        local v64 = true;
        if v63 ~= l_UIFullView_0 then
            v64 = v63 == l_None_0;
        end;
        return v64;
    end, {});
    local v66 = nil;
    v66 = if l_FFlagAXExpandPeekViewOnFirstScroll_0 then v7.useCallback(function() --[[ Line: 202 ]]
        -- upvalues: v54 (copy)
        if v54.current then
            v54.current:destroy();
            v54.current = nil;
        end;
    end, {}) else function() --[[ Line: 209 ]]
        -- upvalues: v54 (copy)
        if v54.current then
            v54.current:destroy();
            v54.current = nil;
        end;
    end;
    local function _() --[[ Line: 217 ]]
        -- upvalues: v55 (copy)
        if v55 and v55.current then
            v55.current:destroy();
            v55.current = nil;
        end;
    end;
    local v68 = nil;
    if l_FFlagAXHideMenuOnScroll_0 then
        v68 = v7.useCallback(function() --[[ Line: 228 ]]
            -- upvalues: v51 (ref)
            if v51.current then
                task.cancel(v51.current);
                v51.current = nil;
            end;
        end, {});
    end;
    v7.useEffect(function() --[[ Line: 236 ]]
        -- upvalues: v66 (ref), v55 (copy), l_FFlagAXHideMenuOnScroll_0 (ref), v68 (ref)
        return function() --[[ Line: 237 ]]
            -- upvalues: v66 (ref), v55 (ref), l_FFlagAXHideMenuOnScroll_0 (ref), v68 (ref)
            v66();
            if v55 and v55.current then
                v55.current:destroy();
                v55.current = nil;
            end;
            if l_FFlagAXHideMenuOnScroll_0 then
                v68();
            end;
        end;
    end, {});
    local v69 = l_useStyle_0();
    local l_Theme_0 = v69.Theme;
    local function _(v71) --[[ Line: 249 ]] --[[ Name: getGoToHeight ]]
        -- upvalues: l_UIFullView_0 (ref), l_fullHeight_0 (copy), l_SceneFullView_0 (ref), l_alwaysShowingHeight_0 (copy), l_midHeight_0 (copy)
        if v71 == l_UIFullView_0 then
            return l_fullHeight_0;
        elseif v71 == l_SceneFullView_0 then
            return l_alwaysShowingHeight_0;
        else
            return l_midHeight_0;
        end;
    end;
    local v73, v74 = v7.useBinding(0);
    local v75, v76 = v13();
    local v77 = v7.useRef(v75);
    v77.current = v75;
    local v78, v79 = v7.useBinding(v65(v75));
    local v80 = nil;
    local v81 = nil;
    local v82 = nil;
    local v83 = nil;
    local v84 = nil;
    if l_FFlagAXExpandPeekViewOnFirstScroll_0 then
        local v85, v86 = v7.useBinding(true);
        v80 = v85;
        v81 = v86;
        v82 = v7.useRef(v29.NONE);
        v83 = v7.useRef(0);
        v84 = v7.useRef(0);
    end;
    local function _() --[[ Line: 275 ]] --[[ Name: isAnimating ]]
        -- upvalues: v54 (copy)
        return v54.current ~= nil;
    end;
    local function v95() --[[ Line: 281 ]] --[[ Name: adjustScrollingFramePosition ]]
        -- upvalues: v75 (copy), l_None_0 (ref), v61 (copy), v28 (ref), v46 (copy), v6 (ref), l_FFlagAXExpandPeekViewOnFirstScroll_0 (ref), v55 (copy), l_FFlagAXHideMenuOnScroll_0 (ref), v52 (ref), v40 (copy), v49 (ref), v15 (ref), v27 (ref)
        if v75 ~= l_None_0 then
            return;
        elseif tick() - v61.time > v28 then
            return;
        else
            local l_instance_0 = v61.instance;
            if not l_instance_0 then
                return;
            else
                assert(l_instance_0, "");
                local v89 = nil;
                v89 = l_instance_0:FindFirstAncestor("RCTScrollView") or l_instance_0:FindFirstAncestor("scrollingFrame") or l_instance_0:FindFirstAncestorWhichIsA("ScrollingFrame");
                if not v89 or v89 == v46.current then
                    return;
                else
                    assert(v89, "");
                    local l_Y_0 = l_instance_0.AbsolutePosition.Y;
                    local l_Y_1 = v89.CanvasPosition.Y;
                    local v92 = l_Y_0 - v89.AbsolutePosition.Y;
                    if math.abs(v92) > 5 then
                        l_Y_1 = l_Y_1 + (v92 - v6.WidgetListVerticalMargin);
                    end;
                    if not l_FFlagAXExpandPeekViewOnFirstScroll_0 then
                        l_Y_1 = math.clamp(l_Y_1, 0, v89.AbsoluteCanvasSize.Y - v89.AbsoluteWindowSize.Y);
                    end;
                    if v55 then
                        if l_FFlagAXHideMenuOnScroll_0 then
                            v52.current = true;
                            if v40.enableAnimatedVisibility and v49 then
                                v49.show();
                            end;
                        end;
                        local v93 = v15.createSingleMotor(v89.CanvasPosition.Y);
                        v55.current = v93;
                        v93:onStep(function(v94) --[[ Line: 341 ]]
                            -- upvalues: v89 (ref)
                            v89.ScrollVelocity = Vector2.new(0, 0);
                            v89.CanvasPosition = Vector2.new(0, v94);
                        end);
                        v93:onComplete(function() --[[ Line: 345 ]]
                            -- upvalues: v55 (ref), l_FFlagAXHideMenuOnScroll_0 (ref), v52 (ref)
                            if v55 and v55.current then
                                v55.current:destroy();
                                v55.current = nil;
                            end;
                            if l_FFlagAXHideMenuOnScroll_0 then
                                v52.current = false;
                            end;
                        end);
                        v93:setGoal(v15.spring(l_Y_1, v27));
                    end;
                    return;
                end;
            end;
        end;
    end;
    local v104 = v7.useCallback(function(v96, v97) --[[ Line: 355 ]]
        -- upvalues: v46 (copy), l_UIFullView_0 (ref), l_fullHeight_0 (copy), l_SceneFullView_0 (ref), l_alwaysShowingHeight_0 (copy), l_midHeight_0 (copy), v54 (copy), v79 (copy), v65 (copy), v75 (copy), v76 (copy), l_FFlagAXExpandPeekViewOnFirstScroll_0 (ref), l_None_0 (ref), v95 (copy), l_FFlagAXHideMenuOnScroll_0 (ref), v40 (copy), v49 (ref), v15 (ref), v66 (ref), v27 (ref)
        local l_current_0 = v46.current;
        if not l_current_0 then
            return;
        else
            assert(l_current_0, "");
            local l_Y_2 = l_current_0.CanvasPosition.Y;
            local v100 = (if v96 == l_UIFullView_0 then l_fullHeight_0 else if v96 == l_SceneFullView_0 then l_alwaysShowingHeight_0 else l_midHeight_0) - l_alwaysShowingHeight_0;
            if v54.current ~= nil then
                return;
            else
                v79(v65(v96));
                if v96 == v75 and math.abs(v100 - l_Y_2) < 1.0E-4 then
                    return;
                else
                    v76(v96);
                    if l_FFlagAXExpandPeekViewOnFirstScroll_0 and v96 == l_None_0 then
                        v95();
                    end;
                    if l_FFlagAXHideMenuOnScroll_0 and v40.enableAnimatedVisibility and v49 then
                        v49.show();
                    end;
                    local v101 = v15.createSingleMotor(l_Y_2);
                    v54.current = v101;
                    v101:onStep(function(v102) --[[ Line: 389 ]]
                        -- upvalues: l_current_0 (copy)
                        l_current_0.ScrollVelocity = Vector2.new(0, 0);
                        l_current_0.CanvasPosition = Vector2.new(0, v102);
                    end);
                    v101:onComplete(function(_) --[[ Line: 394 ]]
                        -- upvalues: v66 (ref), l_FFlagAXExpandPeekViewOnFirstScroll_0 (ref), v95 (ref)
                        v66();
                        if not l_FFlagAXExpandPeekViewOnFirstScroll_0 then
                            v95();
                        end;
                    end);
                    if v97 then
                        v101:setGoal(v15.spring(v100, v27));
                        return;
                    else
                        v101:setGoal(v15.instant(v100));
                        return;
                    end;
                end;
            end;
        end;
    end, {
        v75, 
        v76, 
        l_alwaysShowingHeight_0, 
        l_midHeight_0, 
        l_fullHeight_0, 
        if l_FFlagAXHideMenuOnScroll_0 then v40.enableAnimatedVisibility else nil, 
        if l_FFlagAXHideMenuOnScroll_0 then v49 else nil
    });
    v7.useEffect(function() --[[ Line: 417 ]]
        -- upvalues: v104 (copy), v77 (copy)
        v104(v77.current, false);
    end, {
        l_alwaysShowingHeight_0, 
        l_midHeight_0, 
        l_fullHeight_0
    });
    v7.useEffect(function() --[[ Line: 422 ]]
        -- upvalues: v104 (copy), v75 (copy)
        v104(v75, true);
    end, {
        v75
    });
    v7.useEffect(function() --[[ Line: 427 ]]
        -- upvalues: v61 (copy), v75 (copy), l_None_0 (ref), v54 (copy), v95 (copy)
        if v61.instance and v75 == l_None_0 and not (v54.current ~= nil) then
            v95();
        end;
    end, {
        v61.instance, 
        v75
    });
    local v105 = nil;
    if l_FFlagAXHideMenuOnScroll_0 then
        v105 = v7.useCallback(function(v106) --[[ Line: 436 ]]
            -- upvalues: v40 (copy), v49 (ref), v50 (ref), v68 (ref), v52 (ref), v47 (copy), v51 (ref)
            if not v40.enableAnimatedVisibility or not v49 then
                return;
            else
                local v107 = v106 - v50.current;
                v68();
                if math.abs(v107) > 1 then
                    local v108 = v107 > 0;
                    local v109 = v49.getIsVisible(false);
                    local l_current_1 = v52.current;
                    local v111 = v47:getValue();
                    if v108 and v109 and not l_current_1 and v111 then
                        v49.hide();
                    elseif not v108 and not v109 and not l_current_1 and v111 then
                        v49.show();
                    end;
                end;
                v51.current = task.delay(0.5, function() --[[ Line: 469 ]]
                    -- upvalues: v49 (ref), v51 (ref)
                    v49.show();
                    v51.current = nil;
                end);
                v50.current = v106;
                return;
            end;
        end, {
            v49, 
            v40.enableAnimatedVisibility, 
            v68, 
            v47
        });
    end;
    local v114 = v7.useCallback(function(v112) --[[ Line: 486 ]]
        -- upvalues: v47 (copy), v20 (ref), v79 (copy), l_FFlagAXHideMenuOnScroll_0 (ref), v40 (copy), v105 (ref)
        local v113 = v47:getValue();
        if v112 < -v20 and v113 then
            v79(false);
        end;
        if l_FFlagAXHideMenuOnScroll_0 and v40.enableAnimatedVisibility then
            v105(v112);
        end;
    end, {
        v47, 
        if l_FFlagAXHideMenuOnScroll_0 then v40.enableAnimatedVisibility else nil, 
        if l_FFlagAXHideMenuOnScroll_0 then v105 else nil
    });
    local v117 = v7.useMemo(function() --[[ Line: 505 ]]
        -- upvalues: v78 (copy), v114 (copy), v62 (copy)
        return {
            scrollingEnabledBinding = v78, 
            onCanvasYChanged = v114, 
            onCanvasPositionChanged = function(v115) --[[ Line: 511 ]] --[[ Name: onCanvasPositionChanged ]]
                -- upvalues: v114 (ref)
                if v114 then
                    v114(v115.CanvasPosition.Y);
                end;
            end, 
            setSelectedItemInstance = function(v116) --[[ Line: 517 ]] --[[ Name: setSelectedItemInstance ]]
                -- upvalues: v62 (ref)
                if not v116 then
                    v62({
                        instance = nil, 
                        time = 0
                    });
                    return;
                else
                    v62({
                        instance = v116, 
                        time = tick()
                    });
                    return;
                end;
            end
        };
    end, {
        v78, 
        v114
    });
    local function v119(v118) --[[ Line: 539 ]] --[[ Name: onCanvasPositionChanged ]]
        -- upvalues: v74 (copy)
        v74(v118.CanvasPosition.Y);
    end;
    local function _(v120, v121, v122, v123) --[[ Line: 554 ]] --[[ Name: getTargetViewModeInRange ]]
        -- upvalues: l_UIFullView_0 (ref), l_fullHeight_0 (copy), l_SceneFullView_0 (ref), l_alwaysShowingHeight_0 (copy), l_midHeight_0 (copy), v75 (copy)
        local v124 = if v122 == l_UIFullView_0 then l_fullHeight_0 else if v122 == l_SceneFullView_0 then l_alwaysShowingHeight_0 else l_midHeight_0;
        local v125 = if v121 == l_UIFullView_0 then l_fullHeight_0 else if v121 == l_SceneFullView_0 then l_alwaysShowingHeight_0 else l_midHeight_0;
        local v126 = v124 - v125;
        local v127 = v123 < 0;
        local v128 = v123 > 0;
        if v75 == v122 then
            if v128 or v120 < v125 + v126 * 0.8 then
                return v121;
            else
                return v122;
            end;
        elseif v127 or v125 + v126 * 0.2 < v120 then
            return v122;
        else
            return v121;
        end;
    end;
    local v151 = v7.useCallback(function() --[[ Line: 582 ]]
        -- upvalues: v46 (copy), l_alwaysShowingHeight_0 (copy), v75 (copy), l_SceneFullView_0 (ref), l_UIFullView_0 (ref), l_fullHeight_0 (copy), l_None_0 (ref), l_midHeight_0 (copy)
        local l_current_2 = v46.current;
        if not l_current_2 then
            return nil;
        else
            assert(l_current_2, "");
            local l_Y_3 = l_current_2.CanvasPosition.Y;
            local v132 = l_alwaysShowingHeight_0 + l_Y_3;
            local l_Y_4 = l_current_2.ScrollVelocity.Y;
            local v134 = false;
            if v75 == l_SceneFullView_0 then
                v134 = math.abs(v132 - l_alwaysShowingHeight_0) < 1;
            end;
            local v135 = false;
            if v75 == l_UIFullView_0 then
                v135 = math.abs(v132 - l_fullHeight_0) < 1;
            end;
            local v136 = false;
            if v75 == l_None_0 then
                v136 = math.abs(v132 - l_midHeight_0) < 1;
            end;
            if (v134 or v135 or v136) and l_Y_4 == 0 then
                return nil;
            elseif l_midHeight_0 < v132 then
                local l_l_None_0_0 = l_None_0;
                local l_l_UIFullView_0_0 = l_UIFullView_0;
                local v139 = if l_l_UIFullView_0_0 == l_UIFullView_0 then l_fullHeight_0 else if l_l_UIFullView_0_0 == l_SceneFullView_0 then l_alwaysShowingHeight_0 else l_midHeight_0;
                local v140 = if l_l_None_0_0 == l_UIFullView_0 then l_fullHeight_0 else if l_l_None_0_0 == l_SceneFullView_0 then l_alwaysShowingHeight_0 else l_midHeight_0;
                local v141 = v139 - v140;
                local v142 = l_Y_4 < 0;
                local v143 = l_Y_4 > 0;
                if v75 == l_l_UIFullView_0_0 then
                    if v143 or v132 < v140 + v141 * 0.8 then
                        return l_l_None_0_0;
                    else
                        return l_l_UIFullView_0_0;
                    end;
                elseif v142 or v140 + v141 * 0.2 < v132 then
                    return l_l_UIFullView_0_0;
                else
                    return l_l_None_0_0;
                end;
            else
                local l_l_SceneFullView_0_0 = l_SceneFullView_0;
                local l_l_None_0_1 = l_None_0;
                local v146 = if l_l_None_0_1 == l_UIFullView_0 then l_fullHeight_0 else if l_l_None_0_1 == l_SceneFullView_0 then l_alwaysShowingHeight_0 else l_midHeight_0;
                local v147 = if l_l_SceneFullView_0_0 == l_UIFullView_0 then l_fullHeight_0 else if l_l_SceneFullView_0_0 == l_SceneFullView_0 then l_alwaysShowingHeight_0 else l_midHeight_0;
                local v148 = v146 - v147;
                local v149 = l_Y_4 < 0;
                local v150 = l_Y_4 > 0;
                if v75 == l_l_None_0_1 then
                    if v150 or v132 < v147 + v148 * 0.8 then
                        return l_l_SceneFullView_0_0;
                    else
                        return l_l_None_0_1;
                    end;
                elseif v149 or v147 + v148 * 0.2 < v132 then
                    return l_l_None_0_1;
                else
                    return l_l_SceneFullView_0_0;
                end;
            end;
        end;
    end, {
        v75, 
        l_fullHeight_0, 
        l_midHeight_0, 
        l_alwaysShowingHeight_0
    });
    local v152 = nil;
    if l_FFlagAXExpandPeekViewOnFirstScroll_0 then
        v152 = v7.useCallback(function() --[[ Line: 612 ]]
            -- upvalues: v84 (ref), v82 (ref), v29 (ref), v81 (ref), v79 (copy), v65 (copy), v75 (copy)
            v84.current = 0;
            v82.current = v29.NONE;
            v81(true);
            v79(v65(v75));
        end, {
            v75, 
            v81, 
            v79, 
            v65
        });
    end;
    local v154 = v7.useCallback(function(v153) --[[ Line: 621 ]]
        -- upvalues: v48 (copy), l_FFlagAXExpandPeekViewOnFirstScroll_0 (ref), v40 (copy), v152 (ref), v83 (ref), v66 (ref)
        if v153.UserInputType ~= Enum.UserInputType.Touch then
            return;
        else
            v48(true);
            if l_FFlagAXExpandPeekViewOnFirstScroll_0 and v40.enableExpandPeekViewOnUpwardScroll then
                v152();
                v83.current = v153.Position.Y;
            end;
            v66();
            return;
        end;
    end, {
        if l_FFlagAXExpandPeekViewOnFirstScroll_0 then v48 else nil, 
        if l_FFlagAXExpandPeekViewOnFirstScroll_0 then v66 else nil, 
        if l_FFlagAXExpandPeekViewOnFirstScroll_0 then v40.enableExpandPeekViewOnUpwardScroll else nil, 
        if l_FFlagAXExpandPeekViewOnFirstScroll_0 then v152 else nil
    });
    local v155 = nil;
    if l_FFlagAXExpandPeekViewOnFirstScroll_0 then
        v155 = v7.useCallback(function(v156) --[[ Line: 646 ]]
            -- upvalues: v40 (copy), v75 (copy), l_None_0 (ref), v83 (ref), v29 (ref), v82 (ref), v84 (ref), v24 (ref), v151 (copy), v104 (copy), v81 (ref), v79 (copy)
            if not v40.enableExpandPeekViewOnUpwardScroll then
                return;
            elseif v156.UserInputType ~= Enum.UserInputType.Touch then
                return;
            elseif v75 ~= l_None_0 then
                return;
            else
                local v157 = v156.Position.Y - v83.current;
                if math.abs(v157) > 5 then
                    local v158 = if v157 > 0 then v29.DOWN else v29.UP;
                    v83.current = v156.Position.Y;
                    if v82.current ~= v158 then
                        local l_v84_0 = v84;
                        l_v84_0.current = l_v84_0.current + 1;
                        if v84.current > v24 then
                            l_v84_0 = v151();
                            if l_v84_0 then
                                v104(l_v84_0, true);
                            end;
                            return;
                        else
                            v82.current = v158;
                            if v158 == v29.DOWN then
                                v81(false);
                                return;
                            else
                                v79(false);
                                v81(true);
                            end;
                        end;
                    end;
                end;
                return;
            end;
        end, {
            v75, 
            v104, 
            v151, 
            v81, 
            v79, 
            v65, 
            v48, 
            v152, 
            v40.enableExpandPeekViewOnUpwardScroll
        });
    end;
    local v162 = v7.useCallback(function(v160) --[[ Line: 707 ]]
        -- upvalues: l_FFlagAXExpandPeekViewOnFirstScroll_0 (ref), v40 (copy), v152 (ref), v48 (copy), v151 (copy), v104 (copy), v79 (copy), v65 (copy), v77 (copy)
        if v160.UserInputType ~= Enum.UserInputType.Touch then
            return;
        else
            if l_FFlagAXExpandPeekViewOnFirstScroll_0 and v40.enableExpandPeekViewOnUpwardScroll then
                v152();
            end;
            v48(false);
            local v161 = v151();
            if v161 then
                v104(v161, true);
                return;
            else
                v79(v65(v77.current));
                return;
            end;
        end;
    end, {
        v104, 
        v151
    });
    local v163 = v7.useCallback(function() --[[ Line: 729 ]]
        -- upvalues: v75 (copy), l_UIFullView_0 (ref), l_SceneFullView_0 (ref), v104 (copy), l_None_0 (ref)
        if v75 == l_UIFullView_0 or v75 == l_SceneFullView_0 then
            v104(l_None_0, true);
            return;
        else
            v104(l_UIFullView_0, true);
            return;
        end;
    end, {
        v75, 
        v104
    });
    local v166 = v7.useCallback(function(v164) --[[ Line: 737 ]]
        -- upvalues: v44 (copy)
        local v165 = v44 - v164;
        if v165 > 100 then
            return 1;
        else
            return v165 / 80;
        end;
    end, {});
    local v172 = v7.useCallback(function(v167) --[[ Line: 747 ]]
        -- upvalues: v44 (copy), l_Size_900_0 (copy), l_Size_100_0 (copy)
        local v168 = v44 - v167;
        if v168 > 50 then
            return UDim2.new(0, l_Size_900_0, 0, l_Size_100_0);
        else
            local v169 = v168 / 50;
            local v170 = l_Size_900_0 * v169;
            local v171 = math.clamp(l_Size_100_0 * v169, 1, l_Size_100_0);
            return UDim2.new(1 - v169, v170, 0, v171);
        end;
    end, {});
    local v173 = nil;
    local v174 = nil;
    if l_FFlagAXHideMenuOnScroll_0 then
        v174 = v7.useCallback(function(v175) --[[ Line: 764 ]]
            -- upvalues: l_fullHeight_0 (copy), l_alwaysShowingHeight_0 (copy), l_midHeight_0 (copy)
            return math.clamp((l_fullHeight_0 - (v175 + l_alwaysShowingHeight_0)) / (l_fullHeight_0 - l_midHeight_0), 0, 1) * 12;
        end, {
            l_fullHeight_0, 
            l_alwaysShowingHeight_0, 
            l_midHeight_0
        });
        v173 = v7.useCallback(function(v176) --[[ Line: 773 ]]
            -- upvalues: v44 (copy), v6 (ref)
            local v177 = v44 - v176;
            if v177 > 50 then
                return v6.PeekHeaderHeight;
            else
                local v178 = v177 / 50;
                return v6.PeekHeaderMinHeight + (v6.PeekHeaderHeight - v6.PeekHeaderMinHeight) * v178;
            end;
        end, {
            v44
        });
    end;
    return v7.createElement("Frame", {
        BackgroundTransparency = 1, 
        Size = UDim2.new(1, 1, 1, 0), 
        ref = v45
    }, {
        DropShadowBackground = v7.createElement("Frame", {
            ZIndex = 0, 
            Size = UDim2.new(1, 0, 0, 36), 
            Position = v73:map(function(v179) --[[ Line: 800 ]]
                -- upvalues: l_alwaysShowingHeight_0 (copy)
                return UDim2.new(0, 0, 1, -v179 - l_alwaysShowingHeight_0 - 30);
            end)
        }, {
            UIGradient = v7.createElement("UIGradient", {
                Rotation = 90, 
                Color = ColorSequence.new({
                    ColorSequenceKeypoint.new(0, v69.Theme.DropShadow.Color), 
                    ColorSequenceKeypoint.new(1, v69.Theme.DropShadow.Color)
                }), 
                Transparency = NumberSequence.new({
                    NumberSequenceKeypoint.new(0, 1), 
                    NumberSequenceKeypoint.new(1, 0.7)
                })
            })
        }), 
        AdaptiveScrollingViewOpaqueBackground = if v60 and v60.opaqueBackground then v7.createElement("Frame", {
            ZIndex = 1, 
            Size = UDim2.fromScale(1, 1), 
            Position = UDim2.fromOffset(0, -v57), 
            BackgroundTransparency = v73:map(v166), 
            BackgroundColor3 = l_Theme_0.BackgroundDefault.Color, 
            BorderSizePixel = 0
        }) else nil, 
        ClipFrame = v7.createElement("Frame", {
            BackgroundTransparency = 1, 
            ClipsDescendants = true, 
            AnchorPoint = Vector2.new(0.5, 1), 
            Position = UDim2.fromScale(0.5, 1), 
            Size = v73:map(function(v180) --[[ Line: 834 ]]
                -- upvalues: l_alwaysShowingHeight_0 (copy)
                return UDim2.new(1, 0, 0, v180 + l_alwaysShowingHeight_0);
            end), 
            ZIndex = l_FFlagAXAdaptiveScrollingViewBanner_0 and 2 or nil
        }, {
            ScrollingFrame = v7.createElement("ScrollingFrame", {
                ref = v46, 
                AnchorPoint = Vector2.new(0.5, 1), 
                Position = UDim2.fromScale(0.5, 1), 
                Size = UDim2.new(1, 0, 0, l_fullHeight_0), 
                CanvasSize = UDim2.new(1, 0, 0, l_fullHeight_0 + v44), 
                BackgroundTransparency = 1, 
                ScrollingDirection = if l_FFlagAXSlotsPeekViewScrollFix_0 and v40.disableViewChangeByScroll then v40.disableViewChangeByScroll:map(function(v181) --[[ Line: 847 ]]
                    if v181 then
                        return Enum.ScrollingDirection.X;
                    else
                        return Enum.ScrollingDirection.Y;
                    end;
                end) else Enum.ScrollingDirection.Y, 
                ScrollBarThickness = 0, 
                ScrollingEnabled = if v18 then if v40.enableViewModeTransition ~= nil then v40.enableViewModeTransition else not l_FFlagAXExpandPeekViewOnFirstScroll_0 or v80 else nil, 
                ElasticBehavior = Enum.ElasticBehavior.Never, 
                [v7.Change.CanvasPosition] = v119
            }, {
                VerticalLayout = v7.createElement("UIListLayout", {
                    SortOrder = Enum.SortOrder.LayoutOrder, 
                    FillDirection = Enum.FillDirection.Vertical, 
                    HorizontalAlignment = Enum.HorizontalAlignment.Center
                }), 
                Spacer = v7.createElement("Frame", {
                    BackgroundTransparency = 1, 
                    Active = false, 
                    Size = UDim2.new(1, 0, 0, v44), 
                    LayoutOrder = 1
                }), 
                PeekHeader = v7.createElement("TextButton", {
                    Text = "", 
                    LayoutOrder = 2, 
                    ZIndex = 2, 
                    BackgroundTransparency = 1, 
                    Size = if l_FFlagAXHideMenuOnScroll_0 and v60 and v60.draggerToDivider then v73:map(function(v182) --[[ Line: 879 ]]
                        -- upvalues: v173 (ref)
                        return UDim2.new(1, 0, 0, v173(v182));
                    end) else UDim2.new(1, 0, 0, v6.PeekHeaderHeight), 
                    BorderSizePixel = 0, 
                    [v7.Event.Activated] = v163
                }, {
                    PeekHeaderBackground = v7.createElement("Frame", {
                        LayoutOrder = 2, 
                        ZIndex = 1, 
                        Size = if l_FFlagAXHideMenuOnScroll_0 and v60 and v60.draggerToDivider then v73:map(function(v183) --[[ Line: 895 ]]
                            -- upvalues: v174 (ref), v173 (ref)
                            local v184 = v174(v183);
                            return UDim2.new(1, 0, 0, v173(v183) + v184);
                        end) else UDim2.new(1, 0, 0, v6.PeekHeaderHeight + 12), 
                        BackgroundTransparency = l_Theme_0.BackgroundDefault.Transparency, 
                        BackgroundColor3 = if l_FFlagAXAdaptiveScrollingViewBanner_0 and v40.banner then l_Theme_0.BackgroundContrast.Color else l_Theme_0.BackgroundDefault.Color, 
                        BorderSizePixel = 0, 
                        Active = false
                    }, {
                        UICorner = v7.createElement("UICorner", {
                            CornerRadius = if l_FFlagAXHideMenuOnScroll_0 and v60 and v60.draggerToDivider then v73:map(function(v185) --[[ Line: 911 ]]
                                -- upvalues: v174 (ref)
                                return UDim.new(0, v174(v185));
                            end) else UDim.new(0, 12)
                        })
                    }), 
                    Dragger = v7.createElement("Frame", {
                        ZIndex = 2, 
                        BackgroundColor3 = if v21 then v56.Semantic.Color.Common.Divider.Color3 else v56.Color.Extended.White.White_10.Color3, 
                        BackgroundTransparency = if v21 then v56.Semantic.Color.Common.Divider.Transparency else v56.Color.Extended.White.White_10.Transparency, 
                        Size = if v60 and v60.draggerToDivider then v73:map(v172) else UDim2.new(0, l_Size_900_0, 0, l_Size_100_0), 
                        AnchorPoint = Vector2.new(0.5, 0.5), 
                        Position = UDim2.fromScale(0.5, 0.5), 
                        BorderSizePixel = 0, 
                        Active = false
                    }, {
                        DraggerUICorner = v7.createElement("UICorner", {
                            CornerRadius = UDim.new(0, 12)
                        })
                    })
                }), 
                Banner = if l_FFlagAXAdaptiveScrollingViewBanner_0 and v40.banner then v7.createElement("Frame", {
                    BackgroundColor3 = l_Theme_0.BackgroundContrast.Color, 
                    Size = UDim2.new(1, 0, 0, 0), 
                    AutomaticSize = Enum.AutomaticSize.Y, 
                    LayoutOrder = 3, 
                    ZIndex = 3, 
                    BorderSizePixel = 0
                }, {
                    Content = v40.banner
                }) else nil, 
                ExpandingContent = v7.createElement("Frame", {
                    BackgroundTransparency = 1, 
                    Size = v73:map(function(v186) --[[ Line: 952 ]]
                        -- upvalues: l_alwaysShowingHeight_0 (copy)
                        return UDim2.new(1, 0, 0, v186 + l_alwaysShowingHeight_0);
                    end), 
                    LayoutOrder = l_FFlagAXAdaptiveScrollingViewBanner_0 and 4 or 3, 
                    ZIndex = 3
                }, {
                    AdaptiveScrollingProvider = v7.createElement(v11.Provider, {
                        value = v117
                    }, v40.children)
                }), 
                OnInputBegan = v7.createElement(l_ExternalEventConnection_0, {
                    event = l_UserInputService_0.InputBegan, 
                    callback = v154
                }), 
                OnInputChanged = if l_FFlagAXExpandPeekViewOnFirstScroll_0 then v7.createElement(l_ExternalEventConnection_0, {
                    event = l_UserInputService_0.InputChanged, 
                    callback = v155
                }) else nil, 
                OnInputEnded = v7.createElement(l_ExternalEventConnection_0, {
                    event = l_UserInputService_0.InputEnded, 
                    callback = v162
                })
            })
        })
    });
end;