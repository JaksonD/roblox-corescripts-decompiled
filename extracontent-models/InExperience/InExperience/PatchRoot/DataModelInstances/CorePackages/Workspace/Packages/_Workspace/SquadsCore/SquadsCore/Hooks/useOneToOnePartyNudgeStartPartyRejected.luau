local l_script_FirstAncestor_0 = script:FindFirstAncestor("SquadsCore");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local l_Players_0 = game:GetService("Players");
local v3 = require(l_script_FirstAncestor_0.Common.Constants);
local v4 = require(l_Parent_0.RealtimeDelivery);
local l_dependencyArray_0 = require(l_Parent_0.RoactUtils).Hooks.dependencyArray;
local v6 = require(l_Parent_0.SharedFlags);
local l_FFlagEnablePartyNudgeAfterJoin_0 = v6.FFlagEnablePartyNudgeAfterJoin;
local l_FFlagRemoveDependencyArrayAntipattern_0 = v6.FFlagRemoveDependencyArrayAntipattern;
return function(v9) --[[ Line: 16 ]] --[[ Name: useOneToOnePartyNudgeStartPartyRejected ]]
    -- upvalues: l_FFlagEnablePartyNudgeAfterJoin_0 (copy), v4 (copy), v3 (copy), l_Players_0 (copy), l_FFlagRemoveDependencyArrayAntipattern_0 (copy), l_dependencyArray_0 (copy)
    if l_FFlagEnablePartyNudgeAfterJoin_0 then
        v4.useRealtimeNamespace(v3.PARTY_NUDGE_RTN_NAMESPACE, function(v10) --[[ Line: 20 ]]
            -- upvalues: l_Players_0 (ref), v3 (ref), v9 (copy)
            if l_Players_0.LocalPlayer and v10.nudgeType == v3.ONE_TO_ONE_NUDGE_IN_EXPERIENCE_TYPE and v10.inviteeId == l_Players_0.LocalPlayer.UserId and v10.status == v3.START_PARTY_REJECTED_STATUS then
                v9(v10);
            end;
        end, if l_FFlagRemoveDependencyArrayAntipattern_0 then {
            v9
        } else l_dependencyArray_0(v9));
    end;
end;