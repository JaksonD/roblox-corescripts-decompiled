local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v2 = require(l_CorePackages_0.Packages.Cryo);
local v3 = require(l_CorePackages_0.Packages.Roact);
local v4 = require(l_CorePackages_0.Packages.RoactRodux);
local v5 = require(l_Modules_0.LuaApp.AppPage);
local l_RoactServices_0 = require(l_CorePackages_0.Workspace.Packages.RoactServices).RoactServices;
local v7 = require(l_Modules_0.LuaApp.Services.RoactAnalyticsAuthEvents);
local v8 = require(l_Modules_0.LuaApp.Services.RoactNetworking);
local v9 = require(l_Modules_0.LuaApp.Thunks.NavigateDown);
local v10 = require(l_Modules_0.LuaApp.Components.Authentication.SignUpLayout);
local v11 = require(l_Modules_0.LuaApp.Components.Authentication.TextInputValidationWidget);
local v12 = require(l_Modules_0.LuaApp.Thunks.Authentication.UsernameValidator);
local v13 = require(l_Modules_0.LuaApp.Thunks.Authentication.StoreSignUpUsername);
local v14 = require(l_Modules_0.LuaApp.Components.Authentication.SignUpSelectedCharacterWithName);
local v15 = require(l_Modules_0.LuaApp.Enum.UsernameValidationContext);
local v16 = require(l_Modules_0.LuaApp.EventStreamConstants);
local v17 = v3.PureComponent:extend("UsernamePage");
local l_Signup_0 = v15.Signup;
v17.init = function(v19) --[[ Line: 31 ]] --[[ Name: init ]]
    -- upvalues: v16 (copy), v2 (copy), v12 (copy), l_Signup_0 (copy), v3 (copy), v11 (copy)
    v19.continueButtonActivated = function(v20) --[[ Line: 32 ]]
        -- upvalues: v19 (copy), v16 (ref)
        v19.props.storeSignUpUsername(v19.props.networking, v20, v19.props.birthdayString):andThen(function() --[[ Line: 35 ]]
            -- upvalues: v19 (ref), v16 (ref)
            v19.props.authAnalytics.reportContinueButtonClicked(v16.Context.UsernameScreen);
            v19.props.goToNextPage();
        end);
    end;
    v19.usernameTextBoxDidGainFocus = false;
    v19.textInputOnFocus = function() --[[ Line: 42 ]]
        -- upvalues: v19 (copy), v16 (ref)
        if not v19.usernameTextBoxDidGainFocus then
            v19.usernameTextBoxDidGainFocus = true;
            v19.props.authAnalytics.reportUsernameFocus(v16.Context.UsernameScreen);
        end;
    end;
    v19.renderWidget = function(v21) --[[ Line: 49 ]]
        -- upvalues: v2 (ref), v19 (copy), v12 (ref), l_Signup_0 (ref), v3 (ref), v11 (ref)
        local v22 = v2.Dictionary.join(v21, {
            continueButtonActivated = v19.continueButtonActivated, 
            textInputType = Enum.TextInputType.NoSuggestions, 
            returnKeyType = Enum.ReturnKeyType.Next, 
            captureFocusOnMount = true, 
            textInputOnFocus = v19.textInputOnFocus, 
            validator = v12, 
            validatorAdditionalProps = {
                birthday = v19.props.birthdayString, 
                context = l_Signup_0
            }
        });
        return v3.createElement(v11, v22);
    end;
    v19.props.authAnalytics.reportScreenLoaded(v16.Context.UsernameScreen);
end;
v17.render = function(v23) --[[ Line: 68 ]] --[[ Name: render ]]
    -- upvalues: v3 (copy), v10 (copy), v14 (copy)
    return v3.createElement(v10, {
        titleTextKey = "Authentication.SignUp.Heading.UsernamePage", 
        paragraphTextKeys = {
            "Authentication.SignUp.Description.UsernamePage"
        }, 
        showDisclaimerLinks = true, 
        renderWidget = v23.renderWidget, 
        renderCharacter = function() --[[ Line: 74 ]] --[[ Name: renderCharacter ]]
            -- upvalues: v3 (ref), v14 (ref)
            return v3.createElement(v14);
        end
    });
end;
v17 = v4.connect(function(v24, _) --[[ Line: 80 ]]
    return {
        birthdayString = v24.SignUpInfo.SignUpBirthday:FormatForEndpoint()
    };
end, function(v26) --[[ Line: 84 ]]
    -- upvalues: v13 (copy), l_Signup_0 (copy), v9 (copy), v5 (copy)
    return {
        storeSignUpUsername = function(v27, v28, v29) --[[ Line: 86 ]] --[[ Name: storeSignUpUsername ]]
            -- upvalues: v26 (copy), v13 (ref), l_Signup_0 (ref)
            return v26(v13(v27, v28, v29, l_Signup_0));
        end, 
        goToNextPage = function() --[[ Line: 89 ]] --[[ Name: goToNextPage ]]
            -- upvalues: v26 (copy), v9 (ref), v5 (ref)
            return v26(v9({
                name = v5.PasswordSelectionPage
            }));
        end
    };
end)(v17);
return l_RoactServices_0.connect({
    networking = v8, 
    authAnalytics = v7
})(v17);