local l_script_FirstAncestor_0 = script:FindFirstAncestor("NotApprovedPage");
local v1 = require(l_script_FirstAncestor_0.Components.EvidenceField);
local v2 = require(l_script_FirstAncestor_0.Utils.platformEvidence);
local v3 = require(l_script_FirstAncestor_0.Utils.parseDateFromString);
local _ = require(l_script_FirstAncestor_0.Common.Types);
local l_useNotApprovedPageContext_0 = require(l_script_FirstAncestor_0.Contexts.NotApprovedPageContext).useNotApprovedPageContext;
local _ = require(l_script_FirstAncestor_0.Components.pageItemConfigs.PageItemConfigUtils);
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v8 = require(l_Parent_0.React);
local l_useState_0 = v8.useState;
local l_useCallback_0 = v8.useCallback;
local l_useMemo_0 = v8.useMemo;
local l_dependencyArray_0 = require(l_Parent_0.RoactUtils).Hooks.dependencyArray;
local v13 = require(l_Parent_0.Foundation);
local l_Text_0 = v13.Text;
local l_View_0 = v13.View;
local l_Divider_0 = v13.Divider;
local v17 = require(l_Parent_0.UIBlox);
local l_FFlagRemoveDependencyArrayAntipattern_0 = require(l_Parent_0.SharedFlags).FFlagRemoveDependencyArrayAntipattern;
local l_LinkButton_0 = v17.App.Button.LinkButton;
local function v32(v20) --[[ Line: 47 ]] --[[ Name: BadUtterancesContent ]]
    -- upvalues: l_useNotApprovedPageContext_0 (copy), l_useState_0 (copy), l_useCallback_0 (copy), l_FFlagRemoveDependencyArrayAntipattern_0 (copy), l_dependencyArray_0 (copy), l_useMemo_0 (copy), v8 (copy), l_Text_0 (copy), l_View_0 (copy), l_LinkButton_0 (copy)
    local l_translations_0 = l_useNotApprovedPageContext_0().translations;
    local v22, v23 = l_useState_0(false);
    local l_badUtterances_0 = v20.badUtterances;
    local v26 = l_useCallback_0(function() --[[ Line: 53 ]]
        -- upvalues: v23 (copy)
        v23(function(v25) --[[ Line: 54 ]]
            return not v25;
        end);
    end, if l_FFlagRemoveDependencyArrayAntipattern_0 then {
        v22
    } else l_dependencyArray_0(v22));
    local v27 = l_useMemo_0(function() --[[ Line: 60 ]]
        -- upvalues: v22 (copy), l_badUtterances_0 (copy)
        if v22 or #l_badUtterances_0 <= 4 then
            return l_badUtterances_0;
        else
            return {
                unpack(l_badUtterances_0, 1, 4)
            };
        end;
    end, if l_FFlagRemoveDependencyArrayAntipattern_0 then {
        l_badUtterances_0, 
        v22
    } else l_dependencyArray_0(l_badUtterances_0, v22));
    local v31 = l_useMemo_0(function() --[[ Line: 70 ]]
        -- upvalues: v27 (copy), v8 (ref), l_Text_0 (ref)
        local v28 = {};
        for v29, v30 in v27 do
            table.insert(v28, v8.createElement(l_Text_0, {
                tag = "auto-xy text-body-medium text-align-x-left text-wrap", 
                Text = v30.utteranceText, 
                RichText = true, 
                LayoutOrder = v29
            }));
        end;
        return v28;
    end, if l_FFlagRemoveDependencyArrayAntipattern_0 then {
        v27
    } else l_dependencyArray_0(v27));
    return v8.createElement(l_View_0, {
        tag = "auto-xy col gap-small", 
        LayoutOrder = v20.LayoutOrder
    }, {
        BadUtteranceItems = v8.createElement(l_View_0, {
            tag = "auto-xy col gap-xxsmall", 
            LayoutOrder = 1
        }, {
            OffensiveItemLabel = v8.createElement(l_Text_0, {
                tag = "auto-xy text-body-medium text-align-x-left text-wrap content-emphasis", 
                Text = ("<b>%*:</b>"):format(l_translations_0.offensiveItemLabel), 
                RichText = true, 
                LayoutOrder = 1
            }), 
            ListOfItems = v8.createElement(l_View_0, {
                tag = "auto-xy col", 
                LayoutOrder = 2
            }, unpack(v31))
        }), 
        ToggleButton = #l_badUtterances_0 > 4 and v8.createElement(l_LinkButton_0, {
            text = if v22 then l_translations_0.viewLessButton else l_translations_0.viewMoreButton, 
            onActivated = v26, 
            fontStyle = "CaptionHeader", 
            minPaddingX = 0, 
            minPaddingY = 0, 
            layoutOrder = 2
        }) or nil
    });
end;
return {
    getIsVisible = function(v33) --[[ Line: 156 ]] --[[ Name: getIsVisible ]]
        -- upvalues: v2 (copy)
        local l_violation_0 = v33.violation;
        local l_badUtterances_1 = v33.badUtterances;
        return not v2.isVisibleInView(l_violation_0) and l_badUtterances_1 and #l_badUtterances_1 ~= 0;
    end, 
    renderComponent = v8.memo(function(v36) --[[ Line: 125 ]] --[[ Name: BadUtterances ]]
        -- upvalues: l_useNotApprovedPageContext_0 (copy), v8 (copy), l_View_0 (copy), v32 (copy), l_Divider_0 (copy), v1 (copy), v3 (copy)
        local l_translations_1 = l_useNotApprovedPageContext_0().translations;
        local l_badUtterances_2 = v36.moderationDetail.badUtterances;
        local l_beginDate_0 = v36.moderationDetail.beginDate;
        return v8.createElement(l_View_0, {
            tag = "size-full-0 auto-y col gap-small", 
            LayoutOrder = 1
        }, {
            BadUtterancesContent = v8.createElement(v32, {
                badUtterances = l_badUtterances_2, 
                LayoutOrder = 1
            }), 
            Divider = v8.createElement(l_View_0, {
                tag = "auto-xy padding-y-small", 
                LayoutOrder = 2
            }, {
                Divider = v8.createElement(l_Divider_0, nil)
            }), 
            ReviewDate = v8.createElement(v1, {
                fieldLabel = l_translations_1.dateReviewedLabel, 
                fieldValue = v3(l_beginDate_0, l_translations_1), 
                layoutOrder = 4
            })
        });
    end)
};