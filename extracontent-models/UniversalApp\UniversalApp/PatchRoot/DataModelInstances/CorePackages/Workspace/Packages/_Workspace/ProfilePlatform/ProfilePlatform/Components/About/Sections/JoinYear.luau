local l_script_FirstAncestor_0 = script:FindFirstAncestor("ProfilePlatform");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_Parent_0.Foundation);
local v4 = require(l_Parent_0.Localization);
local v5 = require(l_Parent_0.BuilderIcons);
local v6 = require(l_script_FirstAncestor_0.Common.TextKeys);
local l_Text_0 = v3.Text;
local l_View_0 = v3.View;
local l_Icon_0 = v3.Icon;
local l_InputSize_0 = v3.Enums.InputSize;
local l_IconVariant_0 = v3.Enums.IconVariant;
local l_CircleI_0 = v5.Icon.CircleI;
local l_useLocalization_0 = v4.Hooks.useLocalization;
return function(v14) --[[ Line: 24 ]] --[[ Name: JoinYear ]]
    -- upvalues: l_useLocalization_0 (copy), v6 (copy), v2 (copy), l_View_0 (copy), l_Text_0 (copy), l_Icon_0 (copy), l_CircleI_0 (copy), l_InputSize_0 (copy), l_IconVariant_0 (copy)
    if not v14.joinDateTime or v14.joinDateTime == "" then
        return nil;
    else
        local v15 = string.match(v14.joinDateTime, "^(%d%d%d%d)");
        if not v15 then
            return nil;
        else
            local v16 = l_useLocalization_0({
                statistics = v6.Statistics, 
                joinedInYear = {
                    v6.JoinedInYear; 
                    year = v15
                }
            });
            return v2.createElement(l_View_0, {
                LayoutOrder = v14.layoutOrder, 
                tag = "col size-full-0 auto-y gap-small align-x-left"
            }, {
                Title = v2.createElement(l_Text_0, {
                    LayoutOrder = 1, 
                    tag = "auto-y size-full-0 text-align-x-left text-heading-small", 
                    Text = v16.statistics
                }), 
                Content = v2.createElement(l_View_0, {
                    LayoutOrder = v14.layoutOrder, 
                    tag = "auto-xy size-0 row align-y-center gap-xsmall"
                }, {
                    Icon = v2.createElement(l_Icon_0, {
                        LayoutOrder = 1, 
                        name = l_CircleI_0, 
                        size = l_InputSize_0.XSmall, 
                        variant = l_IconVariant_0.Filled
                    }), 
                    Text = v2.createElement(l_Text_0, {
                        LayoutOrder = 2, 
                        tag = "auto-xy size-0 text-align-x-left text-body-medium", 
                        Text = v16.joinedInYear
                    })
                })
            });
        end;
    end;
end;