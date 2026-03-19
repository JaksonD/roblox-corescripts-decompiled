local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local l_UserInputService_0 = game:GetService("UserInputService");
local v3 = require(l_CorePackages_0.Packages.Roact);
local v4 = require(l_CorePackages_0.Workspace.Packages.AuthCommon);
local l_Text_0 = require(l_CorePackages_0.Workspace.Packages.AppCommonLib).Text;
local v6 = require(l_CorePackages_0.Packages.UIBlox);
local l_withStyle_0 = v6.Style.withStyle;
local v8 = require(l_Modules_0.LuaApp.withLocalization);
local v9 = require(l_Modules_0.LuaApp.Util.isStringEmail);
local l_isStringPhone_0 = v4.Utils.isStringPhone;
local v11 = require(l_Modules_0.LuaApp.Util.debounce);
local l_Images_0 = v6.App.ImageSet.Images;
local l_ImageSetLabel_0 = v6.Core.ImageSet.ImageSetLabel;
local l_TextBoxStateWrapper_0 = v4.Components.TextBoxStateWrapper;
local l_GenericTextBox_0 = v4.Components.GenericTextBox;
local l_PhoneNumberTextBox_0 = v4.Components.PhoneNumberTextBox;
local v17 = require(l_Modules_0.LuaApp.Enum.CredentialType);
local v18 = require(l_Modules_0.LuaApp.Services.RoactAnalyticsAuthEvents);
local v19 = require(l_Modules_0.LuaApp.EventStreamConstants);
local l_RoactServices_0 = require(l_CorePackages_0.Workspace.Packages.RoactServices).RoactServices;
local v21 = l_Images_0["icons/navigation/pushRight"];
local v22 = l_Images_0["icons/actions/accept_small"];
local v23 = UDim2.new(0, 18, 0, 18);
local v24 = v3.Component:extend("ContactInfoField");
v24.defaultProps = {
    TextBoxHeight = 36
};
v24.init = function(v25) --[[ Line: 43 ]] --[[ Name: init ]]
    -- upvalues: l_UserInputService_0 (copy), v17 (copy), v19 (copy), v11 (copy), v9 (copy), l_isStringPhone_0 (copy)
    local l_l_UserInputService_0_Platform_0 = l_UserInputService_0:GetPlatform();
    local v27 = true;
    if l_l_UserInputService_0_Platform_0 ~= Enum.Platform.IOS then
        v27 = l_l_UserInputService_0_Platform_0 == Enum.Platform.Android;
    end;
    v25:setState({
        Type = v27 and v17.PhoneNumber or v17.Email, 
        LinkHover = false, 
        EmailInput = "", 
        EmailValid = false, 
        CountryCode = {
            code = "US", 
            name = "United States", 
            prefix = "1"
        }, 
        PhoneInput = "", 
        PhoneValid = false
    });
    v25.MouseEnterLink = function() --[[ Line: 60 ]]
        -- upvalues: v25 (copy)
        v25:setState({
            LinkHover = true
        });
    end;
    v25.MouseLeaveLink = function() --[[ Line: 66 ]]
        -- upvalues: v25 (copy)
        v25:setState({
            LinkHover = false
        });
    end;
    v25.LinkActivated = function() --[[ Line: 72 ]]
        -- upvalues: v25 (copy), v17 (ref), v19 (ref)
        v25:setState({
            Type = v25.state.Type == v17.Email and v17.PhoneNumber or v17.Email, 
            Focused = false
        });
        local v28 = nil;
        if v25.state.Type == v17.Email then
            v28 = v19.Field.UseEmail;
        elseif v25.state.Type == v17.PhoneNumber then
            v28 = v19.Field.UsePhone;
        end;
        v25.props.authAnalytics.reportInteractWithAction(v19.Context.SinglePageSignUpScreen, v28, v19.ActionType.Click, "", "");
    end;
    v25.UpdateEmailInput = function(v29, v30) --[[ Line: 93 ]]
        -- upvalues: v25 (copy)
        v25:setState({
            EmailInput = v29, 
            EmailValid = v30
        });
        if v25.props.SetEmail then
            v25.props.SetEmail(v29, v30);
        end;
    end;
    v25.UpdatePhoneInput = function(v31, v32) --[[ Line: 103 ]]
        -- upvalues: v25 (copy)
        v25:setState({
            PhoneInput = v31, 
            PhoneValid = v32
        });
        if v25.props.SetPhoneNumber then
            v25.props.SetPhoneNumber(v25.state.CountryCode, v31, v32);
        end;
    end;
    v25.InputFocused = function(_) --[[ Line: 113 ]]
        -- upvalues: v25 (copy), v17 (ref), v19 (ref)
        v25:setState({
            Focused = true
        });
        local v34 = nil;
        if v25.state.Type == v17.Email then
            v34 = v19.Field.Email;
        elseif v25.state.Type == v17.PhoneNumber then
            v34 = v19.Field.Phone;
        end;
        v25.props.authAnalytics.reportInteractWithAction(v19.Context.SinglePageSignUpScreen, v34, v19.ActionType.Focus, "", "");
    end;
    v25.EmailInputChanged = v11(function(v35) --[[ Line: 133 ]]
        -- upvalues: v25 (copy), v9 (ref)
        v25.UpdateEmailInput(v35.Text, v9(v35.Text));
    end, 1.5);
    v25.EmailInputFocusLost = function(v36) --[[ Line: 137 ]]
        -- upvalues: v25 (copy), v9 (ref)
        v25:setState({
            Focused = false
        });
        v25.UpdateEmailInput(v36.Text, v9(v36.Text));
    end;
    v25.PhoneInputChanged = v11(function(v37) --[[ Line: 144 ]]
        -- upvalues: v25 (copy), l_isStringPhone_0 (ref)
        v25.UpdatePhoneInput(v37.Text, l_isStringPhone_0(v37.Text));
    end, 1.5);
    v25.PhoneInputFocusLost = function(v38) --[[ Line: 148 ]]
        -- upvalues: v25 (copy), l_isStringPhone_0 (ref)
        v25:setState({
            Focused = false
        });
        v25.UpdatePhoneInput(v38.Text, l_isStringPhone_0(v38.Text));
    end;
    v25.SetCountryCode = function(v39) --[[ Line: 155 ]]
        -- upvalues: v25 (copy)
        v25:setState({
            CountryCode = v39
        });
        if v25.props.SetPhoneNumber then
            v25.props.SetPhoneNumber(v39, v25.state.PhoneInput, v25.state.PhoneValid);
        end;
    end;
