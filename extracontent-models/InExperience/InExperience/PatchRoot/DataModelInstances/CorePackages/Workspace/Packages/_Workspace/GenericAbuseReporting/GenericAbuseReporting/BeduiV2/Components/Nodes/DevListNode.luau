local l_script_FirstAncestor_0 = script:FindFirstAncestor("GenericAbuseReporting");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.Dash);
local v3 = require(l_Parent_0.Foundation);
local v4 = require(l_Parent_0.React);
local l_Button_0 = v3.Button;
local l_ButtonVariant_0 = v3.Enums.ButtonVariant;
local l_Radius_0 = v3.Enums.Radius;
local l_Skeleton_0 = v3.Skeleton;
local l_useTokens_0 = v3.Hooks.useTokens;
local l_View_0 = v3.View;
local v11 = require(l_script_FirstAncestor_0.BeduiV2.Components.Eyebrow);
local v12 = require(l_script_FirstAncestor_0.BeduiV2.Components.LayoutSlots);
local v13 = require(l_script_FirstAncestor_0.BeduiV2.Components.Nodes.ListNode);
local v14 = require(l_script_FirstAncestor_0.BeduiV2.Utils.Translate.TextWithTranslation);
local _ = require(l_script_FirstAncestor_0.BeduiV2.Utils.Translate.translate);
local l_useArTranslation_0 = require(l_script_FirstAncestor_0.BeduiV2.Utils.Translate.arTranslation).useArTranslation;
local l_useListLoader_0 = require(l_script_FirstAncestor_0.BeduiV2.Loaders.useLoader).useListLoader;
return v4.memo(function(v18) --[[ Line: 49 ]] --[[ Name: DevListNode ]]
    -- upvalues: l_useTokens_0 (copy), l_useArTranslation_0 (copy), v12 (copy), l_useListLoader_0 (copy), v4 (copy), v11 (copy), v14 (copy), l_View_0 (copy), l_Skeleton_0 (copy), l_Radius_0 (copy), l_Button_0 (copy), l_ButtonVariant_0 (copy), v3 (copy), v13 (copy), v2 (copy)
    local v19 = l_useTokens_0();
    local l_translateIntoString_0 = l_useArTranslation_0().translateIntoString;
    local l_Body_0 = v12.useLayoutSlots().Body;
    local v22 = l_useListLoader_0(v18.items);
    local l_loading_0 = v22.loading;
    local l_error_0 = v22.error;
    local l_retry_0 = v22.retry;
    local l_data_0 = v22.data;
    if l_loading_0 then
        return v4.createElement(l_Body_0, nil, {
            Eyebrow = v18.eyebrow and v4.createElement(v11, {
                eyebrow = v18.eyebrow, 
                layoutOrder = 0
            }), 
            Title = v4.createElement(v14, {
                input = v18.title, 
                tag = "size-full-0 auto-y text-heading-medium", 
                layoutOrder = 1
            }), 
            SkeletonContainer = v4.createElement(l_View_0, {
                tag = "col size-full-0 auto-y gap-medium", 
                LayoutOrder = 2
            }, {
                Skeleton1 = v4.createElement(l_Skeleton_0, {
                    radius = l_Radius_0.Medium, 
                    Size = UDim2.new(1, 0, 0, v19.Size.Size_600)
                }), 
                Skeleton2 = v4.createElement(l_Skeleton_0, {
                    radius = l_Radius_0.Medium, 
                    Size = UDim2.new(1, 0, 0, v19.Size.Size_600)
                }), 
                Skeleton3 = v4.createElement(l_Skeleton_0, {
                    radius = l_Radius_0.Medium, 
                    Size = UDim2.new(1, 0, 0, v19.Size.Size_600)
                }), 
                Skeleton4 = v4.createElement(l_Skeleton_0, {
                    radius = l_Radius_0.Medium, 
                    Size = UDim2.new(1, 0, 0, v19.Size.Size_600)
                }), 
                Skeleton5 = v4.createElement(l_Skeleton_0, {
                    radius = l_Radius_0.Medium, 
                    Size = UDim2.new(1, 0, 0, v19.Size.Size_600)
                })
            })
        });
    elseif l_error_0 then
        return v4.createElement(l_Body_0, nil, {
            Eyebrow = v18.eyebrow and v4.createElement(v11, {
                eyebrow = v18.eyebrow, 
                layoutOrder = 0
            }), 
            Title = v4.createElement(v14, {
                input = v18.title, 
                tag = "size-full-0 auto-y text-heading-medium", 
                layoutOrder = 1
            }), 
            ErrorText = v4.createElement(v14, {
                input = l_translateIntoString_0(v18.errorText), 
                tag = "size-full-0 auto-y text-body-small", 
                layoutOrder = 2
            }), 
            RetryButton = v4.createElement(l_Button_0, {
                text = l_translateIntoString_0(v18.retryButtonText), 
                variant = l_ButtonVariant_0.Standard, 
                fillBehavior = v3.Enums.FillBehavior.Fit, 
                onActivated = l_retry_0, 
                LayoutOrder = 3
            })
        });
    else
        return (v4.createElement(v13, v2.join(v18, {
            items = l_data_0, 
            variant = "chevron"
        })));
    end;
end);