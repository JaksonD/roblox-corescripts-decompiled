local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_HttpRbxApiService_0 = game:GetService("HttpRbxApiService");
local l_RobloxReplicatedStorage_0 = game:GetService("RobloxReplicatedStorage");
local v4 = l_CoreGui_0:WaitForChild("RobloxGui", 1e999);
local l_Constants_0 = require(l_CorePackages_0.Workspace.Packages.CoreScriptsCommon).Constants;
local l_Modules_0 = l_CoreGui_0.RobloxGui.Modules;
local l_ShareGame_0 = l_Modules_0.Settings.Pages.ShareGame;
local v8 = require(l_CorePackages_0.Packages.Promise);
local v9 = require(v4.Modules.Settings.Utility);
local v10 = require(l_Modules_0.Flags.GetFFlagEnableNewInviteMenu);
local v11 = require(l_CorePackages_0.Packages.Roact);
local v12 = require(l_CorePackages_0.Packages.RoactRodux);
local l_RoactAppPolicy_0 = require(l_CorePackages_0.Workspace.Packages.UniversalAppPolicy).RoactAppPolicy;
local v14 = require(l_Modules_0.Common.httpRequest);
local v15 = require(l_ShareGame_0.Components.Header);
local v16 = require(l_ShareGame_0.Components.ConversationList);
local v17 = require(l_ShareGame_0.Constants);
local v18 = require(l_ShareGame_0.Components.ShareInviteLink);
local l_GetGameNameAndDescription_0 = require(l_CorePackages_0.Workspace.Packages.GameDetailRodux).GetGameNameAndDescription;
local v20 = require(l_ShareGame_0.Components.BackButton);
local v21 = require(l_ShareGame_0.Actions.SetGameInfoCreated);
local v22 = 10;
local v23 = 44;
if v10() then
    v22 = 16;
    v23 = 52;
end;
local v24 = v11.PureComponent:extend("ShareGamePageFrame");
local v25 = require(l_ShareGame_0.Components.ErrorToaster);
v24.init = function(v26) --[[ Line: 43 ]] --[[ Name: init ]]
    v26.state = {
        serverType = nil
    };
end;
v24.shouldShowInviteLink = function(v27, v28) --[[ Line: 49 ]] --[[ Name: shouldShowInviteLink ]]
    -- upvalues: l_Constants_0 (copy), v9 (copy)
    if v27.props.experienceInviteShareLinkEnabled and v27.state.serverType == l_Constants_0.STANDARD_SERVER and v9:IsExperienceOlderThanOneWeek(v28) then
        return true;
    else
        return false;
    end;
end;
v24.didMount = function(v29) --[[ Line: 61 ]] --[[ Name: didMount ]]
    -- upvalues: v8 (copy), l_RobloxReplicatedStorage_0 (copy)
    v29.props.fetchGameInfo();
    if v29.state.serverType == nil then
        v8.try(function() --[[ Line: 64 ]]
            -- upvalues: l_RobloxReplicatedStorage_0 (ref)
            return l_RobloxReplicatedStorage_0:WaitForChild("GetServerType", 1e999):InvokeServer();
        end):andThen(function(v30) --[[ Line: 67 ]]
            -- upvalues: v29 (copy)
            v29:setState({
                serverType = v30
            });
        end);
    end;
end;
v24.render = function(v31) --[[ Line: 73 ]] --[[ Name: render ]]
    -- upvalues: v17 (copy), v20 (copy), v23 (ref), v11 (copy), l_CoreGui_0 (copy), v25 (copy), v15 (copy), v18 (copy), v16 (copy), v22 (ref)
    local l_analytics_0 = v31.props.analytics;
    local l_deviceLayout_0 = v31.props.deviceLayout;
    local l_zIndex_0 = v31.props.zIndex;
    local l_closePage_0 = v31.props.closePage;
    local l_searchAreaActive_0 = v31.props.searchAreaActive;
    local l_searchText_0 = v31.props.searchText;
    local v38 = v17.LayoutSpecific[l_deviceLayout_0];
    local l_HEADER_HEIGHT_0 = v38.HEADER_HEIGHT;
    local v40 = l_deviceLayout_0 == v17.DeviceLayout.DESKTOP;
    local v41 = not v40 and v20.IconType.Arrow or v20.IconType.None;
    local v42 = not v40;
    local l_isVisible_0 = v31.props.isVisible;
    local v44 = v31:shouldShowInviteLink(v31.props.gameInfo);
    local v45 = 0;
    local v46 = 0;
    if v44 then
        v45 = v45 - v23;
        v46 = 10;
    end;
    return v11.createElement("Frame", {
        BackgroundTransparency = 1, 
        Size = UDim2.new(1, 0, 1, 0), 
        Position = UDim2.new(0, 0, 0, 0), 
        ZIndex = l_zIndex_0, 
        AutoLocalize = false
    }, {
        toasterPortal = v11.createElement(v11.Portal, {
            target = l_CoreGui_0
        }, {
            Toaster = v11.createElement(v25)
        }), 
        Header = v11.createElement(v15, {
            deviceLayout = l_deviceLayout_0, 
            size = UDim2.new(1, 0, 0, l_HEADER_HEIGHT_0), 
            position = UDim2.new(0, 0, 0, -l_HEADER_HEIGHT_0), 
            layoutOrder = 0, 
            zIndex = l_zIndex_0, 
            closePage = l_closePage_0, 
            searchAreaActive = l_searchAreaActive_0, 
            toggleSearchIcon = v42, 
            iconType = v41, 
            analytics = l_analytics_0
        }), 
        ShareInviteLink = v44 and v11.createElement(v18, {
            position = UDim2.new(0, 0, 0, v46), 
            analytics = l_analytics_0, 
            deviceLayout = l_deviceLayout_0, 
            size = UDim2.new(1, 0, 0, v23), 
            layoutOrder = 1, 
            zIndex = l_zIndex_0
        }) or nil, 
        ConversationList = v11.createElement(v16, {
            analytics = l_analytics_0, 
            size = UDim2.new(1, 0, 1, v38.EXTEND_BOTTOM_SIZE - v22 + v45), 
            topPadding = v44 and v22 + v23 + v46 or v22, 
            layoutOrder = v44 and 2 or 1, 
            zIndex = l_zIndex_0, 
            searchText = l_searchText_0, 
            isVisible = l_isVisible_0, 
            trigger = "GameMenu"
        })
    });
end;
v24 = v12.connect(function(v47) --[[ Line: 143 ]]
    return {
        gameInfo = v47.GameInfo
    };
end, function(v48) --[[ Line: 147 ]]
    -- upvalues: v14 (copy), l_HttpRbxApiService_0 (copy), l_GetGameNameAndDescription_0 (copy), v21 (copy)
    return {
        fetchGameInfo = function() --[[ Line: 149 ]] --[[ Name: fetchGameInfo ]]
            -- upvalues: v14 (ref), l_HttpRbxApiService_0 (ref), l_GetGameNameAndDescription_0 (ref), v48 (copy), v21 (ref)
            local v49 = v14(l_HttpRbxApiService_0);
            l_GetGameNameAndDescription_0(v49, game.GameId):andThen(function(v50) --[[ Line: 151 ]]
                -- upvalues: v48 (ref), v21 (ref)
                v48(v21(v50.Created));
            end);
        end
    };
end)(v24);
return (l_RoactAppPolicy_0.connect(function(v51) --[[ Line: 158 ]]
    return {
        experienceInviteShareLinkEnabled = v51.getExperienceInviteShareLinkEnabled()
    };
end)(v24));