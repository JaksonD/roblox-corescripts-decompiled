local l_CorePackages_0 = game:GetService("CorePackages");
local l_FormFactor_0 = require(l_CorePackages_0.Workspace.Packages.FormFactor).Enums.FormFactor;
local v2 = require(script.Parent.Parent.TopBarConstants);
local v3 = {
    [l_FormFactor_0.COMPACT] = {
        IconButtonSize = 34
    }, 
    [l_FormFactor_0.WIDE] = {
        IconButtonSize = 44
    }
};
return function(v4) --[[ Line: 22 ]] --[[ Name: getIconButtonSize ]]
    -- upvalues: v3 (copy), v2 (copy)
    local v5 = v3[v4];
    return v5 and v5.IconButtonSize or v2.DEFAULT_ICON_BUTTON_SIZE;
end;