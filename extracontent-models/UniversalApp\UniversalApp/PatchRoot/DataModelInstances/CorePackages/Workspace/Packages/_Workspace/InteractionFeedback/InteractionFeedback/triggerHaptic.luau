local l_Parent_0 = script:FindFirstAncestor("InteractionFeedback").Parent;
local v1 = require(l_Parent_0.Cryo);
local v2 = require(l_Parent_0.SharedFlags);
local _ = require(script.Parent.InteractionFeedbackContext);
local v4 = require(script.Parent.sendHapticAnalytics);
local l_FFlagLuaAppHapticTriggeredTelemetry_0 = v2.FFlagLuaAppHapticTriggeredTelemetry;
local l_FFlagLuaAppFixExplicitFeedbackTelemetry_0 = v2.FFlagLuaAppFixExplicitFeedbackTelemetry;
local v7 = {};
return function(v8, v9, v10, v11, v12, v13, v14) --[[ Line: 16 ]] --[[ Name: triggerHaptic ]]
    -- upvalues: v7 (copy), l_FFlagLuaAppHapticTriggeredTelemetry_0 (copy), v1 (copy), l_FFlagLuaAppFixExplicitFeedbackTelemetry_0 (copy), v4 (copy)
    if not v7[v8] then
        v7[v8] = Instance.new("HapticEffect");
        v7[v8].Parent = workspace;
        v7[v8].Type = v8;
    end;
    v7[v8].Position = v9;
    v7[v8].Radius = v10;
    v7[v8]:Play();
    if l_FFlagLuaAppHapticTriggeredTelemetry_0 and v13 then
        local v15 = v1.Dictionary.join({
            hapticType = v8.Name, 
            contextKey = v11, 
            interactionType = v12, 
            ctx = if l_FFlagLuaAppFixExplicitFeedbackTelemetry_0 then nil else v13
        }, v14 or {});
        v4(v15, if l_FFlagLuaAppFixExplicitFeedbackTelemetry_0 then v13 else nil);
    end;
end;