local l_script_FirstAncestor_0 = script:FindFirstAncestor("NotApprovedPage");
local _ = require(l_script_FirstAncestor_0.Common.Types);
local _ = require(l_script_FirstAncestor_0.Components.pageItemConfigs.PageItemConfigUtils);
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v4 = require(l_Parent_0.React);
local v5 = require(l_Parent_0.Foundation);
local l_Text_0 = v5.Text;
local l_View_0 = v5.View;
local l_useMemo_0 = v4.useMemo;
local l_dependencyArray_0 = require(l_Parent_0.RoactUtils).Hooks.dependencyArray;
local v10 = require(l_script_FirstAncestor_0.Components.EvidenceField);
local l_useNotApprovedPageContext_0 = require(l_script_FirstAncestor_0.Contexts.NotApprovedPageContext).useNotApprovedPageContext;
local l_FFlagEnableNapDedicatedPage_0 = require(l_Parent_0.SharedFlags).FFlagEnableNapDedicatedPage;
return {
    getIsVisible = function() --[[ Line: 74 ]] --[[ Name: getIsVisible ]]
        return true;
    end, 
    renderComponent = v4.memo(function(v13) --[[ Line: 29 ]] --[[ Name: WhatHappened ]]
        -- upvalues: l_useNotApprovedPageContext_0 (copy), l_useMemo_0 (copy), l_dependencyArray_0 (copy), v4 (copy), l_View_0 (copy), l_Text_0 (copy), l_FFlagEnableNapDedicatedPage_0 (copy), v10 (copy)
        local v14 = l_useNotApprovedPageContext_0();
        local l_translations_0 = v14.translations;
        local l_violationReasons_0 = v14.violationReasons;
        local l_messageToUser_0 = v13.moderationDetail.messageToUser;
        local v19 = l_useMemo_0(function() --[[ Line: 36 ]]
            -- upvalues: l_violationReasons_0 (copy), l_translations_0 (copy)
            local v18 = table.concat(l_violationReasons_0.translatedReasons, ", ");
            if v18 ~= "" then
                return v18;
            else
                return l_translations_0.otherAbuseType;
            end;
        end, l_dependencyArray_0(l_violationReasons_0.translatedReasons));
        return v4.createElement(l_View_0, {
            tag = "size-full-0 auto-y col gap-medium", 
            LayoutOrder = v13.layoutOrder
        }, {
            Heading = v4.createElement(l_Text_0, {
                tag = {
                    ["auto-xy text-title-large text-align-x-left content-emphasis"] = true, 
                    ["text-wrap"] = l_FFlagEnableNapDedicatedPage_0
                }, 
                Text = l_translations_0.whatHappenedLabel, 
                LayoutOrder = 1
            }), 
            Content = v4.createElement(l_View_0, {
                tag = "size-full-0 auto-y col gap-small bg-shift-100 radius-medium padding-large", 
                LayoutOrder = 2
            }, {
                Reason = v4.createElement(v10, {
                    fieldLabel = l_translations_0.reasonLabel, 
                    fieldValue = v19, 
                    layoutOrder = 1
                }), 
                ModeratorNote = v4.createElement(v10, {
                    fieldLabel = l_translations_0.moderatorNoteLabel, 
                    fieldValue = l_messageToUser_0, 
                    layoutOrder = 2
                })
            })
        });
    end)
};