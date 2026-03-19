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
local function v95(v27, v28, v29) --[[ Line: 79 ]] --[[ Name: createController ]]
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
    local function v77(v52, v53, v54, v55, v56, v57) --[[ Line: 171 ]] --[[ Name: handleDeleteTransition ]]
        -- upvalues: v27 (copy), v28 (copy), v31 (ref), v35 (ref), v33 (ref), v47 (copy), v51 (copy), l_UserGameSettings_0 (ref), v6 (ref)
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
            local function v72() --[[ Line: 216 ]] --[[ Name: handleDeleteImagesFadeIn ]]
                -- upvalues: v53 (copy), v55 (copy), v47 (ref), l_current_0 (copy), v57 (copy), l_current_1 (copy), v6 (ref), v52 (copy), v33 (ref), l_ScrollingEnabled_0 (copy), v51 (ref), v54 (copy)
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
                    v51(v54, v55 - 1, true);
                    return;
                end;
            end;
            local function v74() --[[ Line: 243 ]] --[[ Name: handleDeleteNextImageFadeOut ]]
                -- upvalues: v53 (copy), v6 (ref), v72 (copy)
                if not v53 then
                    return;
                else
                    assert(v53 ~= nil, "setPostDeletionItemBinding should exist");
                    local v73 = v6.createSingleMotor(1);
                    v73:onStep(v53);
                    v73:onComplete(v72);
                    v73:setGoal(v6.spring(0, {
                        frequency = 6
                    }));
                    return;
                end;
            end;
            local v75 = v6.createSingleMotor(1);
            v75:onStep(v52);
            local v76 = nil;
            if l_UserGameSettings_0.ReducedMotion then
                v76 = 6;
                v75:onComplete(v74);
            else
                v76 = 4;
                v75:onComplete(v66);
            end;
            v75:setGoal(v6.spring(0, {
                frequency = v76
            }));
            return;
        end;
    end;
    local function v90(v78, v79) --[[ Line: 267 ]] --[[ Name: handleInertialMove ]]
        -- upvalues: v27 (copy), v31 (ref), v20 (ref), v47 (copy), v51 (copy), v30 (ref), l_RunService_0 (ref), v29 (copy)
        local v80 = nil;
        local l_current_2 = v27.current;
        if v31 or not l_current_2 then
            return;
        else
            assert(l_current_2 ~= nil, "carousel should not be nil");
            v80 = -l_current_2:GetSampledInertialVelocity().X;
            l_current_2:ClearInertialScrolling();
            local v82, v83 = v20(v78, l_current_2);
            if math.abs(v80) < 60 and v82 == v79 then
                if v83 > 0.5 then
                    v47(l_current_2.CanvasPosition.X);
                    v51(v78, v79, false);
                end;
                return;
            else
                if v30 then
                    v30:Disconnect();
                    v30 = nil;
                end;
                v30 = l_RunService_0.RenderStepped:Connect(function(v84) --[[ Line: 297 ]]
                    -- upvalues: v27 (ref), v31 (ref), v30 (ref), v20 (ref), v78 (copy), v80 (ref), v79 (copy), v47 (ref), v51 (ref), v29 (ref)
                    local l_current_3 = v27.current;
                    if not l_current_3 or v31 then
                        assert(v30 ~= nil, "handleInertialMoveConn should exist");
                        v30:Disconnect();
                        v30 = nil;
                        return;
                    else
                        assert(l_current_3 ~= nil, "carousel should not be nil");
                        local v86, v87 = v20(v78, l_current_3);
                        if math.abs(v80) < 60 then
                            assert(v30 ~= nil, "handleInertialMoveConn should exist");
                            v30:Disconnect();
                            v30 = nil;
                            if v86 == v79 then
                                v47(l_current_3.CanvasPosition.X);
                                v51(v78, v79, false);
                                return;
                            else
                                v29(v86);
                                return;
                            end;
                        else
                            l_current_3.CanvasPosition = l_current_3.CanvasPosition + Vector2.new(v80 * v84, 0);
                            local v88 = math.max(v87 / (v78.X / 2) * 1.25, 0.85);
                            local v89 = nil;
                            v89 = math.abs(v80) < 120 and 0.7 or v88 * 0.95;
                            v80 = v80 * v89 ^ (v84 / 0.016666666666666666);
                            return;
                        end;
                    end;
                end);
                return;
            end;
        end;
    end;
    local function v93(_, v92) --[[ Line: 343 ]] --[[ Name: onInputBegan ]]
        -- upvalues: v33 (ref), v31 (ref), v35 (ref)
        if v33 then
            return;
        else
            if v92.UserInputType == Enum.UserInputType.Touch then
                v31 = true;
                v35 = true;
            end;
            return;
        end;
    end;
    local v94 = {
        carouselRef = v27, 
        getWasTouched = v36, 
        getIsNavigationLocked = v38, 
        handleDeleteTransition = v77, 
        handleInertialMove = v90, 
        onInputBegan = v93, 
        resetMotor = v47, 
        resetTouchState = v37, 
        setGoal = v51, 
        setIsNavigationLocked = v40
    };
    v94.resetMotor(0);
    return v94;
