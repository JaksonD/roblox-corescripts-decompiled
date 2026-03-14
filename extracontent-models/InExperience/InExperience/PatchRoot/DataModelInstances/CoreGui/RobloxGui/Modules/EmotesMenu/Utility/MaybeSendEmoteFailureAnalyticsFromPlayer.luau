local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.Constants);
return function(v2, v3) --[[ Line: 16 ]] --[[ Name: MaybeSendEmoteFailureAnalyticsFromPlayer ]]
    -- upvalues: v1 (copy)
    local l_Character_0 = v2.Character;
    if not l_Character_0 then
        v3(v1.ErrorTypes.TemporarilyUnavailable);
        return true;
    else
        local v5 = l_Character_0 and l_Character_0:FindFirstChildOfClass("Humanoid") or nil;
        if not v5 then
            v3(v1.ErrorTypes.TemporarilyUnavailable);
            return true;
        elseif v5 and v5.RigType ~= Enum.HumanoidRigType.R15 then
            v3(v1.ErrorTypes.SwitchToR15);
            return true;
        else
            local v6 = l_Character_0 and l_Character_0:FindFirstChild("Animate") or nil;
            local v7 = v5 and v5:FindFirstChildOfClass("HumanoidDescription") or nil;
            if not v6 or not v7 then
                v3(v1.ErrorTypes.NotSupported);
                return true;
            else
                local v8 = v6 and v6:FindFirstChild("PlayEmote") or nil;
                if not v8 or not v8:IsA("BindableFunction") then
                    v3(v1.ErrorTypes.NotSupported);
                    return true;
                else
                    return false;
                end;
            end;
        end;
    end;
end;