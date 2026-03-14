local l_script_FirstAncestor_0 = script:FindFirstAncestor("SocialLibraries");
local l_UIBlox_0 = require(l_script_FirstAncestor_0.dependencies).UIBlox;
return function(v2) --[[ Line: 5 ]]
    -- upvalues: l_UIBlox_0 (copy)
    local v3 = l_UIBlox_0.App.ImageSet.Images[v2];
    return {
        Image = v3.Image, 
        ImageRectSize = v3.ImageRectSize, 
        ImageRectOffset = v3.ImageRectOffset
    };
end;