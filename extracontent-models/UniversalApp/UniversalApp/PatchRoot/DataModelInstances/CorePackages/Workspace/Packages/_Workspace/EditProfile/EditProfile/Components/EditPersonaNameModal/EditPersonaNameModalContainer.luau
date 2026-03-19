local l_script_FirstAncestor_0 = script:FindFirstAncestor("EditProfile");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(script.Parent.EditPersonaNameModal);
local l_useScreenSize_0 = require(l_Parent_0.RobloxAppHooks).useScreenSize;
local v5 = require(l_script_FirstAncestor_0.Networking.UsersNetworking);
local v6 = require(l_script_FirstAncestor_0.Networking.PersonasNetworking);
local l_useLocalUserId_0 = require(l_Parent_0.RobloxAppHooks).useLocalUserId;
local l_useDispatch_0 = require(l_Parent_0.RoactUtils).Hooks.RoactRodux.useDispatch;
local l_useLocalization_0 = require(l_Parent_0.Localization).Hooks.useLocalization;
local v10 = require(l_script_FirstAncestor_0.Common.TextKeys);
local v11 = require(l_script_FirstAncestor_0.Analytics);
local l_EventNames_0 = v11.EventNames;
local l_useAnalytics_0 = v11.useAnalytics;
return function(v14) --[[ Line: 26 ]]
    -- upvalues: l_useScreenSize_0 (copy), l_useLocalUserId_0 (copy), l_useDispatch_0 (copy), l_useAnalytics_0 (copy), l_useLocalization_0 (copy), v10 (copy), l_EventNames_0 (copy), v6 (copy), v5 (copy), v2 (copy), v3 (copy)
    local v15 = l_useScreenSize_0();
    local v16 = l_useLocalUserId_0();
    local v17 = l_useDispatch_0();
    local v18 = v14.navigation.getParam("initialName");
    local v19 = v14.navigation.getParam("setPersonaName");
    local v20 = l_useAnalytics_0();
    local v21 = l_useLocalization_0({
        personaNameModalTitle = v10.PersonaNameModalTitle, 
        personaNameModalDescription = v10.PersonaNameModalDescription
    });
    local function v22() --[[ Line: 39 ]] --[[ Name: cancelOnActivated ]]
        -- upvalues: v14 (copy)
        v14.navigation.goBack();
    end;
    local function v26(v23) --[[ Line: 43 ]] --[[ Name: saveOnActivated ]]
        -- upvalues: v20 (copy), l_EventNames_0 (ref), v17 (copy), v6 (ref), v19 (copy), v14 (copy)
        v20.fireAnalyticsEvent(l_EventNames_0.PersonaNameSaved);
        return v17(v6.SetDisplayName.API({
            displayName = v23
        })):andThen(function(_) --[[ Line: 47 ]]

        end):catch(function(v25) --[[ Line: 48 ]]
            -- upvalues: v19 (ref), v23 (copy), v14 (ref)
            if v25.HttpError == Enum.HttpError.OK then
                v19(v23);
                v14.navigation.goBack();
            end;
        end);
    end;
    local function v28(v27) --[[ Line: 56 ]] --[[ Name: validatePersonaName ]]
        -- upvalues: v17 (copy), v5 (ref), v16 (copy)
        return v17(v5.GetDisplayNameValidation.API(v16, v27));
    end;
    return v2.createElement(v3, {
        screenSize = v15, 
        title = v21.personaNameModalTitle, 
        description = v21.personaNameModalDescription, 
        initialText = v18, 
        cancelOnActivated = v22, 
        saveOnActivated = v26, 
        validatePersonaName = v28
    });
end;