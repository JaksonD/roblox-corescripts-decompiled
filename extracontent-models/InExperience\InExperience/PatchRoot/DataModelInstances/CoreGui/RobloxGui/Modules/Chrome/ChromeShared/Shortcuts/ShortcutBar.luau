local l_script_FirstAncestor_0 = script:FindFirstAncestor("ChromeShared");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_CoreGui_0 = game:GetService("CoreGui");
local v3 = require(l_script_FirstAncestor_0.Parent.Parent.TopBar.Components.GamepadConnector);
local v4 = require(l_CorePackages_0.Packages.React);
local v5 = require(l_CorePackages_0.Packages.ReactRoblox);
local v6 = require(l_CorePackages_0.Packages.UIBlox);
local v7 = require(l_CorePackages_0.Packages.Foundation);
local l_ShortcutBar_0 = v6.App.Navigation.ShortcutBar;
local _ = require(l_script_FirstAncestor_0.Service.Types);
local v10 = require(l_script_FirstAncestor_0.Unibar.Constants);
local v11 = require(l_script_FirstAncestor_0.Service.ViewportUtil);
local v12 = require(l_script_FirstAncestor_0.Hooks.useObservableValue);
local l_useTokens_0 = v7.Hooks.useTokens;
local v14 = require(l_script_FirstAncestor_0.Service);
local l_FFlagEnableConsoleExpControls_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagEnableConsoleExpControls;
local l_isSpatial_0 = require(l_CorePackages_0.Workspace.Packages.AppCommonLib).isSpatial;
local l_FFlagDisableGamepadConnectorInVR_0 = require(l_CorePackages_0.Workspace.Packages.Chrome).Flags.FFlagDisableGamepadConnectorInVR;
ChromeShortcutBar = function(_) --[[ Line: 26 ]] --[[ Name: ChromeShortcutBar ]]
    -- upvalues: v4 (copy), l_useTokens_0 (copy), v12 (copy), v11 (copy), v14 (copy), l_FFlagDisableGamepadConnectorInVR_0 (copy), l_isSpatial_0 (copy), v3 (copy), l_FFlagEnableConsoleExpControls_0 (copy), v5 (copy), v10 (copy), l_ShortcutBar_0 (copy), l_CoreGui_0 (copy)
    local v19, v20 = v4.useState({});
    local v21, v22 = v4.useState({});
    local v23, v24 = v4.useBinding(false);
    local v25 = l_useTokens_0();
    local v26 = v12(v11.screenSize);
    local v27 = v4.useRef(0);
    local function v32() --[[ Line: 35 ]] --[[ Name: checkOverflow ]]
        -- upvalues: v27 (copy), v26 (copy), v19 (copy), v22 (copy)
        if v27.current > v26.X then
            local v28 = 1;
            for v29, v30 in v19 do
                if v30.displayPriority <= v19[v28].displayPriority then
                    v28 = v29;
                end;
            end;
            local v31 = table.clone(v19);
            table.remove(v31, v28);
            v22(v31);
        end;
    end;
    v4.useEffect(function() --[[ Line: 52 ]]
        -- upvalues: v22 (copy), v32 (copy)
        v22({});
        v32();
    end, {
        v26
    });
    v4.useEffect(function() --[[ Line: 57 ]]
        -- upvalues: v14 (ref), v20 (copy), v22 (copy), l_FFlagDisableGamepadConnectorInVR_0 (ref), l_isSpatial_0 (ref), v3 (ref), l_FFlagEnableConsoleExpControls_0 (ref), v24 (copy)
        v14:onShortcutBarChanged():connect(function() --[[ Line: 58 ]]
            -- upvalues: v14 (ref), v20 (ref), v22 (ref)
            local v33 = v14:getCurrentShortcuts();
            v20(v33);
            v22({});
        end);
        if not l_FFlagDisableGamepadConnectorInVR_0 or not l_isSpatial_0() then
            local v34 = v3:getShowTopBar();
            local v35 = v3:getGamepadActive();
            if l_FFlagEnableConsoleExpControls_0 then
                local function v37() --[[ Line: 69 ]] --[[ Name: shouldHideShortcutBar ]]
                    -- upvalues: v34 (copy), v35 (copy), v14 (ref)
                    local v36 = not v34:get() or not v35:get();
                    v14:setHideShortcutBar("TopBar", v36);
                end;
                local v38 = not v34:get() or not v35:get();
                v14:setHideShortcutBar("TopBar", v38);
                v34:connect(v37);
                v35:connect(v37);
                return;
            else
                local function v40() --[[ Line: 77 ]] --[[ Name: shouldShowShortcutBar ]]
                    -- upvalues: v34 (copy), v35 (copy), v24 (ref)
                    local v39 = v34:get() and v35:get();
                    v24(v39);
                end;
                v34:connect(v40);
                v35:connect(v40);
            end;
        end;
    end, {});
    local v41 = if #v21 > 0 then v21 else v19;
    local v42 = {};
    for _, v44 in v41 do
        if v44.label then
            local v45 = {
                icon = "", 
                text = ""
            };
            if v44.icon then
                v45.icon = v44.icon;
            end;
            v45.text = v44.label;
            table.insert(v42, v45);
        end;
    end;
    return v5.createPortal({
        Name = v4.createElement("ScreenGui", {
            Name = "ShortcutBar", 
            DisplayOrder = v10.SHORTCUTBAR_DISPLAYORDER, 
            ZIndexBehavior = Enum.ZIndexBehavior.Sibling, 
            Enabled = if l_FFlagEnableConsoleExpControls_0 then nil else v23
        }, {
            v4.createElement("Frame", {
                Name = "ShortcutBarWrapper", 
                AutomaticSize = Enum.AutomaticSize.XY, 
                Position = UDim2.new(0.5, 0, 1, if v25 then -v25.Gap.Medium else 0), 
                AnchorPoint = Vector2.new(0.5, 1), 
                BorderSizePixel = 0, 
                BackgroundTransparency = 1, 
                [v4.Change.AbsoluteSize] = function(v46) --[[ Line: 118 ]]
                    -- upvalues: v27 (copy), v32 (copy)
                    v27.current = v46.AbsoluteSize.X;
                    v32();
                end
            }, {
                Layout = v4.createElement("UIListLayout"); 
                v4.createElement(l_ShortcutBar_0, {
                    items = v42
                })
            })
        })
    }, l_CoreGui_0);
end;
return ChromeShortcutBar;