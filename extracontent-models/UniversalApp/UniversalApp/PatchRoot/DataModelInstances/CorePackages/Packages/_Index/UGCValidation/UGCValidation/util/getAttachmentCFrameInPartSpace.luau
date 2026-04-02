local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.util.R15plusUtils);
return function(v2) --[[ Line: 12 ]]
    -- upvalues: v1 (copy)
    if not v1.checkFlagEnabledForAllowHrd() then
        return v2.CFrame;
    else
        local l_CFrame_0 = v2.CFrame;
        local l_Parent_1 = v2.Parent;
        while l_Parent_1 and l_Parent_1:IsA("Attachment") do
            l_CFrame_0 = l_Parent_1.CFrame * l_CFrame_0;
            l_Parent_1 = l_Parent_1.Parent;
        end;
        return l_CFrame_0;
    end;
end;