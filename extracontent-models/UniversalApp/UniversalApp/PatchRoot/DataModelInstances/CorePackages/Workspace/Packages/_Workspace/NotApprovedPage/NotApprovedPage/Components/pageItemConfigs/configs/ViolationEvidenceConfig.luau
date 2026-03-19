local l_script_FirstAncestor_0 = script:FindFirstAncestor("NotApprovedPage");
local l_HttpService_0 = game:GetService("HttpService");
local v2 = require(l_script_FirstAncestor_0.Components.EvidenceField);
local v3 = require(l_script_FirstAncestor_0.Utils.platformEvidence);
local v4 = require(l_script_FirstAncestor_0.Utils.parseDateFromString);
local v5 = require(l_script_FirstAncestor_0.Utils.sendNotApprovedPageEvent);
local l_useNotApprovedPageContext_0 = require(l_script_FirstAncestor_0.Contexts.NotApprovedPageContext).useNotApprovedPageContext;
local _ = require(l_script_FirstAncestor_0.Common.Types);
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v9 = require(l_Parent_0.React);
local l_useMemo_0 = v9.useMemo;
local l_dependencyArray_0 = require(l_Parent_0.RoactUtils).Hooks.dependencyArray;
local v12 = require(l_Parent_0.Foundation);
local l_Text_0 = v12.Text;
local l_View_0 = v12.View;
local _ = require(l_script_FirstAncestor_0.Components.pageItemConfigs.PageItemConfigUtils);
local l_Constants_0 = require(l_Parent_0.NotApprovedPageState).Constants;
local v17 = require(l_script_FirstAncestor_0.Flags.FFlagEnableNapPageNavigationContext);
local v18 = require(l_script_FirstAncestor_0.Flags.FFlagNapPublicEvidenceTranslationKeys);
local v19 = {
    TEXT = "text", 
    IMAGE = "image"
};
return {
    getIsVisible = function(v20) --[[ Line: 136 ]] --[[ Name: getIsVisible ]]
        -- upvalues: v3 (copy)
        return v3.isVisibleInView(v20.violation);
    end, 
    renderComponent = v9.memo(function(v21) --[[ Line: 42 ]] --[[ Name: ViolationEvidence ]]
        -- upvalues: l_useNotApprovedPageContext_0 (copy), l_useMemo_0 (copy), v3 (copy), l_dependencyArray_0 (copy), v19 (copy), v18 (copy), v5 (copy), l_Constants_0 (copy), l_HttpService_0 (copy), v17 (copy), v9 (copy), v2 (copy), l_Text_0 (copy), l_View_0 (copy), v4 (copy)
        local l_translations_0 = l_useNotApprovedPageContext_0().translations;
        local l_violation_0 = v21.moderationDetail.violation;
        local l_beginDate_0 = v21.moderationDetail.beginDate;
        if not l_violation_0 then
            return nil;
        else
            local v25 = l_useMemo_0(function() --[[ Line: 56 ]]
                -- upvalues: v3 (ref), l_violation_0 (copy)
                return v3.filterForVisibleElements(l_violation_0.evidence.elements);
            end, l_dependencyArray_0(l_violation_0.evidence.elements));
            local v31 = l_useMemo_0(function() --[[ Line: 60 ]]
                -- upvalues: v25 (copy), v19 (ref), v18 (ref), l_translations_0 (copy), v5 (ref), l_Constants_0 (ref), l_HttpService_0 (ref), v17 (ref), v9 (ref), v2 (ref), l_Text_0 (ref)
                local v26 = {};
                for v27, v28 in v25 do
                    if v28.type == v19.TEXT then
                        local l_text_0 = v28.text;
                        if v18 and v28.textKey then
                            local v30 = l_translations_0[v28.textKey .. "_" .. v28.labelKey];
                            if v30 and v30 ~= "" then
                                l_text_0 = v30;
                            else
                                v5({
                                    eventType = l_Constants_0.EVENT_TYPES.MissingTranslation, 
                                    additionalInfo = l_HttpService_0:JSONEncode({
                                        key = v28.textKey, 
                                        params = v28.textKeyParameters
                                    })
                                });
                                l_text_0 = v28.textKey;
                            end;
                        end;
                        table.insert(v26, if v17 then v9.createElement(v2, {
                            fieldLabel = l_translations_0[v28.labelKey], 
                            fieldValue = if v18 then l_text_0 else v28.text, 
                            layoutOrder = v27
                        }) else v9.createElement(l_Text_0, {
                            tag = "auto-xy text-body-medium text-align-x-left text-wrap", 
                            Text = ("<b>%*:</b>\n%*"):format(l_translations_0[v28.labelKey], v28.text), 
                            RichText = true, 
                            LayoutOrder = v27
                        }));
                    end;
                end;
                return v26;
            end, l_dependencyArray_0(v25));
            return v9.createElement(l_View_0, {
                tag = "size-full-0 auto-y col gap-small", 
                LayoutOrder = 1
            }, {
                Elements = v9.createElement(l_View_0, {
                    tag = "size-full-0 auto-y col gap-small", 
                    LayoutOrder = 2
                }, unpack(v31)), 
                ReviewDate = if v17 then v9.createElement(v2, {
                    fieldLabel = l_translations_0.dateReviewedLabel, 
                    fieldValue = v4(l_beginDate_0, l_translations_0), 
                    layoutOrder = 3
                }) else v9.createElement(l_Text_0, {
                    tag = "auto-xy text-body-medium text-align-x-left text-wrap", 
                    Text = ("<b>%*:</b>\n%*"):format(l_translations_0.dateReviewedLabel, (v4(l_beginDate_0, l_translations_0))), 
                    RichText = true, 
                    LayoutOrder = 3
                })
            });
        end;
    end)
};