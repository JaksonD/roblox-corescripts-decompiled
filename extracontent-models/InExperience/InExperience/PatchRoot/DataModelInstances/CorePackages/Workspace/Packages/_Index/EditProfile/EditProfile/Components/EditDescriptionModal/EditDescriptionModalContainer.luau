local l_script_FirstAncestor_0 = script:FindFirstAncestor("EditProfile");
local v1 = require(script.Parent.EditDescriptionModal);
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v3 = require(l_Parent_0.React);
local l_getDeepValue_0 = require(l_Parent_0.LuaSocialLibrariesDeps).SocialLibraries.config({}).Dictionary.getDeepValue;
local v5 = require(l_script_FirstAncestor_0.Networking.UsersNetworking);
local l_useDispatch_0 = require(l_Parent_0.RoactUtils).Hooks.RoactRodux.useDispatch;
local l_useScreenSize_0 = require(l_Parent_0.RobloxAppHooks).useScreenSize;
local l_useLocalUserId_0 = require(l_Parent_0.RobloxAppHooks).useLocalUserId;
local l_useLocalization_0 = require(l_Parent_0.Localization).Hooks.useLocalization;
local v10 = require(l_script_FirstAncestor_0.Common.TextKeys);
local l_HttpService_0 = game:GetService("HttpService");
local v12 = require(l_script_FirstAncestor_0.Flags.EditProfileIXP);
local v13 = require(l_script_FirstAncestor_0.Analytics);
local l_EventNames_0 = v13.EventNames;
local l_useAnalytics_0 = v13.useAnalytics;
return function(v16) --[[ Line: 36 ]] --[[ Name: EditDescriptionModalContainer ]]
    -- upvalues: l_useDispatch_0 (copy), l_useScreenSize_0 (copy), l_useLocalUserId_0 (copy), v3 (copy), v12 (copy), l_useAnalytics_0 (copy), l_useLocalization_0 (copy), v10 (copy), v5 (copy), l_getDeepValue_0 (copy), l_HttpService_0 (copy), l_EventNames_0 (copy), v1 (copy)
    local v17 = l_useDispatch_0();
    local v18 = l_useScreenSize_0();
    local v19 = l_useLocalUserId_0();
    local v20 = v16.navigation.getParam("setDescription");
    local v21, v22 = v3.useState(false);
    local v23, v24 = v3.useState(false);
    local v25 = if not v16.IXPNotEnabled and v12.useIsExperimentEnabled() then l_useAnalytics_0() else nil;
    local v26 = l_useLocalization_0({
        About = v10.About, 
        Caption = v10.AboutModalCaption, 
        ThrottleError = v10.TooManyAttemptsTryAgainLater
    });
    local v27 = v16.navigation.getParam("initialText");
    local function v28() --[[ Line: 55 ]] --[[ Name: cancelOnActivated ]]
        -- upvalues: v16 (copy)
        v16.navigation.goBack();
    end;
    local function v33(v29) --[[ Line: 59 ]] --[[ Name: saveDescription ]]
        -- upvalues: v17 (copy), v5 (ref), v19 (copy), v20 (copy), l_getDeepValue_0 (ref), v16 (copy), l_HttpService_0 (ref), v25 (copy), l_EventNames_0 (ref), v22 (copy), v24 (copy)
        return v17(v5.SetDescription.API(v19, v29)):andThen(function(v30) --[[ Line: 61 ]]
            -- upvalues: v20 (ref), l_getDeepValue_0 (ref), v16 (ref)
            v20(l_getDeepValue_0(v30, "responseBody.description"));
            v16.navigation.goBack();
        end):catch(function(v31) --[[ Line: 65 ]]
            -- upvalues: l_HttpService_0 (ref), v25 (ref), l_EventNames_0 (ref), v22 (ref), v24 (ref)
            local v32 = l_HttpService_0:JSONDecode(v31.Body);
            if v32.errors[1].code == 2 then
                if v25 then
                    v25.fireAnalyticsEvent(l_EventNames_0.DescriptionPINBlocked);
                end;
                v22(true);
                return;
            else
                if v32.errors[1].code == 0 then
                    v24(true);
                end;
                return;
            end;
        end);
    end;
    return v3.createElement(v1, {
        screenSize = v18, 
        title = v26.About, 
        description = v26.Caption, 
        throttleErrorText = v26.ThrottleError, 
        initialText = v27, 
        cancelOnActivated = v28, 
        saveOnActivated = v33, 
        textError = v21, 
        throttleError = v23
    });
end;