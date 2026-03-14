local l_script_FirstAncestor_0 = script:FindFirstAncestor("ReactSceneUnderstanding");
local l_UserInputService_0 = game:GetService("UserInputService");
local v2 = require(l_script_FirstAncestor_0.Parent.ReactUtils);
local v3 = require(l_script_FirstAncestor_0.Parent.React);
local v4 = require(l_script_FirstAncestor_0.enums);
local v5 = require(l_script_FirstAncestor_0.useCurrentCamera);
local l_useCallback_0 = v3.useCallback;
local l_useEffect_0 = v3.useEffect;
local l_useRef_0 = v3.useRef;
local l_useState_0 = v3.useState;
local l_useEventConnection_0 = v2.useEventConnection;
return function(v11) --[[ Line: 20 ]] --[[ Name: useCameraState ]]
    -- upvalues: v5 (copy), l_useState_0 (copy), v4 (copy), l_useRef_0 (copy), l_useCallback_0 (copy), l_useEventConnection_0 (copy), l_UserInputService_0 (copy), l_useEffect_0 (copy)
    local v12 = v5();
    local v13, v14 = l_useState_0(v4.CameraState.Idle);
    local v15 = l_useRef_0(nil);
    local v16 = v11 or v12;
    local v18 = l_useCallback_0(function() --[[ Line: 27 ]]
        -- upvalues: v14 (copy), v4 (ref), v15 (copy)
        v14(function(v17) --[[ Line: 28 ]]
            -- upvalues: v4 (ref)
            if v17 ~= v4.CameraState.Moving then
                return v4.CameraState.Moving;
            else
                return v17;
            end;
        end);
        if v15.current then
            task.cancel(v15.current);
        end;
        v15.current = task.delay(0.2, function() --[[ Line: 36 ]]
            -- upvalues: v14 (ref), v4 (ref)
            v14(v4.CameraState.Idle);
        end);
    end, {});
    l_useEventConnection_0(l_UserInputService_0.InputChanged, function(v19) --[[ Line: 41 ]]
        -- upvalues: v18 (copy)
        if v19.UserInputType == Enum.UserInputType.MouseWheel then
            v18();
        end;
    end, {
        v18
    });
    l_useEffect_0(function() --[[ Line: 47 ]]
        -- upvalues: v16 (copy), v18 (copy)
        local v20 = v16:GetPropertyChangedSignal("CFrame"):Connect(v18);
        return function() --[[ Line: 50 ]]
            -- upvalues: v20 (copy)
            v20:Disconnect();
        end;
    end, {
        v16, 
        v18
    });
    return v13;
end;