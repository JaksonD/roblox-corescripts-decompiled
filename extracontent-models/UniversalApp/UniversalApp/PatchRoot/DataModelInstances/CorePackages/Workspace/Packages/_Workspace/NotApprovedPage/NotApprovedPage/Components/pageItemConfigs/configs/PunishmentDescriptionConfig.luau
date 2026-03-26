local l_script_FirstAncestor_0 = script:FindFirstAncestor("NotApprovedPage");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local l_PUNISHMENT_TYPE_TO_INTERVENTION_MAP_0 = require(l_Parent_0.NotApprovedPageState).Constants.PUNISHMENT_TYPE_TO_INTERVENTION_MAP;
local _ = require(l_script_FirstAncestor_0.Common.Types);
local v4 = require(l_Parent_0.React);
local v5 = require(l_Parent_0.Foundation);
local l_View_0 = v5.View;
local l_Text_0 = v5.Text;
local l_useMemo_0 = v4.useMemo;
local l_dependencyArray_0 = require(l_Parent_0.RoactUtils).Hooks.dependencyArray;
local l_useNotApprovedPageContext_0 = require(l_script_FirstAncestor_0.Contexts.NotApprovedPageContext).useNotApprovedPageContext;
local _ = require(l_script_FirstAncestor_0.Components.pageItemConfigs.PageItemConfigUtils);
local v12 = require(l_script_FirstAncestor_0.Utils.determinePunishmentDescription);
return {
    getIsVisible = function() --[[ Line: 55 ]] --[[ Name: getIsVisible ]]
        return true;
    end, 
    renderComponent = v4.memo(function(v13) --[[ Line: 29 ]] --[[ Name: PunishmentDescription ]]
        -- upvalues: l_useNotApprovedPageContext_0 (copy), l_PUNISHMENT_TYPE_TO_INTERVENTION_MAP_0 (copy), l_useMemo_0 (copy), v12 (copy), l_dependencyArray_0 (copy), v4 (copy), l_View_0 (copy), l_Text_0 (copy)
        local l_translations_0 = l_useNotApprovedPageContext_0().translations;
        local l_translatedReasons_0 = l_useNotApprovedPageContext_0().violationReasons.translatedReasons;
        local v16 = l_PUNISHMENT_TYPE_TO_INTERVENTION_MAP_0[v13.moderationDetail.punishmentTypeDescription];
        local v17 = l_useMemo_0(function() --[[ Line: 37 ]]
            -- upvalues: v12 (ref), l_translations_0 (copy), v16 (copy), l_translatedReasons_0 (copy)
            return v12(l_translations_0.violationType, v16, l_translatedReasons_0 or {});
        end, l_dependencyArray_0(l_translations_0.violationType, v16, l_translatedReasons_0));
        return v4.createElement(l_View_0, {
            tag = "size-full-0 auto-y col gap-small", 
            LayoutOrder = v13.layoutOrder, 
            testId = "punishment-description"
        }, {
            Description = v4.createElement(l_Text_0, {
                Text = v17, 
                tag = "auto-xy text-body-medium text-wrap text-align-x-left content-emphasis", 
                LayoutOrder = 1
            })
        });
    end)
};