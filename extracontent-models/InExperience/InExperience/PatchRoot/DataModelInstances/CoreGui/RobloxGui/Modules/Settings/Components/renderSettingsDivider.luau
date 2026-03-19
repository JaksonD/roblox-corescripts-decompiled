local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Packages.React);
local v2 = require(l_CorePackages_0.Packages.ReactRoblox);
local v3 = require(l_CorePackages_0.Packages.Foundation);
local v4 = require(l_CorePackages_0.Workspace.Packages.CoreScriptsCommon);
local l_Parent_0 = script.Parent.Parent;
local v6 = require(l_Parent_0.InExperienceMenuReact);
local l_Create_0 = require(l_CorePackages_0.Workspace.Packages.AppCommonLib).Create;
local l_SettingsShowSignal_0 = v4.SettingsShowSignal;
local l_View_0 = v3.View;
local l_Divider_0 = v3.Divider;
local l_DividerOrientation_0 = v3.Enums.DividerOrientation;
local l_useTokens_0 = v3.Hooks.useTokens;
local function v14() --[[ Line: 23 ]] --[[ Name: DividerContainer ]]
    -- upvalues: l_useTokens_0 (copy), v1 (copy), l_View_0 (copy), l_Divider_0 (copy), l_DividerOrientation_0 (copy)
    local v13 = l_useTokens_0();
    return v1.createElement(l_View_0, {
        tag = "auto-xy", 
        padding = {
            left = UDim.new(0, 10), 
            top = UDim.new(0, v13.Padding.XSmall), 
            bottom = UDim.new(0, v13.Padding.Large)
        }
    }, {
        Divider = v1.createElement(l_Divider_0, {
            orientation = l_DividerOrientation_0.Horizontal
        })
    });
end;
return function(v15) --[[ Line: 39 ]] --[[ Name: renderSettingsDivider ]]
    -- upvalues: l_Create_0 (copy), l_SettingsShowSignal_0 (copy), v2 (copy), v1 (copy), v6 (copy), v14 (copy)
    local v16 = l_Create_0("Frame")({
        Name = "DividerWrapper", 
        Size = UDim2.fromScale(1, 0), 
        BackgroundTransparency = 1, 
        AutomaticSize = Enum.AutomaticSize.Y, 
        LayoutOrder = v15.layoutOrder, 
        Parent = v15.parent
    });
    local v17 = nil;
    l_SettingsShowSignal_0:connect(function(v18) --[[ Line: 50 ]]
        -- upvalues: v17 (ref), v16 (copy), v15 (copy), v2 (ref), v1 (ref), v6 (ref), v14 (ref)
        if not v18 then
            if v17 then
                v17:unmount();
                v17 = nil;
                v16.Parent = nil;
            end;
            return;
        else
            v16.Parent = v15.parent;
            v17 = v2.createRoot(v16);
            v17:render(v1.createElement(v6, nil, {
                DividerContainer = v1.createElement(v14)
            }));
            return;
        end;
    end);
    return v16;
end;