local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Packages.Cryo);
local v2 = require(l_CorePackages_0.Packages.t);
local l_GamesProductInfoReducer_0 = require(l_CorePackages_0.Workspace.Packages.GameProductInfoRodux).GamesProductInfoReducer;
local v4 = require(l_CorePackages_0.Packages.Roact);
local v5 = require(l_CorePackages_0.Packages.RoactRodux);
local l_RoactNetworking_0 = require(l_CorePackages_0.Workspace.Packages.RoactServiceTags).RoactNetworking;
local v7 = require(l_CorePackages_0.Workspace.Packages.GamePlayButton);
local l_useOnPlayButtonCallback_0 = v7.useOnPlayButtonCallback;
local l_useOnPlaySquadButtonCallback_0 = v7.useOnPlaySquadButtonCallback;
local l_usePlayButtonState_0 = v7.usePlayButtonState;
local l_useRoactService_0 = require(l_CorePackages_0.Workspace.Packages.RobloxAppHooks).useRoactService;
local l_MenuDirection_0 = require(l_CorePackages_0.Packages.UIBlox).App.Menu.MenuDirection;
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v14 = require(l_Modules_0.LuaApp.Components.Games.PlayButton);
local l_FFlagLuaAppEnablePlaySquadButton_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagLuaAppEnablePlaySquadButton;
local l_FFlagLuaAppEnableCustomSpawnSponsored_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagLuaAppEnableCustomSpawnSponsored;
local v17 = v4.PureComponent:extend("PlayButtonContainer");
v17.validateProps = v2.strictInterface({
    universeId = v2.string, 
    Size = v2.optional(v2.UDim2), 
    LayoutOrder = v2.optional(v2.number), 
    referralSource = v2.optional(v2.string), 
    experienceJoinData = v2.optional(v2.table), 
    placeId = if l_FFlagLuaAppEnableCustomSpawnSponsored_0 then v2.optional(v2.string) else nil, 
    testId = v2.optional(v2.string), 
    onPlayButtonCallback = v2.callback, 
    onPlaySquadButtonCallback = if l_FFlagLuaAppEnablePlaySquadButton_0 then v2.callback else nil, 
    playButtonState = v2.string, 
    gameProductInfo = v2.optional(v2.table)
});
v17.init = function(v18) --[[ Line: 45 ]] --[[ Name: init ]]
    -- upvalues: l_FFlagLuaAppEnablePlaySquadButton_0 (copy)
    v18.isMounted = false;
    v18.onPlayButtonActivated = function() --[[ Line: 48 ]]
        -- upvalues: v18 (copy)
        if not v18.isMounted then
            return;
        else
            v18.props.onPlayButtonCallback(v18.props.playButtonState);
            return;
        end;
    end;
    v18.onPlaySquadButtonActivated = l_FFlagLuaAppEnablePlaySquadButton_0 and function(v19) --[[ Line: 57 ]]
        -- upvalues: v18 (copy)
        if not v18.isMounted then
            return;
        else
            v18.props.onPlaySquadButtonCallback(v19);
            return;
        end;
    end or nil;
end;
v17.didMount = function(v20) --[[ Line: 67 ]] --[[ Name: didMount ]]
    v20.isMounted = true;
end;
v17.willUnmount = function(v21) --[[ Line: 71 ]] --[[ Name: willUnmount ]]
    v21.isMounted = false;
end;
v17.render = function(v22) --[[ Line: 75 ]] --[[ Name: render ]]
    -- upvalues: v4 (copy), v14 (copy), l_FFlagLuaAppEnablePlaySquadButton_0 (copy)
    local l_Size_0 = v22.props.Size;
    local l_LayoutOrder_0 = v22.props.LayoutOrder;
    local l_playButtonState_0 = v22.props.playButtonState;
    local l_gameProductInfo_0 = v22.props.gameProductInfo;
    local v27 = l_gameProductInfo_0 and l_gameProductInfo_0.price or 0;
    return v4.createElement(v14, {
        Size = l_Size_0, 
        LayoutOrder = l_LayoutOrder_0, 
        playButtonState = l_playButtonState_0, 
        price = v27, 
        localizedFiatPrice = l_gameProductInfo_0 and l_gameProductInfo_0.localizedFiatPrice or "", 
        onPlayButtonActivated = v22.onPlayButtonActivated, 
        onPlaySquadButtonActivated = if l_FFlagLuaAppEnablePlaySquadButton_0 then v22.onPlaySquadButtonActivated else nil, 
        testId = v22.props.testId
    });
end;
local l_v17_0 = v17;
return (v5.connect(function(v29, v30) --[[ Line: 128 ]]
    -- upvalues: l_GamesProductInfoReducer_0 (copy)
    local l_universeId_0 = v30.universeId;
    return {
        gameProductInfo = v29[l_GamesProductInfoReducer_0.key][l_universeId_0]
    };
end)(function(v32) --[[ Line: 95 ]]
    -- upvalues: l_useRoactService_0 (copy), l_RoactNetworking_0 (copy), l_usePlayButtonState_0 (copy), l_useOnPlayButtonCallback_0 (copy), l_FFlagLuaAppEnableCustomSpawnSponsored_0 (copy), l_FFlagLuaAppEnablePlaySquadButton_0 (copy), l_useOnPlaySquadButtonCallback_0 (copy), l_MenuDirection_0 (copy), v1 (copy), v4 (copy), l_v17_0 (copy)
    local v33 = l_useRoactService_0(l_RoactNetworking_0);
    local v34 = l_usePlayButtonState_0(v33, v32.universeId, nil);
    local v35 = l_useOnPlayButtonCallback_0(v32.universeId, v32.referralSource, "PlayButton", nil, "LuaGameCard", v32.experienceJoinData, if l_FFlagLuaAppEnableCustomSpawnSponsored_0 then v32.placeId else nil);
    local v36 = if l_FFlagLuaAppEnablePlaySquadButton_0 then l_useOnPlaySquadButtonCallback_0(l_MenuDirection_0.Up, v34.playButtonState, v32.referralSource, v32.universeId) else nil;
    local v37 = v1.Dictionary.join(v32, {
        onPlayButtonCallback = v35, 
        onPlaySquadButtonCallback = v36, 
        playButtonState = v34.playButtonState
    });
    return v4.createElement(l_v17_0, v37);
end));