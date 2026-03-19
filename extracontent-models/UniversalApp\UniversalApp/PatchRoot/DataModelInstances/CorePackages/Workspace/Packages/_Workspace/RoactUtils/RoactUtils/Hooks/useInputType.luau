local l_UserInputService_0 = game:GetService("UserInputService");
local l_Parent_0 = script:FindFirstAncestor("RoactUtils").Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(script.Parent.useExternalEvent);
local l_getInputGroup_0 = require(l_Parent_0.InputType).getInputGroup;
return function(v5) --[[ Line: 13 ]] --[[ Name: useInputType ]]
    -- upvalues: l_UserInputService_0 (copy), l_getInputGroup_0 (copy), v2 (copy), v3 (copy)
    local v6 = v5 or l_UserInputService_0;
    local function v8() --[[ Line: 16 ]] --[[ Name: getLastInputType ]]
        -- upvalues: v6 (copy), l_getInputGroup_0 (ref)
        local l_v6_LastInputType_0 = v6:GetLastInputType();
        return l_getInputGroup_0(l_v6_LastInputType_0);
    end;
    local v9, v10 = v2.useState(v8);
    local v13 = v2.useCallback(function(v11) --[[ Line: 23 ]]
        -- upvalues: l_getInputGroup_0 (ref), v10 (copy)
        local v12 = l_getInputGroup_0(v11);
        if v12 ~= nil then
            v10(v12);
        end;
    end);
    v3(v6.LastInputTypeChanged, v13);
    v2.useEffect(function() --[[ Line: 34 ]]
        -- upvalues: v10 (copy), v8 (copy)
        v10(v8());
    end, {});
    return v9;
end;