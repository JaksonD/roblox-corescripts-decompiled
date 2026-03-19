local l_script_FirstAncestor_0 = script:FindFirstAncestor("SquadsCore");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local l_Players_0 = game:GetService("Players");
local v3 = require(l_script_FirstAncestor_0.Common.Constants);
local v4 = require(l_Parent_0.RealtimeDelivery);
local l_dependencyArray_0 = require(l_Parent_0.RoactUtils).Hooks.dependencyArray;
local l_FFlagEnablePartyNudgeAfterJoin_0 = require(l_Parent_0.SharedFlags).FFlagEnablePartyNudgeAfterJoin;
return function(v7) --[[ Line: 14 ]] --[[ Name: useOneToOnePartyNudgeStartPartyRejected ]]
    -- upvalues: l_FFlagEnablePartyNudgeAfterJoin_0 (copy), v4 (copy), v3 (copy), l_Players_0 (copy), l_dependencyArray_0 (copy)
    if l_FFlagEnablePartyNudgeAfterJoin_0 then
        v4.useRealtimeNamespace(v3.PARTY_NUDGE_RTN_NAMESPACE, function(v8) --[[ Line: 16 ]]
            -- upvalues: l_Players_0 (ref), v3 (ref), v7 (copy)
            if l_Players_0.LocalPlayer and v8.nudgeType == v3.ONE_TO_ONE_NUDGE_IN_EXPERIENCE_TYPE and v8.inviteeId == l_Players_0.LocalPlayer.UserId and v8.status == v3.START_PARTY_REJECTED_STATUS then
                v7(v8);
            end;
        end, l_dependencyArray_0(v7));
    end;
end;