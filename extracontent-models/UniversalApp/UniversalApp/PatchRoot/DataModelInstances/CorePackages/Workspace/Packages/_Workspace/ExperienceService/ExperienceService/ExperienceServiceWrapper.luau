local l_ExperienceService_0 = game:GetService("ExperienceService");
local v1 = game:DefineFastFlag("ReturnExperienceServiceConnections", false);
return {
    LaunchExperience = function(_, v3, v4, v5) --[[ Line: 4 ]] --[[ Name: LaunchExperience ]]
        -- upvalues: l_ExperienceService_0 (copy)
        if v4 ~= nil then
            if v5 ~= nil then
                l_ExperienceService_0:LaunchExperienceFromSourceWithCallback(v3, v4, v5);
                return;
            else
                l_ExperienceService_0:LaunchExperienceFromSource(v3, v4);
                return;
            end;
        elseif v5 ~= nil then
            l_ExperienceService_0:LaunchExperienceFromSourceWithCallback(v3, "", v5);
            return;
        else
            l_ExperienceService_0:LaunchExperience(v3);
            return;
        end;
    end, 
    RegisterForExperienceJoin = function(_, v7) --[[ Line: 19 ]] --[[ Name: RegisterForExperienceJoin ]]
        -- upvalues: l_ExperienceService_0 (copy), v1 (copy)
        local v8 = l_ExperienceService_0:RegisterForExperienceJoin(v7);
        if v1 then
            return v8;
        else
            return nil;
        end;
    end, 
    RegisterForExperienceLeave = function(_, v10) --[[ Line: 26 ]] --[[ Name: RegisterForExperienceLeave ]]
        -- upvalues: l_ExperienceService_0 (copy), v1 (copy)
        local v11 = l_ExperienceService_0:RegisterForExperienceLeave(v10);
        if v1 then
            return v11;
        else
            return nil;
        end;
    end, 
    GetPendingJoinAttempt = function(_) --[[ Line: 34 ]] --[[ Name: GetPendingJoinAttempt ]]
        -- upvalues: l_ExperienceService_0 (copy)
        return l_ExperienceService_0:GetPendingJoinAttempt();
    end, 
    OnNewJoinAttempt = function(_) --[[ Line: 38 ]] --[[ Name: OnNewJoinAttempt ]]
        -- upvalues: l_ExperienceService_0 (copy)
        return l_ExperienceService_0.OnNewJoinAttempt;
    end
};