local l_script_FirstAncestor_0 = script:FindFirstAncestor("NotApprovedPage");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local _ = require(l_script_FirstAncestor_0.Common.Types);
local l_EVENT_TYPES_0 = require(l_Parent_0.NotApprovedPageState).Constants.EVENT_TYPES;
local v4 = require(l_Parent_0.React);
local l_useCallback_0 = v4.useCallback;
local l_AppPage_0 = require(l_Parent_0.RobloxAppEnums).AppPage;
local l_NavigateDown_0 = require(l_Parent_0.NavigationRodux).Thunks.NavigateDown;
local l_UrlBuilder_0 = require(l_Parent_0.UrlBuilder).UrlBuilder;
local l_dependencyArray_0 = require(l_Parent_0.RoactUtils).Hooks.dependencyArray;
local v10 = require(l_Parent_0.Foundation);
local l_Text_0 = v10.Text;
local l_View_0 = v10.View;
local l_Button_0 = v10.Button;
local l_ButtonVariant_0 = v10.Enums.ButtonVariant;
local l_InputSize_0 = v10.Enums.InputSize;
local v16 = require(l_script_FirstAncestor_0.Utils.sendNotApprovedPageEvent);
local l_useNotApprovedPageContext_0 = require(l_script_FirstAncestor_0.Contexts.NotApprovedPageContext).useNotApprovedPageContext;
local v18 = require(l_script_FirstAncestor_0.Utils.useOpenLink);
local l_STATIC_PAGE_NAMES_0 = require(l_script_FirstAncestor_0.Components.pageItemConfigs.PageItemConfigUtils).STATIC_PAGE_NAMES;
local v20 = require(l_script_FirstAncestor_0.Flags.FFlagEnableNapNewWebView);
return {
    getIsVisible = function(_, _, v23, v24) --[[ Line: 86 ]] --[[ Name: getIsVisible ]]
        -- upvalues: l_STATIC_PAGE_NAMES_0 (copy)
        local v25 = if v24 then v24.educational_pass_eligible else false;
        local v26 = v23 or l_STATIC_PAGE_NAMES_0.Unknown;
        local v27 = true;
        if v26 ~= l_STATIC_PAGE_NAMES_0.SecondChanceIntro then
            v27 = not v25;
        end;
        return v27;
    end, 
    renderComponent = v4.memo(function(v28) --[[ Line: 41 ]] --[[ Name: ReportMistake ]]
        -- upvalues: l_useNotApprovedPageContext_0 (copy), v20 (copy), v18 (copy), l_UrlBuilder_0 (copy), l_useCallback_0 (copy), v16 (copy), l_EVENT_TYPES_0 (copy), l_NavigateDown_0 (copy), l_AppPage_0 (copy), l_dependencyArray_0 (copy), v4 (copy), l_View_0 (copy), l_Text_0 (copy), l_Button_0 (copy), l_ButtonVariant_0 (copy), l_InputSize_0 (copy)
        local l_translations_0 = l_useNotApprovedPageContext_0().translations;
        local l_dispatch_0 = v28.dispatch;
        local v31 = if v20 then v18(l_UrlBuilder_0.static.appealsPortal.main(), l_translations_0.appealsPortalTitle) else nil;
        local v32 = l_useCallback_0(function() --[[ Line: 49 ]]
            -- upvalues: v16 (ref), l_EVENT_TYPES_0 (ref), v20 (ref), v31 (copy), l_dispatch_0 (copy), l_NavigateDown_0 (ref), l_AppPage_0 (ref), l_UrlBuilder_0 (ref), l_translations_0 (copy)
            v16({
                eventType = l_EVENT_TYPES_0.AppealsPortalClicked
            });
            if v20 and v31 then
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
        return v4.createElement(l_View_0, {
            tag = "size-full-0 auto-y col gap-medium", 
            LayoutOrder = v28.layoutOrder
        }, {
            Content = v4.createElement(l_Text_0, {
                Text = l_translations_0.reportMistakeDescriptionV3, 
                tag = "auto-xy text-body-large text-align-x-left text-wrap", 
                LayoutOrder = 2
            }), 
            ReportMistakeButton = v4.createElement(l_Button_0, {
                text = l_translations_0.sendAppealButton, 
                onActivated = v32, 
                variant = l_ButtonVariant_0.Standard, 
                size = l_InputSize_0.Small, 
                width = UDim.new(1, 0), 
                LayoutOrder = 3
            })
        });
    end)
};