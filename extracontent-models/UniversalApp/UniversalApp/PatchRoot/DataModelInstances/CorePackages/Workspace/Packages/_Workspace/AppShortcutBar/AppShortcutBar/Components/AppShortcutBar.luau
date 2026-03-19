local l_Parent_0 = script:FindFirstAncestor("AppShortcutBar").Parent;
local v1 = require(l_Parent_0.React);
local v2 = require(l_Parent_0.Responsive);
local v3 = require(l_Parent_0.UIBlox);
local l_useFocusedTextBox_0 = require(l_Parent_0.FocusNavigationUtils).useFocusedTextBox;
local l_ShortcutBar_0 = v3.App.Navigation.ShortcutBar;
local v6 = game:DefineFastFlag("ShortcutBarMinSize", false);
AppShortcutBar = function(v7) --[[ Line: 20 ]] --[[ Name: AppShortcutBar ]]
    -- upvalues: l_useFocusedTextBox_0 (copy), v6 (copy), v2 (copy), v1 (copy), l_ShortcutBar_0 (copy)
    local v8 = if v7.Position then v7.Position else UDim2.fromScale(0.5, 0);
    local v9 = if v7.AnchorPoint then v7.AnchorPoint else Vector2.new(0.5, 0);
    local v10 = l_useFocusedTextBox_0();
    local v11 = false;
    if #v7.items > 0 then
        v11 = not v10;
    end;
    if v6 then
        local v12 = not v2.useBreakpointXOrSmaller(v2.Keys.Small);
        local v13 = not v2.useBreakpointYOrSmaller(v2.Keys.XSmall);
        local v14 = v12 and v13;
        v11 = v11 and v14;
    end;
    return v1.createElement("Frame", {
        Position = UDim2.fromScale(0, 0), 
        Size = if v6 and v7.Size then v7.Size else UDim2.fromScale(1, 1), 
        BackgroundTransparency = 1
    }, if v11 then v1.createElement(l_ShortcutBar_0, {
        items = v7.items, 
        position = v8, 
        anchorPoint = v9
    }) else nil);
end;
return AppShortcutBar;