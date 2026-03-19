local l_AppStorageService_0 = game:GetService("AppStorageService");
local l_LocalizationService_0 = game:GetService("LocalizationService");
local l_NotificationService_0 = game:GetService("NotificationService");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v4 = require(l_Modules_0.Common.Roact);
local l_CorePackages_0 = game:GetService("CorePackages");
local l_LocalStorageKey_0 = require(l_CorePackages_0.Workspace.Packages.LocalStorage).Enums.LocalStorageKey;
local l_MessageBus_0 = require(l_CorePackages_0.Workspace.Packages.MessageBus).MessageBus;
local v8 = require(l_CorePackages_0.Packages.t);
local v9 = v4.PureComponent:extend("LocalStorageListener");
local v10 = {
    mid = l_MessageBus_0.getMessageId("Locale", "RobloxLocaleIdChanged"), 
    validateParams = v8.strictInterface({
        localeId = v8.string
    })
};
v9.init = function(_) --[[ Line: 23 ]] --[[ Name: init ]]

end;
v9.render = function(_) --[[ Line: 25 ]] --[[ Name: render ]]

end;
v9.didMount = function(v13) --[[ Line: 27 ]] --[[ Name: didMount ]]
    -- upvalues: l_AppStorageService_0 (copy), l_LocalStorageKey_0 (copy), l_LocalizationService_0 (copy), l_MessageBus_0 (copy), v10 (copy), l_NotificationService_0 (copy)
    local l_l_AppStorageService_0_Item_0 = l_AppStorageService_0:GetItem(l_LocalStorageKey_0.RobloxLocaleId);
    if l_l_AppStorageService_0_Item_0 ~= "" then
        l_LocalizationService_0:SetRobloxLocaleId(l_l_AppStorageService_0_Item_0);
    end;
    v13.connections = {
        l_AppStorageService_0.ItemWasSet:Connect(function(v15, v16) --[[ Line: 35 ]]
            -- upvalues: l_LocalStorageKey_0 (ref), l_LocalizationService_0 (ref), l_MessageBus_0 (ref), v10 (ref), l_NotificationService_0 (ref)
            if v15 == l_LocalStorageKey_0.RobloxLocaleId then
                l_LocalizationService_0:SetRobloxLocaleId(v16);
                local v17 = {
                    localeId = v16
                };
                l_MessageBus_0.publish(v10, v17);
                return;
            else
                if v15 == l_LocalStorageKey_0.AuthenticatedTheme then
                    l_NotificationService_0.SelectedTheme = v16;
                end;
                return;
            end;
        end)
    };
end;
v9.willUnmount = function(v18) --[[ Line: 49 ]] --[[ Name: willUnmount ]]
    for _, v20 in ipairs(v18.connections) do
        v20:Disconnect();
    end;
end;
return v9;