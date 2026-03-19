local l_script_FirstAncestor_0 = script:FindFirstAncestor("SocialUpsell");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_script_FirstAncestor_0.Signals.GetAgeVerifiedChangedSignal);
return function(v4) --[[ Line: 8 ]]
    -- upvalues: v2 (copy), v3 (copy)
    v2.useEffect(function() --[[ Line: 9 ]]
        -- upvalues: v3 (ref), v4 (copy)
        local v5 = v3();
        if v4 then
            v5:connect(v4);
        end;
        return function() --[[ Line: 15 ]]

        end;
    end, {
        v4
    });
    return nil;
end;