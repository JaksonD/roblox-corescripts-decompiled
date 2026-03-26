local l_Parent_0 = script.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local l_ContextActionService_0 = game:GetService("ContextActionService");
local l_RunService_0 = game:GetService("RunService");
local l_UserGameSettings_0 = UserSettings():GetService("UserGameSettings");
local l_UserInputService_0 = game:GetService("UserInputService");
local v6 = require(l_Parent_1.Otter);
local v7 = require(l_Parent_1.React);
local v8 = require(l_Parent_1.ReactUtils);
local v9 = require(l_Parent_1.Responsive);
local v10 = require(l_Parent_1.RoactUtils);
local v11 = require(l_Parent_1.SocialCommon);
local v12 = require(l_Parent_0.Analytics.useAnalytics);
local l_useBinding_0 = v7.useBinding;
local l_useEffectOnce_0 = v10.Hooks.useEffectOnce;
local l_useEventConnection_0 = v8.useEventConnection;
local l_useIsHovered_0 = v11.Hooks.useIsHovered;
local l_useIsTouchDown_0 = v11.Hooks.useIsTouchDown;
local l_useLastInput_0 = v9.useLastInput;
local v19 = require(l_Parent_0.Analytics.EventNames);
local v20 = require(l_Parent_0.Utils.getClosestItemToCenter);
local l_FFlagUseMediaPlayerInCarousel_0 = require(l_Parent_1.SharedFlags).FFlagUseMediaPlayerInCarousel;
local v22 = {
    dampingRatio = 1, 
    frequency = 4
};
local function _(v23, v24, v25) --[[ Line: 75 ]] --[[ Name: isWithinEpsilon ]]
    return math.abs(v23 - v24) < v25;
