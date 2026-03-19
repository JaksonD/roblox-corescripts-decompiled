local l_ContextActionService_0 = game:GetService("ContextActionService");
local l_RunService_0 = game:GetService("RunService");
local _ = require(script.Parent.Parent.EventType);
local v3 = {
    Name = "FirstPersonToggleEvent"
};
local v4 = false;
local v5 = nil;
local function v9(v6, v7, _) --[[ Line: 16 ]] --[[ Name: onJumpInput ]]
    -- upvalues: v4 (ref)
    if v6 == "JumpAction" and v7 == Enum.UserInputState.Begin then
        v4 = true;
    end;
    return Enum.ContextActionResult.Pass;
end;
startJumpEventListener = function() --[[ Line: 26 ]] --[[ Name: startJumpEventListener ]]
    -- upvalues: l_ContextActionService_0 (copy), v9 (copy)
    l_ContextActionService_0:BindCoreAction("JumpAction", v9, false, Enum.KeyCode.Space);
end;
stopJumpEventListener = function() --[[ Line: 30 ]] --[[ Name: stopJumpEventListener ]]
    -- upvalues: l_ContextActionService_0 (copy)
    l_ContextActionService_0:UnbindAction("JumpAction");
end;
v3.StartEvent = function(v10) --[[ Line: 34 ]] --[[ Name: StartEvent ]]
    -- upvalues: v4 (ref), v5 (ref), l_RunService_0 (copy)
    startJumpEventListener();
    local function v12(_) --[[ Line: 39 ]] --[[ Name: onRenderStepped ]]
        -- upvalues: v4 (ref), v10 (copy), v5 (ref)
        if v4 then
            stopJumpEventListener();
            v10();
            if v5 then
                v5:Disconnect();
                v5 = nil;
            end;
        end;
    end;
    v5 = l_RunService_0.RenderStepped:Connect(v12);
end;
v3.StopEvent = function() --[[ Line: 58 ]] --[[ Name: StopEvent ]]
    -- upvalues: v5 (ref)
    if v5 then
        v5:Disconnect();
        v5 = nil;
    end;
    stopJumpEventListener();
end;
return v3;