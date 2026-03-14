local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Packages.React);
local l_useSelector_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useSelector;
local l_useStyle_0 = require(l_CorePackages_0.Packages.UIBlox).Core.Style.useStyle;
local v4 = require(l_CorePackages_0.Packages.ReactFocusNavigation);
local v5 = v4.FocusNavigationService.new(v4.EngineInterface.CoreGui);
local v6 = require(l_CorePackages_0.Workspace.Packages.FocusNavigationUtils);
local l_Provider_0 = v6.FocusNavigableSurfaceRegistry.Provider;
local l_FocusRoot_0 = v6.FocusRoot;
local l_FocusNavigableSurfaceIdentifierEnum_0 = v6.FocusNavigableSurfaceIdentifierEnum;
local l_Parent_0 = script.Parent.Parent;
local v11 = require(l_Parent_0.Colors);
local v12 = require(l_Parent_0.Components.OverlayComponents);
local function v14(v13) --[[ Line: 30 ]] --[[ Name: selectOverlayComponent ]]
    -- upvalues: v12 (copy)
    return v12[v13.overlay.overlay];
end;
local function v16(v15) --[[ Line: 34 ]] --[[ Name: selectOverlayProps ]]
    return v15.overlay.overlayProps;
end;
return function(_) --[[ Line: 38 ]] --[[ Name: Overlay ]]
    -- upvalues: l_useSelector_0 (copy), v14 (copy), v16 (copy), l_useStyle_0 (copy), v1 (copy), v4 (copy), v5 (copy), l_Provider_0 (copy), l_FocusRoot_0 (copy), l_FocusNavigableSurfaceIdentifierEnum_0 (copy), v11 (copy)
    local v18 = l_useSelector_0(v14);
    local v19 = l_useSelector_0(v16);
    local v20 = l_useStyle_0();
    return v1.createElement(v4.FocusNavigationContext.Provider, {
        value = v5
    }, {
        FocusNavigationRegistryProvider = v1.createElement(l_Provider_0, nil, {
            FocusNavigationCoreScriptsWrapper = v1.createElement(l_FocusRoot_0, {
                surfaceIdentifier = l_FocusNavigableSurfaceIdentifierEnum_0.CentralOverlay, 
                isIsolated = true, 
                isAutoFocusRoot = true
            }, {
                OverlayContainer = v1.createElement("Frame", {
                    BackgroundTransparency = v20.Tokens.Semantic.Color.Common.Overlay.Transparency, 
                    BackgroundColor3 = v11.Black, 
                    BorderSizePixel = 0, 
                    Size = UDim2.fromScale(1, 1), 
                    Visible = v18 ~= nil
                }, {
                    Overlay = v18 and v1.createElement(v18, v19) or nil
                })
            })
        })
    });
end;