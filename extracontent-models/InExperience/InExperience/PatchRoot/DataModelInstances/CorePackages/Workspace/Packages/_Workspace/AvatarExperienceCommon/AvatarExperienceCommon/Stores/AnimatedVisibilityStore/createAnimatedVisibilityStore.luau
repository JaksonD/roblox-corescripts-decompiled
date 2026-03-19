local l_Parent_0 = script:FindFirstAncestor("AvatarExperienceCommon").Parent;
local v1 = require(l_Parent_0.Signals);
local v2 = require(l_Parent_0.Otter);
local v3 = {
    dampingRatio = 1, 
    frequency = 3, 
    restingVelocityLimit = 0.1, 
    restingPositionLimit = 0.1
};
return function(v4) --[[ Line: 38 ]] --[[ Name: createAnimatedVisibilityStore ]]
    -- upvalues: v1 (copy), v2 (copy), v3 (copy)
    local v5 = v4 or 1;
    local v6, v7 = v1.createSignal(v5);
    local v8, v9 = v1.createSignal(false);
    local v10, v11 = v1.createSignal(v5 > 0.5);
    local v12 = v2.createSingleMotor(v5);
    local l_v3_0 = v3;
    v12:onStep(function(v14) --[[ Line: 51 ]]
        -- upvalues: v7 (copy)
        v7(v14);
    end);
    v12:onComplete(function() --[[ Line: 55 ]]
        -- upvalues: v9 (copy)
        v9(false);
    end);
    local function v15() --[[ Line: 60 ]] --[[ Name: show ]]
        -- upvalues: v11 (copy), v9 (copy), v12 (copy), v2 (ref), l_v3_0 (copy)
        v11(true);
        v9(true);
        v12:setGoal(v2.spring(1, l_v3_0));
    end;
    local function v16() --[[ Line: 67 ]] --[[ Name: hide ]]
        -- upvalues: v11 (copy), v9 (copy), v12 (copy), v2 (ref), l_v3_0 (copy)
        v11(false);
        v9(true);
        v12:setGoal(v2.spring(0, l_v3_0));
    end;
    return {
        getVisibilityRatio = v6, 
        getIsVisible = v10, 
        getIsAnimating = v8, 
        show = v15, 
        hide = v16, 
        destroy = function() --[[ Line: 73 ]] --[[ Name: destroy ]]
            -- upvalues: v12 (copy)
            v12:destroy();
        end
    };
end;