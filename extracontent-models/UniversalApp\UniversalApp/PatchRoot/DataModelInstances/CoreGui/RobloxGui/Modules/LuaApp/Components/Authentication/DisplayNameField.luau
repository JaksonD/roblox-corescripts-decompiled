local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.Packages.React);
local v3 = require(l_Modules_0.LuaApp.Components.Authentication.CollapsingTextInputValidator);
local v4 = require(l_Modules_0.LuaApp.Thunks.Authentication.UniversalDisplayNameValidator);
local l_useLocalization_0 = require(l_CorePackages_0.Workspace.Packages.Localization).Hooks.useLocalization;
local l_InputValidity_0 = require(l_CorePackages_0.Workspace.Packages.AuthCommon).Enums.InputValidity;
local l_useRoactService_0 = require(l_CorePackages_0.Workspace.Packages.RobloxAppHooks).useRoactService;
local v8 = require(l_Modules_0.LuaApp.Services.RoactNetworking);
local v9 = require(l_Modules_0.LuaApp.Http.Requests.GetUsernameRecommendationFromDisplayName);
local v10 = require(l_Modules_0.LuaApp.Http.Requests.PostUsernameRecommendationFromDisplayName);
local v11 = require(l_Modules_0.LuaApp.EventStreamConstants);
local v12 = require(l_CorePackages_0.Workspace.Packages.RoactUtils);
local l_useEffectOnMount_0 = v12.Hooks.useEffectOnMount;
local l_useEffectOnce_0 = v12.Hooks.useEffectOnce;
local v15 = require(l_Modules_0.LuaApp.Components.Authentication.Flags.FFlagSignupDisplayNameLogging);
local v16 = game:DefineFastFlag("UsernameDisplayNameRecommendationPostSwitch", false);
game:DefineFastInt("DisplayNameDebounceInMilliseconds", 500);
local function _() --[[ Line: 26 ]]
    return game:GetFastInt("DisplayNameDebounceInMilliseconds");
end;
local function _() --[[ Line: 33 ]]
    return (game:GetFastInt("DisplayNameDebounceInMilliseconds") or 500) / 1000;
