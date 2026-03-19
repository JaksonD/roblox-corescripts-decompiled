local l_ContentProvider_0 = game:GetService("ContentProvider");
local l_script_FirstAncestor_0 = script:FindFirstAncestor("LoginV2");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v3 = require(l_Parent_0.ArgCheck);
local v4 = require(l_Parent_0.AuthAnalytics);
local v5 = require(l_Parent_0.React);
local v6 = require(l_Parent_0.SharedFlags);
local l_useDesignTokens_0 = require(l_Parent_0.Style).useDesignTokens;
local l_useLocalization_0 = require(l_Parent_0.Localization).Hooks.useLocalization;
local l_TextButton_0 = require(l_Parent_0.UIBlox).App.Button.TextButton;
local l_GetFFlagEnableLuafiedRecoveryFlow_0 = v6.GetFFlagEnableLuafiedRecoveryFlow;
local l_enrolledInLuafiedRecoveryExperiment_0 = require(l_Parent_0.AuthCommon).Experiments.enrolledInLuafiedRecoveryExperiment;
local l_authButtonClick_0 = v4.Events.authButtonClick;
local l_EventStreamConstants_0 = v4.EventStreamConstants;
local v14 = require(l_script_FirstAncestor_0.Context.LoginContext);
return function(v15) --[[ Line: 34 ]] --[[ Name: NeedHelpButton ]]
    -- upvalues: v5 (copy), v14 (copy), l_useDesignTokens_0 (copy), l_useLocalization_0 (copy), v3 (copy), l_authButtonClick_0 (copy), l_EventStreamConstants_0 (copy), l_GetFFlagEnableLuafiedRecoveryFlow_0 (copy), l_enrolledInLuafiedRecoveryExperiment_0 (copy), l_ContentProvider_0 (copy), l_TextButton_0 (copy)
    local v16 = v5.useContext(v14);
    local v17 = l_useDesignTokens_0();
    local v18 = l_useLocalization_0({
        needHelpButtonText = v15.textKey
    });
    local function v21() --[[ Line: 42 ]]
        -- upvalues: v15 (copy), v3 (ref), l_authButtonClick_0 (ref), l_EventStreamConstants_0 (ref), l_GetFFlagEnableLuafiedRecoveryFlow_0 (ref), l_enrolledInLuafiedRecoveryExperiment_0 (ref), v16 (copy), l_ContentProvider_0 (ref)
        if v15.originPage then
            local v19 = v3.isNonEmptyString(v15.originPage, "props.originPage");
            l_authButtonClick_0(v19, l_EventStreamConstants_0.Button.NeedHelpLink, nil, nil);
        end;
        if l_GetFFlagEnableLuafiedRecoveryFlow_0() and l_enrolledInLuafiedRecoveryExperiment_0() then
            v16.utils.openAccountRecovery(v15.identifierAutofill or "");
            return;
        else
            local v20 = l_ContentProvider_0.BaseUrl .. "login/forgot-password-or-username";
            v16.utils.openWebView(v20);
            return;
        end;
    end;
    return v5.createElement("Frame", {
        BackgroundTransparency = 1, 
        LayoutOrder = v15.layoutOrder, 
        Size = UDim2.new(1, 0, 0, 0), 
        AutomaticSize = Enum.AutomaticSize.Y
    }, {
        UIPadding = v5.createElement("UIPadding", {
            PaddingTop = UDim.new(0, v17.Global.Space_150), 
            PaddingBottom = UDim.new(0, v17.Global.Space_150)
        }), 
        Button = v5.createElement(l_TextButton_0, {
            text = v18.needHelpButtonText, 
            isDisabled = v15.isDisabled, 
            onActivated = v21, 
            verticalPadding = v17.Global.Space_200, 
            fontStyle = "CaptionHeader", 
            colorStyleDefault = "TextDefault", 
            position = UDim2.new(0.5, 0, 0.5, 0), 
            anchorPoint = Vector2.new(0.5, 0.5)
        })
    });
end;