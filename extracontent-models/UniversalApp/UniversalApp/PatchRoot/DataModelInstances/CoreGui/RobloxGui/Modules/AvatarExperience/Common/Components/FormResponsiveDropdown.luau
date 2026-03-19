local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v2 = require(l_CorePackages_0.Packages.React);
local v3 = require(l_CorePackages_0.Packages.Foundation);
local l_Signal_0 = require(l_CorePackages_0.Workspace.Packages.AppCommonLib).Signal;
local l_useSelector_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useSelector;
local l_useSignal_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).Hooks.useSignal;
local v7 = require(l_Modules_0.AvatarExperience.Common.Components.FormPeekview);
local v8 = require(l_Modules_0.AvatarExperience.Common.Components.FormDropdown);
local v9 = require(l_Modules_0.AvatarExperience.Common.Selectors.selectIsPortrait);
return v2.forwardRef(function(v10, v11) --[[ Line: 32 ]] --[[ Name: FormResponsiveDropdown ]]
    -- upvalues: l_useSelector_0 (copy), v9 (copy), v2 (copy), l_Signal_0 (copy), l_useSignal_0 (copy), v7 (copy), v3 (copy), v8 (copy)
    local v12 = l_useSelector_0(v9);
    local v13 = v2.useRef(l_Signal_0.new());
    l_useSignal_0(v13.current, v10.onClose or function() --[[ Line: 35 ]]

    end);
    if v12 then
        return v2.createElement(v7, {
            canApply = v10.canApply, 
            onApply = v10.onApply, 
            closePeekViewSignal = v13.current, 
            totalSize = UDim2.fromScale(1, 0), 
            useAutomaticSize = true
        }, {
            Container = v2.createElement(v3.View, {
                tag = "auto-xy col"
            }, {
                Header = v10.headerText and v2.createElement(v3.Text, {
                    tag = "auto-xy text-title-large padding-x-xlarge padding-bottom-xlarge", 
                    Text = v10.headerText, 
                    LayoutOrder = 1
                }), 
                ChildrenContainer = v2.createElement(v3.View, {
                    tag = "padding-x-large auto-xy", 
                    LayoutOrder = 2
                }, v10.children)
            })
        });
    else
        return v2.createElement(v8, {
            canApply = v10.canApply, 
            onApply = v10.onApply, 
            onClose = v10.onClose, 
            dropdownPosition = v10.dropdownPosition, 
            headerText = v10.headerText, 
            ref = v11
        }, v10.children);
    end;
end);