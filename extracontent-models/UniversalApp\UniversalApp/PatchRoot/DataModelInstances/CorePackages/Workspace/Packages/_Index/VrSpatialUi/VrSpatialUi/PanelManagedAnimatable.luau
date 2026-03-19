local l_Parent_0 = script:FindFirstAncestor("VrSpatialUi").Parent;
local v1 = require(l_Parent_0.Otter);
local _ = require(l_Parent_0.Observable);
local function v3() --[[ Line: 8 ]]

end;
local v4 = {
    Default = {
        dampingRatio = 1, 
        frequency = 4.5
    }, 
    Slower = {
        dampingRatio = 1, 
        frequency = 0.66
    }
};
local v5 = {};
v5.__index = v5;
v5.checkIfAnimateNeeded = function(v6, v7) --[[ Line: 36 ]] --[[ Name: checkIfAnimateNeeded ]]
    if v7 == v6._currentGoal then
        return false;
    else
        return true;
    end;
end;
v5.hideAndBlockAnimationUntilLookBackAgain = function(v8) --[[ Line: 43 ]] --[[ Name: hideAndBlockAnimationUntilLookBackAgain ]]
    v8._ignoreAnimateShow = true;
    v8:animateHideIfNeeded(true);
end;
v5.animateHideIfNeeded = function(v9, v10) --[[ Line: 48 ]] --[[ Name: animateHideIfNeeded ]]
    -- upvalues: v3 (copy), v4 (copy)
    if not v10 then
        v9._ignoreAnimateShow = false;
    end;
    if not v9:checkIfAnimateNeeded(1) or v9._pendingHideAnimation and v9._pendingHideAnimation ~= v3 then
        return;
    else
        v9._currentGoal = 1;
        v9:animateToGoal(v9._currentGoal, v4.Slower);
        return;
    end;
end;
v5.animateShowIfNeeded = function(v11) --[[ Line: 59 ]] --[[ Name: animateShowIfNeeded ]]
    -- upvalues: v4 (copy), v3 (copy)
    if not v11:checkIfAnimateNeeded(0) or v11._ignoreAnimateShow then
        return;
    else
        v11:cancelPendingTaskIfNeeded();
        v11._currentGoal = 0;
        v11:animateToGoal(v11._currentGoal, v4.Default);
        local v12 = nil;
        v11._pendingHideAnimation = function() --[[ Line: 68 ]]
            -- upvalues: v11 (copy), v12 (ref), v3 (ref), v4 (ref)
            if v11._pendingHideAnimation == v12 then
                v11._pendingHideAnimation = v3;
                v11:animateToGoal(1, v4.Slower);
            end;
        end;
        v12 = v11._pendingHideAnimation;
        task.delay(3, v11._pendingHideAnimation);
        return;
    end;
end;
v5.animateToGoal = function(v13, v14, v15) --[[ Line: 78 ]] --[[ Name: animateToGoal ]]
    -- upvalues: v1 (copy)
    v13._fadeTransparencyMotor:stop();
    v13._fadeTransparencyMotor:setGoal(v1.spring(v14, v15));
end;
v5.isTargetVisible = function(v16) --[[ Line: 83 ]] --[[ Name: isTargetVisible ]]
    return v16._targetInstance.GroupTransparency == 0;
end;
v5.reset = function(v17) --[[ Line: 87 ]] --[[ Name: reset ]]
    v17._fadeTransparencyMotor:stop();
    v17:cancelPendingTaskIfNeeded();
    v17._ignoreAnimateShow = false;
    v17._currentGoal = -1;
    v17._targetInstance.GroupTransparency = 0;
    v17._visibilityObservable:set(true);
end;
v5.cancelPendingTaskIfNeeded = function(v18) --[[ Line: 96 ]] --[[ Name: cancelPendingTaskIfNeeded ]]
    -- upvalues: v3 (copy)
    v18._pendingHideAnimation = v3;
end;
v5.create = function(v19, v20) --[[ Line: 100 ]] --[[ Name: create ]]
    -- upvalues: v1 (copy), v3 (copy), v5 (copy)
    local v21 = nil;
    for _, v23 in ipairs(v19:GetDescendants()) do
        if v23.Name == "AnimatablePanelManagedContent" then
            v21 = v23;
            break;
        end;
    end;
    if v21 == nil then
        return nil;
    else
        v20:set(v21.GroupTransparency == 0);
        local v24 = v1.createSingleMotor(0);
        v24:onStep(function(v25) --[[ Line: 116 ]]
            -- upvalues: v21 (ref), v20 (copy)
            v21.GroupTransparency = v25;
            v20:set(v21.GroupTransparency == 0);
        end);
        local v26 = {
            _targetInstance = v21, 
            _fadeTransparencyMotor = v24, 
            _currentGoal = -1, 
            _pendingHideAnimation = v3, 
            _ignoreAnimateShow = false, 
            _visibilityObservable = v20
        };
        setmetatable(v26, v5);
        return v26;
    end;
end;
return v5;