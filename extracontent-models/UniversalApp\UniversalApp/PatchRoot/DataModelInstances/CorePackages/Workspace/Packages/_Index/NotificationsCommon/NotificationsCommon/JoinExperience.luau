local l_Parent_0 = script.Parent.Parent;
local l_default_0 = require(l_Parent_0.LinkingProtocol).LinkingProtocol.default;
local l_isSubjectToDesktopPolicies_0 = require(l_Parent_0.SharedFlags).isSubjectToDesktopPolicies;
return function(v3, v4) --[[ Line: 10 ]]
    -- upvalues: l_isSubjectToDesktopPolicies_0 (copy), l_default_0 (copy)
    return pcall(function() --[[ Line: 11 ]]
        -- upvalues: v4 (copy), l_isSubjectToDesktopPolicies_0 (ref), l_default_0 (ref), v3 (copy)
        if v4 and not l_isSubjectToDesktopPolicies_0() then
            game:Shutdown();
        end;
        l_default_0:isURLRegistered(v3):andThen(function(v5) --[[ Line: 15 ]]
            -- upvalues: l_default_0 (ref), v3 (ref), v4 (ref)
            if v5 then
                l_default_0:detectURL(v3);
                return;
            else
                if v4 then
                    game:Shutdown();
                    l_default_0:detectURL(v3);
                end;
                return;
            end;
        end);
    end);
end;