end;
local function v109(v27, v28, v29) --[[ Line: 79 ]] --[[ Name: createController ]]
    -- upvalues: v6 (copy), v22 (copy), l_UserGameSettings_0 (copy), v20 (copy), l_RunService_0 (copy)
    local v30 = nil;
    local v31 = false;
    local v32 = nil;
    local v33 = false;
    local v34 = 0;
    local v35 = false;
    local function v36() --[[ Line: 91 ]] --[[ Name: getWasTouched ]]
        -- upvalues: v35 (ref)
        return v35;
    end;
    local function v37() --[[ Line: 95 ]] --[[ Name: resetTouchState ]]
        -- upvalues: v31 (ref), v35 (ref)
        v31 = false;
        v35 = false;
    end;
    local function v38() --[[ Line: 100 ]] --[[ Name: getIsNavigationLocked ]]
        -- upvalues: v33 (ref)
        return v33;
    end;
    local function v40(v39) --[[ Line: 104 ]] --[[ Name: setIsNavigationLocked ]]
        -- upvalues: v31 (ref), v35 (ref), v33 (ref)
        if v39 == true then
            v31 = false;
            v35 = false;
        end;
        v33 = v39;
    end;
    local function v47(v41, v42, v43) --[[ Line: 111 ]] --[[ Name: resetMotor ]]
        -- upvalues: v32 (ref), v6 (ref), v31 (ref), v34 (ref), v27 (copy)
        if v32 then
            v32:destroy();
            v32 = nil;
        end;
        local v44 = v6.createSingleMotor(v41);
        v32 = v44;
        v44:onStep(function(v45) --[[ Line: 123 ]]
            -- upvalues: v32 (ref), v44 (copy), v31 (ref), v34 (ref), v42 (copy), v41 (copy), v27 (ref)
            if v32 ~= v44 then
                v44:destroy();
                return;
            elseif v31 then
                v44:destroy();
                v32 = nil;
                return;
            else
                local v46 = if math.abs(v45 - v34) < 0.5 then v34 else v45;
                if v42 and v42(v41, v46) then
                    return;
                else
                    if v27.current then
                        v27.current.CanvasPosition = Vector2.new(v46, 0);
                    end;
                    return;
                end;
            end;
        end);
        if v43 then
            v44:onComplete(v43);
        end;
        v44:start();
    end;
    local function v51(v48, v49, v50) --[[ Line: 156 ]] --[[ Name: setGoal ]]
        -- upvalues: v32 (ref), v34 (ref), v6 (ref), v22 (ref)
        if not v32 then
            return;
        else
            assert(v32 ~= nil, "setGoal called before resetMotor");
            v34 = v48.X * (v49 - 1);
            if v50 then
                v32:setGoal(v6.instant(v34));
                return;
            else
                v32:setGoal(v6.spring(v34, v22));
                return;
            end;
        end;
    end;
    local function v79(v52, v53, v54, v55, v56, v57) --[[ Line: 171 ]] --[[ Name: handleDeleteTransition ]]
        -- upvalues: v27 (copy), v28 (copy), v31 (ref), v35 (ref), v33 (ref), v47 (copy), v51 (copy), l_UserGameSettings_0 (ref), v6 (ref), v32 (ref), v34 (ref)
        local l_current_0 = v27.current;
        local l_current_1 = v28.current;
        if not l_current_0 or not l_current_1 then
            return;
        else
            assert(l_current_0 ~= nil, "carousel should exist");
            assert(l_current_1 ~= nil, "selectedItem should exist");
            local l_ScrollingEnabled_0 = l_current_0.ScrollingEnabled;
            l_current_0.ScrollingEnabled = false;
            v31 = false;
            v35 = false;
            v33 = true;
            local function v66() --[[ Line: 194 ]] --[[ Name: handleDeleteNextImageMovement ]]
                -- upvalues: v54 (copy), l_current_1 (copy), v55 (copy), v47 (ref), l_current_0 (copy), v57 (copy), v52 (copy), v33 (ref), l_ScrollingEnabled_0 (copy), v51 (ref), v56 (copy), l_UserGameSettings_0 (ref)
                local function v65(v61, v62) --[[ Line: 195 ]] --[[ Name: onStep ]]
                    -- upvalues: v54 (ref), l_current_1 (ref), v55 (ref)
                    local v63 = math.abs(v61 - v62);
                    local v64 = math.round(v54.X - v63);
                    l_current_1.Size = UDim2.fromOffset(v64, v54.Y);
                    return v55 == 1;
                end;
                v47(l_current_0.CanvasPosition.X, v65, function() --[[ Line: 205 ]]
                    -- upvalues: v57 (ref), l_current_1 (ref), v52 (ref), v33 (ref), l_current_0 (ref), l_ScrollingEnabled_0 (ref)
                    v57();
                    l_current_1.Visible = false;
                    v52(1);
                    v33 = false;
                    l_current_0.ScrollingEnabled = l_ScrollingEnabled_0;
                end);
                v51(v54, v55 - 1, v56 or l_UserGameSettings_0.ReducedMotion);
            end;
            local function v74() --[[ Line: 216 ]] --[[ Name: handleDeleteImagesFadeIn ]]
                -- upvalues: v53 (copy), v55 (copy), v47 (ref), l_current_0 (copy), v57 (copy), l_current_1 (copy), v6 (ref), v52 (copy), v33 (ref), l_ScrollingEnabled_0 (copy), v54 (copy), v32 (ref), v34 (ref)
                if not v53 then
                    return;
                else
                    assert(v53 ~= nil, "setPostDeletionItemBinding should exist");
                    local function v69(_, _) --[[ Line: 221 ]]
                        -- upvalues: v55 (ref)
                        return v55 == 1;
                    end;
                    v47(l_current_0.CanvasPosition.X, v69, function() --[[ Line: 225 ]]
                        -- upvalues: v57 (ref), l_current_1 (ref), v6 (ref), v52 (ref), v53 (ref), v33 (ref), l_current_0 (ref), l_ScrollingEnabled_0 (ref)
                        v57();
                        l_current_1.Visible = false;
                        local v70 = v6.createSingleMotor(0);
                        v70:onStep(function(v71) --[[ Line: 229 ]]
                            -- upvalues: v52 (ref), v53 (ref)
                            v52(v71);
                            v53(1);
                        end);
                        v70:onComplete(function() --[[ Line: 233 ]]
                            -- upvalues: v33 (ref), l_current_0 (ref), l_ScrollingEnabled_0 (ref)
                            v33 = false;
                            l_current_0.ScrollingEnabled = l_ScrollingEnabled_0;
                        end);
                        v70:setGoal(v6.spring(1, {
                            frequency = 2
                        }));
                    end);
                    local l_v54_0 = v54;
                    local v73 = v55 - 1;
                    if not v32 then
                        return;
                    else
                        assert(v32 ~= nil, "setGoal called before resetMotor");
                        v34 = l_v54_0.X * (v73 - 1);
                        v32:setGoal(v6.instant(v34));
                        return;
                    end;
                end;
            end;
            local function v76() --[[ Line: 243 ]] --[[ Name: handleDeleteNextImageFadeOut ]]
                -- upvalues: v53 (copy), v6 (ref), v74 (copy)
                if not v53 then
                    return;
                else
                    assert(v53 ~= nil, "setPostDeletionItemBinding should exist");
                    local v75 = v6.createSingleMotor(1);
                    v75:onStep(v53);
                    v75:onComplete(v74);
                    v75:setGoal(v6.spring(0, {
                        frequency = 6
                    }));
                    return;
                end;
            end;
            local v77 = v6.createSingleMotor(1);
            v77:onStep(v52);
            local v78 = nil;
            if l_UserGameSettings_0.ReducedMotion then
                v78 = 6;
                v77:onComplete(v76);
            else
                v78 = 4;
                v77:onComplete(v66);
            end;
            v77:setGoal(v6.spring(0, {
                frequency = v78
            }));
            return;
        end;
    end;
    local function v104(v80, v81) --[[ Line: 267 ]] --[[ Name: handleInertialMove ]]
        -- upvalues: v27 (copy), v31 (ref), v20 (ref), v32 (ref), v6 (ref), v34 (ref), v22 (ref), v30 (ref), l_RunService_0 (ref), v29 (copy)
        local v82 = nil;
        local l_current_2 = v27.current;
        if v31 or not l_current_2 then
            return;
        else
            assert(l_current_2 ~= nil, "carousel should not be nil");
            v82 = -l_current_2:GetSampledInertialVelocity().X;
            l_current_2:ClearInertialScrolling();
            local v84, v85 = v20(v80, l_current_2);
            if math.abs(v82) < 60 and v84 == v81 then
                if v85 > 0.5 then
                    local l_X_0 = l_current_2.CanvasPosition.X;
                    if v32 then
                        v32:destroy();
                        v32 = nil;
                    end;
                    local v87 = v6.createSingleMotor(l_X_0);
                    v32 = v87;
                    local v88 = nil;
                    v87:onStep(function(v89) --[[ Line: 123 ]]
                        -- upvalues: v32 (ref), v87 (copy), v31 (ref), v34 (ref), v88 (copy), l_X_0 (copy), v27 (ref)
                        if v32 ~= v87 then
                            v87:destroy();
                            return;
                        elseif v31 then
                            v87:destroy();
                            v32 = nil;
                            return;
                        else
                            local v90 = if math.abs(v89 - v34) < 0.5 then v34 else v89;
                            if v88 and v88(l_X_0, v90) then
                                return;
                            else
                                if v27.current then
                                    v27.current.CanvasPosition = Vector2.new(v90, 0);
                                end;
                                return;
                            end;
                        end;
                    end);
                    v87:start();
                    if v32 then
                        assert(v32 ~= nil, "setGoal called before resetMotor");
                        v34 = v80.X * (v81 - 1);
                        v32:setGoal(v6.spring(v34, v22));
                    end;
                end;
                return;
            else
                if v30 then
                    v30:Disconnect();
                    v30 = nil;
                end;
                v30 = l_RunService_0.RenderStepped:Connect(function(v91) --[[ Line: 297 ]]
                    -- upvalues: v27 (ref), v31 (ref), v30 (ref), v20 (ref), v80 (copy), v82 (ref), v81 (copy), v32 (ref), v6 (ref), v34 (ref), v22 (ref), v29 (ref)
                    local l_current_3 = v27.current;
                    if not l_current_3 or v31 then
                        assert(v30 ~= nil, "handleInertialMoveConn should exist");
                        v30:Disconnect();
                        v30 = nil;
                        return;
                    else
                        assert(l_current_3 ~= nil, "carousel should not be nil");
                        local v93, v94 = v20(v80, l_current_3);
                        if math.abs(v82) < 60 then
                            assert(v30 ~= nil, "handleInertialMoveConn should exist");
                            v30:Disconnect();
                            v30 = nil;
                            if v93 == v81 then
                                local l_X_1 = l_current_3.CanvasPosition.X;
                                if v32 then
                                    v32:destroy();
                                    v32 = nil;
                                end;
                                local v96 = v6.createSingleMotor(l_X_1);
                                v32 = v96;
                                local v97 = nil;
                                local l_v96_0 = v96 --[[ copy: 5 -> 10 ]];
                                local l_l_X_1_0 = l_X_1 --[[ copy: 4 -> 11 ]];
                                v96:onStep(function(v100) --[[ Line: 123 ]]
                                    -- upvalues: v32 (ref), l_v96_0 (copy), v31 (ref), v34 (ref), v97 (copy), l_l_X_1_0 (copy), v27 (ref)
                                    if v32 ~= l_v96_0 then
                                        l_v96_0:destroy();
                                        return;
                                    elseif v31 then
                                        l_v96_0:destroy();
                                        v32 = nil;
                                        return;
                                    else
                                        local v101 = if math.abs(v100 - v34) < 0.5 then v34 else v100;
                                        if v97 and v97(l_l_X_1_0, v101) then
                                            return;
                                        else
                                            if v27.current then
                                                v27.current.CanvasPosition = Vector2.new(v101, 0);
                                            end;
                                            return;
                                        end;
                                    end;
                                end);
                                v96:start();
                                l_X_1 = v80;
                                v96 = v81;
                                if not v32 then
                                    return;
                                else
                                    assert(v32 ~= nil, "setGoal called before resetMotor");
                                    v34 = l_X_1.X * (v96 - 1);
                                    v32:setGoal(v6.spring(v34, v22));
                                    return;
                                end;
                            else
                                v29(v93);
                                return;
                            end;
                        else
                            l_current_3.CanvasPosition = l_current_3.CanvasPosition + Vector2.new(v82 * v91, 0);
                            local v102 = math.max(v94 / (v80.X / 2) * 1.25, 0.85);
                            local v103 = nil;
                            v103 = math.abs(v82) < 120 and 0.7 or v102 * 0.95;
                            v82 = v82 * v103 ^ (v91 / 0.016666666666666666);
                            return;
                        end;
                    end;
                end);
                return;
            end;
        end;
    end;
    local function v107(_, v106) --[[ Line: 343 ]] --[[ Name: onInputBegan ]]
        -- upvalues: v33 (ref), v31 (ref), v35 (ref)
        if v33 then
            return;
        else
            if v106.UserInputType == Enum.UserInputType.Touch then
                v31 = true;
                v35 = true;
            end;
            return;
        end;
    end;
    local v108 = {
        carouselRef = v27, 
        getWasTouched = v36, 
        getIsNavigationLocked = v38, 
        handleDeleteTransition = v79, 
        handleInertialMove = v104, 
        onInputBegan = v107, 
        resetMotor = v47, 
        resetTouchState = v37, 
        setGoal = v51, 
        setIsNavigationLocked = v40
    };
    v108.resetMotor(0);
    return v108;
