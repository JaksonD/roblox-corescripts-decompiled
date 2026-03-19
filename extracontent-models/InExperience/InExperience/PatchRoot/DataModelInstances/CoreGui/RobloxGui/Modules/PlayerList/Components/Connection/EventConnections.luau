local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Packages.Roact);
local v2 = require(l_CorePackages_0.Workspace.Packages.PlayerList);
local v3 = require(script.Parent.PlayerServiceConnector);
local v4 = require(script.Parent.TeamServiceConnector);
local v5 = require(script.Parent.LeaderstatsConnector);
local v6 = require(script.Parent.CoreGuiConnector);
local v7 = require(script.Parent.SocialConnector);
local v8 = require(script.Parent.GuiServiceConnector);
local v9 = require(script.Parent.UserInputServiceConnector);
local v10 = require(script.Parent.ScreenSizeConnector);
local l_FFlagUseNewPlayerList_0 = v2.Flags.FFlagUseNewPlayerList;
local v12 = v1.PureComponent:extend("EventConnections");
v12.render = function(_) --[[ Line: 22 ]] --[[ Name: render ]]
    -- upvalues: v1 (copy), v3 (copy), l_FFlagUseNewPlayerList_0 (copy), v4 (copy), v5 (copy), v6 (copy), v7 (copy), v8 (copy), v9 (copy), v10 (copy)
    return v1.createFragment({
        PlayerServiceConnector = v1.createElement(v3), 
        TeamServiceConnector = if l_FFlagUseNewPlayerList_0 then nil else v1.createElement(v4), 
        LeaderstatsConnector = if l_FFlagUseNewPlayerList_0 then nil else v1.createElement(v5), 
        CoreGuiConnector = v1.createElement(v6), 
        SocialConnector = v1.createElement(v7), 
        GuiServiceConnector = v1.createElement(v8), 
        UserInputServiceConnector = v1.createElement(v9), 
        ScreenSizeConnector = v1.createElement(v10)
    });
end;
return v12;