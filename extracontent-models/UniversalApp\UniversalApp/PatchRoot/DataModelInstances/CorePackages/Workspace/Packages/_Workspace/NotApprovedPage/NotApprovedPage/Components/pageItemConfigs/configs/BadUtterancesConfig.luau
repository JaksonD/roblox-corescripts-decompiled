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
local l_LinkButton_0 = require(l_Parent_0.UIBlox).App.Button.LinkButton;
local v18 = require(l_script_FirstAncestor_0.Flags.FFlagEnableNapPageNavigationContext);
local function v31(v19) --[[ Line: 47 ]] --[[ Name: BadUtterancesContent ]]
    -- upvalues: l_useNotApprovedPageContext_0 (copy), l_useState_0 (copy), l_useCallback_0 (copy), l_dependencyArray_0 (copy), l_useMemo_0 (copy), v8 (copy), l_Text_0 (copy), l_View_0 (copy), v18 (copy), l_LinkButton_0 (copy)
    local l_translations_0 = l_useNotApprovedPageContext_0().translations;
    local v21, v22 = l_useState_0(false);
    local l_badUtterances_0 = v19.badUtterances;
    local v25 = l_useCallback_0(function() --[[ Line: 53 ]]
        -- upvalues: v22 (copy)
        v22(function(v24) --[[ Line: 54 ]]
            return not v24;
        end);
    end, l_dependencyArray_0(v21));
    local v26 = l_useMemo_0(function() --[[ Line: 59 ]]
        -- upvalues: v21 (copy), l_badUtterances_0 (copy)
        if v21 or #l_badUtterances_0 <= 4 then
            return l_badUtterances_0;
        else
            return {
                unpack(l_badUtterances_0, 1, 4)
            };
        end;
    end, l_dependencyArray_0(l_badUtterances_0, v21));
    local v30 = l_useMemo_0(function() --[[ Line: 65 ]]
        -- upvalues: v26 (copy), v8 (ref), l_Text_0 (ref)
        local v27 = {};
        for v28, v29 in v26 do
            table.insert(v27, v8.createElement(l_Text_0, {
                tag = "auto-xy text-body-medium text-align-x-left text-wrap", 
                Text = v29.utteranceText, 
                RichText = true, 
                LayoutOrder = v28
            }));
        end;
        return v27;
    end, l_dependencyArray_0(v26));
    return v8.createElement(l_View_0, {
        tag = "auto-xy col gap-small", 
        LayoutOrder = v19.LayoutOrder
    }, {
        BadUtteranceItems = v8.createElement(l_View_0, {
            tag = "auto-xy col gap-xxsmall", 
            LayoutOrder = 1
        }, {
            OffensiveItemLabel = v8.createElement(l_Text_0, {
                tag = {
                    ["auto-xy text-body-medium text-align-x-left text-wrap"] = true, 
                    ["content-emphasis"] = v18
                }, 
                Text = ("<b>%*:</b>"):format(l_translations_0.offensiveItemLabel), 
                RichText = true, 
                LayoutOrder = 1
            }), 
            ListOfItems = v8.createElement(l_View_0, {
                tag = "auto-xy col", 
                LayoutOrder = 2
            }, unpack(v30))
        }), 
        ToggleButton = #l_badUtterances_0 > 4 and v8.createElement(l_LinkButton_0, {
            text = if v21 then l_translations_0.viewLessButton else l_translations_0.viewMoreButton, 
            onActivated = v25, 
            fontStyle = "CaptionHeader", 
            minPaddingX = 0, 
            minPaddingY = 0, 
            layoutOrder = 2
        }) or nil
    });
end;
return {
    getIsVisible = function(v32) --[[ Line: 161 ]] --[[ Name: getIsVisible ]]
        -- upvalues: v2 (copy)
        local l_violation_0 = v32.violation;
        local l_badUtterances_1 = v32.badUtterances;
        return not v2.isVisibleInView(l_violation_0) and l_badUtterances_1 and #l_badUtterances_1 ~= 0;
    end, 
    renderComponent = v8.memo(function(v35) --[[ Line: 123 ]] --[[ Name: BadUtterances ]]
        -- upvalues: l_useNotApprovedPageContext_0 (copy), v8 (copy), l_View_0 (copy), v31 (copy), l_Divider_0 (copy), v18 (copy), v1 (copy), v3 (copy), l_Text_0 (copy)
        local l_translations_1 = l_useNotApprovedPageContext_0().translations;
        local l_badUtterances_2 = v35.moderationDetail.badUtterances;
        local l_beginDate_0 = v35.moderationDetail.beginDate;
        return v8.createElement(l_View_0, {
            tag = "size-full-0 auto-y col gap-small", 
            LayoutOrder = 1
        }, {
            BadUtterancesContent = v8.createElement(v31, {
                badUtterances = l_badUtterances_2, 
                LayoutOrder = 1
            }), 
            Divider = v8.createElement(l_View_0, {
                tag = "auto-xy padding-y-small", 
                LayoutOrder = 2
            }, {
                Divider = v8.createElement(l_Divider_0, nil)
            }), 
            ReviewDate = if v18 then v8.createElement(v1, {
                fieldLabel = l_translations_1.dateReviewedLabel, 
                fieldValue = v3(l_beginDate_0, l_translations_1), 
                layoutOrder = 4
            }) else v8.createElement(l_Text_0, {
                tag = "auto-xy text-body-medium text-align-x-left text-wrap", 
                Text = ("<b>%*:</b>\n%*"):format(l_translations_1.dateReviewedLabel, (v3(l_beginDate_0, l_translations_1))), 
                RichText = true, 
                LayoutOrder = 4
            })
        });
    end)
};