end;
v24.didMount = function(v40) --[[ Line: 165 ]] --[[ Name: didMount ]]
    v40.mounted = true;
    if v40.props.SetContactMethod then
        v40.props.SetContactMethod(v40.state.Type);
    end;
end;
v24.didUpdate = function(v41, v42, v43) --[[ Line: 172 ]] --[[ Name: didUpdate ]]
    local l_contactMethod_0 = v41.props.contactMethod;
    if l_contactMethod_0 and l_contactMethod_0 ~= v42.contactMethod and l_contactMethod_0 ~= v41.state.Type then
        v41:setState({
            Type = l_contactMethod_0
        });
    end;
    if v41.state.Type ~= v43.Type and v41.props.SetContactMethod then
        v41.props.SetContactMethod(v41.state.Type);
    end;
end;
v24.willUnmount = function(v45) --[[ Line: 187 ]] --[[ Name: willUnmount ]]
    v45.mounted = false;
end;
v24.getDerivedStateFromProps = function(v46, v47) --[[ Line: 191 ]] --[[ Name: getDerivedStateFromProps ]]
    -- upvalues: v17 (copy)
    if v46.Under13 and v47.Type ~= v17.Email then
        return {
            Type = v17.Email
        };
    else
        return nil;
    end;
end;
v24.render = function(v48) --[[ Line: 201 ]] --[[ Name: render ]]
    -- upvalues: v17 (copy), v8 (copy), l_withStyle_0 (copy), l_Text_0 (copy), v3 (copy), l_TextBoxStateWrapper_0 (copy), l_GenericTextBox_0 (copy), l_PhoneNumberTextBox_0 (copy), v22 (copy), v23 (copy), l_ImageSetLabel_0 (copy), v21 (copy)
    local v49 = v48.state.Type == v17.Email;
    local v50 = v49 and "Authentication.SignUp.Label.EmailAddress" or "Authentication.SignUp.Label.PhoneNumber";
    local v51 = v49 and "Authentication.SignUp.Response.InvalidEmail" or "Authentication.SignUp.Response.InvalidPhoneNumber";
    local v52 = v49 and "Authentication.SignUp.Action.UsePhoneNumber" or "Authentication.SignUp.Action.UseEmail";
    local v53 = not (not v49 or v48.state.EmailValid or v48.state.Focused) and v48.state.EmailInput ~= "" or not v49 and not v48.state.PhoneValid and not v48.state.Focused and v48.state.PhoneInput ~= "";
    return v8({
        Title = v48.props.Under13 and "Authentication.SignUp.Label.ParentEmailAddress" or v50, 
        Placeholder = v50, 
        Error = v53 and v51 or nil, 
        LinkText = v52
    })(function(v54) --[[ Line: 222 ]]
        -- upvalues: l_withStyle_0 (ref), l_Text_0 (ref), v48 (copy), v3 (ref), l_TextBoxStateWrapper_0 (ref), v49 (copy), l_GenericTextBox_0 (ref), l_PhoneNumberTextBox_0 (ref), v53 (copy), v22 (ref), v23 (ref), l_ImageSetLabel_0 (ref), v21 (ref)
        return l_withStyle_0(function(v55) --[[ Line: 223 ]]
            -- upvalues: l_Text_0 (ref), v54 (copy), v48 (ref), v3 (ref), l_TextBoxStateWrapper_0 (ref), v49 (ref), l_GenericTextBox_0 (ref), l_PhoneNumberTextBox_0 (ref), v53 (ref), v22 (ref), v23 (ref), l_ImageSetLabel_0 (ref), v21 (ref)
            local l_Font_0 = v55.Font.Body.Font;
            local v57 = v55.Font.BaseSize * v55.Font.Body.RelativeSize;
            local l_Color_0 = v55.Theme.TextDefault.Color;
            local l_Transparency_0 = v55.Theme.TextDefault.Transparency;
            local l_Color_1 = v55.Theme.BackgroundUIContrast.Color;
            local l_Transparency_1 = v55.Theme.BackgroundUIContrast.Transparency;
            local l_Color_2 = v55.Theme.UIDefault.Color;
            local v63 = v55.Font.BaseSize * v55.Font.CaptionBody.RelativeSize;
            local v64 = math.max(1, l_Text_0.GetTextWidth(" ", l_Font_0, v63));
            local v65 = v54.LinkText .. string.rep(" ", math.ceil(v63 / v64) + 1);
            local v66 = l_Text_0.GetTextWidth(v65, l_Font_0, v63);
            local v67 = not v48.props.Under13;
            if v48.state.LinkHover then
                v65 = "<u>" .. v65 .. "</u>";
            end;
            return v3.createElement("Frame", {
                LayoutOrder = v48.props.layoutOrder, 
                Size = UDim2.new(1, 0, 0, 0), 
                AutomaticSize = Enum.AutomaticSize.Y, 
                BackgroundTransparency = 1
            }, {
                UIListLayout = v3.createElement("UIListLayout", {
                    FillDirection = Enum.FillDirection.Vertical, 
                    SortOrder = Enum.SortOrder.LayoutOrder, 
                    Padding = UDim.new(0, 0)
                }), 
                Padding = v3.createElement("UIPadding", {
                    PaddingTop = UDim.new(0, 5)
                }), 
                Title = v3.createElement("TextLabel", {
                    LayoutOrder = 0, 
                    Size = UDim2.new(1, 0, 0, 0), 
                    AutomaticSize = Enum.AutomaticSize.Y, 
                    BackgroundTransparency = 1, 
                    Text = v54.Title, 
                    TextWrapped = true, 
                    Font = v55.Font.CaptionHeader.Font, 
                    TextSize = v55.Font.BaseSize * v55.Font.CaptionHeader.RelativeSize, 
                    TextColor3 = v55.Theme.TextEmphasis.Color, 
                    TextTransparency = v55.Theme.TextEmphasis.Transparency, 
                    TextXAlignment = Enum.TextXAlignment.Left
                }), 
                Spacer = v3.createElement("Frame", {
                    BackgroundTransparency = 1, 
                    Size = UDim2.new(0, 0, 0, 5), 
                    LayoutOrder = 1
                }), 
                CValue = v3.createElement(l_TextBoxStateWrapper_0, {
                    ChildClass = v49 and l_GenericTextBox_0 or l_PhoneNumberTextBox_0, 
                    ErrorState = v53, 
                    Icon = (v49 and v48.state.EmailValid or not v49 and v48.state.PhoneValid) and v22, 
                    IconSize = v23, 
                    Size = UDim2.new(1, 0, 0, v48.props.TextBoxHeight), 
                    LayoutOrder = 2, 
                    ChildProps = {
                        CountryCode = not v49 and v48.state.CountryCode or nil, 
                        SetCountryCode = not v49 and v48.SetCountryCode or nil, 
                        Text = v49 and v48.state.EmailInput or v48.state.PhoneInput, 
                        PlaceholderText = v54.Placeholder, 
                        Font = l_Font_0, 
                        TextSize = v57, 
                        TextXAlignment = Enum.TextXAlignment.Left, 
                        Color = l_Color_1, 
                        Transparency = l_Transparency_1, 
                        TextColor = l_Color_0, 
                        PlaceholderColor = l_Color_2, 
                        TextTransparency = l_Transparency_0, 
                        ClearTextOnFocus = false, 
                        PaddingX = 12, 
                        onChangeText = v49 and v48.EmailInputChanged or v48.PhoneInputChanged, 
                        onFocused = v48.InputFocused, 
                        onFocusLost = v49 and v48.EmailInputFocusLost or v48.PhoneInputFocusLost, 
                        phoneCountryCodeSelectorCallback = v48.props.phoneCountryCodeSelectorCallback
                    }
                }), 
                Footer = v3.createElement("Frame", {
                    LayoutOrder = 3, 
                    Size = UDim2.new(1, 0, 0, v63 + 10), 
                    BackgroundTransparency = 1
                }, {
                    ErrorText = v53 and v3.createElement("TextLabel", {
                        Size = UDim2.new(1, -12 - v66, 1, 0), 
                        Position = UDim2.new(0, 12, 0, 0), 
                        BackgroundTransparency = 1, 
                        Text = v54.Error, 
                        TextWrapped = true, 
                        Font = l_Font_0, 
                        TextSize = v63, 
                        TextColor3 = v55.Theme.Alert.Color, 
                        TextTransparency = v48.issueSummaryTextTransparency, 
                        TextXAlignment = Enum.TextXAlignment.Left
                    }), 
                    Arrow = v67 and v3.createElement(l_ImageSetLabel_0, {
                        Size = UDim2.new(0, v63, 0, v63), 
                        Position = UDim2.new(1, 0, 0.5, 0), 
                        AnchorPoint = Vector2.new(1, 0.5), 
                        BackgroundTransparency = 1, 
                        Image = v21, 
                        ImageColor3 = v55.Theme.IconEmphasis.Color, 
                        ImageTransparency = v55.Theme.IconEmphasis.Transparency
                    }), 
                    Link = v67 and v3.createElement("TextButton", {
                        Text = v65, 
                        Size = UDim2.new(0, v66, 1, 0), 
                        TextSize = v63, 
                        Position = UDim2.new(1, 0, 0, 0), 
                        AnchorPoint = Vector2.new(1, 0), 
                        RichText = true, 
                        BackgroundTransparency = 1, 
                        TextColor3 = l_Color_0, 
                        Font = l_Font_0, 
                        [v3.Event.MouseEnter] = v48.MouseEnterLink, 
                        [v3.Event.MouseLeave] = v48.MouseLeaveLink, 
                        [v3.Event.Activated] = v48.LinkActivated
                    })
                })
            });
        end);
    end);
end;
return (l_RoactServices_0.connect({
    authAnalytics = v18
})(v24));