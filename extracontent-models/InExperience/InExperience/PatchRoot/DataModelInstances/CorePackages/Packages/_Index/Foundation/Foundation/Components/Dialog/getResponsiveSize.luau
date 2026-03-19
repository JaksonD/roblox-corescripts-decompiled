local l_script_FirstAncestor_0 = script:FindFirstAncestor("Foundation");
local v1 = require(l_script_FirstAncestor_0.Enums.DialogSize);
local _ = require(l_script_FirstAncestor_0.Providers.Style.Tokens);
local l_DIALOG_SIZES_0 = require(script.Parent.useDialogVariants).DIALOG_SIZES;
return function(v4, v5, v6) --[[ Line: 11 ]] --[[ Name: getResponsiveSize ]]
    -- upvalues: v1 (copy), l_DIALOG_SIZES_0 (copy)
    local v7 = ({
        [v1.Small] = v6.Padding.Large, 
        [v1.Medium] = v6.Padding.XLarge, 
        [v1.Large] = v6.Padding.XLarge
    })[v5] * 2;
    local l_Scale_0 = v6.Config.UI.Scale;
    if v4 <= l_DIALOG_SIZES_0[v1.Medium] * l_Scale_0 + v7 and v5 ~= v1.Small then
        return v1.Small;
    elseif v4 <= l_DIALOG_SIZES_0[v1.Large] * l_Scale_0 + v7 and v5 == v1.Large then
        return v1.Medium;
    else
        return v5;
    end;
end;