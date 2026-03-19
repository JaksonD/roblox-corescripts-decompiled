local l_script_FirstAncestor_0 = script:FindFirstAncestor("ReactSceneUnderstanding");
local v1 = require(l_script_FirstAncestor_0.Parent.React);
local l_useState_0 = v1.useState;
local l_useCallback_0 = v1.useCallback;
local l_useEffect_0 = v1.useEffect;
local l_Camera_0 = Instance.new("Camera");
return function() --[[ Line: 11 ]] --[[ Name: useCurrentCamera ]]
    -- upvalues: l_useState_0 (copy), l_useCallback_0 (copy), l_useEffect_0 (copy), l_Camera_0 (copy)
    local v6, v7 = l_useState_0(nil);
    local v9 = l_useCallback_0(function() --[[ Line: 14 ]]
        -- upvalues: v6 (copy), v7 (copy)
        local l_CurrentCamera_0 = workspace.CurrentCamera;
        if l_CurrentCamera_0 and l_CurrentCamera_0 ~= v6 then
            v7(l_CurrentCamera_0);
        end;
    end, {
        v6
    });
    l_useEffect_0(function() --[[ Line: 21 ]]
        -- upvalues: v9 (copy)
        local v10 = workspace:GetPropertyChangedSignal("CurrentCamera"):Connect(v9);
        return function() --[[ Line: 24 ]]
            -- upvalues: v10 (copy)
            v10:Disconnect();
        end;
    end, {
        v9
    });
    l_useEffect_0(v9, {});
    if v6 then
        return v6;
    else
        return l_Camera_0;
    end;
end;