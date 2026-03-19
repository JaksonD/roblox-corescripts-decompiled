local l_RbxAnalyticsService_0 = game:GetService("RbxAnalyticsService");
local l_GuiService_0 = game:GetService("GuiService");
local l_script_FirstAncestor_0 = script:FindFirstAncestor("PeopleReactView");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v4 = require(l_Parent_0.React);
local v5 = require(l_Parent_0.SignalsReact);
local l_formatUsername_0 = require(l_Parent_0.UserProfiles).Formatters.formatUsername;
local v7 = require(l_Parent_0.Foundation);
local l_ButtonVariant_0 = v7.Enums.ButtonVariant;
local l_ControlState_0 = v7.Enums.ControlState;
local l_IconName_0 = v7.Enums.IconName;
local l_IconVariant_0 = v7.Enums.IconVariant;
local l_InputSize_0 = v7.Enums.InputSize;
local l_StateLayerAffordance_0 = v7.Enums.StateLayerAffordance;
local l_IconButton_0 = v7.IconButton;
local l_Text_0 = v7.Text;
local l_View_0 = v7.View;
local v17 = require(l_script_FirstAncestor_0.Configs.PersonButtonConfigs);
local v18 = require(l_script_FirstAncestor_0.Hooks.useGetPeopleService);
local v19 = require(l_script_FirstAncestor_0.Hooks.useInExperienceCombinedName);
local v20 = require(l_script_FirstAncestor_0.Hooks.useIsComponentInputEnded);
local l_game_EngineFeature_0 = game:GetEngineFeature("RbxAnalyticsServiceExposePlaySessionId");
local l_FFlagAddIEMProfilePage_0 = require(l_Parent_0.SharedFlags).FFlagAddIEMProfilePage;
return v4.memo(function(v23) --[[ Line: 42 ]] --[[ Name: CardDetails ]]
    -- upvalues: v4 (copy), v18 (copy), l_FFlagAddIEMProfilePage_0 (copy), v17 (copy), v19 (copy), v5 (copy), l_IconName_0 (copy), l_IconVariant_0 (copy), v20 (copy), l_ControlState_0 (copy), l_game_EngineFeature_0 (copy), l_RbxAnalyticsService_0 (copy), l_GuiService_0 (copy), l_View_0 (copy), l_StateLayerAffordance_0 (copy), l_Text_0 (copy), l_formatUsername_0 (copy), l_IconButton_0 (copy), l_ButtonVariant_0 (copy), l_InputSize_0 (copy)
    local v24 = v4.useRef(nil);
    local v25 = v18("FriendStatusStore");
    local v26 = v18("Constants");
    local v27 = if l_FFlagAddIEMProfilePage_0 then v18("PeopleAnalyticsManager") else nil;
    local v28 = if l_FFlagAddIEMProfilePage_0 then v18("SettingsHubService") else nil;
    local v29 = v17(v23.person.UserId);
    local v30 = v4.useMemo(function() --[[ Line: 56 ]]
        -- upvalues: v29 (copy), v26 (copy)
        return v29[v26.PERSON_BUTTONS.ADD_FRIEND];
    end, {
        v29
    });
    local v31 = v19(v23.person.UserId, v23.person.DisplayName);
    local v32 = v5.useSignalState(v25.getFriendStatus(v23.person.UserId));
    local v33 = v5.useSignalState(v25.getIsFriendButtonGrayedOut(v23.person.UserId));
    local v34 = v4.useMemo(function() --[[ Line: 66 ]]
        -- upvalues: v32 (copy), l_IconName_0 (ref), l_IconVariant_0 (ref), v33 (copy)
        if v32 then
            return {
                name = l_IconName_0.PersonCheck, 
                variant = l_IconVariant_0.Filled
            };
        elseif v33 then
            return {
                name = l_IconName_0.Clock, 
                variant = l_IconVariant_0.Filled
            };
        else
            return {
                name = l_IconName_0.PersonPlus, 
                variant = l_IconVariant_0.Regular
            };
        end;
    end, {
        v32, 
        v33
    });
    local v35 = v20(v24);
    local v36 = v5.useSignalState(v25.getIsFriendButtonDisabled(v23.person.UserId));
    local v37, v38 = v4.useState(false);
    local v42 = v4.useCallback(function(v39) --[[ Line: 91 ]]
        -- upvalues: v38 (copy), l_ControlState_0 (ref)
        local l_v38_0 = v38;
        local v41 = true;
        if v39 ~= l_ControlState_0.Hover then
            v41 = v39 == l_ControlState_0.Pressed;
        end;
        l_v38_0(v41);
    end, {});
    local v45 = if l_FFlagAddIEMProfilePage_0 then v4.useCallback(function() --[[ Line: 96 ]]
        -- upvalues: v28 (copy), v23 (copy), l_game_EngineFeature_0 (ref), l_RbxAnalyticsService_0 (ref), v27 (copy), l_GuiService_0 (ref)
        local v43 = v28.hubRef();
        if v43 then
            v43:SwitchToReactPage(v43.PlayerProfilePage, {
                userId = v23.person.UserId, 
                inspectAvatar = function() --[[ Line: 101 ]] --[[ Name: inspectAvatar ]]
                    -- upvalues: l_game_EngineFeature_0 (ref), l_RbxAnalyticsService_0 (ref), v27 (ref), l_GuiService_0 (ref), v23 (ref), v43 (copy)
                    local v44 = if l_game_EngineFeature_0 then l_RbxAnalyticsService_0:GetPlaySessionId() else nil;
                    v27:trackInspectButton(game.GameId, v44, "player_profile");
                    l_GuiService_0:InspectPlayerFromUserIdWithCtx(v23.person.UserId, "playerProfile");
                    v43:SetVisibility(false);
                end, 
                closePage = function() --[[ Line: 110 ]] --[[ Name: closePage ]]
                    -- upvalues: v43 (copy)
                    v43:CloseReactPage();
                end
            });
        end;
    end, {}) else nil;
    local v46 = v4.useCallback(function() --[[ Line: 118 ]]
        -- upvalues: v30 (copy), v26 (copy)
        v30.onActivated(v26.ANALYTICS.ENTRY_POINT.PEOPLE_CARD);
    end, {
        v30.onActivated
    });
    return v4.createElement(l_View_0, {
        tag = "row size-full-1400 align-y-center padding-x-small radius-medium", 
        LayoutOrder = v23.layoutOrder, 
        stateLayer = {
            affordance = if not not v37 or v35 then l_StateLayerAffordance_0.None else l_StateLayerAffordance_0.Background
        }, 
        onActivated = if l_FFlagAddIEMProfilePage_0 then v45 else nil, 
        ref = v24
    }, {
        NameContainer = v4.createElement(l_View_0, {
            tag = "col fill auto-y", 
            LayoutOrder = 1
        }, {
            Name = v4.createElement(l_Text_0, {
                tag = "size-full-0 auto-y content-emphasis text-title-medium text-align-x-left text-truncate-end padding-right-small", 
                Text = v31, 
                LayoutOrder = 1
            }), 
            Handle = v4.createElement(l_Text_0, {
                tag = "size-full-0 auto-y content-default text-body-medium text-align-x-left text-truncate-end padding-right-small", 
                Text = l_formatUsername_0(v23.person.Name), 
                LayoutOrder = 2
            })
        }), 
        ConnectButtonBackground = v4.createElement(l_View_0, {
            AutomaticSize = Enum.AutomaticSize.XY, 
            LayoutOrder = 2, 
            stateLayer = {
                affordance = l_StateLayerAffordance_0.None
            }, 
            onStateChanged = v42
        }, {
            ConnectButton = v4.createElement(l_IconButton_0, {
                icon = v34, 
                variant = if v36 then l_ButtonVariant_0.Utility else l_ButtonVariant_0.Standard, 
                size = l_InputSize_0.Medium, 
                isDisabled = v36, 
                Visible = v30.shouldShow(), 
                onActivated = v46
            })
        })
    });
end);