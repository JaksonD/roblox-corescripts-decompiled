local l_Players_0 = game:GetService("Players");
local l_script_FirstAncestor_0 = script:FindFirstAncestor("Squads");
local v2 = require(l_script_FirstAncestor_0.dependencies);
local l_React_0 = v2.React;
local l_useCurrentSquadSelector_0 = v2.Hooks.useCurrentSquadSelector;
local l_dependencyArray_0 = v2.Hooks.dependencyArray;
local l_GetFFlagEnablePartyVoiceOnlyForEligibleUsers_0 = v2.SquadsCore.Flags.GetFFlagEnablePartyVoiceOnlyForEligibleUsers;
local l_GetFStringPartyVoiceEligibilityAllowList_0 = v2.SquadsCore.Flags.GetFStringPartyVoiceEligibilityAllowList;
getIsUserWhitelisted = function(v8) --[[ Line: 17 ]] --[[ Name: getIsUserWhitelisted ]]
    -- upvalues: l_GetFStringPartyVoiceEligibilityAllowList_0 (copy)
    for v9 in l_GetFStringPartyVoiceEligibilityAllowList_0():gmatch("%d+") do
        if tonumber(v9) == v8 then
            return true;
        end;
    end;
    return false;
end;
useIsAnyOtherUserPartyVoiceEligible = function() --[[ Line: 26 ]] --[[ Name: useIsAnyOtherUserPartyVoiceEligible ]]
    -- upvalues: l_Players_0 (copy), l_useCurrentSquadSelector_0 (copy), l_React_0 (copy), l_dependencyArray_0 (copy)
    local v10 = l_Players_0.LocalPlayer and l_Players_0.LocalPlayer.UserId or 0;
    local v11 = l_useCurrentSquadSelector_0();
    local v12 = l_React_0.useMemo(function() --[[ Line: 29 ]]
        -- upvalues: v11 (copy)
        if v11 then
            return v11.members;
        else
            return {};
        end;
    end, {
        v11
    });
    return l_React_0.useMemo(function() --[[ Line: 36 ]]
        -- upvalues: v10 (copy), v12 (copy)
        if v10 ~= 0 then
            for _, v14 in ipairs(v12) do
                if v14.userId ~= v10 and (v14.partyVoiceEligible or getIsUserWhitelisted(v14.userId)) then
                    return true;
                end;
            end;
        end;
        return false;
    end, l_dependencyArray_0(v10, v12));
end;
if not l_GetFFlagEnablePartyVoiceOnlyForEligibleUsers_0() then
    return function() --[[ Line: 53 ]]
        return true;
    end;
else
    return useIsAnyOtherUserPartyVoiceEligible;
end;