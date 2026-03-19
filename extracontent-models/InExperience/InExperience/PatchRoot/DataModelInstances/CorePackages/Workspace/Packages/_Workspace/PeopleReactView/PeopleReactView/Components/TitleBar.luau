local l_script_FirstAncestor_0 = script:FindFirstAncestor("PeopleReactView");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_Parent_0.Foundation);
local l_useLocalization_0 = require(l_Parent_0.Localization).Hooks.useLocalization;
local l_Text_0 = v3.Text;
local l_View_0 = v3.View;
local v7 = require(l_script_FirstAncestor_0.Components.Buttons.LayoutToggleButton);
local v8 = require(l_script_FirstAncestor_0.Constants);
return v2.memo(function(v9) --[[ Line: 23 ]] --[[ Name: TitleBar ]]
    -- upvalues: l_useLocalization_0 (copy), v8 (copy), v2 (copy), l_View_0 (copy), l_Text_0 (copy), v7 (copy)
    local v10 = l_useLocalization_0({
        header = v8.PEOPLEPAGE.PEOPLE_LIST.HEADER
    });
    return v2.createElement(l_View_0, {
        tag = "row size-full-0 auto-y align-y-center flex-x-between", 
        LayoutOrder = v9.LayoutOrder
    }, {
        Title = v2.createElement(l_Text_0, {
            tag = "auto-xy content-default text-heading-small text-align-x-left", 
            Text = v10.header, 
            LayoutOrder = 1
        }), 
        LayoutToggleButton = v2.createElement(v7, {
            layout = v9.layout, 
            setLayout = v9.setLayout, 
            LayoutOrder = 2
        })
    });
end);