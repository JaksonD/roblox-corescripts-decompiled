local l_script_FirstAncestor_0 = script:FindFirstAncestor("Squads");
local v1 = require(l_script_FirstAncestor_0.Logger);
local v2 = require(l_script_FirstAncestor_0.dependencies);
local l_React_0 = v2.React;
local l_Foundation_0 = v2.Foundation;
local l_useLocalization_0 = v2.Hooks.useLocalization;
local l_useSelector_0 = v2.Hooks.useSelector;
local l_useDispatch_0 = v2.Hooks.useDispatch;
local l_useCurrentSquadId_0 = v2.SquadsCore.Hooks.useCurrentSquadId;
local l_ButtonSize_0 = l_Foundation_0.Enums.ButtonSize;
local l_ButtonVariant_0 = l_Foundation_0.Enums.ButtonVariant;
local l_Image_0 = l_Foundation_0.Image;
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local l_getRbxthumbWithTypeSizeAndOptions_0 = require(l_Parent_0.UserLib).Utils.getRbxthumbWithTypeSizeAndOptions;
local l_Constants_0 = require(l_Parent_0.UserLib).Utils.Constants;
local v15 = require(l_script_FirstAncestor_0.Thunks.CreateExperienceInvite);
local l_SquadExternalContractContext_0 = v2.SquadsCore.SquadExternalContractProvider.SquadExternalContractContext;
local l_EventNames_0 = v2.SquadsCore.Analytics.EventNames;
local l_SquadToastActionsAndStates_0 = v2.SquadsCore.Enums.SquadToastActionsAndStates;
local l_SquadExperienceInviteSource_0 = v2.SquadsCore.Enums.SquadExperienceInviteSource;
local l_SquadRegroupEntryPoint_0 = v2.SquadsCore.Enums.SquadRegroupEntryPoint;
local l_RbxAnalyticsService_0 = game:GetService("RbxAnalyticsService");
return function(v22) --[[ Line: 31 ]] --[[ Name: SquadLobbyRegroupRow ]]
    -- upvalues: l_useDispatch_0 (copy), l_React_0 (copy), l_SquadExternalContractContext_0 (copy), l_useLocalization_0 (copy), l_useSelector_0 (copy), l_useCurrentSquadId_0 (copy), l_getRbxthumbWithTypeSizeAndOptions_0 (copy), l_Constants_0 (copy), l_Foundation_0 (copy), l_Image_0 (copy), l_ButtonSize_0 (copy), l_ButtonVariant_0 (copy), v1 (copy), v15 (copy), l_SquadExperienceInviteSource_0 (copy), l_EventNames_0 (copy), l_RbxAnalyticsService_0 (copy), l_SquadToastActionsAndStates_0 (copy), l_SquadRegroupEntryPoint_0 (copy)
    local v23 = l_useDispatch_0();
    local v24 = l_React_0.useContext(l_SquadExternalContractContext_0);
    local v25 = l_useLocalization_0({
        Title = "Notifications.SquadRegroupPrompt.ToastLabel.ContinuePlayingTogether", 
        Body = "Notifications.SquadRegroupPrompt.ToastLabel.JoinANewServer", 
        Join = "Notifications.SquadRegroupPrompt.ToastAction.Join"
    });
    local v27 = l_React_0.useCallback(function(v26) --[[ Line: 40 ]]
        return v26.Squad and v26.Squad.Squad and v26.Squad.Squad.currentExperienceInvite;
    end, {});
    local v28 = l_useSelector_0(v27);
    local v29 = l_useCurrentSquadId_0();
    local v31 = l_React_0.useCallback(function(v30) --[[ Line: 46 ]]
        -- upvalues: v22 (copy)
        return v30 and v30.Squad and v30.Squad.Presence and v30.Squad.Presence.byUserId and v30.Squad.Presence.byUserId[tostring(v22.localUserId)];
    end, {
        v22.localUserId
    });
    local v32 = l_useSelector_0(v31);
    local v33 = v32 and v32.rootPlaceId or nil;
    local v34 = v32 and (v32.universeId or v32.gameId) or nil;
    local v35 = if v34 ~= nil then l_getRbxthumbWithTypeSizeAndOptions_0(tostring(v34), l_Constants_0.RbxthumbTypes.GameIcon, 150, false) else nil;
    return l_React_0.createElement(l_Foundation_0.View, {
        tag = "align-y-center row auto-none size-full radius-medium gap-medium gui-object-defaults padding-x-xlarge padding-y-medium"
    }, {
        Thumbnail = if v35 then l_React_0.createElement(l_Image_0, {
            tag = "radius-small bg-surface-100 size-1000", 
            LayoutOrder = 1, 
            Image = v35
        }) else nil, 
        TextContainer = l_React_0.createElement(l_Foundation_0.View, {
            tag = "auto-y fill col gap-xsmall align-x-left gui-object-defaults", 
            LayoutOrder = 2
        }, {
            Title = l_React_0.createElement(l_Foundation_0.Text, {
                tag = "auto-y text-align-x-left text-no-wrap text-title-medium content-emphasis", 
                LayoutOrder = 1, 
                Text = v25.Title
            }), 
            Body = l_React_0.createElement(l_Foundation_0.Text, {
                tag = "auto-y content-default text-body-medium text-align-x-left text-no-wrap gui-object-defaults", 
                LayoutOrder = 2, 
                Text = v25.Body
            })
        }), 
        JoinButton = l_React_0.createElement(l_Foundation_0.Button, {
            LayoutOrder = 3, 
            text = v25.Join, 
            size = l_ButtonSize_0.Medium, 
            variant = l_ButtonVariant_0.Standard, 
            isDisabled = v28 ~= nil, 
            onActivated = l_React_0.useCallback(function() --[[ Line: 101 ]]
                -- upvalues: v33 (copy), v1 (ref), v23 (copy), v15 (ref), v24 (copy), l_SquadExperienceInviteSource_0 (ref), l_EventNames_0 (ref), v29 (copy), v22 (copy), v32 (copy), l_RbxAnalyticsService_0 (ref), l_SquadToastActionsAndStates_0 (ref), l_SquadRegroupEntryPoint_0 (ref)
                if v33 == nil then
                    v1:warning("SquadRegroupEventReceiver: Join clicked but rootPlaceId is missing from local presence");
                    return;
                else
                    v23(v15(tostring(v33), v24, l_SquadExperienceInviteSource_0.Regroup)):andThen(function(v36) --[[ Line: 113 ]]
                        -- upvalues: v24 (ref), l_EventNames_0 (ref), v29 (ref), v22 (ref), v32 (ref), l_RbxAnalyticsService_0 (ref), l_SquadToastActionsAndStates_0 (ref), l_SquadRegroupEntryPoint_0 (ref)
                        v24.fireSquadAnalytics(l_EventNames_0.SquadRegroupButtonClicked, {
                            clientTimestamp = os.time(), 
                            squadId = v29, 
                            initiatorId = v22.localUserId, 
                            gameInstanceId = v32.gameId, 
                            rootPlaceId = v32.rootPlaceId, 
                            placeId = v32.placeId, 
                            universeId = v32.universeId, 
                            playSessionId = l_RbxAnalyticsService_0:GetPlaySessionId(), 
                            experienceInviteId = v36, 
                            button = l_SquadToastActionsAndStates_0.RegroupJoin, 
                            entryPoint = l_SquadRegroupEntryPoint_0.SquadLobbyButton
                        });
                    end);
                    return;
                end;
            end, {
                v23, 
                v15, 
                v33, 
                v24, 
                v29, 
                v22.localUserId, 
                v32
            })
        })
    });
end;