end;
return function(v19) --[[ Line: 63 ]]
    -- upvalues: v2 (copy), l_useLocalization_0 (copy), l_useRoactService_0 (copy), v8 (copy), l_InputValidity_0 (copy), v15 (copy), v11 (copy), v9 (copy), v16 (copy), v10 (copy), l_useEffectOnMount_0 (copy), l_useEffectOnce_0 (copy), v3 (copy), v4 (copy)
    local v20, v21 = v2.useState(false);
    local v22, v23 = v2.useState(nil);
    local v24, v25 = v2.useState(false);
    local v26 = l_useLocalization_0({
        displayNamePlaceholder = "Feature.DisplayName.Label.SignUpAgedUpDisplayName"
    });
    local v27 = l_useRoactService_0(v8);
    local v31 = v2.useCallback(function(v28, v29, v30) --[[ Line: 74 ]]
        -- upvalues: v19 (copy), v23 (copy), v21 (copy), l_InputValidity_0 (ref), v15 (ref), v11 (ref), v22 (copy)
        v19.onDisplayNameTextChanged(v28, v29, v30);
        v23(v28);
        v21(v29 == l_InputValidity_0.Valid);
        v19.updateBypassDisplayNameField(v30);
        if v15 then
            v19.authEventAnalytics.reportAuthFormInteraction(v11.Context.SinglePageSignUpScreen, v11.Field.DisplayName, v11.ActionType.Submit, v29, v22);
        end;
    end, {
        v19.onDisplayNameTextChanged, 
        v19.updateBypassDisplayNameField
    });
    local v32 = v2.useMemo(function() --[[ Line: 92 ]]
        -- upvalues: v19 (copy)
        return {
            birthday = v19.birthday
        };
    end, {
        v19.birthday
    });
    local l_v9_0 = v9;
    if v16 then
        l_v9_0 = v10;
    end;
    if v19.mockGetUsernameRecommendationFromDisplayName then
        l_v9_0 = v19.mockGetUsernameRecommendationFromDisplayName;
    end;
    local function _(v34, v35) --[[ Line: 105 ]]
        -- upvalues: l_v9_0 (ref), v27 (copy)
        return l_v9_0(v27, v34, v35);
    end;
    local v37 = v19.bypassDisplayNameField and "Feature.DisplayName.Label.ValidationFailed" or "Feature.DisplayName.Label.ErrorsWithAgedUpDisplayName";
    v2.useEffect(function() --[[ Line: 114 ]]
        -- upvalues: v19 (copy), v20 (copy), v25 (copy), v22 (copy), l_v9_0 (ref), v27 (copy), v15 (ref), v11 (ref)
        if v19.bypassDisplayNameField then
            v19.setUsernameRecommendation("");
            return;
        else
            if v20 and not v19.shouldDisableRecommendation then
                v25(true);
                task.spawn(function() --[[ Line: 123 ]]
                    -- upvalues: v22 (ref), v19 (ref), l_v9_0 (ref), v27 (ref), v25 (ref), v15 (ref), v11 (ref)
                    local l_v22_0 = v22;
                    local l_birthday_0 = v19.birthday;
                    l_v9_0(v27, l_v22_0, l_birthday_0):andThen(function(v40) --[[ Line: 125 ]]
                        -- upvalues: v25 (ref), v15 (ref), v19 (ref), v11 (ref), v22 (ref)
                        v25(false);
                        local v41 = v40 and v40[1] and v40[1].suggestedUsernames and v40[1].suggestedUsernames[1] or "";
                        if v15 then
                            v19.authEventAnalytics.reportUsernameSuggestionShown(v11.Context.SinglePageSignUpScreen, v22, if v41 ~= "" then v40[1].suggestedUsernames else {}, v11.Field.DisplayName);
                        end;
                        v19.setUsernameRecommendation(v41);
                    end):catch(function(_) --[[ Line: 144 ]]
                        -- upvalues: v15 (ref), v19 (ref), v11 (ref), v25 (ref)
                        if v15 then
                            v19.authEventAnalytics.reportUsernameGenerationFailed(v11.Context.SinglePageSignUpScreen, v11.State.ReportUsernameGenerationFailed);
                        end;
                        v25(false);
                        v19.setUsernameRecommendation("");
                    end);
                end);
            end;
            return;
        end;
    end, {
        v20, 
        v22, 
        v19.shouldDisableRecommendation, 
        v19.bypassDisplayNameField
    });
    if v15 then
        l_useEffectOnMount_0(function() --[[ Line: 167 ]]
            -- upvalues: v19 (copy), v11 (ref)
            v19.authEventAnalytics.reportDisplayNameFieldLoaded(v11.Context.SinglePageSignUpScreen, v11.Field.DisplayName, v11.ActionType.Shown);
        end);
        l_useEffectOnce_0(function() --[[ Line: 175 ]]
            -- upvalues: v19 (copy), v11 (ref)
            v19.authEventAnalytics.reportDisplayNameFieldBypassed(v11.Context.SinglePageSignUpScreen, v11.State.BypassDisplayNameField);
        end, v19.bypassDisplayNameField);
    end;
    return v2.createElement(v3, {
        debounceTime = (game:GetFastInt("DisplayNameDebounceInMilliseconds") or 500) / 1000, 
        focusedTextBoxPositionChangedCallback = v19.focusedTextBoxPositionChangedCallback, 
        showDetailedError = v19.bypassDisplayNameField, 
        layoutOrder = v19.layoutOrder, 
        onAnimationStateChangeCallback = v19.onAnimationStateChangeCallback, 
        onInputTextValidated = v31, 
        onReturnPressedFromOnScreenKeyboard = v19.onReturnPressedFromOnScreenKeyboard, 
        pillClicked = v19.pillClicked, 
        placeholderText = v26.displayNamePlaceholder, 
        prerequisiteMet = true, 
        resetPillClicked = v19.resetPillClicked, 
        returnKeyType = Enum.ReturnKeyType.Next, 
        summaryErrorTextKey = v37, 
        textBoxFocusedCallback = v19.textBoxFocusedCallback, 
        textBoxFocusLostCallback = v19.textBoxFocusLostCallback, 
        textBoxRef = v19.textBoxRef, 
        textInputType = Enum.TextInputType.NoSuggestions, 
        titleTextKey = "Feature.DisplayName.Label.AgedUpNameField", 
        updatePillClicked = v19.updatePillClicked, 
        validator = v4, 
        validatorAdditionalProps = v32, 
        hasFieldFailed = v19.bypassDisplayNameField, 
        shouldShowLoadingIcon = v24
    });
end;