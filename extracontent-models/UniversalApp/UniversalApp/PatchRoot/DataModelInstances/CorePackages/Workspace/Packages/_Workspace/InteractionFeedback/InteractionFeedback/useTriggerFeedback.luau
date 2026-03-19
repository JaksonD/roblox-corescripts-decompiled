local l_Parent_0 = script:FindFirstAncestor("InteractionFeedback").Parent;
local v1 = require(l_Parent_0.SharedFlags);
local v2 = require(script.Parent.triggerFeedback);
local v3 = require(script.Parent.InteractionFeedbackContext);
local v4 = require(l_Parent_0.RoactUtils);
local l_useInputType_0 = v4.Hooks.useInputType;
local l_useLaserPointerHand_0 = v4.Hooks.useLaserPointerHand;
local v7 = require(l_Parent_0.React);
local l_isSpatial_0 = require(l_Parent_0.AppCommonLib).isSpatial;
local l_FFlagLuaAppHapticTriggeredTelemetry_0 = v1.FFlagLuaAppHapticTriggeredTelemetry;
local function v12() --[[ Line: 18 ]] --[[ Name: useHapticPositionAndRadius ]]
    -- upvalues: l_useInputType_0 (copy), l_useLaserPointerHand_0 (copy), v7 (copy), l_isSpatial_0 (copy)
    local v10 = l_useInputType_0();
    local v11 = l_useLaserPointerHand_0();
    return (v7.useMemo(function() --[[ Line: 21 ]]
        -- upvalues: l_isSpatial_0 (ref), v11 (copy)
        if l_isSpatial_0() then
            if v11 == "Right" then
                return {
                    Vector3.new(1, 0, 0, 0), 
                    0.1
                };
            else
                return {
                    Vector3.new(-1, 0, 0, 0), 
                    0.1
                };
            end;
        else
            return {
                Vector3.new(0, 0, 0, 0), 
                100
            };
        end;
    end, {
        v10, 
        v11
    }));
end;
return function() --[[ Line: 38 ]] --[[ Name: useTriggerFeedback ]]
    -- upvalues: v7 (copy), v3 (copy), v12 (copy), v2 (copy), l_FFlagLuaAppHapticTriggeredTelemetry_0 (copy)
    local v13 = v7.useContext(v3);
    local v14 = nil;
    local v15 = nil;
    local v16 = v12();
    v14 = v16[1];
    v15 = v16[2];
    if not v13 then
        error("useTriggerFeedback must be used within an InteractionFeedbackProvider");
    end;
    return (v7.useCallback(function(v17, v18, v19, v20) --[[ Line: 52 ]]
        -- upvalues: v2 (ref), v13 (copy), v14 (ref), v15 (ref), l_FFlagLuaAppHapticTriggeredTelemetry_0 (ref)
        return v2(v17, v18, v13, v14, v15, if l_FFlagLuaAppHapticTriggeredTelemetry_0 then v19 else nil, if l_FFlagLuaAppHapticTriggeredTelemetry_0 then v20 else nil);
    end, {
        v13, 
        v14, 
        v15
    }));
end;