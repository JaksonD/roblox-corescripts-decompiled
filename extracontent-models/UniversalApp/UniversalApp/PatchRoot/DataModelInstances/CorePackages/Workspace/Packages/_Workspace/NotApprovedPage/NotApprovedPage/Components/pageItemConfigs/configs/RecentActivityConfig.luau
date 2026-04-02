local l_script_FirstAncestor_0 = script:FindFirstAncestor("NotApprovedPage");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_script_FirstAncestor_0.Utils.sendNotApprovedPageEvent);
local l_EVENT_TYPES_0 = require(l_Parent_0.NotApprovedPageState).Constants.EVENT_TYPES;
local v4 = require(l_Parent_0.React);
local l_useCallback_0 = v4.useCallback;
local l_AppPage_0 = require(l_Parent_0.RobloxAppEnums).AppPage;
local l_NavigateDown_0 = require(l_Parent_0.NavigationRodux).Thunks.NavigateDown;
local l_UrlBuilder_0 = require(l_Parent_0.UrlBuilder).UrlBuilder;
local v9 = require(l_Parent_0.Foundation);
local l_Text_0 = v9.Text;
local l_View_0 = v9.View;
local l_Button_0 = v9.Button;
local l_ButtonVariant_0 = v9.Enums.ButtonVariant;
local l_InputSize_0 = v9.Enums.InputSize;
local l_renderPageItemsFromList_0 = require(l_script_FirstAncestor_0.Components.pageItemConfigs.PageItemConfigUtils).renderPageItemsFromList;
local v16 = require(l_script_FirstAncestor_0.Components.pageItemConfigs.configs.ViolationEvidenceConfig);
local v17 = require(l_script_FirstAncestor_0.Components.pageItemConfigs.configs.BadUtterancesConfig);
local v18 = require(l_script_FirstAncestor_0.Components.pageItemConfigs.configs.SimpleModeratorNoteConfig);
local l_useNotApprovedPageContext_0 = require(l_script_FirstAncestor_0.Contexts.NotApprovedPageContext).useNotApprovedPageContext;
local v20 = require(l_script_FirstAncestor_0.Utils.useOpenLink);
local l_dependencyArray_0 = require(l_Parent_0.RoactUtils).Hooks.dependencyArray;
local v22 = require(l_script_FirstAncestor_0.Flags.FFlagEnableNapNewWebView);
local l_FFlagEnableNapDedicatedPage_0 = require(l_Parent_0.SharedFlags).FFlagEnableNapDedicatedPage;
local l_FFlagRemoveDependencyArrayAntipattern_0 = require(l_Parent_0.SharedFlags).FFlagRemoveDependencyArrayAntipattern;
local v25 = {
    v16, 
    v17, 
    v18
};
return {
    getIsVisible = function() --[[ Line: 153 ]] --[[ Name: getIsVisible ]]
        return true;
    end, 
    renderComponent = v4.memo(function(v26) --[[ Line: 61 ]] --[[ Name: RecentActivity ]]
        -- upvalues: l_useNotApprovedPageContext_0 (copy), v22 (copy), v20 (copy), l_UrlBuilder_0 (copy), l_renderPageItemsFromList_0 (copy), v25 (copy), l_useCallback_0 (copy), v2 (copy), l_EVENT_TYPES_0 (copy), l_NavigateDown_0 (copy), l_AppPage_0 (copy), l_FFlagRemoveDependencyArrayAntipattern_0 (copy), l_dependencyArray_0 (copy), v4 (copy), l_View_0 (copy), l_Text_0 (copy), l_FFlagEnableNapDedicatedPage_0 (copy), l_Button_0 (copy), l_ButtonVariant_0 (copy), l_InputSize_0 (copy)
        local l_translations_0 = l_useNotApprovedPageContext_0().translations;
        local v28 = if v22 then v20(l_UrlBuilder_0.static.appealsPortal.main(), l_translations_0.appealsPortalTitle) else nil;
        local l_interventionId_0 = v26.moderationDetail.interventionId;
        local l_consequenceTransparencyMessage_0 = v26.moderationDetail.consequenceTransparencyMessage;
        local l_dispatch_0 = v26.dispatch;
        local v32 = l_renderPageItemsFromList_0(v25, v26.moderationDetail, v26.dispatch);
        local v33 = l_useCallback_0(function() --[[ Line: 76 ]]
            -- upvalues: v2 (ref), l_EVENT_TYPES_0 (ref), v22 (ref), v28 (copy), l_dispatch_0 (copy), l_NavigateDown_0 (ref), l_AppPage_0 (ref), l_UrlBuilder_0 (ref), l_translations_0 (copy)
            v2({
                eventType = l_EVENT_TYPES_0.AppealsPortalClicked
            });
            if v22 and v28 then
                v28();
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
        end, if l_FFlagRemoveDependencyArrayAntipattern_0 then {
            l_dispatch_0, 
            v28
        } else l_dependencyArray_0(l_dispatch_0, v28));
        local l_createElement_0 = v4.createElement;
        local l_l_View_0_0 = l_View_0;
        local v36 = {
            tag = "size-full-0 auto-y col gap-medium", 
            LayoutOrder = v26.layoutOrder
        };
        local v37 = {
            Heading = v4.createElement(l_Text_0, {
                tag = {
                    ["auto-xy text-title-large text-align-x-left content-emphasis"] = true, 
                    ["text-wrap"] = l_FFlagEnableNapDedicatedPage_0
                }, 
                Text = l_translations_0.latestActivityLabel, 
                LayoutOrder = 1
            })
        };
        local l_createElement_1 = v4.createElement;
        local l_l_View_0_1 = l_View_0;
        local v40 = {
            tag = "size-full-0 auto-y col gap-xsmall", 
            LayoutOrder = 2
        };
        local v41 = {};
        local l_createElement_2 = v4.createElement;
        local l_l_View_0_2 = l_View_0;
        local v44 = {
            tag = "size-full-0 auto-y col bg-shift-100 radius-medium padding-large gap-small", 
            LayoutOrder = 1
        };
        local v45 = {
            Evidence = v4.createElement(l_View_0, {
                tag = "size-full-0 auto-y col", 
                LayoutOrder = 1
            }, unpack(v32))
        };
        local v46 = false;
        if l_consequenceTransparencyMessage_0 ~= "" then
            v46 = v4.createElement(l_Text_0, {
                tag = "auto-xy text-body-medium text-align-x-left text-wrap", 
                Text = ("<b>%*:</b>\n%*"):format(l_translations_0.decisionMethodLabel, l_consequenceTransparencyMessage_0), 
                RichText = true, 
                LayoutOrder = 2
            });
        end;
        v45.DecisionMethod = v46;
        v45.ViewActivityButton = v4.createElement(l_Button_0, {
            text = l_translations_0.viewMoreButton, 
            onActivated = v33, 
            variant = l_ButtonVariant_0.Standard, 
            size = l_InputSize_0.Small, 
            width = UDim.new(1, 0), 
            LayoutOrder = 3
        });
        v41.EvidenceCard = l_createElement_2(l_l_View_0_2, v44, v45);
        v41.InterventionId = v4.createElement(l_Text_0, {
            tag = "auto-xy text-caption-medium text-align-x-left text-wrap content-muted", 
            Text = l_interventionId_0, 
            LayoutOrder = 2
        });
        v37.Content = l_createElement_1(l_l_View_0_1, v40, v41);
        return l_createElement_0(l_l_View_0_0, v36, v37);
    end)
};