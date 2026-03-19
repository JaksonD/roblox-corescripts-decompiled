local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Packages.React);
local l_Skeleton_0 = require(l_CorePackages_0.Packages.Foundation).Skeleton;
local l_useDesignTokens_0 = require(l_CorePackages_0.Workspace.Packages.Style).useDesignTokens;
return function() --[[ Line: 8 ]]
    -- upvalues: l_useDesignTokens_0 (copy), v1 (copy), l_Skeleton_0 (copy)
    local v4 = l_useDesignTokens_0();
    local v5 = {
        Padding = v1.createElement("UIPadding", {
            PaddingTop = UDim.new(0, v4.Global.Space_400), 
            PaddingBottom = UDim.new(0, v4.Global.Space_300)
        })
    };
    for v6 = 1, 6 do
        v5[#v5 + 1] = v1.createElement(l_Skeleton_0, {
            Size = UDim2.new(1, 0, 0, 30), 
            Position = UDim2.new(0, 0, 0, (v6 - 1) * 45)
        });
    end;
    return v1.createElement("Frame", {
        Size = UDim2.new(1, 0, 1, 0), 
        BackgroundTransparency = v4.Global.Opacity_0
    }, v5);
end;