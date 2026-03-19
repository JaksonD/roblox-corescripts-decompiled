local l_script_FirstAncestor_0 = script:FindFirstAncestor("ServerDrivenUi");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local l_FFlagLuaAppSduiUpdateUserSettingsAction_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppSduiUpdateUserSettingsAction;
local v3 = require(l_Parent_0.SduiCoreSystem);
local l_SduiActionType_0 = v3.SduiActionType;
local l_getSduiActionHandlerRegistry_0 = v3.getSduiActionHandlerRegistry;
local l_FFlagSduiActionsUpdateFiresOwnTelemetry_0 = require(l_Parent_0.SharedFlags).FFlagSduiActionsUpdateFiresOwnTelemetry;
local l_FFlagLuaAppSduiBadgeDetailsComponents_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppSduiBadgeDetailsComponents;
return function() --[[ Line: 21 ]] --[[ Name: registerDiscoveryActions ]]
    -- upvalues: l_SduiActionType_0 (copy), l_script_FirstAncestor_0 (copy), l_FFlagSduiActionsUpdateFiresOwnTelemetry_0 (copy), l_FFlagLuaAppSduiBadgeDetailsComponents_0 (copy), l_FFlagLuaAppSduiUpdateUserSettingsAction_0 (copy), l_getSduiActionHandlerRegistry_0 (copy)
    local v8 = {
        [l_SduiActionType_0.DismissDialog] = {
            lazyHandler = function() --[[ Line: 24 ]] --[[ Name: lazyHandler ]]
                -- upvalues: l_script_FirstAncestor_0 (ref)
                return require(l_script_FirstAncestor_0.Actions.SduiDismissDialogAction);
            end, 
            firesOwnTelemetry = false
        }, 
        [l_SduiActionType_0.Link] = {
            lazyHandler = function() --[[ Line: 30 ]] --[[ Name: lazyHandler ]]
                -- upvalues: l_script_FirstAncestor_0 (ref)
                return require(l_script_FirstAncestor_0.Actions.SduiLinkAction);
            end, 
            firesOwnTelemetry = false
        }, 
        [l_SduiActionType_0.OpenAbuseReport] = {
            lazyHandler = function() --[[ Line: 36 ]] --[[ Name: lazyHandler ]]
                -- upvalues: l_script_FirstAncestor_0 (ref)
                return require(l_script_FirstAncestor_0.Actions.SduiOpenAbuseReportAction);
            end, 
            firesOwnTelemetry = false
        }, 
        [l_SduiActionType_0.OpenGameDetails] = {
            lazyHandler = function() --[[ Line: 42 ]] --[[ Name: lazyHandler ]]
                -- upvalues: l_script_FirstAncestor_0 (ref)
                return require(l_script_FirstAncestor_0.Actions.SduiOpenGameDetailsAction);
            end, 
            firesOwnTelemetry = l_FFlagSduiActionsUpdateFiresOwnTelemetry_0 and true or false
        }, 
        [l_SduiActionType_0.OpenBadgeDetails] = {
            lazyHandler = function() --[[ Line: 48 ]] --[[ Name: lazyHandler ]]
                -- upvalues: l_script_FirstAncestor_0 (ref)
                return require(l_script_FirstAncestor_0.Actions.SduiOpenBadgeDetailsAction);
            end, 
            firesOwnTelemetry = false
        }, 
        [l_SduiActionType_0.OpenProfile] = if l_FFlagLuaAppSduiBadgeDetailsComponents_0 then {
            lazyHandler = function() --[[ Line: 55 ]] --[[ Name: lazyHandler ]]
                -- upvalues: l_script_FirstAncestor_0 (ref)
                return require(l_script_FirstAncestor_0.Actions.SduiOpenProfileAction);
            end, 
            firesOwnTelemetry = false
        } else nil, 
        [l_SduiActionType_0.OpenJoinFriends] = {
            lazyHandler = function() --[[ Line: 62 ]] --[[ Name: lazyHandler ]]
                -- upvalues: l_script_FirstAncestor_0 (ref)
                return require(l_script_FirstAncestor_0.Actions.SduiOpenJoinFriendsAction);
            end, 
            firesOwnTelemetry = false
        }, 
        [l_SduiActionType_0.OpenSeeAll] = {
            lazyHandler = function() --[[ Line: 68 ]] --[[ Name: lazyHandler ]]
                -- upvalues: l_script_FirstAncestor_0 (ref)
                return require(l_script_FirstAncestor_0.Actions.SduiOpenSeeAllAction);
            end, 
            firesOwnTelemetry = l_FFlagSduiActionsUpdateFiresOwnTelemetry_0 and true or false
        }, 
        [l_SduiActionType_0.OpenSponsoredTooltip] = {
            lazyHandler = function() --[[ Line: 74 ]] --[[ Name: lazyHandler ]]
                -- upvalues: l_script_FirstAncestor_0 (ref)
                return require(l_script_FirstAncestor_0.Actions.SduiOpenSponsoredTooltipAction);
            end, 
            firesOwnTelemetry = false
        }, 
        [l_SduiActionType_0.OpenMarketplaceTryOn] = {
            lazyHandler = function() --[[ Line: 80 ]] --[[ Name: lazyHandler ]]
                -- upvalues: l_script_FirstAncestor_0 (ref)
                return require(l_script_FirstAncestor_0.Actions.SduiOpenMarketplaceTryOnAction);
            end, 
            firesOwnTelemetry = false
        }, 
        [l_SduiActionType_0.UpdateUserSettings] = if l_FFlagLuaAppSduiUpdateUserSettingsAction_0 then {
            lazyHandler = function() --[[ Line: 87 ]] --[[ Name: lazyHandler ]]
                -- upvalues: l_script_FirstAncestor_0 (ref)
                return require(l_script_FirstAncestor_0.Actions.SduiUpdateUserSettingsAction);
            end, 
            firesOwnTelemetry = false
        } else nil, 
        [l_SduiActionType_0.PlayButtonClick] = {
            lazyHandler = function() --[[ Line: 94 ]] --[[ Name: lazyHandler ]]
                return nil;
            end, 
            firesOwnTelemetry = l_FFlagSduiActionsUpdateFiresOwnTelemetry_0 and true or false
        }, 
        [l_SduiActionType_0.OpenTooltip] = {
            lazyHandler = function() --[[ Line: 100 ]] --[[ Name: lazyHandler ]]
                -- upvalues: l_script_FirstAncestor_0 (ref)
                return require(l_script_FirstAncestor_0.Actions.SduiOpenTooltipAction);
            end, 
            firesOwnTelemetry = false
        }, 
        [l_SduiActionType_0.RemoveBadgeFromInventory] = if l_FFlagLuaAppSduiBadgeDetailsComponents_0 then {
            lazyHandler = function() --[[ Line: 107 ]] --[[ Name: lazyHandler ]]
                -- upvalues: l_script_FirstAncestor_0 (ref)
                return require(l_script_FirstAncestor_0.Actions.SduiRemoveBadgeFromInventoryAction);
            end, 
            firesOwnTelemetry = false
        } else nil
    };
    l_getSduiActionHandlerRegistry_0().registerActionHandlerConfigs(v8);
end;