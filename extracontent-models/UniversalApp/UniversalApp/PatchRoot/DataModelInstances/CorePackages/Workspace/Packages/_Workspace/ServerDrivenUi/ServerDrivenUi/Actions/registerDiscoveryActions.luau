local l_script_FirstAncestor_0 = script:FindFirstAncestor("ServerDrivenUi");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local l_FFlagLuaAppSduiUpdateUserSettingsAction_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppSduiUpdateUserSettingsAction;
local v3 = require(l_Parent_0.SduiCoreSystem);
local l_SduiActionType_0 = v3.SduiActionType;
local l_getSduiActionHandlerRegistry_0 = v3.getSduiActionHandlerRegistry;
local l_FFlagSduiActionsUpdateFiresOwnTelemetry_0 = require(l_Parent_0.SharedFlags).FFlagSduiActionsUpdateFiresOwnTelemetry;
local l_FFlagSduiActionTelemetryHandler_0 = require(l_Parent_0.SharedFlags).FFlagSduiActionTelemetryHandler;
local l_FFlagLuaAppSduiBadgeDetailsComponents_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppSduiBadgeDetailsComponents;
local l_FFlagSduiExperienceDetailsSupport_0 = require(l_Parent_0.SharedFlags).FFlagSduiExperienceDetailsSupport;
local l_FFlagSduiEventDetailsSupport_0 = require(l_Parent_0.SharedFlags).FFlagSduiEventDetailsSupport;
return function() --[[ Line: 24 ]] --[[ Name: registerDiscoveryActions ]]
    -- upvalues: l_SduiActionType_0 (copy), l_script_FirstAncestor_0 (copy), l_FFlagSduiActionsUpdateFiresOwnTelemetry_0 (copy), l_FFlagLuaAppSduiBadgeDetailsComponents_0 (copy), l_FFlagSduiExperienceDetailsSupport_0 (copy), l_FFlagSduiActionTelemetryHandler_0 (copy), l_FFlagLuaAppSduiUpdateUserSettingsAction_0 (copy), l_FFlagSduiEventDetailsSupport_0 (copy), l_getSduiActionHandlerRegistry_0 (copy)
    local v11 = {
        [l_SduiActionType_0.DismissDialog] = {
            lazyHandler = function() --[[ Line: 27 ]] --[[ Name: lazyHandler ]]
                -- upvalues: l_script_FirstAncestor_0 (ref)
                return require(l_script_FirstAncestor_0.Actions.SduiDismissDialogAction);
            end, 
            firesOwnTelemetry = false
        }, 
        [l_SduiActionType_0.Link] = {
            lazyHandler = function() --[[ Line: 33 ]] --[[ Name: lazyHandler ]]
                -- upvalues: l_script_FirstAncestor_0 (ref)
                return require(l_script_FirstAncestor_0.Actions.SduiLinkAction);
            end, 
            firesOwnTelemetry = false
        }, 
        [l_SduiActionType_0.OpenAbuseReport] = {
            lazyHandler = function() --[[ Line: 39 ]] --[[ Name: lazyHandler ]]
                -- upvalues: l_script_FirstAncestor_0 (ref)
                return require(l_script_FirstAncestor_0.Actions.SduiOpenAbuseReportAction);
            end, 
            firesOwnTelemetry = false
        }, 
        [l_SduiActionType_0.OpenGameDetails] = {
            lazyHandler = function() --[[ Line: 45 ]] --[[ Name: lazyHandler ]]
                -- upvalues: l_script_FirstAncestor_0 (ref)
                return require(l_script_FirstAncestor_0.Actions.SduiOpenGameDetailsAction);
            end, 
            firesOwnTelemetry = l_FFlagSduiActionsUpdateFiresOwnTelemetry_0 and true or false
        }, 
        [l_SduiActionType_0.OpenBadgeDetails] = {
            lazyHandler = function() --[[ Line: 51 ]] --[[ Name: lazyHandler ]]
                -- upvalues: l_script_FirstAncestor_0 (ref)
                return require(l_script_FirstAncestor_0.Actions.SduiOpenBadgeDetailsAction);
            end, 
            firesOwnTelemetry = false
        }, 
        [l_SduiActionType_0.OpenProfile] = if l_FFlagLuaAppSduiBadgeDetailsComponents_0 then {
            lazyHandler = function() --[[ Line: 58 ]] --[[ Name: lazyHandler ]]
                -- upvalues: l_script_FirstAncestor_0 (ref)
                return require(l_script_FirstAncestor_0.Actions.SduiOpenProfileAction);
            end, 
            firesOwnTelemetry = false
        } else nil, 
        [l_SduiActionType_0.OpenJoinFriends] = {
            lazyHandler = function() --[[ Line: 65 ]] --[[ Name: lazyHandler ]]
                -- upvalues: l_script_FirstAncestor_0 (ref)
                return require(l_script_FirstAncestor_0.Actions.SduiOpenJoinFriendsAction);
            end, 
            firesOwnTelemetry = false
        }, 
        [l_SduiActionType_0.OpenSeeAll] = {
            lazyHandler = function() --[[ Line: 71 ]] --[[ Name: lazyHandler ]]
                -- upvalues: l_script_FirstAncestor_0 (ref)
                return require(l_script_FirstAncestor_0.Actions.SduiOpenSeeAllAction);
            end, 
            firesOwnTelemetry = l_FFlagSduiActionsUpdateFiresOwnTelemetry_0 and true or false
        }, 
        [l_SduiActionType_0.OpenSocialLink] = if l_FFlagSduiExperienceDetailsSupport_0 then {
            lazyHandler = function() --[[ Line: 78 ]] --[[ Name: lazyHandler ]]
                -- upvalues: l_script_FirstAncestor_0 (ref)
                return require(l_script_FirstAncestor_0.Actions.SduiOpenSocialLinkAction);
            end, 
            lazyTelemetryHandler = l_FFlagSduiActionTelemetryHandler_0 and function() --[[ Line: 82 ]]
                -- upvalues: l_script_FirstAncestor_0 (ref)
                return require(l_script_FirstAncestor_0.Actions.TelemetryHandlers.SduiLeavingRobloxTelemetryHandler);
            end or nil, 
            firesOwnTelemetry = true
        } else nil, 
        [l_SduiActionType_0.OpenSongDetail] = if l_FFlagSduiExperienceDetailsSupport_0 then {
            lazyHandler = function() --[[ Line: 91 ]] --[[ Name: lazyHandler ]]
                -- upvalues: l_script_FirstAncestor_0 (ref)
                return require(l_script_FirstAncestor_0.Actions.SduiOpenSongDetailAction);
            end, 
            firesOwnTelemetry = false
        } else nil, 
        [l_SduiActionType_0.OpenSponsoredTooltip] = {
            lazyHandler = function() --[[ Line: 98 ]] --[[ Name: lazyHandler ]]
                -- upvalues: l_script_FirstAncestor_0 (ref)
                return require(l_script_FirstAncestor_0.Actions.SduiOpenSponsoredTooltipAction);
            end, 
            firesOwnTelemetry = false
        }, 
        [l_SduiActionType_0.OpenMarketplaceTryOn] = {
            lazyHandler = function() --[[ Line: 104 ]] --[[ Name: lazyHandler ]]
                -- upvalues: l_script_FirstAncestor_0 (ref)
                return require(l_script_FirstAncestor_0.Actions.SduiOpenMarketplaceTryOnAction);
            end, 
            firesOwnTelemetry = false
        }, 
        [l_SduiActionType_0.UpdateUserSettings] = if l_FFlagLuaAppSduiUpdateUserSettingsAction_0 then {
            lazyHandler = function() --[[ Line: 111 ]] --[[ Name: lazyHandler ]]
                -- upvalues: l_script_FirstAncestor_0 (ref)
                return require(l_script_FirstAncestor_0.Actions.SduiUpdateUserSettingsAction);
            end, 
            firesOwnTelemetry = false
        } else nil, 
        [l_SduiActionType_0.PlayButtonClick] = {
            lazyHandler = function() --[[ Line: 118 ]] --[[ Name: lazyHandler ]]
                return nil;
            end, 
            firesOwnTelemetry = l_FFlagSduiActionsUpdateFiresOwnTelemetry_0 and true or false
        }, 
        [l_SduiActionType_0.OpenTooltip] = {
            lazyHandler = function() --[[ Line: 124 ]] --[[ Name: lazyHandler ]]
                -- upvalues: l_script_FirstAncestor_0 (ref)
                return require(l_script_FirstAncestor_0.Actions.SduiOpenTooltipAction);
            end, 
            firesOwnTelemetry = false
        }, 
        [l_SduiActionType_0.RemoveBadgeFromInventory] = if l_FFlagLuaAppSduiBadgeDetailsComponents_0 then {
            lazyHandler = function() --[[ Line: 131 ]] --[[ Name: lazyHandler ]]
                -- upvalues: l_script_FirstAncestor_0 (ref)
                return require(l_script_FirstAncestor_0.Actions.SduiRemoveBadgeFromInventoryAction);
            end, 
            firesOwnTelemetry = false
        } else nil, 
        [l_SduiActionType_0.RsvpToEvent] = if l_FFlagSduiEventDetailsSupport_0 then {
            lazyHandler = function() --[[ Line: 139 ]] --[[ Name: lazyHandler ]]
                -- upvalues: l_script_FirstAncestor_0 (ref)
                return require(l_script_FirstAncestor_0.Actions.SduiRsvpToEventAction);
            end, 
            firesOwnTelemetry = false
        } else nil, 
        [l_SduiActionType_0.OpenGameInvite] = if l_FFlagSduiExperienceDetailsSupport_0 then {
            lazyHandler = function() --[[ Line: 147 ]] --[[ Name: lazyHandler ]]
                -- upvalues: l_script_FirstAncestor_0 (ref)
                return require(l_script_FirstAncestor_0.Actions.SduiOpenGameInviteAction);
            end, 
            firesOwnTelemetry = true
        } else nil
    };
    l_getSduiActionHandlerRegistry_0().registerActionHandlerConfigs(v11);
end;