local l_UserInputService_0 = game:GetService("UserInputService");
local l_Parent_0 = script:FindFirstAncestor("AppShortcutBar").Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_Parent_0.Responsive);
local v4 = require(l_Parent_0.UIBlox);
local l_useFocusedTextBox_0 = require(l_Parent_0.FocusNavigationUtils).useFocusedTextBox;
local l_ShortcutBar_0 = v4.App.Navigation.ShortcutBar;
local v7 = game:DefineFastFlag("ShortcutBarMinSize", false);
local v8 = game:DefineFastFlag("DisableAppShortcutBarAndroidTV", false);
AppShortcutBar = function(v9) --[[ Line: 23 ]] --[[ Name: AppShortcutBar ]]
    -- upvalues: l_useFocusedTextBox_0 (copy), v3 (copy), v2 (copy), l_UserInputService_0 (copy), v8 (copy), v7 (copy), l_ShortcutBar_0 (copy)
    local v10 = if v9.Position then v9.Position else UDim2.fromScale(0.5, 0);
    local v11 = if v9.AnchorPoint then v9.AnchorPoint else Vector2.new(0.5, 0);
    local v12 = l_useFocusedTextBox_0();
    local v13 = v3.useLastInput();
    local l_useState_0 = v2.useState;
    local v15 = true;
    if v13 == v3.Input.Directional then
        v15 = l_UserInputService_0:GamepadSupports(l_UserInputService_0:GetLastInputType(), Enum.KeyCode.Thumbstick1);
    end;
    l_useState_0, v15 = l_useState_0(v15);
    if v8 then
        v2.useEffect(function() --[[ Line: 34 ]]
            -- upvalues: l_UserInputService_0 (ref), v15 (copy), v13 (copy), v3 (ref)
            local v18 = l_UserInputService_0.LastInputTypeChanged:Connect(function() --[[ Line: 35 ]]
                -- upvalues: v15 (ref), v13 (ref), v3 (ref), l_UserInputService_0 (ref)
                local l_v15_0 = v15;
                local v17 = true;
                if v13 == v3.Input.Directional then
                    v17 = l_UserInputService_0:GamepadSupports(l_UserInputService_0:GetLastInputType(), Enum.KeyCode.Thumbstick1);
                end;
                l_v15_0(v17);
            end);
            return function() --[[ Line: 44 ]]
                -- upvalues: v18 (copy)
                v18:Disconnect();
            end;
        end, {
            v13
        });
    end;
    local v19 = false;
    if #v9.items > 0 then
        v19 = not v12 and (not v8 or l_useState_0);
    end;
    if v7 then
        local v20 = not v3.useBreakpointXOrSmaller(v3.Keys.Small);
        local v21 = not v3.useBreakpointYOrSmaller(v3.Keys.XSmall);
        local v22 = v20 and v21;
        v19 = v19 and v22;
    end;
    return v2.createElement("Frame", {
        Position = UDim2.fromScale(0, 0), 
        Size = if v7 and v9.Size then v9.Size else UDim2.fromScale(1, 1), 
        BackgroundTransparency = 1
    }, if v19 then v2.createElement(l_ShortcutBar_0, {
        items = v9.items, 
        position = v10, 
        anchorPoint = v11
    }) else nil);
end;
return AppShortcutBar;