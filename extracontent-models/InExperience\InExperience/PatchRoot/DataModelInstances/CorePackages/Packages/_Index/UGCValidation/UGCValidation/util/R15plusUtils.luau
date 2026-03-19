local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.Constants);
local v2 = {};
local v3 = nil;
v2.getJointNameWhitelist = function() --[[ Line: 7 ]] --[[ Name: getJointNameWhitelist ]]
    -- upvalues: v3 (ref), v1 (copy)
    if v3 ~= nil then
        return v3;
    else
        v3 = {};
        for v4, _ in v1.R15_STANDARD_JOINT_NAMES do
            v3[v4] = true;
        end;
        for _, v7 in Instance.new("HumanoidRigDescription"):GetJointLabels() do
            v3[v7.Name] = true;
        end;
        for _, v9 in Instance.new("DigitsRigDescription"):GetJointLabels() do
            v3[("LeftHand%*"):format(v9.Name)] = true;
            v3[("RightHand%*"):format(v9.Name)] = true;
        end;
        return v3;
    end;
end;
return v2;