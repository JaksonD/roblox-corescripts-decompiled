local l_UserInputService_0 = game:GetService("UserInputService");
local l_script_FirstAncestor_0 = script:FindFirstAncestor("CoreGuiCommon");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local l_IXPServiceWrapper_0 = require(l_Parent_0.IXPServiceWrapper).IXPServiceWrapper;
local v4 = require(l_Parent_0.Signals);
local l_createSignal_0 = v4.createSignal;
local l_createEffect_0 = v4.createEffect;
local l_LogTopBarToggled_0 = require(l_script_FirstAncestor_0.Telemetry).LogTopBarToggled;
local v8 = game:DefineFastFlag("EnableDesktopUILessMode", false);
local v9 = game:DefineFastString("AddUILessModeIxpLayer", "");
return function() --[[ Line: 25 ]]
    -- upvalues: l_createSignal_0 (copy), v8 (copy), l_UserInputService_0 (copy), l_createEffect_0 (copy), l_LogTopBarToggled_0 (copy), l_IXPServiceWrapper_0 (copy), v9 (copy)
    local v10, _ = l_createSignal_0(v8 and l_UserInputService_0.PreferredInput == Enum.PreferredInput.KeyboardAndMouse);
    local v12, v13 = l_createSignal_0(not v10(false));
    local v15 = l_createEffect_0(function(v14) --[[ Line: 31 ]]
        -- upvalues: v10 (copy), l_LogTopBarToggled_0 (ref), v12 (copy)
        if v10(false) then
            l_LogTopBarToggled_0(v12(v14));
        end;
    end);
    local function v16() --[[ Line: 37 ]] --[[ Name: cleanup ]]
        -- upvalues: v15 (copy)
        v15();
    end;
    if v10(false) then
        l_IXPServiceWrapper_0:LogFlagLinkedUserLayerExposure(v9);
    end;
    return {
        getUILessModeEnabled = v10, 
        getUIVisible = v12, 
        setUIVisible = v13, 
        cleanup = v16
    };
end;