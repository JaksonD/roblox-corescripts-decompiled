local l_Parent_0 = script:FindFirstAncestor("AppChat").Parent;
local v1 = require(l_Parent_0.AppCommonLib).Signal.new();
return {
    dismissed = v1, 
    dismiss = function() --[[ Line: 14 ]] --[[ Name: dismiss ]]
        -- upvalues: v1 (copy)
        v1:fire();
    end
};