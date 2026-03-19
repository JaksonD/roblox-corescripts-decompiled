local l_script_FirstAncestor_0 = script:FindFirstAncestor("ServerDrivenUi");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local l_FFlagLuaAppSduiUpdateUserSettingsAction_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppSduiUpdateUserSettingsAction;
local v3 = require(l_script_FirstAncestor_0.Actions.SduiDismissDialogAction);
local v4 = require(l_script_FirstAncestor_0.Actions.SduiLinkAction);
local v5 = require(l_script_FirstAncestor_0.Actions.SduiOpenGameDetailsAction);
local v6 = require(l_script_FirstAncestor_0.Actions.SduiOpenJoinFriendsAction);
local v7 = require(l_script_FirstAncestor_0.Actions.SduiOpenSeeAllAction);
local v8 = require(l_script_FirstAncestor_0.Actions.SduiOpenSponsoredTooltipAction);
local v9 = require(l_script_FirstAncestor_0.Actions.SduiOpenTooltipAction);
local v10 = require(l_script_FirstAncestor_0.Actions.SduiOpenMarketplaceTryOnAction);
local v11 = if l_FFlagLuaAppSduiUpdateUserSettingsAction_0 then require(l_script_FirstAncestor_0.Actions.SduiUpdateUserSettingsAction) else nil;
local v12 = require(l_script_FirstAncestor_0.Actions.SduiRemoveBadgeFromInventoryAction);
local l_SduiActionType_0 = require(l_Parent_0.SduiCoreSystem).SduiActionType;
local l_FFlagSduiActionsUpdateFiresOwnTelemetry_0 = require(l_Parent_0.SharedFlags).FFlagSduiActionsUpdateFiresOwnTelemetry;
local l_FFlagLuaAppSduiBadgeDetailsComponents_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppSduiBadgeDetailsComponents;
local l_FFlagLuaAppSduiRemoveAbuseReportActionFromLegacyRegistry_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppSduiRemoveAbuseReportActionFromLegacyRegistry;
local v17 = if l_FFlagLuaAppSduiRemoveAbuseReportActionFromLegacyRegistry_0 then nil else require(l_script_FirstAncestor_0.Actions.SduiOpenAbuseReportAction);
local v18 = {};
v18.__index = v18;
v18.new = function() --[[ Line: 48 ]] --[[ Name: new ]]
    -- upvalues: l_SduiActionType_0 (copy), v3 (copy), v4 (copy), l_FFlagLuaAppSduiRemoveAbuseReportActionFromLegacyRegistry_0 (copy), v17 (copy), v5 (copy), l_FFlagSduiActionsUpdateFiresOwnTelemetry_0 (copy), v6 (copy), v7 (copy), v8 (copy), v10 (copy), l_FFlagLuaAppSduiUpdateUserSettingsAction_0 (copy), v11 (copy), l_FFlagLuaAppSduiBadgeDetailsComponents_0 (copy), v12 (copy), v9 (copy), v18 (copy)
    local v19 = {
        _registeredActionHandlerConfigs = {
            [l_SduiActionType_0.DismissDialog] = {
                handler = v3, 
                firesOwnTelemetry = false
            }, 
            [l_SduiActionType_0.Link] = {
                handler = v4, 
                firesOwnTelemetry = false
            }, 
            [l_SduiActionType_0.OpenAbuseReport] = if l_FFlagLuaAppSduiRemoveAbuseReportActionFromLegacyRegistry_0 then nil else {
                handler = v17, 
                firesOwnTelemetry = false
            }, 
            [l_SduiActionType_0.OpenGameDetails] = {
                handler = v5, 
                firesOwnTelemetry = l_FFlagSduiActionsUpdateFiresOwnTelemetry_0 and true or false
            }, 
            [l_SduiActionType_0.OpenJoinFriends] = {
                handler = v6, 
                firesOwnTelemetry = false
            }, 
            [l_SduiActionType_0.OpenSeeAll] = {
                handler = v7, 
                firesOwnTelemetry = l_FFlagSduiActionsUpdateFiresOwnTelemetry_0 and true or false
            }, 
            [l_SduiActionType_0.OpenSponsoredTooltip] = {
                handler = v8, 
                firesOwnTelemetry = false
            }, 
            [l_SduiActionType_0.OpenMarketplaceTryOn] = {
                handler = v10, 
                firesOwnTelemetry = false
            }, 
            [l_SduiActionType_0.UpdateUserSettings] = {
                handler = if l_FFlagLuaAppSduiUpdateUserSettingsAction_0 then v11 else nil, 
                firesOwnTelemetry = false
            }, 
            [l_SduiActionType_0.PlayButtonClick] = {
                handler = nil, 
                firesOwnTelemetry = l_FFlagSduiActionsUpdateFiresOwnTelemetry_0 and true or false
            }, 
            [l_SduiActionType_0.RemoveBadgeFromInventory] = if l_FFlagLuaAppSduiBadgeDetailsComponents_0 then {
                handler = v12, 
                firesOwnTelemetry = false
            } else nil, 
            [l_SduiActionType_0.OpenTooltip] = {
                handler = v9, 
                firesOwnTelemetry = false
            }
        }
    };
    setmetatable(v19, v18);
    return v19;
end;
v18.getActionHandlerConfig = function(v20, v21) --[[ Line: 111 ]] --[[ Name: getActionHandlerConfig ]]
    return v20._registeredActionHandlerConfigs[v21];
end;
v18.registerActionHandlerConfig = function(v22, v23, v24) --[[ Line: 118 ]] --[[ Name: registerActionHandlerConfig ]]
    v22._registeredActionHandlerConfigs[v23] = v24;
end;
return v18;