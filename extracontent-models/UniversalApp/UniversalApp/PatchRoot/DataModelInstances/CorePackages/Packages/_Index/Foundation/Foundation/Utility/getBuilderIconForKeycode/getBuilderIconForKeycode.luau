local l_Parent_0 = script:FindFirstAncestor("Foundation").Parent;
local l_getBuilderIconForKeycode_0 = require(l_Parent_0.BuilderIcons).getBuilderIconForKeycode;
return function(v2) --[[ Line: 8 ]]
    -- upvalues: l_getBuilderIconForKeycode_0 (copy)
    local l_status_0, l_result_0 = pcall(function() --[[ Line: 9 ]]
        -- upvalues: l_getBuilderIconForKeycode_0 (ref), v2 (copy)
        return l_getBuilderIconForKeycode_0(v2);
    end);
    if l_status_0 then
        return l_result_0;
    else
        return nil;
    end;
end;