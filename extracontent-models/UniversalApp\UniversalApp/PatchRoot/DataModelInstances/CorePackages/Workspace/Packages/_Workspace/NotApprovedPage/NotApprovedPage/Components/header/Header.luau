local l_script_FirstAncestor_0 = script:FindFirstAncestor("NotApprovedPage");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_Parent_0.Foundation);
local l_Icon_0 = v3.Icon;
local l_IconSize_0 = v3.Enums.IconSize;
local l_Text_0 = v3.Text;
local l_useTokens_0 = v3.Hooks.useTokens;
local l_View_0 = v3.View;
local v9 = require(l_Parent_0.BuilderIcons);
local l_CircleSlash_0 = v9.Icon.CircleSlash;
local l_IconVariant_0 = v9.IconVariant;
local l_TriangleExclamation_0 = v9.Icon.TriangleExclamation;
local v13 = require(l_script_FirstAncestor_0.Components.header.BackButton);
local v14 = require(l_script_FirstAncestor_0.Components.header.HeaderPopoverMenu);
local v15 = require(l_script_FirstAncestor_0.Components.HeaderProgressBar);
local _ = require(l_script_FirstAncestor_0.Common.Types);
local l_usePageNavigation_0 = require(l_script_FirstAncestor_0.Contexts.PageNavigationContext).usePageNavigation;
local l_useNotApprovedPageContext_0 = require(l_script_FirstAncestor_0.Contexts.NotApprovedPageContext).useNotApprovedPageContext;
local l_Constants_0 = require(l_Parent_0.NotApprovedPageState).Constants;
local l_INTERVENTION_TYPES_0 = l_Constants_0.INTERVENTION_TYPES;
local l_PUNISHMENT_TYPE_TO_INTERVENTION_MAP_0 = l_Constants_0.PUNISHMENT_TYPE_TO_INTERVENTION_MAP;
return v2.memo(function(v22) --[[ Line: 43 ]] --[[ Name: Header ]]
    -- upvalues: l_useTokens_0 (copy), l_usePageNavigation_0 (copy), l_useNotApprovedPageContext_0 (copy), l_PUNISHMENT_TYPE_TO_INTERVENTION_MAP_0 (copy), l_INTERVENTION_TYPES_0 (copy), l_CircleSlash_0 (copy), l_TriangleExclamation_0 (copy), v2 (copy), l_View_0 (copy), l_Icon_0 (copy), l_IconSize_0 (copy), l_IconVariant_0 (copy), l_Text_0 (copy), v14 (copy), v13 (copy), v15 (copy)
    local v23 = l_useTokens_0();
    local v24 = l_usePageNavigation_0();
    local l_translations_0 = l_useNotApprovedPageContext_0().translations;
    local l_isFirstPage_0 = v24.isFirstPage;
    local l_totalPages_0 = v24.totalPages;
    local l_punishmentTypeDescription_0 = v22.moderationDetail.punishmentTypeDescription;
    local l_verificationCategory_0 = v22.moderationDetail.verificationCategory;
    local v30 = l_PUNISHMENT_TYPE_TO_INTERVENTION_MAP_0[l_punishmentTypeDescription_0] or l_INTERVENTION_TYPES_0.Banned;
    local v31 = v30 == l_INTERVENTION_TYPES_0.Warning;
    local v32 = v30 == l_INTERVENTION_TYPES_0.Deleted;
    local v33 = l_verificationCategory_0 and l_verificationCategory_0 ~= "";
    local v34 = if v33 then l_translations_0["Feature.NotApproved.Heading.Suspended"] else l_translations_0[l_punishmentTypeDescription_0];
    if not v34 or v34 == "" then
        v34 = l_translations_0["Feature.NotApproved.Heading.Suspended"];
    end;
    local v35 = if v32 then l_CircleSlash_0 else l_TriangleExclamation_0;
    local v36 = if not v31 or v33 then v23.Color.System.Alert else v23.Color.System.Warning;
    if l_isFirstPage_0 then
        return v2.createElement(l_View_0, {
            tag = "size-full-0 auto-y row flex-between items-center gap-medium padding-xxlarge"
        }, {
            LeftContent = v2.createElement(l_View_0, {
                tag = "auto-xy row gap-small items-center wrap shrink", 
                LayoutOrder = 1
            }, {
                PunishmentIcon = v2.createElement(l_Icon_0, {
                    name = v35, 
                    size = l_IconSize_0.Large, 
                    variant = l_IconVariant_0.Regular, 
                    style = v36, 
                    LayoutOrder = 1
                }), 
                PunishmentLabel = v2.createElement(l_Text_0, {
                    tag = "auto-xy text-heading-small content-emphasis text-wrap text-align-x-left", 
                    Text = v34, 
                    LayoutOrder = 2
                })
            }), 
            RightContent = v2.createElement(l_View_0, {
                tag = "auto-xy shrink-0", 
                LayoutOrder = 2
            }, {
                PopoverMenu = v2.createElement(v14, {
                    LogoutThunk = v22.LogoutThunk
                })
            })
        });
    else
        local l_createElement_0 = v2.createElement;
        local l_l_View_0_0 = l_View_0;
        local v39 = {
            tag = "size-full-0 auto-y col gap-xlarge items-start padding-y-xxlarge padding-right-xxlarge"
        };
        local v40 = {
            BackButtonContainer = v2.createElement(l_View_0, {
                tag = "auto-xy padding-left-medium", 
                LayoutOrder = 1
            }, {
                BackButton = v2.createElement(v13)
            })
        };
        local v41 = false;
        if l_totalPages_0 > 2 then
            v41 = v2.createElement(l_View_0, {
                tag = "size-full-0 auto-y padding-left-xxlarge", 
                LayoutOrder = 2
            }, {
                ProgressBar = v2.createElement(v15)
            });
        end;
        v40.ProgressBarContainer = v41;
        return l_createElement_0(l_l_View_0_0, v39, v40);
    end;
end);