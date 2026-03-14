local l_script_FirstAncestor_0 = script:FindFirstAncestor("CoreScriptsRoactCommon");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_script_FirstAncestor_0.Traversal.TeleportBack);
local v3 = require(l_Parent_0.React);
return function(v4) --[[ Line: 7 ]] --[[ Name: useTeleportBack ]]
    -- upvalues: v3 (copy), v2 (copy)
    return v3.useCallback(function() --[[ Line: 8 ]]
        -- upvalues: v2 (ref), v4 (copy)
        v2(v4);
    end, {});
end;