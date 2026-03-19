local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Packages.Roact);
local l_Parent_0 = script.Parent.Parent;
local v3 = require(l_Parent_0.Flags.FFlagTopBarDeprecateCoreGuiRodux);
local v4 = require(l_Parent_0.Flags.FFlagTopBarDeprecateChatRodux);
local v5 = require(l_Parent_0.Flags.FFlagTopBarDeprecateDisplayOptionsRodux);
local v6 = require(l_Parent_0.Flags.FFlagTopBarDeprecateRespawnRodux);
local v7 = require(l_Parent_0.Flags.FFlagTopBarDeprecateMoreMenuRodux);
local v8 = require(l_CorePackages_0.Workspace.Packages.CoreGuiCommon);
local l_FFlagTopBarSignalizeHealthBar_0 = v8.Flags.FFlagTopBarSignalizeHealthBar;
local l_FFlagTopBarSignalizeMenuOpen_0 = v8.Flags.FFlagTopBarSignalizeMenuOpen;
local v11 = require(script.CoreGuiConnector);
local v12 = require(script.MenuConnector);
local v13 = require(script.ChatConnector);
local v14 = require(script.HealthConnector);
local v15 = require(script.EnabledNotifier);
local v16 = require(script.OpenUIConnector);
local _ = require(script.LastInputTypeConnector);
local v18 = v1.PureComponent:extend("Connection");
v18.render = function(_) --[[ Line: 26 ]] --[[ Name: render ]]
    -- upvalues: v1 (copy), v3 (copy), v11 (copy), l_FFlagTopBarSignalizeMenuOpen_0 (copy), v6 (copy), v12 (copy), v4 (copy), v13 (copy), l_FFlagTopBarSignalizeHealthBar_0 (copy), v14 (copy), v5 (copy), v15 (copy), v7 (copy), v16 (copy)
    return v1.createFragment({
        CoreGuiConnector = if v3 then nil else v1.createElement(v11), 
        MenuConnector = if l_FFlagTopBarSignalizeMenuOpen_0 and v6 then nil else v1.createElement(v12), 
        ChatConnector = if v4 then nil else v1.createElement(v13), 
        HealthConnector = if l_FFlagTopBarSignalizeHealthBar_0 then nil else v1.createElement(v14), 
        EnabledNotifier = if v5 then nil else v1.createElement(v15), 
        OpenUIConnector = if v7 then nil else v1.createElement(v16)
    });
end;
return v18;