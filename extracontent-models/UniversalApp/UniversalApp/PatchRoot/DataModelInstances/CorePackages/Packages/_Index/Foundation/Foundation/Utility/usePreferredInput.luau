local l_script_FirstAncestor_0 = script:FindFirstAncestor("Foundation");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local l_UserInputService_0 = require(l_script_FirstAncestor_0.Utility.Wrappers.Services).UserInputService;
return function() --[[ Line: 7 ]] --[[ Name: usePreferredInput ]]
    -- upvalues: v2 (copy), l_UserInputService_0 (copy)
    local v4, v5 = v2.useState(l_UserInputService_0.PreferredInput);
    v2.useEffect(function() --[[ Line: 10 ]]
        -- upvalues: l_UserInputService_0 (ref), v5 (copy)
        local v6 = l_UserInputService_0:GetPropertyChangedSignal("PreferredInput"):Connect(function() --[[ Line: 12 ]]
            -- upvalues: v5 (ref), l_UserInputService_0 (ref)
            v5(l_UserInputService_0.PreferredInput);
        end);
        v5(l_UserInputService_0.PreferredInput);
        return function() --[[ Line: 18 ]]
            -- upvalues: v6 (copy)
            if v6 then
                v6:Disconnect();
            end;
        end;
    end, {});
    return v4;
end;