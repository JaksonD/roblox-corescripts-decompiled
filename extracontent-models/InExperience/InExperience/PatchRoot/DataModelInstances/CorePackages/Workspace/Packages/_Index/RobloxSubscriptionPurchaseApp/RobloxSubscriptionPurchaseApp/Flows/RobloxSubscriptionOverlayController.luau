local l_script_FirstAncestor_0 = script:FindFirstAncestor("RobloxSubscriptionPurchaseApp");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_Parent_0.ReactRoblox);
local l_StyleProviderWithDefaultTheme_0 = require(l_Parent_0.Style).StyleProviderWithDefaultTheme;
local v5 = require(l_script_FirstAncestor_0.Components.RobloxSubscriptionContainer);
local v6 = require(l_script_FirstAncestor_0.Store.RobloxSubscriptionStore);
local v7 = nil;
local function v8() --[[ Line: 19 ]] --[[ Name: close ]]
    -- upvalues: v7 (ref)
    if v7 then
        v7();
        v7 = nil;
    end;
end;
return {
    render = function(v9) --[[ Line: 26 ]] --[[ Name: render ]]
        -- upvalues: v6 (copy), v2 (copy), v5 (copy), v8 (copy), l_StyleProviderWithDefaultTheme_0 (copy), v3 (copy), v7 (ref)
        local v10 = v6.get();
        v10.triggerUnmountUI();
        local v11 = v2.createElement(v5, {
            title = v9 and v9.title or nil, 
            message = v9 and v9.message or nil, 
            onClose = v8
        });
        local v12 = v2.createElement(l_StyleProviderWithDefaultTheme_0, {
            withUiModeSupport = false, 
            withDarkTheme = true
        }, {
            Sheet = v11
        });
        local l_Folder_0 = Instance.new("Folder");
        l_Folder_0.Name = "RobloxSubscriptionPurchaseOverlay";
        l_Folder_0.Parent = game:GetService("CoreGui");
        local v14 = v3.createRoot(l_Folder_0);
        v14:render(v12);
        local function v15() --[[ Line: 51 ]] --[[ Name: cleanup ]]
            -- upvalues: v14 (copy), l_Folder_0 (copy)
            v14:unmount();
            l_Folder_0:Destroy();
        end;
        v7 = v15;
        v10.setOnUnmountUI(v15);
        return v15;
    end, 
    close = v8
};