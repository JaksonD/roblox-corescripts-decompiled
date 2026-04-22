local l_script_FirstAncestor_0 = script:FindFirstAncestor("InExperienceSideSheet");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.Foundation);
local v3 = require(l_Parent_0.React);
local l_Image_0 = v2.Image;
local l_Skeleton_0 = v2.Skeleton;
local l_Text_0 = v2.Text;
local l_View_0 = v2.View;
local l_Radius_0 = v2.Enums.Radius;
local l_useTokens_0 = v2.Hooks.useTokens;
local v10 = require(l_script_FirstAncestor_0.Components.UnibarList);
local v11 = require(l_script_FirstAncestor_0.Hooks.useExperienceIcon);
local v12 = require(l_script_FirstAncestor_0.Hooks.useExperienceName);
return v3.memo(function(v13) --[[ Line: 23 ]] --[[ Name: ExperienceDetailsRow ]]
    -- upvalues: l_useTokens_0 (copy), v12 (copy), v11 (copy), v3 (copy), l_View_0 (copy), l_Image_0 (copy), l_Skeleton_0 (copy), l_Radius_0 (copy), l_Text_0 (copy), v10 (copy)
    local v14 = l_useTokens_0();
    local v15 = v12();
    local v16 = v11();
    return v3.createElement(l_View_0, {
        tag = "row align-y-center gap-small size-full-1400 padding-right-xlarge", 
        LayoutOrder = v13.layoutOrder
    }, {
        ExperienceIconContainer = v3.createElement(l_View_0, {
            tag = "size-600", 
            LayoutOrder = 1
        }, {
            ExperienceIcon = v16 and v3.createElement(l_Image_0, {
                Image = v16, 
                tag = "size-full radius-small"
            }), 
            ExperienceIconSkeleton = not v16 and v3.createElement(l_Skeleton_0, {
                Size = UDim2.fromScale(1, 1), 
                radius = l_Radius_0.Small
            })
        }), 
        ExperienceNameContainer = v3.createElement(l_View_0, {
            tag = "fill auto-y", 
            LayoutOrder = 2
        }, {
            ExperienceName = v15 and v3.createElement(l_Text_0, {
                Text = v15, 
                tag = "size-full-0 auto-y text-title-large text-align-x-left text-truncate-split content-emphasis"
            }), 
            ExperienceNameSkeleton = not v15 and v3.createElement(l_Skeleton_0, {
                Size = UDim2.new(1, 0, 0, v14.Size.Size_500), 
                radius = l_Radius_0.Small
            })
        }), 
        UnibarList = v3.createElement(v10, {
            layoutOrder = 3
        })
    });
end);