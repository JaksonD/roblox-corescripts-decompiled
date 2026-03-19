local l_CorePackages_0 = game:GetService("CorePackages");
local l_RobloxGui_0 = game:GetService("CoreGui"):WaitForChild("RobloxGui");
local v2 = require(l_CorePackages_0.Packages.Roact);
local v3 = require(l_CorePackages_0.Packages.RoactRodux);
local v4 = require(l_CorePackages_0.Workspace.Packages.PlayerList);
local l_UiModeStyleProvider_0 = require(l_CorePackages_0.Workspace.Packages.Style).UiModeStyleProvider;
local l_Parent_0 = script.Parent;
local l_Connection_0 = l_Parent_0.Components.Connection;
local v8 = require(l_Parent_0.Components.Presentation.PlayerListApp);
local v9 = require(l_Parent_0.Components.PresentationMobile.PlayerListApp);
local l_Provider_0 = require(l_Connection_0.LayoutValues).Provider;
local v11 = require(l_Parent_0.CreateLayoutValues);
local v12 = require(l_RobloxGui_0.Modules.TenFootInterface);
local v13 = require(l_Parent_0.Actions.SetPlayerListVisibility);
local v14 = require(l_Parent_0.PlayerListInitialVisibleState);
local l_FFlagEnableMobilePlayerListOnConsole_0 = v4.Flags.FFlagEnableMobilePlayerListOnConsole;
local v16 = v2.PureComponent:extend("PlayerListSwitcher");
v16.didMount = function(v17) --[[ Line: 28 ]] --[[ Name: didMount ]]
    -- upvalues: v14 (copy)
    v17.props.setPlayerListVisible(v14());
end;
v16.wrapWithUiModeStyleProvider = function(v18, v19) --[[ Line: 32 ]] --[[ Name: wrapWithUiModeStyleProvider ]]
    -- upvalues: v2 (copy), l_UiModeStyleProvider_0 (copy)
    return {
        ThemeProvider = v2.createElement(l_UiModeStyleProvider_0, {
            style = {
                themeName = v18.props.appStyleForUiModeStyleProvider.themeName, 
                fontName = v18.props.appStyleForUiModeStyleProvider.fontName
            }
        }, v19)
    };
end;
v16.render = function(v20) --[[ Line: 43 ]] --[[ Name: render ]]
    -- upvalues: v2 (copy), l_Provider_0 (copy), v11 (copy), l_FFlagEnableMobilePlayerListOnConsole_0 (copy), v12 (copy), v9 (copy), v8 (copy)
    return v2.createElement(l_Provider_0, {
        layoutValues = v11(not l_FFlagEnableMobilePlayerListOnConsole_0 and v12:IsEnabled())
    }, v20:wrapWithUiModeStyleProvider({
        PlayerListApp = v20.props.isSmallTouchDevice and v2.createElement(v9, {
            setLayerCollectorEnabled = v20.props.setLayerCollectorEnabled
        }) or v2.createElement(v8, {
            setLayerCollectorEnabled = v20.props.setLayerCollectorEnabled
        })
    }));
end;
v16.didUpdate = function(v21) --[[ Line: 59 ]] --[[ Name: didUpdate ]]
    v21.props.setPlayerListVisible(not v21.props.isSmallTouchDevice);
end;
return v3.connect(function(v22) --[[ Line: 63 ]] --[[ Name: mapStateToProps ]]
    return {
        isSmallTouchDevice = v22.displayOptions.isSmallTouchDevice
    };
end, function(v23) --[[ Line: 69 ]] --[[ Name: mapDispatchToProps ]]
    -- upvalues: v13 (copy)
    return {
        setPlayerListVisible = function(v24) --[[ Line: 71 ]] --[[ Name: setPlayerListVisible ]]
            -- upvalues: v23 (copy), v13 (ref)
            return v23(v13(v24));
        end
    };
end)(v16);