local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Packages.Cryo);
local v2 = require(l_CorePackages_0.Packages.Roact);
local v3 = require(l_CorePackages_0.Packages.RoactRodux);
local v4 = require(l_CorePackages_0.Packages.Dash);
local v5 = require(l_CorePackages_0.Packages.t);
local l_RoactNetworking_0 = require(l_CorePackages_0.Workspace.Packages.RoactServiceTags).RoactNetworking;
local v7 = require(l_CorePackages_0.Workspace.Packages.GamePlayButton);
local l_usePlayButtonState_0 = v7.usePlayButtonState;
local l_useOnPlayButtonCallback_0 = v7.useOnPlayButtonCallback;
local l_useOnPlaySquadButtonCallback_0 = v7.useOnPlaySquadButtonCallback;
local l_usePlayButtonContextualMessage_0 = v7.usePlayButtonContextualMessage;
local l_useRoactService_0 = require(l_CorePackages_0.Workspace.Packages.RobloxAppHooks).useRoactService;
local l_GameInfosReducer_0 = require(l_CorePackages_0.Workspace.Packages.GameInfosRodux).GameInfosReducer;
local l_MenuDirection_0 = require(l_CorePackages_0.Packages.UIBlox).App.Menu.MenuDirection;
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v16 = require(l_Modules_0.LuaApp.Common.wrapComponent);
local l_GetFFlagLuaAppEnableVirtualEventPlaceId_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagLuaAppEnableVirtualEventPlaceId;
local l_FFlagLuaAppEnablePlaySquadButton_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagLuaAppEnablePlaySquadButton;
return {
    connect = function(v19, v20) --[[ Line: 28 ]] --[[ Name: connect ]]
        -- upvalues: v2 (copy), v5 (copy), l_FFlagLuaAppEnablePlaySquadButton_0 (copy), v4 (copy), l_useRoactService_0 (copy), l_RoactNetworking_0 (copy), l_usePlayButtonState_0 (copy), l_useOnPlayButtonCallback_0 (copy), l_GetFFlagLuaAppEnableVirtualEventPlaceId_0 (copy), l_usePlayButtonContextualMessage_0 (copy), l_useOnPlaySquadButtonCallback_0 (copy), l_MenuDirection_0 (copy), v1 (copy), v3 (copy), l_GameInfosReducer_0 (copy), v16 (copy)
        return function(v21) --[[ Line: 29 ]]
            -- upvalues: v2 (ref), v5 (ref), l_FFlagLuaAppEnablePlaySquadButton_0 (ref), v4 (ref), v20 (copy), l_useRoactService_0 (ref), l_RoactNetworking_0 (ref), l_usePlayButtonState_0 (ref), l_useOnPlayButtonCallback_0 (ref), l_GetFFlagLuaAppEnableVirtualEventPlaceId_0 (ref), l_usePlayButtonContextualMessage_0 (ref), l_useOnPlaySquadButtonCallback_0 (ref), l_MenuDirection_0 (ref), v1 (ref), v3 (ref), l_GameInfosReducer_0 (ref), v16 (ref), v19 (copy)
            local v22 = v2.PureComponent:extend("LaunchExperienceConnector(" .. tostring(v21) .. ")");
            v22.validateProps = v5.interface({
                componentProps = v5.table, 
                universeId = v5.string, 
                extraParams = v5.optional(v5.table), 
                launchSource = v5.optional(v5.string), 
                eventContext = v5.optional(v5.string), 
                referralSource = v5.optional(v5.string), 
                fetchDelayInSeconds = v5.optional(v5.number), 
                placeId = v5.optional(v5.string)
            });
            v22.init = function(v23) --[[ Line: 47 ]] --[[ Name: init ]]
                -- upvalues: l_FFlagLuaAppEnablePlaySquadButton_0 (ref)
                v23.onPlayButtonActivated = function(v24, v25) --[[ Line: 48 ]]
                    -- upvalues: v23 (copy)
                    local v26 = v24 or v23.props.playButtonState;
                    v23.props.onPlayButtonCallback(v26, v25);
                end;
                if l_FFlagLuaAppEnablePlaySquadButton_0 then
                    v23.onPlaySquadButtonActivated = function(v27) --[[ Line: 54 ]]
                        -- upvalues: v23 (copy)
                        v23.props.onPlaySquadButtonCallback(v27);
                    end;
                end;
            end;
            v22.render = function(v28) --[[ Line: 60 ]] --[[ Name: render ]]
                -- upvalues: l_FFlagLuaAppEnablePlaySquadButton_0 (ref), v2 (ref), v21 (copy), v4 (ref), v20 (ref)
                local l_componentProps_0 = v28.props.componentProps;
                local v30 = {
                    playabilityStatus = v28.props.playabilityStatus, 
                    playButtonState = v28.props.playButtonState, 
                    onPlayButtonActivated = v28.onPlayButtonActivated, 
                    onPlaySquadButtonActivated = if l_FFlagLuaAppEnablePlaySquadButton_0 then v28.onPlaySquadButtonActivated else nil, 
                    playButtonContextualMessage = v28.props.playButtonContextualMessage, 
                    gameName = v28.props.gameName, 
                    fetchDelayInSeconds = v28.props.fetchDelayInSeconds
                };
                return v2.createElement(v21, v4.assign({}, v28.props.componentProps, v20(v30, l_componentProps_0)));
            end;
            local l_v22_0 = v22;
            v22 = function(v32) --[[ Line: 80 ]]
                -- upvalues: l_useRoactService_0 (ref), l_RoactNetworking_0 (ref), l_usePlayButtonState_0 (ref), l_useOnPlayButtonCallback_0 (ref), l_GetFFlagLuaAppEnableVirtualEventPlaceId_0 (ref), l_usePlayButtonContextualMessage_0 (ref), l_FFlagLuaAppEnablePlaySquadButton_0 (ref), l_useOnPlaySquadButtonCallback_0 (ref), l_MenuDirection_0 (ref), v1 (ref), v2 (ref), l_v22_0 (copy)
                local v33 = l_useRoactService_0(l_RoactNetworking_0);
                local v34 = l_usePlayButtonState_0(v33, v32.universeId, v32.fetchDelayInSeconds);
                local v35 = l_useOnPlayButtonCallback_0(v32.universeId, v32.referralSource, v32.eventContext or "PlayButton", nil, v32.launchSource or "UnknownLaunchSource", v32.extraParams, if l_GetFFlagLuaAppEnableVirtualEventPlaceId_0() then v32.placeId else nil);
                local v36 = l_usePlayButtonContextualMessage_0(v32.universeId, v34.playButtonState, v34.playabilityStatus);
                local v37 = if l_FFlagLuaAppEnablePlaySquadButton_0 then l_useOnPlaySquadButtonCallback_0(l_MenuDirection_0.Down, v34.playButtonState, v32.referralSource, v32.universeId) else nil;
                local v38 = v1.Dictionary.join(v32, {
                    onPlayButtonCallback = v35, 
                    onPlaySquadButtonCallback = if l_FFlagLuaAppEnablePlaySquadButton_0 then v37 else nil, 
                    playButtonState = v34.playButtonState, 
                    playabilityStatus = v34.playabilityStatus, 
                    playButtonContextualMessage = v36
                });
                return v2.createElement(l_v22_0, v38);
            end;
            v22 = v3.connect(function(v39, v40) --[[ Line: 123 ]]
                -- upvalues: l_GameInfosReducer_0 (ref)
                local l_universeId_0 = v40.universeId;
                local v42 = v39.GameDetails[l_universeId_0];
                local v43 = v39.Personalization[l_GameInfosReducer_0.key][v40.universeId];
                return {
                    gameName = v42 and v42.name or v43 and v43.name or nil
                };
            end)(v22);
            return v16(function(v44, v45) --[[ Line: 135 ]]
                -- upvalues: v19 (ref), v2 (ref)
                local v46 = v19(v45);
                return v2.createElement(v44, {
                    componentProps = v45, 
                    universeId = v46.universeId, 
                    extraParams = v46.extraParams, 
                    launchSource = v46.launchSource, 
                    eventContext = v46.eventContext, 
                    referralSource = v46.referralSource, 
                    fetchDelayInSeconds = v46.fetchDelayInSeconds, 
                    placeId = v46.placeId
                });
            end)(v22);
        end;
    end
};