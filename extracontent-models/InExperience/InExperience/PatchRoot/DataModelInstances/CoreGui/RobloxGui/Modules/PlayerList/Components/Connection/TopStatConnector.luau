local l_CorePackages_0 = game:GetService("CorePackages");
local l_CoreGui_0 = game:GetService("CoreGui");
local l_UserInputService_0 = game:GetService("UserInputService");
local l_GuiService_0 = game:GetService("GuiService");
local v4 = require(l_CorePackages_0.Packages.Roact);
local v5 = require(l_CorePackages_0.Packages.React);
local v6 = require(l_CorePackages_0.Packages.RoactRodux);
local v7 = require(l_CorePackages_0.Workspace.Packages.PlayerList);
local l_RobloxGui_0 = l_CoreGui_0:WaitForChild("RobloxGui");
local v9 = require(l_RobloxGui_0.Modules.TenFootInterface);
local l_Parent_0 = script.Parent.Parent.Parent;
local v11 = require(l_Parent_0.Flags.FFlagPlayerListReduceRerenders);
local l_FFlagEnableMobilePlayerListOnConsole_0 = v7.Flags.FFlagEnableMobilePlayerListOnConsole;
local v13 = game:DefineFastFlag("PlayerListTopStatCheckGamepad", false);
local v14 = nil;
local v15 = not v13 or l_UserInputService_0.PreferredInput == Enum.PreferredInput.Gamepad;
if if l_FFlagEnableMobilePlayerListOnConsole_0 then l_GuiService_0.ViewportDisplaySize == Enum.DisplaySize.Large and v15 else v9:IsEnabled() then
    v14 = v9:SetupTopStat();
end;
local v16 = v4.PureComponent:extend("TopStatConnector");
v16.render = function(v17) --[[ Line: 33 ]] --[[ Name: render ]]
    -- upvalues: v14 (ref)
    if v14 then
        v14:SetTopStatEnabled(v17.props.displayOptions.playerlistCoreGuiEnabled);
    end;
    return nil;
end;
local function v19(v18) --[[ Line: 40 ]] --[[ Name: mapStateToProps ]]
    return {
        displayOptions = v18.displayOptions
    };
end;
if v11 then
    return v5.memo(v6.connect(v19, nil)(v16));
else
    return v6.connect(v19, nil)(v16);
end;