local l_Parent_0 = script:FindFirstAncestor("TrustedContacts").Parent;
local v1 = require(l_Parent_0.React);
local v2 = require(l_Parent_0.Foundation);
local l_Text_0 = v2.Text;
local l_View_0 = v2.View;
local l_useTokens_0 = v2.Hooks.useTokens;
local l_Icon_0 = v2.Icon;
local l_IconSize_0 = v2.Enums.IconSize;
local l_IconVariant_0 = require(l_Parent_0.BuilderIcons).IconVariant;
local l_useDesignTokens_0 = require(l_Parent_0.Style).useDesignTokens;
local l_dependencyArray_0 = require(l_Parent_0.RoactUtils).Hooks.dependencyArray;
local v11 = require(script.Parent.useProfileInsightsToIconsAndTexts);
local l_FFlagRemoveDependencyArrayAntipattern_0 = require(l_Parent_0.SharedFlags).FFlagRemoveDependencyArrayAntipattern;
return function(v13) --[[ Line: 31 ]] --[[ Name: SocialMetadataIconsAndTextsSection ]]
    -- upvalues: v11 (copy), l_useDesignTokens_0 (copy), l_useTokens_0 (copy), v1 (copy), l_View_0 (copy), l_Icon_0 (copy), l_IconSize_0 (copy), l_IconVariant_0 (copy), l_Text_0 (copy), l_FFlagRemoveDependencyArrayAntipattern_0 (copy), l_dependencyArray_0 (copy)
    local v14 = v11(v13.profileInsightIconItems);
    local v15 = l_useDesignTokens_0();
    local v16 = l_useTokens_0();
    local v19 = v1.useCallback(function(v17, v18) --[[ Line: 38 ]]
        -- upvalues: v1 (ref), l_View_0 (ref), l_Icon_0 (ref), l_IconSize_0 (ref), l_IconVariant_0 (ref), l_Text_0 (ref)
        return v1.createElement(l_View_0, {
            tag = "auto-xy size-0 row align-y-center gap-xsmall padding-x-xsmall", 
            LayoutOrder = v18
        }, {
            Icon = v1.createElement(l_Icon_0, {
                name = v17.icon, 
                size = l_IconSize_0.XSmall, 
                LayoutOrder = 1, 
                variant = l_IconVariant_0.Filled
            }), 
            Text = v1.createElement(l_Text_0, {
                tag = "auto-xy size-0 text-align-x-left text-truncate-end text-body-medium", 
                Text = v17.text, 
                LayoutOrder = 2
            })
        });
    end, if l_FFlagRemoveDependencyArrayAntipattern_0 then {
        v15, 
        v16
    } else l_dependencyArray_0(v15, v16));
    local v20 = {};
    for v21, v22 in pairs(v14) do
        table.insert(v20, (v19(v22, v21)));
    end;
    return v1.useMemo(function() --[[ Line: 68 ]]
        -- upvalues: v1 (ref), l_View_0 (ref), v13 (copy), v20 (copy)
        return v1.createElement(l_View_0, {
            tag = {
                ["row auto-y size-full-0 wrap align-x-left"] = true, 
                ["gap-xsmall"] = v13.isVerticallyConstrained, 
                ["gap-small"] = not v13.isVerticallyConstrained
            }, 
            LayoutOrder = v13.layoutOrder
        }, v20);
    end, if l_FFlagRemoveDependencyArrayAntipattern_0 then {
        v13.profileInsightIconItems, 
        v20
    } else l_dependencyArray_0(v13.profileInsightIconItems, v20));
end;