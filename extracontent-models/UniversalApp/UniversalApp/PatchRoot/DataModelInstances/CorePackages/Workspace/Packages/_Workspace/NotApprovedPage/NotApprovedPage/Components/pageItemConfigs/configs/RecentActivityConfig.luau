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
local v24 = {
    v16, 
    v17, 
    v18
};
return {
    getIsVisible = function() --[[ Line: 146 ]] --[[ Name: getIsVisible ]]
        return true;
    end, 
    renderComponent = v4.memo(function(v25) --[[ Line: 59 ]] --[[ Name: RecentActivity ]]
        -- upvalues: l_useNotApprovedPageContext_0 (copy), v22 (copy), v20 (copy), l_UrlBuilder_0 (copy), l_renderPageItemsFromList_0 (copy), v24 (copy), l_useCallback_0 (copy), v2 (copy), l_EVENT_TYPES_0 (copy), l_NavigateDown_0 (copy), l_AppPage_0 (copy), l_dependencyArray_0 (copy), v4 (copy), l_View_0 (copy), l_Text_0 (copy), l_FFlagEnableNapDedicatedPage_0 (copy), l_Button_0 (copy), l_ButtonVariant_0 (copy), l_InputSize_0 (copy)
        local l_translations_0 = l_useNotApprovedPageContext_0().translations;
        local v27 = if v22 then v20(l_UrlBuilder_0.static.appealsPortal.main(), l_translations_0.appealsPortalTitle) else nil;
        local l_interventionId_0 = v25.moderationDetail.interventionId;
        local l_consequenceTransparencyMessage_0 = v25.moderationDetail.consequenceTransparencyMessage;
        local l_dispatch_0 = v25.dispatch;
        local v31 = l_renderPageItemsFromList_0(v24, v25.moderationDetail, v25.dispatch);
        local v32 = l_useCallback_0(function() --[[ Line: 73 ]]
            -- upvalues: v2 (ref), l_EVENT_TYPES_0 (ref), v22 (ref), v27 (copy), l_dispatch_0 (copy), l_NavigateDown_0 (ref), l_AppPage_0 (ref), l_UrlBuilder_0 (ref), l_translations_0 (copy)
            v2({
                eventType = l_EVENT_TYPES_0.AppealsPortalClicked
            });
            if v22 and v27 then
                v27();
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
        end, l_dependencyArray_0(l_dispatch_0, v27));
        local l_createElement_0 = v4.createElement;
        local l_l_View_0_0 = l_View_0;
        local v35 = {
            tag = "size-full-0 auto-y col gap-medium", 
            LayoutOrder = v25.layoutOrder
        };
        local v36 = {
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
        local v39 = {
            tag = "size-full-0 auto-y col gap-xsmall", 
            LayoutOrder = 2
        };
        local v40 = {};
        local l_createElement_2 = v4.createElement;
        local l_l_View_0_2 = l_View_0;
        local v43 = {
            tag = "size-full-0 auto-y col bg-shift-100 radius-medium padding-large gap-small", 
            LayoutOrder = 1
        };
        local v44 = {
            Evidence = v4.createElement(l_View_0, {
                tag = "size-full-0 auto-y col", 
                LayoutOrder = 1
            }, unpack(v31))
        };
        local v45 = false;
        if l_consequenceTransparencyMessage_0 ~= "" then
            v45 = v4.createElement(l_Text_0, {
                tag = "auto-xy text-body-medium text-align-x-left text-wrap", 
                Text = ("<b>%*:</b>\n%*"):format(l_translations_0.decisionMethodLabel, l_consequenceTransparencyMessage_0), 
                RichText = true, 
                LayoutOrder = 2
            });
        end;
        v44.DecisionMethod = v45;
        v44.ViewActivityButton = v4.createElement(l_Button_0, {
            text = l_translations_0.viewMoreButton, 
            onActivated = v32, 
            variant = l_ButtonVariant_0.Standard, 
            size = l_InputSize_0.Small, 
            width = UDim.new(1, 0), 
            LayoutOrder = 3
        });
        v40.EvidenceCard = l_createElement_2(l_l_View_0_2, v43, v44);
        v40.InterventionId = v4.createElement(l_Text_0, {
            tag = "auto-xy text-caption-medium text-align-x-left text-wrap content-muted", 
            Text = l_interventionId_0, 
            LayoutOrder = 2
        });
        v36.Content = l_createElement_1(l_l_View_0_1, v39, v40);
        return l_createElement_0(l_l_View_0_0, v35, v36);
    end)
};