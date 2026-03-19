local l_script_FirstAncestor_0 = script:FindFirstAncestor("EditProfile");
local v1 = require(script.Parent.EditDisplayNameModal);
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v3 = require(l_Parent_0.React);
local v4 = require(l_Parent_0.UserProfiles);
local l_useLocalUserId_0 = require(l_Parent_0.RobloxAppHooks).useLocalUserId;
local l_writeNamesQuery_0 = v4.Mutations.writeNamesQuery;
local v7 = require(l_Parent_0.LuaSocialLibrariesDeps);
local v8 = require(l_Parent_0.UIBlox);
local v9 = v7.SocialLibraries.config({});
local l_SetCurrentToastMessage_0 = require(l_Parent_0.ToastRodux).Actions.SetCurrentToastMessage;
local l_useDispatch_0 = require(l_Parent_0.RoactUtils).Hooks.RoactRodux.useDispatch;
local l_useScreenSize_0 = require(l_Parent_0.RobloxAppHooks).useScreenSize;
local l_getDeepValue_0 = v9.Dictionary.getDeepValue;
local l_useEffectOnMount_0 = require(l_Parent_0.RoactUtils).Hooks.useEffectOnMount;
local v15 = require(l_script_FirstAncestor_0.Networking.UsersNetworking);
local l_Images_0 = v8.App.ImageSet.Images;
local v17 = require(l_script_FirstAncestor_0.Analytics);
local l_EventNames_0 = v17.EventNames;
local l_useAnalytics_0 = v17.useAnalytics;
local v20 = require(l_script_FirstAncestor_0.Hooks.useDisplayNameText);
return function(v21) --[[ Line: 37 ]] --[[ Name: EditDisplayNameModalContainer ]]
    -- upvalues: l_useDispatch_0 (copy), l_useScreenSize_0 (copy), l_useAnalytics_0 (copy), l_useEffectOnMount_0 (copy), l_EventNames_0 (copy), v20 (copy), l_useLocalUserId_0 (copy), v4 (copy), v15 (copy), l_writeNamesQuery_0 (copy), l_getDeepValue_0 (copy), l_SetCurrentToastMessage_0 (copy), l_Images_0 (copy), v3 (copy), v1 (copy)
    local v22 = l_useDispatch_0();
    local v23 = l_useScreenSize_0();
    local v24 = v21.navigation.getParam("setDisplayNameAvailable");
    local v25 = l_useAnalytics_0();
    l_useEffectOnMount_0(function() --[[ Line: 44 ]]
        -- upvalues: v25 (copy), l_EventNames_0 (ref)
        v25.fireAnalyticsEvent(l_EventNames_0.DisplayNameModalLoaded);
    end);
    local v26 = v20();
    local v27 = l_useLocalUserId_0();
    local v28 = v21.navigation.getParam("displayName");
    local v29 = nil;
    local v30 = v4.Hooks.useUserProfilesFetch({
        userIds = {
            v27
        }, 
        query = v4.Queries.userProfilesAllNamesByUserIds
    });
    if v30.data then
        v29 = v4.Selectors.getUserProfileFromId(v30.data, v27);
    end;
    local function v31() --[[ Line: 64 ]] --[[ Name: cancelOnActivated ]]
        -- upvalues: v21 (copy)
        v21.navigation.goBack();
    end;
    local function v34(v32) --[[ Line: 68 ]] --[[ Name: saveDisplayName ]]
        -- upvalues: v22 (copy), v15 (ref), v27 (copy), l_writeNamesQuery_0 (ref), v30 (copy), v4 (ref), l_getDeepValue_0 (ref), v29 (ref), v25 (copy), l_EventNames_0 (ref), v21 (copy), l_SetCurrentToastMessage_0 (ref), v26 (copy), l_Images_0 (ref), v24 (copy)
        return v22(v15.SetDisplayName.API(v27, v32)):andThen(function(_) --[[ Line: 69 ]]
            -- upvalues: l_writeNamesQuery_0 (ref), v30 (ref), v4 (ref), v27 (ref), l_getDeepValue_0 (ref), v29 (ref), v32 (copy), v25 (ref), l_EventNames_0 (ref), v21 (ref), v22 (ref), l_SetCurrentToastMessage_0 (ref), v26 (ref), l_Images_0 (ref), v24 (ref)
            l_writeNamesQuery_0({
                client = v30.client, 
                query = v4.Queries.userProfilesAllNamesByUserIds, 
                userId = v27, 
                names = {
                    alias = l_getDeepValue_0(v29, "names.alias"), 
                    contactName = l_getDeepValue_0(v29, "names.contactName"), 
                    displayName = v32, 
                    username = l_getDeepValue_0(v29, "names.username")
                }
            });
            v25.fireAnalyticsEvent(l_EventNames_0.DisplayNameSaved, {
                displayName = v32
            });
            v21.navigation.goBack();
            v22(l_SetCurrentToastMessage_0({
                toastMessage = v26.displayNameUpdatedMessage, 
                toastIcon = l_Images_0["icons/actions/accept"], 
                isLocalized = true
            }));
            v24(false);
        end);
    end;
    local function v36(v35) --[[ Line: 97 ]] --[[ Name: validateDisplayName ]]
        -- upvalues: v22 (copy), v15 (ref), v27 (copy)
        return v22(v15.GetDisplayNameValidation.API(v27, v35));
    end;
    return v3.createElement(v1, {
        screenSize = v23, 
        title = v26.displayNameEditMessage, 
        description = v26.displayNameCaption, 
        initialText = v28, 
        localUserId = v27, 
        cancelOnActivated = v31, 
        saveOnActivated = v34, 
        validateDisplayName = v36
    });
end;