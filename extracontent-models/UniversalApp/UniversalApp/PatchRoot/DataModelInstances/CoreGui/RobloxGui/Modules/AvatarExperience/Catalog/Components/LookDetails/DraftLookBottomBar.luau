local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.Packages.React);
local v3 = require(l_CorePackages_0.Packages.UIBlox);
local l_useDispatch_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useDispatch;
local l_PeekViewState_0 = require(l_CorePackages_0.Workspace.Packages.PeekView).PeekViewState;
local l_AvatarScreen_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceNavigation).Enums.AvatarScreen;
local l_useNavigation_0 = require(l_CorePackages_0.Workspace.Packages.Navigation).useNavigation;
local v8 = require(l_Modules_0.AvatarExperience.Common.Hooks.useSharePolicy);
local v9 = require(l_Modules_0.LuaApp.Hooks.useLocalization);
local v10 = require(l_Modules_0.LuaApp.Hooks.useRoactService);
local v11 = require(l_Modules_0.LuaApp.Services.RoactNetworking);
local v12 = require(l_Modules_0.AvatarExperience.Catalog.Actions.SetTryOnManagerPeekViewState);
local v13 = require(l_Modules_0.AvatarExperience.AvatarEditor.Thunks.CreateLook);
local v14 = require(l_Modules_0.AvatarExperience.AvatarEditor.Thunks.FetchMySharedAvatars);
local v15 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.NavigationUtils);
local v16 = require(l_Modules_0.AvatarExperience.Common.Thunks.NavigateWithLock);
local v17 = require(l_Modules_0.LuaApp.Actions.SetCurrentToastMessage);
local v18 = require(l_Modules_0.LuaApp.Enum.ToastType);
local l_ActionBar_0 = v3.App.Button.ActionBar;
local l_ButtonStack_0 = v3.App.Button.ButtonStack;
local l_ButtonType_0 = v3.App.Button.Enum.ButtonType;
local v22 = require(l_Modules_0.AvatarExperience.Flags.GetFFlagAXLooksTranslationAudit);
return function() --[[ Line: 34 ]] --[[ Name: DraftLookBottomBar ]]
    -- upvalues: l_useDispatch_0 (copy), v10 (copy), v11 (copy), l_useNavigation_0 (copy), v2 (copy), v8 (copy), v22 (copy), v9 (copy), v12 (copy), l_PeekViewState_0 (copy), l_ButtonType_0 (copy), v13 (copy), v15 (copy), v14 (copy), l_AvatarScreen_0 (copy), v16 (copy), v17 (copy), v18 (copy), l_ActionBar_0 (copy), l_ButtonStack_0 (copy)
    local v23 = l_useDispatch_0();
    local v24 = v10(v11);
    local v25 = l_useNavigation_0();
    local v26, v27 = v2.useState(false);
    local v28 = v8();
    local v29 = v28 and (v28.supportShareButton or v28.supportCopyLinkButton);
    local v30 = if v22() then v9({
        goBack = "Feature.Avatar.Action.GoBack", 
        post = "Feature.Avatar.Action.ComposerPost"
    }) else nil;
    local v31 = v2.useMemo(function() --[[ Line: 51 ]]
        -- upvalues: v23 (copy), v12 (ref), l_PeekViewState_0 (ref), v22 (ref), v30 (copy)
        return {
            props = {
                onActivated = function() --[[ Line: 54 ]] --[[ Name: onActivated ]]
                    -- upvalues: v23 (ref), v12 (ref), l_PeekViewState_0 (ref)
                    v23(v12(l_PeekViewState_0.Closed));
                end, 
                text = if v22() then v30.goBack else "Go Back", 
                isLoading = false
            }
        };
    end, {
        v23
    });
    local v36 = v2.useMemo(function() --[[ Line: 63 ]]
        -- upvalues: l_ButtonType_0 (ref), v26 (copy), v27 (copy), v23 (copy), v13 (ref), v24 (copy), v15 (ref), v25 (copy), v14 (ref), l_AvatarScreen_0 (ref), v29 (copy), v16 (ref), v17 (ref), v18 (ref), v22 (ref), v30 (copy)
        return {
            buttonType = l_ButtonType_0.PrimarySystem, 
            isDefaultChild = true, 
            props = {
                onActivated = function() --[[ Line: 68 ]] --[[ Name: onActivated ]]
                    -- upvalues: v26 (ref), v27 (ref), v23 (ref), v13 (ref), v24 (ref), v15 (ref), v25 (ref), v14 (ref), l_AvatarScreen_0 (ref), v29 (ref), v16 (ref), v17 (ref), v18 (ref)
                    if v26 then
                        return;
                    else
                        v27(true);
                        v23(v13(v24)):andThen(function(v32) --[[ Line: 76 ]]
                            -- upvalues: v27 (ref), v15 (ref), v25 (ref), v23 (ref), v14 (ref), v24 (ref), l_AvatarScreen_0 (ref), v29 (ref), v16 (ref)
                            v27(false);
                            if not v32 then
                                return;
                            else
                                v15.closeLookComposer(v25);
                                v23(v14(v24));
                                v15.navigateFromOverlay(v25, l_AvatarScreen_0.MySharedAvatars);
                                if v29 then
                                    v23(v16(function() --[[ Line: 89 ]]
                                        -- upvalues: l_AvatarScreen_0 (ref), v32 (copy), v25 (ref)
                                        local l_CommunityAvatarSharePrompt_0 = l_AvatarScreen_0.CommunityAvatarSharePrompt;
                                        local v34 = {
                                            lookId = v32
                                        };
                                        v25.navigate(l_CommunityAvatarSharePrompt_0, v34);
                                    end));
                                end;
                                return;
                            end;
                        end):catch(function(_) --[[ Line: 99 ]]
                            -- upvalues: v27 (ref), v23 (ref), v17 (ref), v18 (ref)
                            v27(false);
                            v23(v17({
                                toastMessage = "Feature.Toast.NetworkingError.SomethingIsWrong", 
                                toastType = v18.NetworkingError
                            }));
                        end);
                        return;
                    end;
                end, 
                text = if v22() then v30.post else "Share", 
                isLoading = v26
            }
        };
    end, {
        v23, 
        v26, 
        v29
    });
    return v2.createElement(l_ActionBar_0, {}, {
        ButtonStack = v2.createElement(l_ButtonStack_0, {
            buttons = {
                v31, 
                v36
            }
        })
    });
end;