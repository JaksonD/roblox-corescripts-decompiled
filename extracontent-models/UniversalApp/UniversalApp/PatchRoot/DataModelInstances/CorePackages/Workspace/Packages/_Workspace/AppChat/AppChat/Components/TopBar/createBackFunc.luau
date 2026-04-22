local l_script_FirstAncestor_0 = script:FindFirstAncestor("AppChat");
local v1 = require(l_script_FirstAncestor_0.EnumScreens);
return function(v2) --[[ Line: 12 ]] --[[ Name: createBackFunc ]]
    -- upvalues: v1 (copy)
    local l_navigateToRootStack_0 = v2.navigateToRootStack;
    if l_navigateToRootStack_0 then
        return function() --[[ Line: 16 ]]
            -- upvalues: v2 (copy), v1 (ref), l_navigateToRootStack_0 (copy)
            if v2.closeInputBar then
                v2.closeInputBar();
            end;
            if v2.isRoot then
                v2.navigation.navigate(v1.EmptyConversation);
                l_navigateToRootStack_0();
                return;
            else
                v2.navigation.pop();
                return;
            end;
        end;
    else
        return v2.navigation.pop;
    end;
end;