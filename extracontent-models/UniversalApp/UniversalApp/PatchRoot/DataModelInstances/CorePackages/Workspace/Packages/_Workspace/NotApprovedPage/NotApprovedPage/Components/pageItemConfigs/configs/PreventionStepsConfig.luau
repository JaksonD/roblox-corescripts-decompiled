local l_script_FirstAncestor_0 = script:FindFirstAncestor("NotApprovedPage");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_script_FirstAncestor_0.Utils.sendNotApprovedPageEvent);
local _ = require(l_script_FirstAncestor_0.Common.Types);
local l_Constants_0 = require(l_Parent_0.NotApprovedPageState).Constants;
local l_INTERVENTION_TYPES_0 = l_Constants_0.INTERVENTION_TYPES;
local l_EVENT_TYPES_0 = l_Constants_0.EVENT_TYPES;
local l_PUNISHMENT_TYPE_TO_INTERVENTION_MAP_0 = l_Constants_0.PUNISHMENT_TYPE_TO_INTERVENTION_MAP;
local v8 = require(l_Parent_0.React);
local l_AppPage_0 = require(l_Parent_0.RobloxAppEnums).AppPage;
local l_NavigateDown_0 = require(l_Parent_0.NavigationRodux).Thunks.NavigateDown;
local l_UrlBuilder_0 = require(l_Parent_0.UrlBuilder).UrlBuilder;
local l_useCallback_0 = v8.useCallback;
local l_dependencyArray_0 = require(l_Parent_0.RoactUtils).Hooks.dependencyArray;
local v14 = require(l_Parent_0.Foundation);
local l_Text_0 = v14.Text;
local l_View_0 = v14.View;
local l_Button_0 = v14.Button;
local l_ButtonVariant_0 = v14.Enums.ButtonVariant;
local l_InputSize_0 = v14.Enums.InputSize;
local l_useNotApprovedPageContext_0 = require(l_script_FirstAncestor_0.Contexts.NotApprovedPageContext).useNotApprovedPageContext;
local v21 = require(l_script_FirstAncestor_0.Utils.useOpenLink);
local _ = require(l_script_FirstAncestor_0.Components.pageItemConfigs.PageItemConfigUtils);
local v23 = require(l_script_FirstAncestor_0.Flags.FFlagEnableNapNewWebView);
local l_FFlagRemoveDependencyArrayAntipattern_0 = require(l_Parent_0.SharedFlags).FFlagRemoveDependencyArrayAntipattern;
return {
    getIsVisible = function(v25) --[[ Line: 127 ]] --[[ Name: getIsVisible ]]
        -- upvalues: l_PUNISHMENT_TYPE_TO_INTERVENTION_MAP_0 (copy), l_INTERVENTION_TYPES_0 (copy)
        return l_PUNISHMENT_TYPE_TO_INTERVENTION_MAP_0[v25.punishmentTypeDescription] ~= l_INTERVENTION_TYPES_0.Deleted;
    end, 
    renderComponent = v8.memo(function(v26) --[[ Line: 45 ]] --[[ Name: PreventionSteps ]]
        -- upvalues: l_useNotApprovedPageContext_0 (copy), v23 (copy), v21 (copy), l_UrlBuilder_0 (copy), l_useCallback_0 (copy), v2 (copy), l_EVENT_TYPES_0 (copy), l_NavigateDown_0 (copy), l_AppPage_0 (copy), l_FFlagRemoveDependencyArrayAntipattern_0 (copy), l_dependencyArray_0 (copy), v8 (copy), l_View_0 (copy), l_Text_0 (copy), l_Button_0 (copy), l_ButtonVariant_0 (copy), l_InputSize_0 (copy)
        local l_translations_0 = l_useNotApprovedPageContext_0().translations;
        local l_dispatch_0 = v26.dispatch;
        local l_hasEducationalPages_0 = v26.hasEducationalPages;
        local l_showUGCAvatarGuidelinesLink_0 = v26.moderationDetail.showUGCAvatarGuidelinesLink;
        local v31 = if v23 then v21(if l_showUGCAvatarGuidelinesLink_0 then l_UrlBuilder_0.static.creatorHub() .. "/docs/marketplace/marketplace-policy#general-creation-guidelines" else l_UrlBuilder_0.static.about.guidelines(), if l_showUGCAvatarGuidelinesLink_0 then l_translations_0.avatarGuidelinesLabel else l_translations_0.communityStandardsLabel) else nil;
        local v32 = l_useCallback_0(function() --[[ Line: 64 ]]
            -- upvalues: v2 (ref), l_showUGCAvatarGuidelinesLink_0 (copy), l_EVENT_TYPES_0 (ref), v23 (ref), v31 (copy), l_dispatch_0 (copy), l_NavigateDown_0 (ref), l_AppPage_0 (ref), l_UrlBuilder_0 (ref), l_translations_0 (copy)
            v2({
                eventType = if l_showUGCAvatarGuidelinesLink_0 then l_EVENT_TYPES_0.UGCGuidelinesClicked else l_EVENT_TYPES_0.CommunityGuidelineClicked
            });
            if v23 and v31 then
                v31();
                return;
            else
                l_dispatch_0(l_NavigateDown_0({
                    name = l_AppPage_0.GenericWebPage, 
                    detail = if l_showUGCAvatarGuidelinesLink_0 then l_UrlBuilder_0.static.creatorHub() .. "/docs/marketplace/marketplace-policy#general-creation-guidelines" else l_UrlBuilder_0.static.about.guidelines(), 
                    extraProps = {
                        title = if l_showUGCAvatarGuidelinesLink_0 then l_translations_0.avatarGuidelinesLabel else l_translations_0.communityStandardsLabel
                    }
                }));
                return;
            end;
        end, if l_FFlagRemoveDependencyArrayAntipattern_0 then {
            l_dispatch_0, 
            v31
        } else l_dependencyArray_0(l_dispatch_0, v31));
        return v8.createElement(l_View_0, {
            tag = "col size-full-0 auto-y gap-medium", 
            LayoutOrder = v26.layoutOrder
        }, {
            Heading = v8.createElement(l_Text_0, {
                Text = l_translations_0.preventionStepsHeading, 
                tag = "auto-xy text-align-x-left text-wrap text-heading-medium content-emphasis", 
                LayoutOrder = 1
            }), 
            Content = v8.createElement(l_View_0, {
                tag = "size-full-0 auto-y col gap-medium", 
                LayoutOrder = 3
            }, {
                Description = v8.createElement(l_Text_0, {
                    Text = l_translations_0.foreshadowDescription, 
                    tag = "auto-xy text-body-large text-wrap text-align-x-left", 
                    LayoutOrder = 3
                }), 
                GuidelinesLink = (not l_hasEducationalPages_0 or l_showUGCAvatarGuidelinesLink_0) and v8.createElement(l_Button_0, {
                    text = if l_showUGCAvatarGuidelinesLink_0 then l_translations_0.avatarGuidelinesLabel else l_translations_0.viewRulesButton, 
                    onActivated = v32, 
                    variant = l_ButtonVariant_0.Standard, 
                    size = l_InputSize_0.Small, 
                    width = UDim.new(1, 0), 
                    LayoutOrder = 4
                })
            })
        });
    end)
};