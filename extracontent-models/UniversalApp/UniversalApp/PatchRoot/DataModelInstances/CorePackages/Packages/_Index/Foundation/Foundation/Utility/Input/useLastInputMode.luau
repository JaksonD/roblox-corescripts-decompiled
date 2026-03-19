local l_script_FirstAncestor_0 = script:FindFirstAncestor("Foundation");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local l_UserInputService_0 = game:GetService("UserInputService");
local v3 = require(l_Parent_0.React);
local l_useEventConnection_0 = require(l_Parent_0.ReactUtils).useEventConnection;
local _ = require(l_script_FirstAncestor_0.Utility.Input.InputMode);
local v6 = require(l_script_FirstAncestor_0.Utility.Input.getInputMode);
local function v7() --[[ Line: 16 ]] --[[ Name: getLastInputMode ]]
    -- upvalues: v6 (copy), l_UserInputService_0 (copy)
    return v6(l_UserInputService_0:GetLastInputType());
end;
return function() --[[ Line: 20 ]] --[[ Name: useLastInputMode ]]
    -- upvalues: v3 (copy), v7 (copy), l_useEventConnection_0 (copy), l_UserInputService_0 (copy)
    local v8, v9 = v3.useState(v7);
    l_useEventConnection_0(l_UserInputService_0.LastInputTypeChanged, function() --[[ Line: 23 ]]
        -- upvalues: v9 (copy), v7 (ref)
        v9(v7());
    end);
    return v8;
end;