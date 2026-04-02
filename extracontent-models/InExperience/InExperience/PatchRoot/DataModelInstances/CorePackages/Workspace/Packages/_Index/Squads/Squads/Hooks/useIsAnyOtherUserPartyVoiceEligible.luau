local l_Players_0 = game:GetService("Players");
local l_script_FirstAncestor_0 = script:FindFirstAncestor("Squads");
local v2 = require(l_script_FirstAncestor_0.dependencies);
local l_React_0 = v2.React;
local l_useCurrentSquadSelector_0 = v2.Hooks.useCurrentSquadSelector;
local l_dependencyArray_0 = v2.Hooks.dependencyArray;
local l_GetFFlagEnablePartyVoiceOnlyForEligibleUsers_0 = v2.SquadsCore.Flags.GetFFlagEnablePartyVoiceOnlyForEligibleUsers;
local l_FFlagRemoveDependencyArrayAntipattern_0 = v2.SharedFlags.FFlagRemoveDependencyArrayAntipattern;
local l_GetFStringPartyVoiceEligibilityAllowList_0 = v2.SquadsCore.Flags.GetFStringPartyVoiceEligibilityAllowList;
getIsUserWhitelisted = function(v9) --[[ Line: 19 ]] --[[ Name: getIsUserWhitelisted ]]
    -- upvalues: l_GetFStringPartyVoiceEligibilityAllowList_0 (copy)
    for v10 in l_GetFStringPartyVoiceEligibilityAllowList_0():gmatch("%d+") do
        if tonumber(v10) == v9 then
            return true;
        end;
    end;
    return false;
end;
useIsAnyOtherUserPartyVoiceEligible = function() --[[ Line: 28 ]] --[[ Name: useIsAnyOtherUserPartyVoiceEligible ]]
    -- upvalues: l_Players_0 (copy), l_useCurrentSquadSelector_0 (copy), l_React_0 (copy), l_FFlagRemoveDependencyArrayAntipattern_0 (copy), l_dependencyArray_0 (copy)
    local v11 = l_Players_0.LocalPlayer and l_Players_0.LocalPlayer.UserId or 0;
    local v12 = l_useCurrentSquadSelector_0();
    local v13 = l_React_0.useMemo(function() --[[ Line: 31 ]]
        -- upvalues: v12 (copy)
        if v12 then
            return v12.members;
        else
            return {};
        end;
    end, {
        v12
    });
    return l_React_0.useMemo(function() --[[ Line: 39 ]]
        -- upvalues: v11 (copy), v13 (copy)
        if v11 ~= 0 then
            for _, v15 in ipairs(v13) do
                if v15.userId ~= v11 and (v15.partyVoiceEligible or getIsUserWhitelisted(v15.userId)) then
                    return true;
                end;
            end;
        end;
        return false;
    end, if l_FFlagRemoveDependencyArrayAntipattern_0 then {
        v11, 
        v13
    } else l_dependencyArray_0(v11, v13));
end;
if not l_GetFFlagEnablePartyVoiceOnlyForEligibleUsers_0() then
    return function() --[[ Line: 61 ]]
        return true;
    end;
else
    return useIsAnyOtherUserPartyVoiceEligible;
end;