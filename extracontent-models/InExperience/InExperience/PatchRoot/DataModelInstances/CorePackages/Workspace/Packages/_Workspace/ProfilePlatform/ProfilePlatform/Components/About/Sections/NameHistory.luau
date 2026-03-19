local l_script_FirstAncestor_0 = script:FindFirstAncestor("ProfilePlatform");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_Parent_0.Foundation);
local v4 = require(l_Parent_0.Localization);
local v5 = require(l_script_FirstAncestor_0.Common.TextKeys);
local l_Text_0 = v3.Text;
local l_View_0 = v3.View;
local l_useLocalization_0 = v4.Hooks.useLocalization;
return function(v9) --[[ Line: 18 ]] --[[ Name: NameHistory ]]
    -- upvalues: l_useLocalization_0 (copy), v5 (copy), v2 (copy), l_View_0 (copy), l_Text_0 (copy)
    local v10 = l_useLocalization_0({
        previousNames = v5.PreviousNames, 
        noPreviousName = v5.NoPreviousName
    });
    local v11 = "";
    v11 = if not v9.nameHistory or #v9.nameHistory == 0 then v10.noPreviousName else table.concat(v9.nameHistory, ", ");
    return v2.createElement(l_View_0, {
        LayoutOrder = v9.layoutOrder, 
        tag = "col size-full-0 auto-y gap-small align-x-left"
    }, {
        Title = v2.createElement(l_Text_0, {
            LayoutOrder = 1, 
            tag = "auto-y size-full-0 text-align-x-left text-heading-small", 
            Text = v10.previousNames
        }), 
        Content = v2.createElement(l_Text_0, {
            LayoutOrder = 2, 
            tag = "auto-y size-full-0 text-align-x-left text-body-medium text-wrap", 
            Text = v11, 
            RichText = true
        })
    });
end;