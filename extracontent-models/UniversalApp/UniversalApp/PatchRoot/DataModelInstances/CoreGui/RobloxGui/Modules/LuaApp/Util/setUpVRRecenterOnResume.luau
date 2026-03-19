local l_VRService_0 = game:GetService("VRService");
local v1 = nil;
local l_VRSessionState_0 = l_VRService_0.VRSessionState;
return function() --[[ Line: 7 ]]
    -- upvalues: v1 (ref), l_VRService_0 (copy), l_VRSessionState_0 (ref)
    if not v1 then
        v1 = l_VRService_0:GetPropertyChangedSignal("VRSessionState"):Connect(function() --[[ Line: 9 ]]
            -- upvalues: l_VRSessionState_0 (ref), l_VRService_0 (ref)
            if l_VRSessionState_0 == l_VRService_0.VRSessionState then
                return;
            else
                if l_VRSessionState_0 == Enum.VRSessionState.Undefined and l_VRService_0.VRSessionState == Enum.VRSessionState.Focused then
                    l_VRService_0:RecenterUserHeadCFrame();
                end;
                l_VRSessionState_0 = l_VRService_0.VRSessionState;
                return;
            end;
        end);
    end;
end;