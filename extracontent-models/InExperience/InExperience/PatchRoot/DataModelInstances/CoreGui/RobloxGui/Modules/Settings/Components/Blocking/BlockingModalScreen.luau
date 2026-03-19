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
local v12 = game:DefineFastFlag("CoreScriptsBlockingModalUseFoundationOverlay", false);
local v13 = v4.PureComponent:extend("BlockingModalScreen");
v13.validateProps = v3.interface({
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
v13.render = function(v14) --[[ Line: 36 ]] --[[ Name: render ]]
    -- upvalues: v4 (copy), l_FocusRoot_0 (copy), l_FocusNavigableSurfaceIdentifierEnum_0 (copy), v6 (copy), l_CoreGui_0 (copy), v7 (copy)
    local l_overlay_0 = v14.props.overlay;
    local v16 = v4.createElement(l_FocusRoot_0, {
        surfaceIdentifier = l_FocusNavigableSurfaceIdentifierEnum_0.CentralOverlay, 
        isIsolated = true, 
        isAutoFocusRoot = true
    }, {
        BlockingModalContainerWrapper = v4.createElement(v6, v14.props)
    });
    local v17 = nil;
    v17 = if l_overlay_0 ~= nil then {
        v4.createElement(v4.Portal, {
            target = l_overlay_0
        }, {
            BlockingModalScreen = v16
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
                BlockingModalContainer = v16
            })
        })
    };
    return v7(v17);
end;
local function v21(v18) --[[ Line: 75 ]] --[[ Name: BlockingModalScreenWithFoundationOverlay ]]
    -- upvalues: l_useOverlay_0 (copy), v4 (copy), v13 (copy)
    local v19 = l_useOverlay_0();
    local v20 = table.clone(v18);
    v20.overlay = v19;
    return v4.createElement(v13, v20);
end;
if v12 then
    return v21;
else
    return v13;
end;