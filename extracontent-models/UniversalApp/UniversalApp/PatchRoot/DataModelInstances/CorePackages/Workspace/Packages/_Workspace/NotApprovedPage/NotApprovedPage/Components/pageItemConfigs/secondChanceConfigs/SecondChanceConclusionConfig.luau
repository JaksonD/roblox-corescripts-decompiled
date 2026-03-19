local l_script_FirstAncestor_0 = script:FindFirstAncestor("NotApprovedPage");
local _ = require(l_script_FirstAncestor_0.Common.Types);
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v3 = require(l_Parent_0.React);
local v4 = require(l_Parent_0.Foundation);
local l_Text_0 = v4.Text;
local l_View_0 = v4.View;
local _ = require(l_script_FirstAncestor_0.Components.pageItemConfigs.PageItemConfigUtils);
local l_useNotApprovedPageContext_0 = require(l_script_FirstAncestor_0.Contexts.NotApprovedPageContext).useNotApprovedPageContext;
return {
    getIsVisible = function(_, _) --[[ Line: 45 ]] --[[ Name: getIsVisible ]]
        return true;
    end, 
    renderComponent = v3.memo(function(v11) --[[ Line: 23 ]] --[[ Name: SecondChanceConclusion ]]
        -- upvalues: l_useNotApprovedPageContext_0 (copy), v3 (copy), l_View_0 (copy), l_Text_0 (copy)
        local l_translations_0 = l_useNotApprovedPageContext_0().translations;
        return v3.createElement(l_View_0, {
            tag = "col size-full-0 auto-y gap-medium", 
            LayoutOrder = v11.layoutOrder
        }, {
            Heading = v3.createElement(l_Text_0, {
                Text = l_translations_0.secondChanceConclusionHeading, 
                tag = "auto-xy text-heading-medium content-emphasis text-align-x-left text-wrap", 
                LayoutOrder = 1
            }), 
            Description = v3.createElement(l_Text_0, {
                Text = l_translations_0.secondChanceConclusionDescription, 
                tag = "auto-xy text-body-large text-align-x-left text-wrap", 
                LayoutOrder = 2
            })
        });
    end)
};