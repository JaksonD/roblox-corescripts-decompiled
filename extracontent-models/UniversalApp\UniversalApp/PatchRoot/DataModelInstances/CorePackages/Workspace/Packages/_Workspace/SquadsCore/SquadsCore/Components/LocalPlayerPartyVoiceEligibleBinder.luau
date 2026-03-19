local l_Parent_0 = script:FindFirstAncestor("SquadsCore").Parent;
local v1 = require(l_Parent_0.React);
local v2 = require(l_Parent_0.CrossExperienceVoice);
local v3 = require(script.Parent.Parent.Hooks.useIsLocalPlayerPartyVoiceEligible);
local l_useIsBackgroundDMActive_0 = v2.Hooks.useIsBackgroundDMActive;
return function(v5) --[[ Line: 14 ]]
    -- upvalues: v3 (copy), l_useIsBackgroundDMActive_0 (copy), v1 (copy)
    local v6 = v3();
    local v7 = l_useIsBackgroundDMActive_0();
    v1.useEffect(function() --[[ Line: 18 ]]
        -- upvalues: v5 (copy), v6 (copy), v7 (copy)
        v5.onChange(v6 and v7);
    end, {
        v6, 
        v7
    });
    return nil;
end;