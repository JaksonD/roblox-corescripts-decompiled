local l_script_FirstAncestor_0 = script:FindFirstAncestor("SquadsCore");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_script_FirstAncestor_0.Components.SquadExternalContractProvider.SquadExternalContractContext);
local v3 = require(l_script_FirstAncestor_0.Hooks.useCurrentSquadParentChannelId);
local v4 = require(l_Parent_0.React);
local v5 = require(l_script_FirstAncestor_0.Flags.GetFFlagEnablePartyVoiceOnlyForUnfilteredThreads);
useIsCurrentSquadPartyVoiceEligible = function() --[[ Line: 13 ]] --[[ Name: useIsCurrentSquadPartyVoiceEligible ]]
    -- upvalues: v4 (copy), v2 (copy), v3 (copy)
    local v6 = v4.useContext(v2);
    local v7 = v3() or "";
    return v6.useParentChannelIsPartyVoiceEligible(v7);
end;
if not v5() then
    return function() --[[ Line: 22 ]]
        return true;
    end;
else
    return useIsCurrentSquadPartyVoiceEligible;
end;