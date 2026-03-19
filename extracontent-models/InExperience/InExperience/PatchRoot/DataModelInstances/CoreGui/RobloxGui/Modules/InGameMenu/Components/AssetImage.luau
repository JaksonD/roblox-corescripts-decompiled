local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Packages.InGameMenuDependencies);
local l_Roact_0 = v1.Roact;
local l_Cryo_0 = v1.Cryo;
local l_UIBlox_0 = v1.UIBlox;
local l_Parent_0 = script.Parent.Parent;
local l_ImageSetLabel_0 = l_UIBlox_0.Core.ImageSet.ImageSetLabel;
local l_ImageSetButton_0 = l_UIBlox_0.Core.ImageSet.ImageSetButton;
local v8 = require(l_Parent_0.Resources.Assets);
local function _(v9) --[[ Line: 20 ]] --[[ Name: makeAssetImageComponent ]]
    -- upvalues: l_Roact_0 (copy), v8 (copy), l_Cryo_0 (copy)
    return l_Roact_0.forwardRef(function(v10, v11) --[[ Line: 21 ]]
        -- upvalues: v8 (ref), l_Cryo_0 (ref), l_Roact_0 (ref), v9 (copy)
        local l_imageKey_0 = v10.imageKey;
        local v13 = v8.Images[l_imageKey_0];
        local v14 = nil;
        v14 = if typeof(v13) == "string" then {
            Image = v13
        } else v13;
        local v15 = l_Cryo_0.Dictionary.join(v10, {
            imageKey = l_Cryo_0.None
        }, v14, {
            BackgroundTransparency = 1
        });
        return l_Roact_0.createElement(v9, l_Cryo_0.Dictionary.join(v15, {
            [l_Roact_0.Ref] = v11
        }));
    end);
end;
return {
    Label = l_Roact_0.forwardRef(function(v17, v18) --[[ Line: 21 ]]
        -- upvalues: v8 (copy), l_Cryo_0 (copy), l_Roact_0 (copy), l_ImageSetLabel_0 (copy)
        local l_imageKey_1 = v17.imageKey;
        local v20 = v8.Images[l_imageKey_1];
        local v21 = nil;
        v21 = if typeof(v20) == "string" then {
            Image = v20
        } else v20;
        local v22 = l_Cryo_0.Dictionary.join(v17, {
            imageKey = l_Cryo_0.None
        }, v21, {
            BackgroundTransparency = 1
        });
        return l_Roact_0.createElement(l_ImageSetLabel_0, l_Cryo_0.Dictionary.join(v22, {
            [l_Roact_0.Ref] = v18
        }));
    end), 
    Button = l_Roact_0.forwardRef(function(v23, v24) --[[ Line: 21 ]]
        -- upvalues: v8 (copy), l_Cryo_0 (copy), l_Roact_0 (copy), l_ImageSetButton_0 (copy)
        local l_imageKey_2 = v23.imageKey;
        local v26 = v8.Images[l_imageKey_2];
        local v27 = nil;
        v27 = if typeof(v26) == "string" then {
            Image = v26
        } else v26;
        local v28 = l_Cryo_0.Dictionary.join(v23, {
            imageKey = l_Cryo_0.None
        }, v27, {
            BackgroundTransparency = 1
        });
        return l_Roact_0.createElement(l_ImageSetButton_0, l_Cryo_0.Dictionary.join(v28, {
            [l_Roact_0.Ref] = v24
        }));
    end)
};