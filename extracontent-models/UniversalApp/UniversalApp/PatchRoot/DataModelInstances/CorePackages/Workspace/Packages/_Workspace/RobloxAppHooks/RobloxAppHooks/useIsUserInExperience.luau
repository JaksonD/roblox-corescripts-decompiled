local l_Parent_0 = script:FindFirstAncestor("RobloxAppHooks").Parent;
local l_ExperienceService_0 = require(l_Parent_0.ExperienceService).ExperienceService;
local v2 = require(l_Parent_0.React);
return function(v3) --[[ Line: 10 ]] --[[ Name: useIsUserInExperience ]]
    -- upvalues: v2 (copy), l_ExperienceService_0 (copy)
    local v4, v5 = v2.useState(v3 or false);
    v2.useEffect(function() --[[ Line: 12 ]]
        -- upvalues: l_ExperienceService_0 (ref), v5 (copy)
        local v6 = {
            l_ExperienceService_0:RegisterForExperienceJoin(function() --[[ Line: 14 ]]
                -- upvalues: v5 (ref)
                v5(true);
            end), 
            l_ExperienceService_0:RegisterForExperienceLeave(function() --[[ Line: 17 ]]
                -- upvalues: v5 (ref)
                v5(false);
            end)
        };
        return function() --[[ Line: 22 ]]
            -- upvalues: v6 (copy)
            for _, v8 in v6 do
                if v8 and v8.Disconnect then
                    v8:Disconnect();
                end;
            end;
        end;
    end, {});
    return v4;
end;