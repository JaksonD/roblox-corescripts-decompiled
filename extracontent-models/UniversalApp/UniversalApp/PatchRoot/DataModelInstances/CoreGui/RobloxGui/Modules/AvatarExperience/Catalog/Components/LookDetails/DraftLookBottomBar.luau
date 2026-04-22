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
local l_SetTryOnManagerPeekViewState_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceRodux).Actions.SetTryOnManagerPeekViewState;
local v13 = require(l_Modules_0.AvatarExperience.AvatarEditor.Thunks.CreateLook);
local v14 = require(l_Modules_0.AvatarExperience.AvatarEditor.Thunks.FetchMySharedAvatars);
local v15 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.NavigationUtils);
local l_NavigateWithLock_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceNavigation).Thunks.NavigateWithLock;
local v17 = require(l_Modules_0.LuaApp.Actions.SetCurrentToastMessage);
local v18 = require(l_Modules_0.LuaApp.Enum.ToastType);
local l_ActionBar_0 = v3.App.Button.ActionBar;
local l_ButtonStack_0 = v3.App.Button.ButtonStack;
local l_ButtonType_0 = v3.App.Button.Enum.ButtonType;
local v22 = require(l_Modules_0.AvatarExperience.Flags.GetFFlagAXLooksTranslationAudit);
local v23 = game:DefineFastFlag("AXFixCommunityAvatarsPeekViewClose", false);
return function() --[[ Line: 36 ]] --[[ Name: DraftLookBottomBar ]]
    -- upvalues: l_useDispatch_0 (copy), v10 (copy), v11 (copy), l_useNavigation_0 (copy), v2 (copy), v8 (copy), v22 (copy), v9 (copy), l_SetTryOnManagerPeekViewState_0 (copy), l_PeekViewState_0 (copy), l_ButtonType_0 (copy), v13 (copy), v23 (copy), v15 (copy), v14 (copy), l_AvatarScreen_0 (copy), l_NavigateWithLock_0 (copy), v17 (copy), v18 (copy), l_ActionBar_0 (copy), l_ButtonStack_0 (copy)
    local v24 = l_useDispatch_0();
    local v25 = v10(v11);
    local v26 = l_useNavigation_0();
    local v27, v28 = v2.useState(false);
    local v29 = v8();
    local v30 = v29 and (v29.supportShareButton or v29.supportCopyLinkButton);
    local v31 = if v22() then v9({
        goBack = "Feature.Avatar.Action.GoBack", 
        post = "Feature.Avatar.Action.ComposerPost"
    }) else nil;
    local v32 = v2.useMemo(function() --[[ Line: 53 ]]
        -- upvalues: v24 (copy), l_SetTryOnManagerPeekViewState_0 (ref), l_PeekViewState_0 (ref), v22 (ref), v31 (copy)
        return {
            props = {
                onActivated = function() --[[ Line: 56 ]] --[[ Name: onActivated ]]
                    -- upvalues: v24 (ref), l_SetTryOnManagerPeekViewState_0 (ref), l_PeekViewState_0 (ref)
                    v24(l_SetTryOnManagerPeekViewState_0(l_PeekViewState_0.Closed));
                end, 
                text = if v22() then v31.goBack else "Go Back", 
                isLoading = false
            }
        };
    end, {
        v24
    });
    local v37 = v2.useMemo(function() --[[ Line: 65 ]]
        -- upvalues: l_ButtonType_0 (ref), v27 (copy), v28 (copy), v24 (copy), v13 (ref), v25 (copy), v23 (ref), l_SetTryOnManagerPeekViewState_0 (ref), l_PeekViewState_0 (ref), v15 (ref), v26 (copy), v14 (ref), l_AvatarScreen_0 (ref), v30 (copy), l_NavigateWithLock_0 (ref), v17 (ref), v18 (ref), v22 (ref), v31 (copy)
        return {
            buttonType = l_ButtonType_0.PrimarySystem, 
            isDefaultChild = true, 
            props = {
                onActivated = function() --[[ Line: 70 ]] --[[ Name: onActivated ]]
                    -- upvalues: v27 (ref), v28 (ref), v24 (ref), v13 (ref), v25 (ref), v23 (ref), l_SetTryOnManagerPeekViewState_0 (ref), l_PeekViewState_0 (ref), v15 (ref), v26 (ref), v14 (ref), l_AvatarScreen_0 (ref), v30 (ref), l_NavigateWithLock_0 (ref), v17 (ref), v18 (ref)
                    if v27 then
                        return;
                    else
                        v28(true);
                        v24(v13(v25)):andThen(function(v33) --[[ Line: 78 ]]
                            -- upvalues: v28 (ref), v23 (ref), v24 (ref), l_SetTryOnManagerPeekViewState_0 (ref), l_PeekViewState_0 (ref), v15 (ref), v26 (ref), v14 (ref), v25 (ref), l_AvatarScreen_0 (ref), v30 (ref), l_NavigateWithLock_0 (ref)
                            v28(false);
                            if not v33 then
                                return;
                            else
                                if v23 then
                                    v24(l_SetTryOnManagerPeekViewState_0(l_PeekViewState_0.Closed));
                                end;
                                v15.closeLookComposer(v26);
                                v24(v14(v25));
                                v15.navigateFromOverlay(v26, l_AvatarScreen_0.MySharedAvatars);
                                if v30 then
                                    v24(l_NavigateWithLock_0(function() --[[ Line: 94 ]]
                                        -- upvalues: l_AvatarScreen_0 (ref), v33 (copy), v26 (ref)
                                        local l_CommunityAvatarSharePrompt_0 = l_AvatarScreen_0.CommunityAvatarSharePrompt;
                                        local v35 = {
                                            lookId = v33
                                        };
                                        v26.navigate(l_CommunityAvatarSharePrompt_0, v35);
                                    end));
                                end;
                                return;
                            end;
                        end):catch(function(_) --[[ Line: 104 ]]
                            -- upvalues: v28 (ref), v24 (ref), v17 (ref), v18 (ref)
                            v28(false);
                            v24(v17({
                                toastMessage = "Feature.Toast.NetworkingError.SomethingIsWrong", 
                                toastType = v18.NetworkingError
                            }));
                        end);
                        return;
                    end;
                end, 
                text = if v22() then v31.post else "Share", 
                isLoading = v27
            }
        };
    end, {
        v24, 
        v27, 
        v30
    });
    return v2.createElement(l_ActionBar_0, {}, {
        ButtonStack = v2.createElement(l_ButtonStack_0, {
            buttons = {
                v32, 
                v37
            }
        })
    });
end;