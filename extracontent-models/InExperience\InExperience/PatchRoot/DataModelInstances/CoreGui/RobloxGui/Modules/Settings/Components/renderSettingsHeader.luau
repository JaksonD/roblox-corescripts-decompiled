local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Packages.React);
local v2 = require(l_CorePackages_0.Packages.ReactRoblox);
local v3 = require(l_CorePackages_0.Packages.Foundation);
local v4 = require(l_CorePackages_0.Workspace.Packages.Localization);
local v5 = require(l_CorePackages_0.Workspace.Packages.SettingReactView);
local v6 = require(l_CorePackages_0.Workspace.Packages.CoreScriptsCommon);
local l_Parent_0 = script.Parent.Parent;
local v8 = require(l_Parent_0.InExperienceMenuReact);
local l_Create_0 = require(l_CorePackages_0.Workspace.Packages.AppCommonLib).Create;
local l_useLocalization_0 = v4.Hooks.useLocalization;
local l_HeaderText_0 = v5.HeaderText;
local l_SettingsShowSignal_0 = v6.SettingsShowSignal;
local l_View_0 = v3.View;
local l_useTokens_0 = v3.Hooks.useTokens;
local function v18(v15) --[[ Line: 26 ]] --[[ Name: HeaderTextContainer ]]
    -- upvalues: l_useLocalization_0 (copy), l_useTokens_0 (copy), v1 (copy), l_View_0 (copy), l_HeaderText_0 (copy)
    local v16 = l_useLocalization_0({
        headerText = v15.text
    });
    local v17 = l_useTokens_0();
    return v1.createElement(l_View_0, {
        tag = "auto-xy", 
        padding = {
            left = UDim.new(0, 10), 
            bottom = UDim.new(0, v17.Padding.Small)
        }
    }, {
        Text = v1.createElement(l_HeaderText_0, {
            text = v16.headerText
        })
    });
end;
return function(v19) --[[ Line: 44 ]] --[[ Name: renderSettingsHeader ]]
    -- upvalues: l_Create_0 (copy), l_SettingsShowSignal_0 (copy), v2 (copy), v1 (copy), v8 (copy), v18 (copy)
    local v20 = l_Create_0("Frame")({
        Name = "HeaderWrapper", 
        Size = UDim2.fromScale(1, 0), 
        BackgroundTransparency = 1, 
        AutomaticSize = Enum.AutomaticSize.Y, 
        LayoutOrder = v19.layoutOrder, 
        Parent = v19.parent
    });
    local v21 = nil;
    l_SettingsShowSignal_0:connect(function(v22) --[[ Line: 55 ]]
        -- upvalues: v21 (ref), v20 (copy), v19 (copy), v2 (ref), v1 (ref), v8 (ref), v18 (ref)
        if not v22 then
            if v21 then
                v21:unmount();
                v21 = nil;
                v20.Parent = nil;
            end;
            return;
        else
            v20.Parent = v19.parent;
            v21 = v2.createRoot(v20);
            v21:render(v1.createElement(v8, nil, {
                HeaderTextContainer = v1.createElement(v18, {
                    text = v19.headerText
                })
            }));
            return;
        end;
    end);
    return v20;
end;