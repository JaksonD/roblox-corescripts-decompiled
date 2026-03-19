local l_ContextActionService_0 = game:GetService("ContextActionService");
local l_RunService_0 = game:GetService("RunService");
local _ = require(script.Parent.Parent.EventType);
local v3 = {
    Name = "FirstPersonToggleEvent"
};
local v4 = false;
local v5 = nil;
local function v9(v6, v7, _) --[[ Line: 16 ]] --[[ Name: onFirstPersonToggleInput ]]
    -- upvalues: v4 (ref)
    if v6 == "FirstPersonToggleAction" and v7 == Enum.UserInputState.Begin then
        v4 = true;
    end;
    return Enum.ContextActionResult.Pass;
end;
startFirstPersonToggleListener = function() --[[ Line: 26 ]] --[[ Name: startFirstPersonToggleListener ]]
    -- upvalues: l_ContextActionService_0 (copy), v9 (copy)
    l_ContextActionService_0:BindCoreAction("FirstPersonToggleAction", v9, false, Enum.KeyCode.ButtonR3);
end;
stopFirstPersonToggleListener = function() --[[ Line: 35 ]] --[[ Name: stopFirstPersonToggleListener ]]
    -- upvalues: l_ContextActionService_0 (copy)
    l_ContextActionService_0:UnbindAction("FirstPersonToggleAction");
end;
v3.StartEvent = function(v10) --[[ Line: 39 ]] --[[ Name: StartEvent ]]
    -- upvalues: v4 (ref), v5 (ref), l_RunService_0 (copy)
    startFirstPersonToggleListener();
    local function v12(_) --[[ Line: 44 ]] --[[ Name: onRenderStepped ]]
        -- upvalues: v4 (ref), v10 (copy), v5 (ref)
        if v4 then
            stopFirstPersonToggleListener();
            task.wait(0.2);
            v10();
            if v5 then
                v5:Disconnect();
                v5 = nil;
            end;
        end;
    end;
    v5 = l_RunService_0.RenderStepped:Connect(v12);
end;
v3.StopEvent = function() --[[ Line: 64 ]] --[[ Name: StopEvent ]]
    -- upvalues: v5 (ref)
    if v5 then
        v5:Disconnect();
    end;
    stopFirstPersonToggleListener();
end;
return v3;