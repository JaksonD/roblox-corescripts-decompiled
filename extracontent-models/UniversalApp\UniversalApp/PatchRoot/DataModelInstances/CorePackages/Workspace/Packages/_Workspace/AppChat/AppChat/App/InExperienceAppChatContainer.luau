local l_NotificationService_0 = game:GetService("NotificationService");
local l_Players_0 = game:GetService("Players");
local l_script_FirstAncestor_0 = script:FindFirstAncestor("AppChat");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v4 = require(l_Parent_0.AppCommonLib);
local v5 = require(l_Parent_0.FormFactor);
local v6 = require(l_Parent_0.React);
local v7 = require(l_Parent_0.RealtimeDelivery);
local v8 = require(l_Parent_0.Responsive);
local v9 = require(l_Parent_0.RoactUtils);
local v10 = require(l_Parent_0.SharedFlags);
local v11 = require(l_Parent_0.SquadsCore);
local v12 = require(l_Parent_0.UIBlox);
local l_SetFormFactor_0 = v5.Actions.SetFormFactor;
local l_useDispatch_0 = v9.Hooks.RoactRodux.useDispatch;
local v15 = require(l_script_FirstAncestor_0.AppChatEntryPoint);
local v16 = require(l_script_FirstAncestor_0.Components.EventReceivers.ChatEventReceiver);
local v17 = require(l_script_FirstAncestor_0.App.Components.ChatExternalEventReceiver);
local v18 = require(l_script_FirstAncestor_0.Contexts.ChatPlacementContext);
local v19 = require(l_script_FirstAncestor_0.Contexts.ParentContainer.useParentContainerExtents);
local v20 = require(l_script_FirstAncestor_0.Components.ExternalNavigationHandler.Container);
local v21 = require(l_script_FirstAncestor_0.Hooks.useExternalNavigationByScreen);
local v22 = require(l_script_FirstAncestor_0.Hooks.useAppChatIsWideMode);
local l_LoadingSpinner_0 = v12.App.Loading.LoadingSpinner;
local v24 = require(l_script_FirstAncestor_0.Contexts.ParentContainer.ParentContainerContext);
local l_LocalPlayer_0 = l_Players_0.LocalPlayer;
local l_RobloxEventReceiver_0 = v7.RobloxEventReceiver;
local l_Signal_0 = v4.Signal;
local l_SquadAppChatEventReceiver_0 = v11.SquadAppChatEventReceiver;
local l_useMemo_0 = v6.useMemo;
local l_useState_0 = v6.useState;
local l_useEffect_0 = v6.useEffect;
local l_useCallback_0 = v6.useCallback;
local l_useContext_0 = v6.useContext;
local l_useRef_0 = v6.useRef;
local v35 = game:DefineFastInt("AppChatInExperienceMountMinLoadingTimeMs", 0);
local v36 = require(l_script_FirstAncestor_0.Flags.FFlagAppChatInExpSelectChatMembersMobileHeight);
local l_FFlagSquadAppChatRTNFix_0 = v10.FFlagSquadAppChatRTNFix;
local v38 = require(l_script_FirstAncestor_0.Flags.FIntAppChatWideBreakpointMinHeight);
local v39 = require(l_script_FirstAncestor_0.Flags.FIntAppChatWideBreakpointMinWidth);
local l_PartyPageCarouselExperimentation_0 = require(l_Parent_0.SocialExperiments).PartyPageCarouselExperimentation;
return function(v41) --[[ Line: 59 ]]
    -- upvalues: l_useDispatch_0 (copy), l_useContext_0 (copy), v24 (copy), l_useState_0 (copy), v21 (copy), l_useMemo_0 (copy), l_Signal_0 (copy), l_RobloxEventReceiver_0 (copy), l_NotificationService_0 (copy), v6 (copy), v8 (copy), v39 (copy), v38 (copy), v36 (copy), v22 (copy), l_useEffect_0 (copy), l_PartyPageCarouselExperimentation_0 (copy), l_SetFormFactor_0 (copy), v5 (copy), v19 (copy), l_useRef_0 (copy), l_useCallback_0 (copy), v35 (copy), l_LoadingSpinner_0 (copy), v15 (copy), l_LocalPlayer_0 (copy), v18 (copy), v16 (copy), v17 (copy), v20 (copy), l_FFlagSquadAppChatRTNFix_0 (copy), l_SquadAppChatEventReceiver_0 (copy)
    local v42 = l_useDispatch_0();
    local l_hideParentContainer_0 = l_useContext_0(v24).hideParentContainer;
    local v44, v45 = l_useState_0(0);
    local v46, v47 = v21();
    local v48 = l_useMemo_0(function() --[[ Line: 64 ]]
        -- upvalues: l_Signal_0 (ref)
        return l_Signal_0.new();
    end, {});
    local v49 = l_useMemo_0(function() --[[ Line: 68 ]]
        -- upvalues: l_RobloxEventReceiver_0 (ref), l_NotificationService_0 (ref)
        return l_RobloxEventReceiver_0.new(l_NotificationService_0);
    end, {});
    local v50 = v6.useRef(nil);
    local v51 = v8.useOrientation();
    local v52 = v8.useResponsive({
        {
            Key = "wide", 
            minWidth = v39, 
            minHeight = v38
        }
    }) == "wide";
    local v53 = not v36 or v22(true);
    if not v36 and (v51 == v8.Keys.Portrait or not v52) then
        v53 = false;
    end;
    l_useEffect_0(function() --[[ Line: 91 ]]
        -- upvalues: l_PartyPageCarouselExperimentation_0 (ref), v53 (ref), v42 (copy), l_SetFormFactor_0 (ref), v5 (ref)
        if l_PartyPageCarouselExperimentation_0.getAppChatFormFactorEnabled() then
            if v53 then
                v42(l_SetFormFactor_0(v5.Enums.FormFactor.WIDE));
                return;
            else
                v42(l_SetFormFactor_0(v5.Enums.FormFactor.COMPACT));
            end;
        end;
    end, {
        v53
    });
    local v54, v55 = v19();
    local v56 = v51 == v8.DefaultKey;
    local v57, v58 = l_useState_0(v56);
    local v59 = l_useRef_0(os.clock());
    local v60 = l_useCallback_0(function() --[[ Line: 107 ]]
        -- upvalues: v41 (copy), l_hideParentContainer_0 (copy)
        v41.hideAppChat();
        l_hideParentContainer_0();
    end, {
        l_hideParentContainer_0, 
        v41.hideAppChat
    });
    l_useEffect_0(function() --[[ Line: 112 ]]
        -- upvalues: v56 (copy), v59 (copy), v35 (ref), v58 (copy)
        if not v56 then
            local v61 = os.clock() - v59.current;
            local v62 = v35 / 1000;
            if v61 < v62 then
                delay(v62 - v61, function() --[[ Line: 118 ]]
                    -- upvalues: v58 (ref)
                    v58(false);
                end);
                return;
            else
                v58(false);
            end;
        end;
    end, {
        v56, 
        v58
    });
    return v6.createElement(v6.Fragment, {}, {
        AppChatWindow = v6.createElement("Frame", {
            BackgroundColor3 = Color3.new(0, 0, 0), 
            BackgroundTransparency = 1, 
            Size = v54:map(function(v63) --[[ Line: 131 ]]
                return UDim2.fromOffset(v63.X, v63.Y);
            end), 
            Position = v55:map(function(v64) --[[ Line: 134 ]]
                return UDim2.fromOffset(v64.X, v64.Y);
            end), 
            ref = v50
        }, {
            Corner = v6.createElement("UICorner", {
                CornerRadius = UDim.new(0, 8)
            }), 
            containerRef = v6.createElement(v8.ContainerRef.Provider, {
                value = v50
            }, {
                AppChatEntryPoint = if v57 then v6.createElement(l_LoadingSpinner_0, {
                    size = UDim2.fromOffset(50, 50), 
                    anchorPoint = Vector2.new(0.5, 0.5), 
                    position = UDim2.fromScale(0.5, 0.5)
                }) else v6.createElement(v15, {
                    setActiveConversationId = v45, 
                    localUserId = if l_LocalPlayer_0 then l_LocalPlayer_0.UserId else nil, 
                    chatPlacement = v18.Enum.InExperienceDefault, 
                    isVisible = true, 
                    initialConversationId = v41.initialConversationId, 
                    setInitialConversationId = v41.setInitialConversationId, 
                    wideMode = v53, 
                    navigateToRootStack = v60, 
                    updateExternalNavigationForScreen = v47
                })
            })
        }), 
        ChatEventReceiver = v6.createElement(v16, {
            robloxEventReceiver = v49, 
            rnBypassActionSignal = v48, 
            activeConversationId = tostring(v44)
        }), 
        ChatExternalEventReceiver = v6.createElement(v17, {
            robloxEventReceiver = v49, 
            localUserId = if l_LocalPlayer_0 then l_LocalPlayer_0.UserId else nil
        }), 
        ExternalNavigationHandler = v6.createElement(v20, {
            navigationByScreen = v46
        }), 
        SquadAppChatEventReceiver = if l_FFlagSquadAppChatRTNFix_0 then v6.createElement(l_SquadAppChatEventReceiver_0) else nil
    });
end;