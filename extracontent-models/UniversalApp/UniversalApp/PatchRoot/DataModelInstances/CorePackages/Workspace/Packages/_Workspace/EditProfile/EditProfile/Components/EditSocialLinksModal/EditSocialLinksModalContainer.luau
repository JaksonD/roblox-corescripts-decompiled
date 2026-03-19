local l_script_FirstAncestor_0 = script:FindFirstAncestor("EditProfile");
local l_HttpService_0 = game:GetService("HttpService");
local v2 = require(script.Parent.EditSocialLinksModal);
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v4 = require(l_Parent_0.React);
local v5 = require(l_Parent_0.LuaSocialLibrariesDeps);
local l_NavigateDown_0 = require(l_Parent_0.NavigationRodux).Thunks.NavigateDown;
local l_AppPage_0 = require(l_Parent_0.RobloxAppEnums).AppPage;
local l_getDeepValue_0 = v5.SocialLibraries.config({}).Dictionary.getDeepValue;
local v9 = require(l_script_FirstAncestor_0.Networking.SocialLinksNetworking);
local l_useDispatch_0 = require(l_Parent_0.RoactUtils).Hooks.RoactRodux.useDispatch;
local l_useLocalUserId_0 = require(l_Parent_0.RobloxAppHooks).useLocalUserId;
local l_useNavigation_0 = require(l_Parent_0.Navigation).useNavigation;
local l_useSelector_0 = require(l_Parent_0.RoactUtils).Hooks.RoactRodux.useSelector;
local l_FFlagProfileEnableSocialNetworksUsernames_0 = require(l_Parent_0.SharedFlags).FFlagProfileEnableSocialNetworksUsernames;
return function() --[[ Line: 21 ]] --[[ Name: EditSocialLinksModalContainer ]]
    -- upvalues: l_useDispatch_0 (copy), l_useLocalUserId_0 (copy), l_useNavigation_0 (copy), l_useSelector_0 (copy), l_getDeepValue_0 (copy), l_NavigateDown_0 (copy), l_AppPage_0 (copy), v9 (copy), l_FFlagProfileEnableSocialNetworksUsernames_0 (copy), l_HttpService_0 (copy), v4 (copy), v2 (copy)
    local v15 = l_useDispatch_0();
    local v16 = l_useLocalUserId_0();
    local v17 = l_useNavigation_0();
    local v19 = l_useSelector_0(function(v18) --[[ Line: 26 ]]
        -- upvalues: l_getDeepValue_0 (ref)
        return l_getDeepValue_0(v18, "Profile.SocialLinks.selfSocialLinks");
    end);
    local function v20() --[[ Line: 30 ]] --[[ Name: cancelOnActivated ]]
        -- upvalues: v17 (copy)
        v17.goBack();
    end;
    local function v22(v21) --[[ Line: 34 ]] --[[ Name: openEditSocialNetworksErrorModal ]]
        -- upvalues: v15 (copy), l_NavigateDown_0 (ref), l_AppPage_0 (ref)
        v15(l_NavigateDown_0({
            name = l_AppPage_0.EditSocialNetworksError, 
            extraProps = {
                errorCode = v21
            }
        }));
    end;
    local function v37(v23, v24, v25, v26, v27, v28) --[[ Line: 43 ]] --[[ Name: saveSocialLinks ]]
        -- upvalues: v15 (copy), v9 (ref), v16 (copy), l_FFlagProfileEnableSocialNetworksUsernames_0 (ref), v17 (copy), l_HttpService_0 (ref), v22 (copy)
        return v15(v9.SetSocialLinks.API({
            promotionChannelsVisibilityPrivacy = v23, 
            facebook = v24, 
            twitter = v25, 
            youtube = v26, 
            twitch = v27, 
            guilded = v28
        })):andThen(function(_) --[[ Line: 59 ]]
            -- upvalues: v15 (ref), v9 (ref), v16 (ref), l_FFlagProfileEnableSocialNetworksUsernames_0 (ref), v17 (ref)
            v15(v9.GetSelfSocialLinks.API({
                alwaysReturnUrls = false, 
                filterLink = false
            })):catch(function(_) --[[ Line: 61 ]]

            end);
            v15(v9.GetSocialLinks.API({
                userId = v16, 
                alwaysReturnUrls = true, 
                filterLink = true
            })):andThen(function(_) --[[ Line: 68 ]]
                -- upvalues: l_FFlagProfileEnableSocialNetworksUsernames_0 (ref), v15 (ref), v9 (ref), v16 (ref)
                if l_FFlagProfileEnableSocialNetworksUsernames_0 then
                    v15(v9.GetSocialLinks.API({
                        userId = v16, 
                        alwaysReturnUrls = false, 
                        filterLink = true
                    }));
                end;
            end):catch(function(_) --[[ Line: 77 ]]

            end);
            v17.goBack();
        end):catch(function(v33) --[[ Line: 80 ]]
            -- upvalues: l_HttpService_0 (ref), v22 (ref)
            local l_status_0, l_result_0 = pcall(function() --[[ Line: 81 ]]
                -- upvalues: l_HttpService_0 (ref), v33 (copy)
                return l_HttpService_0:JSONDecode(v33.Body);
            end);
            local v36 = -1;
            if l_status_0 then
                v36 = l_result_0 and l_result_0.errors and l_result_0.errors[1] and l_result_0.errors[1].code or -1;
            end;
            v22(v36);
        end);
    end;
    return v4.createElement(v2, {
        socialNetworksVisbility = v19.visibility, 
        socialNetworks = v19.socialLinks, 
        cancelOnActivated = v20, 
        saveOnActivated = v37
    });
end;