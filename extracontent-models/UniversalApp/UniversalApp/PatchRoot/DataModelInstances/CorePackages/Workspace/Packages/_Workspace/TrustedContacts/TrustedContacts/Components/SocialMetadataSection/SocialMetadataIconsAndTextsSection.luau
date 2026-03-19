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
return function(v12) --[[ Line: 29 ]] --[[ Name: SocialMetadataIconsAndTextsSection ]]
    -- upvalues: v11 (copy), l_useDesignTokens_0 (copy), l_useTokens_0 (copy), v1 (copy), l_View_0 (copy), l_Icon_0 (copy), l_IconSize_0 (copy), l_IconVariant_0 (copy), l_Text_0 (copy), l_dependencyArray_0 (copy)
    local v13 = v11(v12.profileInsightIconItems);
    local v14 = l_useDesignTokens_0();
    local v15 = l_useTokens_0();
    local v18 = v1.useCallback(function(v16, v17) --[[ Line: 35 ]]
        -- upvalues: v1 (ref), l_View_0 (ref), l_Icon_0 (ref), l_IconSize_0 (ref), l_IconVariant_0 (ref), l_Text_0 (ref)
        return v1.createElement(l_View_0, {
            tag = "auto-xy size-0 row align-y-center gap-xsmall padding-x-xsmall", 
            LayoutOrder = v17
        }, {
            Icon = v1.createElement(l_Icon_0, {
                name = v16.icon, 
                size = l_IconSize_0.XSmall, 
                LayoutOrder = 1, 
                variant = l_IconVariant_0.Filled
            }), 
            Text = v1.createElement(l_Text_0, {
                tag = "auto-xy size-0 text-align-x-left text-truncate-end text-body-medium", 
                Text = v16.text, 
                LayoutOrder = 2
            })
        });
    end, l_dependencyArray_0(v14, v15));
    local v19 = {};
    for v20, v21 in pairs(v13) do
        table.insert(v19, (v18(v21, v20)));
    end;
    return v1.useMemo(function() --[[ Line: 60 ]]
        -- upvalues: v1 (ref), l_View_0 (ref), v12 (copy), v19 (copy)
        return v1.createElement(l_View_0, {
            tag = {
                ["row auto-y size-full-0 wrap align-x-left"] = true, 
                ["gap-xsmall"] = v12.isVerticallyConstrained, 
                ["gap-small"] = not v12.isVerticallyConstrained
            }, 
            LayoutOrder = v12.layoutOrder
        }, v19);
    end, l_dependencyArray_0(v12.profileInsightIconItems, v19));
end;