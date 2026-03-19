local l_CoreGui_0 = game:GetService("CoreGui");
local l_script_FirstAncestor_0 = script:FindFirstAncestor("SystemScrim");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v3 = require(l_Parent_0.React);
local v4 = require(l_Parent_0.ReactRoblox);
local v5 = require(l_script_FirstAncestor_0.SystemScrim);
local v6 = require(l_script_FirstAncestor_0["data-model"].SystemScrimSignalStore);
return function() --[[ Line: 13 ]] --[[ Name: renderSystemScrim ]]
    -- upvalues: v6 (copy), l_CoreGui_0 (copy), v3 (copy), v5 (copy), v4 (copy)
    local v7 = v6(false);
    local l_ScreenGui_0 = Instance.new("ScreenGui");
    l_ScreenGui_0.Name = "SystemScrim";
    l_ScreenGui_0.DisplayOrder = -2147483648;
    l_ScreenGui_0.IgnoreGuiInset = true;
    l_ScreenGui_0.ZIndexBehavior = Enum.ZIndexBehavior.Sibling;
    l_ScreenGui_0.ClipToDeviceSafeArea = false;
    l_ScreenGui_0.ScreenInsets = Enum.ScreenInsets.None;
    l_ScreenGui_0.SafeAreaCompatibility = Enum.SafeAreaCompatibility.None;
    l_ScreenGui_0.Parent = l_CoreGui_0;
    local v9 = v3.createElement(v5, {
        store = v7
    });
    local v10 = v4.createRoot(l_ScreenGui_0);
    v10:render(v9);
    return {
        root = v10, 
        store = v7
    };
end;