end;
return function(v96, v97, v98) --[[ Line: 372 ]]
    -- upvalues: v12 (copy), l_useBinding_0 (copy), v7 (copy), l_useIsHovered_0 (copy), l_useIsTouchDown_0 (copy), l_useLastInput_0 (copy), v95 (copy), l_UserGameSettings_0 (copy), l_useEffectOnce_0 (copy), v20 (copy), l_useEventConnection_0 (copy), l_UserInputService_0 (copy), l_ContextActionService_0 (copy), v19 (copy), l_FFlagUseMediaPlayerInCarousel_0 (copy)
    local v99 = v12();
    local v100, v101 = l_useBinding_0(1);
    local v102, v103 = l_useBinding_0(1);
    local v104 = v7.useRef(nil);
    local v105, v106, v107 = l_useIsHovered_0();
    local v108 = l_useIsTouchDown_0();
    local v109 = v7.useRef(nil);
    local v110 = l_useLastInput_0();
    local v111 = v7.useRef(nil);
    if v111.current == nil then
        v111.current = v95(v104, v109, v98);
    end;
    local l_current_4 = v111.current;
    assert(l_current_4 ~= nil, "carouselController should exist");
    v7.useEffect(function() --[[ Line: 392 ]]
        -- upvalues: v104 (copy), l_UserGameSettings_0 (ref), l_current_4 (copy), v96 (copy), v97 (copy)
        local l_current_5 = v104.current;
        if not l_current_5 then
            return;
        else
            assert(l_current_5 ~= nil, "carousel should exist");
            local v114 = false;
            if l_UserGameSettings_0.ReducedMotion then
                v114 = true;
            end;
            l_current_4.resetMotor(l_current_5.CanvasPosition.X);
            l_current_4.setGoal(v96, v97, v114);
            return;
        end;
    end, {
        v97
    });
    l_useEffectOnce_0(function() --[[ Line: 410 ]]
        -- upvalues: l_current_4 (copy), v96 (copy), v97 (copy)
        l_current_4.setGoal(v96, v97, true);
    end, v97 ~= nil);
    v7.useEffect(function() --[[ Line: 416 ]]
        -- upvalues: l_current_4 (copy), v96 (copy), v97 (copy)
        l_current_4.setGoal(v96, v97, true);
    end, {
        v96
    });
    v7.useEffect(function() --[[ Line: 421 ]]
        -- upvalues: v108 (copy), l_current_4 (copy), v96 (copy), v97 (copy)
        if not v108 and l_current_4.getWasTouched() then
            l_current_4.resetTouchState();
            l_current_4.handleInertialMove(v96, v97);
        end;
    end, {
        v108
    });
    local v118 = v7.useCallback(function(v115) --[[ Line: 428 ]]
        -- upvalues: v104 (copy), l_current_4 (copy), v20 (ref), v96 (copy), v105 (copy), v98 (copy)
        local l_current_6 = v104.current;
        if not l_current_6 then
            return;
        else
            assert(l_current_6 ~= nil, "carousel should exist");
            if l_current_4.getIsNavigationLocked() then
                return;
            else
                local v117 = v20(v96, l_current_6);
                if v105 and v115 > 0 then
                    v98(v117 - 1);
                    return;
                else
                    if v105 and v115 < 0 then
                        v98(v117 + 1);
                    end;
                    return;
                end;
            end;
        end;
    end, {
        v105, 
        v96
    });
    l_useEventConnection_0(l_UserInputService_0.PointerAction, v118);
    local v122 = v7.useCallback(function(v119) --[[ Line: 449 ]]
        -- upvalues: l_UserGameSettings_0 (ref), v104 (copy), l_current_4 (copy), v20 (ref), v96 (copy), v98 (copy)
        if not l_UserGameSettings_0.ReducedMotion then
            return;
        else
            local l_current_7 = v104.current;
            if not l_current_7 then
                return;
            else
                assert(l_current_7 ~= nil, "carousel should exist");
                if l_current_4.getIsNavigationLocked() then
                    return;
                else
                    local v121 = v20(v96, l_current_7);
                    if v119 == Enum.SwipeDirection.Left then
                        v98(v121 + 1);
                        return;
                    else
                        if v119 == Enum.SwipeDirection.Right then
                            v98(v121 - 1);
                        end;
                        return;
                    end;
                end;
            end;
        end;
    end, {});
    l_useEventConnection_0(l_UserInputService_0.TouchSwipe, v122);
    v7.useEffect(function() --[[ Line: 473 ]]
        -- upvalues: l_ContextActionService_0 (ref), v104 (copy), l_current_4 (copy), v99 (copy), v19 (ref), v20 (ref), v96 (copy), v98 (copy)
        l_ContextActionService_0:BindCoreAction("CapturesCarouselNavigateShortcutAction", function(_, v124, v125) --[[ Line: 474 ]]
            -- upvalues: v104 (ref), l_current_4 (ref), v99 (ref), v19 (ref), v20 (ref), v96 (ref), v98 (ref)
            local l_current_8 = v104.current;
            if not l_current_8 then
                return;
            else
                assert(l_current_8 ~= nil, "carousel should exist");
                if l_current_4.getIsNavigationLocked() then
                    return;
                else
                    if v124 == Enum.UserInputState.End then
                        v99.fireEvent(v19.CapturesCarouselNavigatedByKeyboard);
                        local v127 = v20(v96, l_current_8);
                        if v125.KeyCode == Enum.KeyCode.Left then
                            v98(v127 - 1);
                            return;
                        elseif v125.KeyCode == Enum.KeyCode.Right then
                            v98(v127 + 1);
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
    local v130 = v7.useCallback(function(v128, v129) --[[ Line: 501 ]]
        -- upvalues: l_current_4 (copy), l_UserGameSettings_0 (ref), v106 (copy)
        if l_current_4.getIsNavigationLocked() then
            return;
        elseif l_UserGameSettings_0.ReducedMotion then
            v106(v128, v129);
            return;
        else
            l_current_4.onInputBegan(v128, v129);
            v106(v128, v129);
            return;
        end;
    end, {
        l_current_4.onInputBegan, 
        v106
    });
    local v133 = v7.useCallback(function(v131, v132) --[[ Line: 515 ]]
        -- upvalues: l_FFlagUseMediaPlayerInCarousel_0 (ref), v110 (copy), l_current_4 (copy), v107 (copy)
        if l_FFlagUseMediaPlayerInCarousel_0 and v110 == "Touch" and not l_current_4.getWasTouched() then
            l_current_4.onInputBegan(v131, v132);
        end;
        v107(v131, v132);
    end, {
        v107
    });
    local v135 = v7.useCallback(function(v134) --[[ Line: 522 ]]
        -- upvalues: l_current_4 (copy), v101 (copy), v103 (copy), v96 (copy), v97 (copy)
        l_current_4.handleDeleteTransition(v101, v103, v96, v97, false, v134);
    end, {
        v96, 
        v97, 
        v101
    });
    return {
        carouselInputBegan = v130, 
        carouselInputEnded = v133, 
        carouselRef = v104, 
        deleteSelectedItem = v135, 
        postDeletionItemBinding = v102, 
        selectedItemFadeOutBinding = v100, 
        selectedItemRef = v109, 
        setIsNavigationLocked = l_current_4.setIsNavigationLocked
    };
end;