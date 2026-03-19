local l_Parent_0 = script:FindFirstAncestor("InExperienceDetailsPrompt").Parent;
local v1 = require(l_Parent_0.React);
local v2 = require(l_Parent_0.Foundation);
local l_View_0 = v2.View;
local l_Icon_0 = v2.Icon;
local l_Enums_0 = v2.Enums;
local l_Text_0 = v2.Text;
local l_useTokens_0 = v2.Hooks.useTokens;
local l_useLocalization_0 = require(l_Parent_0.Localization).Hooks.useLocalization;
local l_EnumGameDetailErrorTypes_0 = require(l_Parent_0.DiscoveryTypes).EnumGameDetailErrorTypes;
local function _(v10, v11) --[[ Line: 18 ]] --[[ Name: getErrorDisplayMessage ]]
    -- upvalues: l_EnumGameDetailErrorTypes_0 (copy)
    if v10 == l_EnumGameDetailErrorTypes_0.ExperienceUnavailable then
        return v11.experienceUnavailable;
    else
        return v11.noInternet;
    end;
end;
return function(v13) --[[ Line: 25 ]] --[[ Name: InExperienceDetailsPromptErrorContent ]]
    -- upvalues: l_useTokens_0 (copy), l_useLocalization_0 (copy), l_EnumGameDetailErrorTypes_0 (copy), v1 (copy), l_View_0 (copy), l_Icon_0 (copy), l_Enums_0 (copy), l_Text_0 (copy)
    local v14 = l_useTokens_0();
    local v15 = l_useLocalization_0({
        experienceUnavailable = "Feature.GamePage.QuickLaunch.LaunchError.TemporarilyUnavailable", 
        noInternet = "Feature.EmptyStatePage.Message.NoInternet"
    });
    local v16 = if v13.errorType == l_EnumGameDetailErrorTypes_0.ExperienceUnavailable then v15.experienceUnavailable else v15.noInternet;
    return v1.createElement(l_View_0, {
        tag = "col size-full-0 auto-y items-center gap-medium padding-bottom-large padding-top-large"
    }, {
        Icon = v1.createElement(l_Icon_0, {
            name = l_Enums_0.IconName.TriangleExclamation, 
            size = v14.Size.Size_1700, 
            layoutOrder = 1
        }), 
        Message = v1.createElement(l_Text_0, {
            Text = v16, 
            tag = "text-body-large size-full-0 auto-y text-center text-wrap", 
            layoutOrder = 2
        })
    });
end;