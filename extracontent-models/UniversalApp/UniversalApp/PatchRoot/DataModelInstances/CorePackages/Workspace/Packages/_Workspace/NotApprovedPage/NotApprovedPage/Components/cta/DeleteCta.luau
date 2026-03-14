local l_script_FirstAncestor_0 = script:FindFirstAncestor("NotApprovedPage");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local l_Fragment_0 = v2.Fragment;
local l_useState_0 = v2.useState;
local l_useCallback_0 = v2.useCallback;
local l_dependencyArray_0 = require(l_Parent_0.RoactUtils).Hooks.dependencyArray;
local l_UrlBuilder_0 = require(l_Parent_0.UrlBuilder).UrlBuilder;
local v8 = require(l_Parent_0.Foundation);
local l_Button_0 = v8.Button;
local l_ButtonVariant_0 = v8.Enums.ButtonVariant;
local l_InputSize_0 = v8.Enums.InputSize;
local l_useNotApprovedPageContext_0 = require(l_script_FirstAncestor_0.Contexts.NotApprovedPageContext).useNotApprovedPageContext;
local v13 = require(l_script_FirstAncestor_0.Utils.sendNotApprovedPageEvent);
local v14 = require(l_script_FirstAncestor_0.Utils.useLogout);
local v15 = require(l_script_FirstAncestor_0.Utils.useOpenLink);
local l_EVENT_TYPES_0 = require(l_Parent_0.NotApprovedPageState).Constants.EVENT_TYPES;
local _ = require(l_script_FirstAncestor_0.Components.pageItemConfigs.PageItemConfigUtils);
local l_FFlagEnableNapDedicatedPage_0 = require(l_Parent_0.SharedFlags).FFlagEnableNapDedicatedPage;
return v2.memo(function(v19) --[[ Line: 38 ]] --[[ Name: DeleteCta ]]
    -- upvalues: l_useNotApprovedPageContext_0 (copy), v15 (copy), l_UrlBuilder_0 (copy), l_useState_0 (copy), v14 (copy), l_useCallback_0 (copy), v13 (copy), l_EVENT_TYPES_0 (copy), l_dependencyArray_0 (copy), v2 (copy), l_Fragment_0 (copy), l_Button_0 (copy), l_ButtonVariant_0 (copy), l_InputSize_0 (copy), l_FFlagEnableNapDedicatedPage_0 (copy)
    local l_translations_0 = l_useNotApprovedPageContext_0().translations;
    local v21 = v15(l_UrlBuilder_0.static.appealsPortal.main(), l_translations_0.appealsPortalTitle);
    local v22, v23 = l_useState_0(false);
    local v24 = v14(v23, v19.LogoutThunk);
    local v25 = l_useCallback_0(function() --[[ Line: 45 ]]
        -- upvalues: v13 (ref), l_EVENT_TYPES_0 (ref), v21 (copy)
        v13({
            eventType = l_EVENT_TYPES_0.AppealsPortalClicked
        });
        v21();
    end, l_dependencyArray_0(v21));
    return v2.createElement(l_Fragment_0, nil, {
        AppealButton = v2.createElement(l_Button_0, {
            text = l_translations_0.reportMistakeButton, 
            onActivated = v25, 
            variant = l_ButtonVariant_0.SoftEmphasis, 
            size = l_InputSize_0.Medium, 
            width = UDim.new(1, 0), 
            LayoutOrder = 1
        }), 
        LogoutButton = not l_FFlagEnableNapDedicatedPage_0 and v2.createElement(l_Button_0, {
            text = l_translations_0.logoutButton, 
            onActivated = v24, 
            variant = l_ButtonVariant_0.Text, 
            width = UDim.new(1, 0), 
            isLoading = v22, 
            LayoutOrder = 2
        })
    });
end);