end;
return function(v110, v111, v112) --[[ Line: 372 ]]
    -- upvalues: v12 (copy), l_useBinding_0 (copy), v7 (copy), l_useIsHovered_0 (copy), l_useIsTouchDown_0 (copy), l_useLastInput_0 (copy), v109 (copy), l_UserGameSettings_0 (copy), l_useEffectOnce_0 (copy), v20 (copy), l_useEventConnection_0 (copy), l_UserInputService_0 (copy), l_ContextActionService_0 (copy), v19 (copy), l_FFlagUseMediaPlayerInCarousel_0 (copy)
    local v113 = v12();
    local v114, v115 = l_useBinding_0(1);
    local v116, v117 = l_useBinding_0(1);
    local v118 = v7.useRef(nil);
    local v119, v120, v121 = l_useIsHovered_0();
    local v122 = l_useIsTouchDown_0();
    local v123 = v7.useRef(nil);
    local v124 = l_useLastInput_0();
    local v125 = v7.useRef(nil);
    if v125.current == nil then
        v125.current = v109(v118, v123, v112);
    end;
    local l_current_4 = v125.current;
    assert(l_current_4 ~= nil, "carouselController should exist");
    v7.useEffect(function() --[[ Line: 392 ]]
        -- upvalues: v118 (copy), l_UserGameSettings_0 (ref), l_current_4 (copy), v110 (copy), v111 (copy)
        local l_current_5 = v118.current;
        if not l_current_5 then
            return;
        else
            assert(l_current_5 ~= nil, "carousel should exist");
            local v128 = false;
            if l_UserGameSettings_0.ReducedMotion then
                v128 = true;
            end;
            l_current_4.resetMotor(l_current_5.CanvasPosition.X);
            l_current_4.setGoal(v110, v111, v128);
            return;
        end;
    end, {
        v111
    });
    l_useEffectOnce_0(function() --[[ Line: 410 ]]
        -- upvalues: l_current_4 (copy), v110 (copy), v111 (copy)
        l_current_4.setGoal(v110, v111, true);
    end, v111 ~= nil);
    v7.useEffect(function() --[[ Line: 416 ]]
        -- upvalues: l_current_4 (copy), v110 (copy), v111 (copy)
        l_current_4.setGoal(v110, v111, true);
    end, {
        v110
    });
    v7.useEffect(function() --[[ Line: 421 ]]
        -- upvalues: v122 (copy), l_current_4 (copy), v110 (copy), v111 (copy)
        if not v122 and l_current_4.getWasTouched() then
            l_current_4.resetTouchState();
            l_current_4.handleInertialMove(v110, v111);
        end;
    end, {
        v122
    });
    local v132 = v7.useCallback(function(v129) --[[ Line: 428 ]]
        -- upvalues: v118 (copy), l_current_4 (copy), v20 (ref), v110 (copy), v119 (copy), v112 (copy)
        local l_current_6 = v118.current;
        if not l_current_6 then
            return;
        else
            assert(l_current_6 ~= nil, "carousel should exist");
            if l_current_4.getIsNavigationLocked() then
                return;
            else
                local v131 = v20(v110, l_current_6);
                if v119 and v129 > 0 then
                    v112(v131 - 1);
                    return;
                else
                    if v119 and v129 < 0 then
                        v112(v131 + 1);
                    end;
                    return;
                end;
            end;
        end;
    end, {
        v119, 
        v110
    });
    l_useEventConnection_0(l_UserInputService_0.PointerAction, v132);
    local v136 = v7.useCallback(function(v133) --[[ Line: 449 ]]
        -- upvalues: l_UserGameSettings_0 (ref), v118 (copy), l_current_4 (copy), v20 (ref), v110 (copy), v112 (copy)
        if not l_UserGameSettings_0.ReducedMotion then
            return;
        else
            local l_current_7 = v118.current;
            if not l_current_7 then
                return;
            else
                assert(l_current_7 ~= nil, "carousel should exist");
                if l_current_4.getIsNavigationLocked() then
                    return;
                else
                    local v135 = v20(v110, l_current_7);
                    if v133 == Enum.SwipeDirection.Left then
                        v112(v135 + 1);
                        return;
                    else
                        if v133 == Enum.SwipeDirection.Right then
                            v112(v135 - 1);
                        end;
                        return;
                    end;
                end;
            end;
        end;
    end, {});
    l_useEventConnection_0(l_UserInputService_0.TouchSwipe, v136);
    v7.useEffect(function() --[[ Line: 473 ]]
        -- upvalues: l_ContextActionService_0 (ref), v118 (copy), l_current_4 (copy), v113 (copy), v19 (ref), v20 (ref), v110 (copy), v112 (copy)
        l_ContextActionService_0:BindCoreAction("CapturesCarouselNavigateShortcutAction", function(_, v138, v139) --[[ Line: 474 ]]
            -- upvalues: v118 (ref), l_current_4 (ref), v113 (ref), v19 (ref), v20 (ref), v110 (ref), v112 (ref)
            local l_current_8 = v118.current;
            if not l_current_8 then
                return;
            else
                assert(l_current_8 ~= nil, "carousel should exist");
                if l_current_4.getIsNavigationLocked() then
                    return;
                else
                    if v138 == Enum.UserInputState.End then
                        v113.fireEvent(v19.CapturesCarouselNavigatedByKeyboard);
                        local v141 = v20(v110, l_current_8);
                        if v139.KeyCode == Enum.KeyCode.Left then
                            v112(v141 - 1);
                            return;
                        elseif v139.KeyCode == Enum.KeyCode.Right then
                            v112(v141 + 1);
                        end;
                    end;
                    return;
                end;
            end;
        end, false, Enum.KeyCode.Left, Enum.KeyCode.Right);
        return function() --[[ Line: 496 ]]
            -- upvalues: l_ContextActionService_0 (ref)
            l_ContextActionService_0:UnbindCoreAction("CapturesCarouselNavigateShortcutAction");
        end;
    end, {});
    local v144 = v7.useCallback(function(v142, v143) --[[ Line: 501 ]]
        -- upvalues: l_current_4 (copy), l_UserGameSettings_0 (ref), v120 (copy)
        if l_current_4.getIsNavigationLocked() then
            return;
        elseif l_UserGameSettings_0.ReducedMotion then
            v120(v142, v143);
            return;
        else
            l_current_4.onInputBegan(v142, v143);
            v120(v142, v143);
            return;
        end;
    end, {
        l_current_4.onInputBegan, 
        v120
    });
    local v147 = v7.useCallback(function(v145, v146) --[[ Line: 515 ]]
        -- upvalues: l_FFlagUseMediaPlayerInCarousel_0 (ref), v124 (copy), l_current_4 (copy), v121 (copy)
        if l_FFlagUseMediaPlayerInCarousel_0 and v124 == "Touch" and not l_current_4.getWasTouched() then
            l_current_4.onInputBegan(v145, v146);
        end;
        v121(v145, v146);
    end, {
        v121
    });
    local v149 = v7.useCallback(function(v148) --[[ Line: 522 ]]
        -- upvalues: l_current_4 (copy), v115 (copy), v117 (copy), v110 (copy), v111 (copy)
        l_current_4.handleDeleteTransition(v115, v117, v110, v111, false, v148);
    end, {
        v110, 
        v111, 
        v115
    });
    return {
        carouselInputBegan = v144, 
        carouselInputEnded = v147, 
        carouselRef = v118, 
        deleteSelectedItem = v149, 
        postDeletionItemBinding = v116, 
        selectedItemFadeOutBinding = v114, 
        selectedItemRef = v123, 
        setIsNavigationLocked = l_current_4.setIsNavigationLocked
    };
end;