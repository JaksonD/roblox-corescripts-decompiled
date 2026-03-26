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
local l_View_0 = require(l_Parent_0.Foundation).View;
local _ = require(l_script_FirstAncestor_0.Components.pageItemConfigs.PageItemConfigUtils);
local l_Constants_0 = require(l_Parent_0.NotApprovedPageState).Constants;
local v15 = require(l_script_FirstAncestor_0.Flags.FFlagNapPublicEvidenceTranslationKeys);
local v16 = {
    TEXT = "text", 
    IMAGE = "image"
};
return {
    getIsVisible = function(v17) --[[ Line: 120 ]] --[[ Name: getIsVisible ]]
        -- upvalues: v3 (copy)
        return v3.isVisibleInView(v17.violation);
    end, 
    renderComponent = v9.memo(function(v18) --[[ Line: 40 ]] --[[ Name: ViolationEvidence ]]
        -- upvalues: l_useNotApprovedPageContext_0 (copy), l_useMemo_0 (copy), v3 (copy), l_dependencyArray_0 (copy), v16 (copy), v15 (copy), v5 (copy), l_Constants_0 (copy), l_HttpService_0 (copy), v9 (copy), v2 (copy), l_View_0 (copy), v4 (copy)
        local l_translations_0 = l_useNotApprovedPageContext_0().translations;
        local l_violation_0 = v18.moderationDetail.violation;
        local l_beginDate_0 = v18.moderationDetail.beginDate;
        if not l_violation_0 then
            return nil;
        else
            local v22 = l_useMemo_0(function() --[[ Line: 54 ]]
                -- upvalues: v3 (ref), l_violation_0 (copy)
                return v3.filterForVisibleElements(l_violation_0.evidence.elements);
            end, l_dependencyArray_0(l_violation_0.evidence.elements));
            local v28 = l_useMemo_0(function() --[[ Line: 58 ]]
                -- upvalues: v22 (copy), v16 (ref), v15 (ref), l_translations_0 (copy), v5 (ref), l_Constants_0 (ref), l_HttpService_0 (ref), v9 (ref), v2 (ref)
                local v23 = {};
                for v24, v25 in v22 do
                    if v25.type == v16.TEXT then
                        local l_text_0 = v25.text;
                        if v15 and v25.textKey then
                            local v27 = l_translations_0[v25.textKey .. "_" .. v25.labelKey];
                            if v27 and v27 ~= "" then
                                l_text_0 = v27;
                            else
                                v5({
                                    eventType = l_Constants_0.EVENT_TYPES.MissingTranslation, 
                                    additionalInfo = l_HttpService_0:JSONEncode({
                                        key = v25.textKey, 
                                        params = v25.textKeyParameters
                                    })
                                });
                                l_text_0 = v25.textKey;
                            end;
                        end;
                        table.insert(v23, v9.createElement(v2, {
                            fieldLabel = l_translations_0[v25.labelKey], 
                            fieldValue = if v15 then l_text_0 else v25.text, 
                            layoutOrder = v24
                        }));
                    end;
                end;
                return v23;
            end, l_dependencyArray_0(v22));
            return v9.createElement(l_View_0, {
                tag = "size-full-0 auto-y col gap-small", 
                LayoutOrder = 1
            }, {
                Elements = v9.createElement(l_View_0, {
                    tag = "size-full-0 auto-y col gap-small", 
                    LayoutOrder = 2
                }, unpack(v28)), 
                ReviewDate = v9.createElement(v2, {
                    fieldLabel = l_translations_0.dateReviewedLabel, 
                    fieldValue = v4(l_beginDate_0, l_translations_0), 
                    layoutOrder = 3
                })
            });
        end;
    end)
};