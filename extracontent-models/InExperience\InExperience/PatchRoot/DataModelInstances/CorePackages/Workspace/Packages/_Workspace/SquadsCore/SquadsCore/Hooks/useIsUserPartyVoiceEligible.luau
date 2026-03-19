local l_script_FirstAncestor_0 = script:FindFirstAncestor("SquadsCore");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(script.Parent.useCurrentSquadMember);
local v3 = require(l_Parent_0.React);
local _ = require(l_Parent_0.RoduxSquads);
local v5 = require(l_script_FirstAncestor_0.Flags.GetFFlagEnablePartyVoiceOnlyForEligibleUsers);
local v6 = require(l_script_FirstAncestor_0.Flags.GetFStringPartyVoiceEligibilityAllowList);
getIsUserWhitelisted = function(v7) --[[ Line: 15 ]] --[[ Name: getIsUserWhitelisted ]]
    -- upvalues: v6 (copy)
    for v8 in v6():gmatch("%d+") do
        if tonumber(v8) == v7 then
            return true;
        end;
    end;
    return false;
end;
useIsUserPartyVoiceEligible = function(v9) --[[ Line: 24 ]] --[[ Name: useIsUserPartyVoiceEligible ]]
    -- upvalues: v2 (copy), v3 (copy)
    local v10 = v2(v9);
    local v11 = v3.useMemo(function() --[[ Line: 27 ]]
        -- upvalues: v10 (copy)
        return v10 and v10.partyVoiceEligible == true;
    end, {
        v10
    });
    local v12 = v3.useMemo(function() --[[ Line: 31 ]]
        -- upvalues: v9 (copy)
        return getIsUserWhitelisted(v9);
    end, {
        v9
    });
    return v11 or v12;
end;
if not v5() then
    return function(_) --[[ Line: 40 ]]
        return true;
    end;
else
    return useIsUserPartyVoiceEligible;
end;