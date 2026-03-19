local l_Parent_0 = script.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local l_ContextActionService_0 = game:GetService("ContextActionService");
local l_UserInputService_0 = game:GetService("UserInputService");
local v4 = require(l_Parent_1.React);
local v5 = require(l_Parent_1.RoactUtils);
local v6 = require(l_Parent_1.SocialStopwatch);
local v7 = require(l_Parent_0.Constants);
local v8 = require(l_Parent_0.Analytics.EventNames);
local v9 = require(l_Parent_0.Utils.getCaptureShortcutSetupKeys);
local v10 = require(l_Parent_0.Thunks.TakeCapture);
local v11 = require(l_Parent_0.Analytics.useAnalytics);
local l_useDispatch_0 = v5.Hooks.RoactRodux.useDispatch;
local l_useEffect_0 = v4.useEffect;
local v14 = require(l_Parent_0.Hooks.useKeyboardEnabled);
local v15 = require(l_Parent_0.Hooks.usePlayShutterSound);
local l_useSelector_0 = v5.Hooks.RoactRodux.useSelector;
local _ = function() --[[ Line: 25 ]]
    -- upvalues: v9 (copy), l_UserInputService_0 (copy)
    for _, v18 in (v9()) do
        if l_UserInputService_0:IsKeyDown(v18) then
            return true;
        end;
    end;
    return false;
end;
return function() --[[ Line: 35 ]]
    -- upvalues: v11 (copy), l_useDispatch_0 (copy), l_useSelector_0 (copy), v7 (copy), v15 (copy), v14 (copy), l_useEffect_0 (copy), v6 (copy), v8 (copy), v10 (copy), l_ContextActionService_0 (copy), v9 (copy), l_UserInputService_0 (copy)
    local v20 = v11();
    local v21 = l_useDispatch_0();
    local v23 = l_useSelector_0(function(v22) --[[ Line: 39 ]]
        -- upvalues: v7 (ref)
        return v22[v7.RoduxKey].IsActive;
    end);
    local v25 = l_useSelector_0(function(v24) --[[ Line: 43 ]]
        -- upvalues: v7 (ref)
        return v24[v7.RoduxKey].IsCapturesCoreGuiEnabled;
    end);
    local v26 = v15();
    local v27 = v14();
    l_useEffect_0(function() --[[ Line: 50 ]]
        -- upvalues: v27 (copy), v25 (copy), v26 (copy), v6 (ref), v20 (copy), v8 (ref), v21 (copy), v10 (ref), l_ContextActionService_0 (ref), v9 (ref), l_UserInputService_0 (ref)
        if not v27 then
            return;
        elseif not v25 then
            return;
        else
            local function v28() --[[ Line: 59 ]]
                -- upvalues: v26 (ref), v6 (ref), v20 (ref), v8 (ref), v21 (ref), v10 (ref)
                v26();
                if not v6.Stopwatch.get(v6.Events.CaptureTaken) then
                    v6.Stopwatch.start(v6.Events.CaptureTaken);
                end;
                v20.fireEvent(v8.CapturesEntrypointActivated);
                v20.fireEvent(v8.CapturesDesktopHotkeyCaptureTriggered);
                v21(v10());
            end;
            l_ContextActionService_0:BindCoreAction("CaptureShortcutAction", function(_, v30) --[[ Line: 70 ]]
                -- upvalues: v9 (ref), l_UserInputService_0 (ref), v28 (copy)
                local v31 = false;
                if v30 == Enum.UserInputState.Begin then
                    local v32;
                    for _, v34 in (v9()) do
                        if l_UserInputService_0:IsKeyDown(v34) then
                            v32 = true;
                            v31 = true;
                        end;
                        if v31 then
                            break;
                        end;
                    end;
                    if not v31 then
                        v32 = false;
                    end;
                    v31 = false;
                    if v32 then
                        v28();
                        return Enum.ContextActionResult.Sink;
                    end;
                end;
                return Enum.ContextActionResult.Pass;
            end, false, Enum.KeyCode.One);
            return function() --[[ Line: 79 ]]
                -- upvalues: l_ContextActionService_0 (ref)
                l_ContextActionService_0:UnbindCoreAction("CaptureShortcutAction");
            end;
        end;
    end, {
        v23, 
        v25, 
        v27
    });
end;