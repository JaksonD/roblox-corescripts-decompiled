local l_script_FirstAncestor_0 = script:FindFirstAncestor("NotApprovedPage");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_script_FirstAncestor_0.Utils.sendNotApprovedPageEvent);
local l_Constants_0 = require(l_Parent_0.NotApprovedPageState).Constants;
local l_EVENT_TYPES_0 = l_Constants_0.EVENT_TYPES;
local l_PUNISHMENT_TYPE_TO_INTERVENTION_MAP_0 = l_Constants_0.PUNISHMENT_TYPE_TO_INTERVENTION_MAP;
local l_INTERVENTION_TYPES_0 = l_Constants_0.INTERVENTION_TYPES;
local v7 = require(l_Parent_0.React);
local l_useCallback_0 = v7.useCallback;
local l_AppPage_0 = require(l_Parent_0.RobloxAppEnums).AppPage;
local l_NavigateDown_0 = require(l_Parent_0.NavigationRodux).Thunks.NavigateDown;
local l_UrlBuilder_0 = require(l_Parent_0.UrlBuilder).UrlBuilder;
local v12 = require(l_Parent_0.Foundation);
local l_Text_0 = v12.Text;
local l_View_0 = v12.View;
local l_Button_0 = v12.Button;
local l_ButtonVariant_0 = v12.Enums.ButtonVariant;
local l_InputSize_0 = v12.Enums.InputSize;
local l_renderPageItemsFromList_0 = require(l_script_FirstAncestor_0.Components.pageItemConfigs.PageItemConfigUtils).renderPageItemsFromList;
local v19 = require(l_script_FirstAncestor_0.Components.pageItemConfigs.configs.ViolationEvidenceConfig);
local v20 = require(l_script_FirstAncestor_0.Components.pageItemConfigs.configs.BadUtterancesConfig);
local v21 = require(l_script_FirstAncestor_0.Components.pageItemConfigs.configs.SimpleModeratorNoteConfig);
local l_useNotApprovedPageContext_0 = require(l_script_FirstAncestor_0.Contexts.NotApprovedPageContext).useNotApprovedPageContext;
local v23 = require(l_script_FirstAncestor_0.Utils.useOpenLink);
local l_dependencyArray_0 = require(l_Parent_0.RoactUtils).Hooks.dependencyArray;
local v25 = require(l_script_FirstAncestor_0.Flags.FFlagEnableNapPageNavigationContext);
local v26 = require(l_script_FirstAncestor_0.Flags.FFlagEnableNapNewWebView);
local l_FFlagEnableNapDedicatedPage_0 = require(l_Parent_0.SharedFlags).FFlagEnableNapDedicatedPage;
local v28 = {
    v19, 
    v20, 
    v21
};
return {
    getIsVisible = function() --[[ Line: 176 ]] --[[ Name: getIsVisible ]]
        return true;
    end, 
    renderComponent = v7.memo(function(v29) --[[ Line: 62 ]] --[[ Name: RecentActivity ]]
        -- upvalues: l_useNotApprovedPageContext_0 (copy), v26 (copy), v23 (copy), l_UrlBuilder_0 (copy), l_PUNISHMENT_TYPE_TO_INTERVENTION_MAP_0 (copy), l_renderPageItemsFromList_0 (copy), v28 (copy), l_useCallback_0 (copy), v2 (copy), l_EVENT_TYPES_0 (copy), l_NavigateDown_0 (copy), l_AppPage_0 (copy), l_dependencyArray_0 (copy), v7 (copy), l_View_0 (copy), v25 (copy), l_Text_0 (copy), l_FFlagEnableNapDedicatedPage_0 (copy), l_Button_0 (copy), l_ButtonVariant_0 (copy), l_InputSize_0 (copy), l_INTERVENTION_TYPES_0 (copy)
        local l_translations_0 = l_useNotApprovedPageContext_0().translations;
        local v31 = if v26 then v23(l_UrlBuilder_0.static.appealsPortal.main(), l_translations_0.appealsPortalTitle) else nil;
        local l_interventionId_0 = v29.moderationDetail.interventionId;
        local l_consequenceTransparencyMessage_0 = v29.moderationDetail.consequenceTransparencyMessage;
        local l_dispatch_0 = v29.dispatch;
        local v35 = l_PUNISHMENT_TYPE_TO_INTERVENTION_MAP_0[v29.moderationDetail.punishmentTypeDescription];
        local v36 = l_renderPageItemsFromList_0(v28, v29.moderationDetail, v29.dispatch);
        local v37 = l_useCallback_0(function() --[[ Line: 79 ]]
            -- upvalues: v2 (ref), l_EVENT_TYPES_0 (ref), v26 (ref), v31 (copy), l_dispatch_0 (copy), l_NavigateDown_0 (ref), l_AppPage_0 (ref), l_UrlBuilder_0 (ref), l_translations_0 (copy)
            v2({
                eventType = l_EVENT_TYPES_0.AppealsPortalClicked
            });
            if v26 and v31 then
                v31();
                return;
            else
                l_dispatch_0(l_NavigateDown_0({
                    name = l_AppPage_0.GenericWebPage, 
                    detail = l_UrlBuilder_0.static.appealsPortal.main(), 
                    extraProps = {
                        title = l_translations_0.appealsPortalTitle
                    }
                }));
                return;
            end;
        end, l_dependencyArray_0(l_dispatch_0, v31));
        local l_createElement_0 = v7.createElement;
        local l_l_View_0_0 = l_View_0;
        local v40 = {
            tag = {
                ["size-full-0 auto-y col gap-small"] = true, 
                ["gap-medium"] = v25
            }, 
            LayoutOrder = v29.layoutOrder
        };
        local v41 = {
            Heading = v7.createElement(l_Text_0, {
                tag = {
                    ["auto-xy text-title-large text-align-x-left"] = true, 
                    ["content-emphasis"] = v25, 
                    ["text-wrap"] = l_FFlagEnableNapDedicatedPage_0
                }, 
                Text = l_translations_0.latestActivityLabel, 
                LayoutOrder = 1
            })
        };
        local l_createElement_1 = v7.createElement;
        local l_l_View_0_1 = l_View_0;
        local v44 = {
            tag = "size-full-0 auto-y col gap-xsmall", 
            LayoutOrder = 2
        };
        local v45 = {};
        local l_createElement_2 = v7.createElement;
        local l_l_View_0_2 = l_View_0;
        local v48 = {
            tag = "size-full-0 auto-y col bg-shift-100 radius-medium padding-large gap-small", 
            LayoutOrder = 1
        };
        local v49 = {
            Evidence = v7.createElement(l_View_0, {
                tag = "size-full-0 auto-y col", 
                LayoutOrder = 1
            }, unpack(v36))
        };
        local v50 = false;
        if l_consequenceTransparencyMessage_0 ~= "" then
            v50 = v7.createElement(l_Text_0, {
                tag = "auto-xy text-body-medium text-align-x-left text-wrap", 
                Text = ("<b>%*:</b>\n%*"):format(l_translations_0.decisionMethodLabel, l_consequenceTransparencyMessage_0), 
                RichText = true, 
                LayoutOrder = 2
            });
        end;
        v49.DecisionMethod = v50;
        v49.ViewActivityButton = v7.createElement(l_Button_0, {
            text = l_translations_0.viewMoreButton, 
            onActivated = v37, 
            variant = l_ButtonVariant_0.Standard, 
            size = l_InputSize_0.Small, 
            width = UDim.new(1, 0), 
            LayoutOrder = 3
        });
        v49.ReportMistakeDescription = not v25 and v35 ~= l_INTERVENTION_TYPES_0.Deleted and v7.createElement(l_Text_0, {
            tag = "auto-xy text-body-medium text-align-x-left text-wrap", 
            Text = l_translations_0.reportMistakeDescriptionV2, 
            RichText = true, 
            LayoutOrder = 4
        });
        v49.ReportMistakeButton = not v25 and v35 ~= l_INTERVENTION_TYPES_0.Deleted and v7.createElement(l_Button_0, {
            text = l_translations_0.reportMistakeButton, 
            onActivated = v37, 
            variant = l_ButtonVariant_0.Standard, 
            size = l_InputSize_0.Small, 
            width = UDim.new(1, 0), 
            LayoutOrder = 5
        });
        v45.EvidenceCard = l_createElement_2(l_l_View_0_2, v48, v49);
        v45.InterventionId = v7.createElement(l_Text_0, {
            tag = "auto-xy text-caption-medium text-align-x-left text-wrap content-muted", 
            Text = l_interventionId_0, 
            LayoutOrder = 2
        });
        v41.Content = l_createElement_1(l_l_View_0_1, v44, v45);
        return l_createElement_0(l_l_View_0_0, v40, v41);
    end)
};