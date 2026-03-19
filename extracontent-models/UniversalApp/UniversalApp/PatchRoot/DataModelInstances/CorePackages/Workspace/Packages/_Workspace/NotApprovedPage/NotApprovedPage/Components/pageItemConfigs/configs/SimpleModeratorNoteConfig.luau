local l_script_FirstAncestor_0 = script:FindFirstAncestor("NotApprovedPage");
local v1 = require(l_script_FirstAncestor_0.Components.EvidenceField);
local v2 = require(l_script_FirstAncestor_0.Utils.platformEvidence);
local v3 = require(l_script_FirstAncestor_0.Utils.parseDateFromString);
local _ = require(l_script_FirstAncestor_0.Common.Types);
local _ = require(l_script_FirstAncestor_0.Components.pageItemConfigs.PageItemConfigUtils);
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v7 = require(l_Parent_0.React);
local v8 = require(l_Parent_0.Foundation);
local l_Text_0 = v8.Text;
local l_View_0 = v8.View;
local l_useNotApprovedPageContext_0 = require(l_script_FirstAncestor_0.Contexts.NotApprovedPageContext).useNotApprovedPageContext;
local v12 = require(l_script_FirstAncestor_0.Flags.FFlagEnableNapPageNavigationContext);
return {
    getIsVisible = function(v13) --[[ Line: 59 ]] --[[ Name: getIsVisible ]]
        -- upvalues: v2 (copy)
        local l_violation_0 = v13.violation;
        local l_badUtterances_0 = v13.badUtterances;
        return not v2.isVisibleInView(l_violation_0) and (not l_badUtterances_0 or #l_badUtterances_0 == 0);
    end, 
    renderComponent = v7.memo(function(v16) --[[ Line: 35 ]] --[[ Name: SimpleModeratorNote ]]
        -- upvalues: l_useNotApprovedPageContext_0 (copy), v7 (copy), l_View_0 (copy), v12 (copy), v1 (copy), v3 (copy), l_Text_0 (copy)
        local l_translations_0 = l_useNotApprovedPageContext_0().translations;
        local l_beginDate_0 = v16.moderationDetail.beginDate;
        return v7.createElement(l_View_0, {
            tag = "size-full-0 auto-y col gap-small", 
            LayoutOrder = v16.layoutOrder
        }, {
            ReviewDate = if v12 then v7.createElement(v1, {
                fieldLabel = l_translations_0.dateReviewedLabel, 
                fieldValue = v3(l_beginDate_0, l_translations_0), 
                layoutOrder = 2
            }) else v7.createElement(l_Text_0, {
                tag = "auto-xy text-body-medium text-align-x-left text-wrap", 
                Text = ("<b>%*:</b>\n%*"):format(l_translations_0.dateReviewedLabel, (v3(l_beginDate_0, l_translations_0))), 
                RichText = true, 
                LayoutOrder = 2
            })
        });
    end)
};