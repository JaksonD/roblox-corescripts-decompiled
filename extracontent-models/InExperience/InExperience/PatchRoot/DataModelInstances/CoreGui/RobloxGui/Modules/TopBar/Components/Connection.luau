local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Packages.Roact);
local l_Parent_0 = script.Parent.Parent;
local v3 = require(l_Parent_0.Flags.GetFFlagRemoveTopBarInputTypeRodux)();
local v4 = require(l_Parent_0.Flags.FFlagTopBarDeprecateCoreGuiRodux);
local v5 = require(l_Parent_0.Flags.FFlagTopBarDeprecateChatRodux);
local v6 = require(l_Parent_0.Flags.FFlagTopBarDeprecateDisplayOptionsRodux);
local v7 = require(l_Parent_0.Flags.FFlagTopBarDeprecateRespawnRodux);
local v8 = require(l_Parent_0.Flags.FFlagTopBarDeprecateMoreMenuRodux);
local v9 = require(l_CorePackages_0.Workspace.Packages.CoreGuiCommon);
local l_FFlagTopBarSignalizeHealthBar_0 = v9.Flags.FFlagTopBarSignalizeHealthBar;
local l_FFlagTopBarSignalizeMenuOpen_0 = v9.Flags.FFlagTopBarSignalizeMenuOpen;
local v12 = require(script.CoreGuiConnector);
local v13 = require(script.MenuConnector);
local v14 = require(script.ChatConnector);
local v15 = require(script.HealthConnector);
local v16 = require(script.EnabledNotifier);
local v17 = require(script.OpenUIConnector);
local v18 = require(script.LastInputTypeConnector);
local v19 = v1.PureComponent:extend("Connection");
v19.render = function(_) --[[ Line: 28 ]] --[[ Name: render ]]
    -- upvalues: v1 (copy), v4 (copy), v12 (copy), l_FFlagTopBarSignalizeMenuOpen_0 (copy), v7 (copy), v13 (copy), v5 (copy), v14 (copy), l_FFlagTopBarSignalizeHealthBar_0 (copy), v15 (copy), v6 (copy), v16 (copy), v8 (copy), v17 (copy), v3 (copy), v18 (copy)
    return v1.createFragment({
        CoreGuiConnector = if v4 then nil else v1.createElement(v12), 
        MenuConnector = if l_FFlagTopBarSignalizeMenuOpen_0 and v7 then nil else v1.createElement(v13), 
        ChatConnector = if v5 then nil else v1.createElement(v14), 
        HealthConnector = if l_FFlagTopBarSignalizeHealthBar_0 then nil else v1.createElement(v15), 
        EnabledNotifier = if v6 then nil else v1.createElement(v16), 
        OpenUIConnector = if v8 then nil else v1.createElement(v17), 
        LastInputTypeConnector = if v3 then nil else v1.createElement(v18)
    });
end;
return v19;