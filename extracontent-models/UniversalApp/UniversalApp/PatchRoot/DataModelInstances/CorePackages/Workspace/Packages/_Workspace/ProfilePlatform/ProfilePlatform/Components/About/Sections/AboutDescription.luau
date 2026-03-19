local l_script_FirstAncestor_0 = script:FindFirstAncestor("ProfilePlatform");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_script_FirstAncestor_0.Common.TextKeys);
local v4 = require(l_Parent_0.Localization);
local v5 = require(l_Parent_0.Foundation);
local l_View_0 = v5.View;
local l_Text_0 = v5.Text;
local l_useLocalization_0 = v4.Hooks.useLocalization;
return function(v9) --[[ Line: 18 ]] --[[ Name: AboutDescription ]]
    -- upvalues: l_useLocalization_0 (copy), v3 (copy), v2 (copy), l_View_0 (copy), l_Text_0 (copy)
    local v10 = l_useLocalization_0({
        about = v3.About, 
        aboutHeading = {
            v3.AboutDetailsHeading; 
            name = v9.name
        }, 
        noBioYet = v3.NoBioYet
    });
    local l_description_0 = v9.description;
    if l_description_0 == nil or l_description_0 == "" then
        l_description_0 = v10.noBioYet;
    end;
    return v2.createElement(l_View_0, {
        LayoutOrder = v9.layoutOrder, 
        tag = "col size-full-0 auto-y gap-small align-x-left"
    }, {
        AboutTitle = v2.createElement(l_Text_0, {
            LayoutOrder = 1, 
            tag = "auto-y size-full-0 text-align-x-left text-heading-small", 
            Text = if v9.name then v10.aboutHeading else v10.about
        }), 
        AboutDescription = v2.createElement(l_Text_0, {
            LayoutOrder = 2, 
            tag = "auto-y size-full-0 text-align-x-left text-wrap text-body-medium", 
            Text = l_description_0
        })
    });
end;