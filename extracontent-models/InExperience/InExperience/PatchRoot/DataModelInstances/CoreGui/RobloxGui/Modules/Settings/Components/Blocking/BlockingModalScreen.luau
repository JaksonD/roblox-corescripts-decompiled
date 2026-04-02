local l_CoreGui_0 = game:GetService("CoreGui");
local l_RobloxGui_0 = l_CoreGui_0:WaitForChild("RobloxGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local v3 = require(l_CorePackages_0.Packages.t);
local v4 = require(l_CorePackages_0.Packages.Roact);
local v5 = require(l_CorePackages_0.Packages.Foundation);
local v6 = require(script.Parent.BlockingModalContainer);
local v7 = require(l_RobloxGui_0.Modules.Common.renderWithCoreScriptsStyleProvider);
local v8 = require(l_CorePackages_0.Workspace.Packages.FocusNavigationUtils);
local l_FocusRoot_0 = v8.FocusRoot;
local l_FocusNavigableSurfaceIdentifierEnum_0 = v8.FocusNavigableSurfaceIdentifierEnum;
local l_useOverlay_0 = v5.Hooks.useOverlay;
local v12 = v4.PureComponent:extend("BlockingModalScreen");
v12.validateProps = v3.interface({
    closeModal = v3.callback, 
    player = v3.interface({
        DisplayName = v3.string, 
        Name = v3.string, 
        UserId = v3.number
    }), 
    translator = v3.optional(v3.table), 
    source = v3.optional(v3.string), 
    onBlockingSuccess = v3.optional(v3.callback), 
    overlay = v3.optional(v3.instanceIsA("GuiBase2d"))
});
v12.render = function(v13) --[[ Line: 33 ]] --[[ Name: render ]]
    -- upvalues: v4 (copy), l_FocusRoot_0 (copy), l_FocusNavigableSurfaceIdentifierEnum_0 (copy), v6 (copy), l_CoreGui_0 (copy), v7 (copy)
    local l_overlay_0 = v13.props.overlay;
    local v15 = v4.createElement(l_FocusRoot_0, {
        surfaceIdentifier = l_FocusNavigableSurfaceIdentifierEnum_0.CentralOverlay, 
        isIsolated = true, 
        isAutoFocusRoot = true
    }, {
        BlockingModalContainerWrapper = v4.createElement(v6, v13.props)
    });
    local v16 = nil;
    v16 = if l_overlay_0 ~= nil then {
        v4.createElement(v4.Portal, {
            target = l_overlay_0
        }, {
            BlockingModalScreen = v15
        })
    } else {
        v4.createElement(v4.Portal, {
            target = l_CoreGui_0
        }, {
            BlockingModalScreen = v4.createElement("ScreenGui", {
                IgnoreGuiInset = true, 
                AutoLocalize = false, 
                DisplayOrder = 6
            }, {
                BlockingModalContainer = v15
            })
        })
    };
    return v7(v16);
end;
return function(v17) --[[ Line: 72 ]] --[[ Name: BlockingModalScreenWithFoundationOverlay ]]
    -- upvalues: l_useOverlay_0 (copy), v4 (copy), v12 (copy)
    local v18 = l_useOverlay_0();
    local v19 = table.clone(v17);
    v19.overlay = v18;
    return v4.createElement(v12, v19);
end;