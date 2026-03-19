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
ChromeShortcutBar = function(_) --[[ Line: 23 ]] --[[ Name: ChromeShortcutBar ]]
    -- upvalues: v4 (copy), l_useTokens_0 (copy), v12 (copy), v11 (copy), v14 (copy), v3 (copy), l_FFlagEnableConsoleExpControls_0 (copy), v5 (copy), v10 (copy), l_ShortcutBar_0 (copy), l_CoreGui_0 (copy)
    local v17, v18 = v4.useState({});
    local v19, v20 = v4.useState({});
    local v21, v22 = v4.useBinding(false);
    local v23 = l_useTokens_0();
    local v24 = v12(v11.screenSize);
    local v25 = v4.useRef(0);
    local function v30() --[[ Line: 32 ]] --[[ Name: checkOverflow ]]
        -- upvalues: v25 (copy), v24 (copy), v17 (copy), v20 (copy)
        if v25.current > v24.X then
            local v26 = 1;
            for v27, v28 in v17 do
                if v28.displayPriority <= v17[v26].displayPriority then
                    v26 = v27;
                end;
            end;
            local v29 = table.clone(v17);
            table.remove(v29, v26);
            v20(v29);
        end;
    end;
    v4.useEffect(function() --[[ Line: 49 ]]
        -- upvalues: v20 (copy), v30 (copy)
        v20({});
        v30();
    end, {
        v24
    });
    v4.useEffect(function() --[[ Line: 54 ]]
        -- upvalues: v14 (ref), v18 (copy), v20 (copy), v3 (ref), l_FFlagEnableConsoleExpControls_0 (ref), v22 (copy)
        v14:onShortcutBarChanged():connect(function() --[[ Line: 55 ]]
            -- upvalues: v14 (ref), v18 (ref), v20 (ref)
            local v31 = v14:getCurrentShortcuts();
            v18(v31);
            v20({});
        end);
        local v32 = v3:getShowTopBar();
        local v33 = v3:getGamepadActive();
        if l_FFlagEnableConsoleExpControls_0 then
            local function v35() --[[ Line: 65 ]] --[[ Name: shouldHideShortcutBar ]]
                -- upvalues: v32 (copy), v33 (copy), v14 (ref)
                local v34 = not v32:get() or not v33:get();
                v14:setHideShortcutBar("TopBar", v34);
            end;
            local v36 = not v32:get() or not v33:get();
            v14:setHideShortcutBar("TopBar", v36);
            v32:connect(v35);
            v33:connect(v35);
            return;
        else
            local function v38() --[[ Line: 73 ]] --[[ Name: shouldShowShortcutBar ]]
                -- upvalues: v32 (copy), v33 (copy), v22 (ref)
                local v37 = v32:get() and v33:get();
                v22(v37);
            end;
            v32:connect(v38);
            v33:connect(v38);
            return;
        end;
    end, {});
    local v39 = if #v19 > 0 then v19 else v17;
    local v40 = {};
    for _, v42 in v39 do
        if v42.label then
            local v43 = {
                icon = "", 
                text = ""
            };
            if v42.icon then
                v43.icon = v42.icon;
            end;
            v43.text = v42.label;
            table.insert(v40, v43);
        end;
    end;
    return v5.createPortal({
        Name = v4.createElement("ScreenGui", {
            Name = "ShortcutBar", 
            DisplayOrder = v10.SHORTCUTBAR_DISPLAYORDER, 
            ZIndexBehavior = Enum.ZIndexBehavior.Sibling, 
            Enabled = if l_FFlagEnableConsoleExpControls_0 then nil else v21
        }, {
            v4.createElement("Frame", {
                Name = "ShortcutBarWrapper", 
                AutomaticSize = Enum.AutomaticSize.XY, 
                Position = UDim2.new(0.5, 0, 1, if v23 then -v23.Gap.Medium else 0), 
                AnchorPoint = Vector2.new(0.5, 1), 
                BorderSizePixel = 0, 
                BackgroundTransparency = 1, 
                [v4.Change.AbsoluteSize] = function(v44) --[[ Line: 113 ]]
                    -- upvalues: v25 (copy), v30 (copy)
                    v25.current = v44.AbsoluteSize.X;
                    v30();
                end
            }, {
                Layout = v4.createElement("UIListLayout"); 
                v4.createElement(l_ShortcutBar_0, {
                    items = v40
                })
            })
        })
    }, l_CoreGui_0);
end;
return ChromeShortcutBar;