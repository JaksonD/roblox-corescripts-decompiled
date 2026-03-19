local v0 = require(script.Parent.Parent.Parent.Actions.CompleteExternalNavigationIntoChat);
return function(v1) --[[ Line: 3 ]]
    -- upvalues: v0 (copy)
    return {
        completeExternalNavigation = function(v2) --[[ Line: 5 ]] --[[ Name: completeExternalNavigation ]]
            -- upvalues: v1 (copy), v0 (ref)
            v1(v0(v2));
        end
    };
end;