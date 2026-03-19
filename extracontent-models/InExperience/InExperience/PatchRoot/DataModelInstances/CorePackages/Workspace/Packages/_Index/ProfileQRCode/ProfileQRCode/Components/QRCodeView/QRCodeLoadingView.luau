local l_Parent_0 = script:FindFirstAncestor("ProfileQRCode").Parent;
local v1 = require(l_Parent_0.React);
local v2 = require(l_Parent_0.Foundation);
local l_Radius_0 = v2.Enums.Radius;
local l_Skeleton_0 = v2.Skeleton;
return function() --[[ Line: 10 ]]
    -- upvalues: v1 (copy), l_Skeleton_0 (copy), l_Radius_0 (copy)
    return v1.createElement(l_Skeleton_0, {
        Size = UDim2.new(1, 0, 1, 0), 
        radius = l_Radius_0.None
    });
end;