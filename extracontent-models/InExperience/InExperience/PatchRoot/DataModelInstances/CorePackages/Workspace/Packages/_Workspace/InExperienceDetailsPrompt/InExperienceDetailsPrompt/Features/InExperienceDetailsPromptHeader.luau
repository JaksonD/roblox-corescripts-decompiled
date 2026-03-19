local l_script_FirstAncestor_0 = script:FindFirstAncestor("InExperienceDetailsPrompt");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local _ = require(l_Parent_0.DataHydration);
local v4 = require(l_Parent_0.Foundation);
local l_Image_0 = v4.Image;
local l_Radius_0 = v4.Enums.Radius;
local l_Sheet_0 = v4.Sheet;
local l_Skeleton_0 = v4.Skeleton;
local l_Text_0 = v4.Text;
local l_View_0 = v4.View;
local l_useTokens_0 = v4.Hooks.useTokens;
local l_useScaledValue_0 = v4.Hooks.useScaledValue;
local v13 = require(l_script_FirstAncestor_0.Features.InExperienceDetailsPromptSubtitle);
local v14 = require(l_script_FirstAncestor_0.Hooks.useImageLoadingState);
return function(v15) --[[ Line: 30 ]] --[[ Name: InExperienceDetailsPromptHeader ]]
    -- upvalues: l_useTokens_0 (copy), l_useScaledValue_0 (copy), v14 (copy), v2 (copy), l_Sheet_0 (copy), l_View_0 (copy), l_Image_0 (copy), l_Skeleton_0 (copy), l_Radius_0 (copy), l_Text_0 (copy), v13 (copy)
    local v16 = l_useTokens_0();
    local v17 = l_useScaledValue_0(200);
    local v18 = l_useScaledValue_0(150);
    local v19 = v14(v15.imageUri);
    return v2.createElement(l_Sheet_0.Header, nil, {
        Content = v2.createElement(l_View_0, {
            LayoutOrder = 1, 
            tag = "row gap-small size-full-0 auto-y items-center padding-top-medium"
        }, {
            GameIcon = if v19 then v2.createElement(l_Image_0, {
                LayoutOrder = 1, 
                Image = v15.imageUri, 
                Size = UDim2.fromOffset(v16.Size.Size_1200, v16.Size.Size_1200), 
                cornerRadius = UDim.new(0, v16.Radius.Medium)
            }) else v2.createElement(l_Skeleton_0, {
                LayoutOrder = 1, 
                Size = UDim2.fromOffset(v16.Size.Size_1200, v16.Size.Size_1200), 
                radius = l_Radius_0.Medium
            }), 
            TextContainer = v2.createElement(l_View_0, {
                LayoutOrder = 2, 
                tag = "col gap-xxsmall fill auto-xy"
            }, {
                Title = if v15.name then v2.createElement(l_Text_0, {
                    LayoutOrder = 1, 
                    Text = v15.name, 
                    tag = "text-heading-small content-emphasis auto-xy text-truncate-end"
                }) else v2.createElement(l_Skeleton_0, {
                    LayoutOrder = 1, 
                    Size = UDim2.fromOffset(v17, v16.Size.Size_600)
                }), 
                Subtitle = if v15.creator then v2.createElement(v13, {
                    creator = v15.creator, 
                    layoutOrder = 2
                }) else v2.createElement(l_Skeleton_0, {
                    LayoutOrder = 2, 
                    Size = UDim2.fromOffset(v18, v16.Size.Size_500)
                })
            })
        })
    });
end;