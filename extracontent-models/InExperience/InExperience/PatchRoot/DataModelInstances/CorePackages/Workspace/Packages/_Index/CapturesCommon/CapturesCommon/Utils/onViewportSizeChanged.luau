return function(v0) --[[ Line: 1 ]]
    local v1 = nil;
    local v2 = nil;
    local v3 = nil;
    local function _(v4) --[[ Line: 6 ]] --[[ Name: fireCallback ]]
        -- upvalues: v1 (ref), v0 (copy)
        if v4 ~= v1 then
            v1 = v4;
            v0(v4);
        end;
    end;
    local function v8() --[[ Line: 13 ]] --[[ Name: onViewportSizeChanged ]]
        -- upvalues: v1 (ref), v0 (copy)
        local l_CurrentCamera_0 = workspace.CurrentCamera;
        if l_CurrentCamera_0 then
            local l_ViewportSize_0 = l_CurrentCamera_0.ViewportSize;
            if l_ViewportSize_0 ~= v1 then
                v1 = l_ViewportSize_0;
                v0(l_ViewportSize_0);
            end;
        end;
    end;
    local function v12() --[[ Line: 20 ]] --[[ Name: onCurrentCameraChanged ]]
        -- upvalues: v3 (ref), v8 (copy), v1 (ref), v0 (copy)
        if v3 then
            v3:Disconnect();
            v3 = nil;
        end;
        local l_CurrentCamera_1 = workspace.CurrentCamera;
        if l_CurrentCamera_1 then
            v3 = l_CurrentCamera_1:GetPropertyChangedSignal("ViewportSize"):Connect(v8);
            local l_CurrentCamera_2 = workspace.CurrentCamera;
            if l_CurrentCamera_2 then
                local l_ViewportSize_1 = l_CurrentCamera_2.ViewportSize;
                if l_ViewportSize_1 ~= v1 then
                    v1 = l_ViewportSize_1;
                    v0(l_ViewportSize_1);
                end;
            end;
        end;
    end;
    v2 = workspace:GetPropertyChangedSignal("CurrentCamera"):Connect(v12);
    if v3 then
        v3:Disconnect();
        v3 = nil;
    end;
    local l_CurrentCamera_3 = workspace.CurrentCamera;
    if l_CurrentCamera_3 then
        v3 = l_CurrentCamera_3:GetPropertyChangedSignal("ViewportSize"):Connect(v8);
        local l_CurrentCamera_4 = workspace.CurrentCamera;
        if l_CurrentCamera_4 then
            local l_ViewportSize_2 = l_CurrentCamera_4.ViewportSize;
            if l_ViewportSize_2 ~= v1 then
                v1 = l_ViewportSize_2;
                v0(l_ViewportSize_2);
            end;
        end;
    end;
    return function() --[[ Line: 37 ]]
        -- upvalues: v2 (ref), v3 (ref)
        if v2 then
            v2:Disconnect();
            v2 = nil;
        end;
        if v3 then
            v3:Disconnect();
            v3 = nil;
        end;
    end;
end;