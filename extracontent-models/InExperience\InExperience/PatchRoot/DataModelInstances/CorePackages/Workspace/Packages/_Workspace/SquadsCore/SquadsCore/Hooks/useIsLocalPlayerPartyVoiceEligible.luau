local l_Parent_0 = script:FindFirstAncestor("SquadsCore").Parent;
local v1 = require(l_Parent_0.SharedFlags);
local l_useSelector_0 = require(l_Parent_0.RoactUtils).Hooks.RoactRodux.useSelector;
local v3 = require(script.Parent.useIsUserPartyVoiceEligible);
local l_FFlagIntroLocalUserCEVEligibleLoadState_0 = v1.FFlagIntroLocalUserCEVEligibleLoadState;
useIsLocalPlayerPartyVoiceEligible = function() --[[ Line: 12 ]] --[[ Name: useIsLocalPlayerPartyVoiceEligible ]]
    -- upvalues: l_useSelector_0 (copy), l_FFlagIntroLocalUserCEVEligibleLoadState_0 (copy), v3 (copy)
    local v6 = l_useSelector_0(function(v5) --[[ Line: 13 ]]
        if v5 and v5.LocalUserId then
            return tonumber(v5.LocalUserId) or 0;
        else
            return 0;
        end;
    end);
    local v7 = nil;
    if l_FFlagIntroLocalUserCEVEligibleLoadState_0 then
        v7 = false;
        if v6 == 0 then
            v7 = true;
        end;
    end;
    local v8 = v3(v6);
    if l_FFlagIntroLocalUserCEVEligibleLoadState_0 then
        return v8, v7;
    else
        return v8, nil;
    end;
end;
return useIsLocalPlayerPartyVoiceEligible;