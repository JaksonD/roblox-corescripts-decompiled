local l_script_FirstAncestor_0 = script:FindFirstAncestor("Modules");
local v1 = require(l_script_FirstAncestor_0.LuaApp.Thunks.NavigateBack);
return function(v2) --[[ Line: 4 ]]
    -- upvalues: v1 (copy)
    return {
        navigateBackInAppRoute = function() --[[ Line: 6 ]] --[[ Name: navigateBackInAppRoute ]]
            -- upvalues: v2 (copy), v1 (ref)
            v2(v1());
        end
    };
end;