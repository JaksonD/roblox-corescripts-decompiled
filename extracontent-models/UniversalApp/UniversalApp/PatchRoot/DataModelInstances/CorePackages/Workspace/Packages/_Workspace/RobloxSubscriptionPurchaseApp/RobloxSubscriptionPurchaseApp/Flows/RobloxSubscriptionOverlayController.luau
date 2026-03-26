local l_script_FirstAncestor_0 = script:FindFirstAncestor("RobloxSubscriptionPurchaseApp");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local l_LocalizationService_0 = game:GetService("LocalizationService");
local l_NotificationService_0 = game:GetService("NotificationService");
local v4 = require(l_Parent_0.React);
local v5 = require(l_Parent_0.ReactRoblox);
local v6 = require(l_Parent_0.Style);
local v7 = require(l_Parent_0.RoactRodux);
local v8 = require(l_Parent_0.Rodux);
local l_Localization_0 = require(l_Parent_0.AppLocales).Localization;
local l_LocalizationProvider_0 = require(l_Parent_0.Localization).LocalizationProvider;
local l_ProviderContainer_0 = require(l_Parent_0.RoactUtils).Components.ProviderContainer;
local v12 = require(l_script_FirstAncestor_0.Components.RobloxSubscriptionContainer);
local v13 = require(l_script_FirstAncestor_0.Store.RobloxSubscriptionStore);
local l_Constants_0 = v6.Constants;
local l_UiModeStyleProvider_0 = v6.UiModeStyleProvider;
local v16 = nil;
local function v17() --[[ Line: 37 ]] --[[ Name: close ]]
    -- upvalues: v16 (ref)
    if v16 then
        v16();
        v16 = nil;
    end;
end;
return {
    render = function(v18) --[[ Line: 44 ]] --[[ Name: render ]]
        -- upvalues: v13 (copy), v4 (copy), v12 (copy), v17 (copy), v8 (copy), v7 (copy), l_NotificationService_0 (copy), l_Constants_0 (copy), l_UiModeStyleProvider_0 (copy), l_LocalizationProvider_0 (copy), l_Localization_0 (copy), l_LocalizationService_0 (copy), l_ProviderContainer_0 (copy), v5 (copy), v16 (ref)
        local v19 = v13.get();
        v19.triggerUnmountUI();
        local v20 = v4.createElement(v12, {
            title = v18 and v18.title or nil, 
            message = v18 and v18.message or nil, 
            onClose = v17
        });
        local v21 = {};
        local v22 = {
            v8.thunkMiddleware
        };
        local v23 = v8.Store.new(v8.combineReducers({}), nil, v22);
        table.insert(v21, {
            class = v7.StoreProvider, 
            props = {
                store = v23
            }
        });
        local l_SelectedTheme_0 = l_NotificationService_0.SelectedTheme;
        local v25 = type(l_SelectedTheme_0) == "string" and string.lower(l_SelectedTheme_0) == "light" and l_Constants_0.ThemeName.Light or l_Constants_0.ThemeName.Dark;
        table.insert(v21, {
            class = l_UiModeStyleProvider_0, 
            props = {
                style = {
                    themeName = v25, 
                    fontName = l_Constants_0.FontName.Gotham
                }
            }
        });
        table.insert(v21, {
            class = l_LocalizationProvider_0, 
            props = {
                localization = l_Localization_0.new(l_LocalizationService_0.RobloxLocaleId)
            }
        });
        local v26 = v4.createElement(l_ProviderContainer_0, {
            providers = v21
        }, {
            Sheet = v20
        });
        local l_Folder_0 = Instance.new("Folder");
        l_Folder_0.Name = "RobloxSubscriptionPurchaseOverlay";
        l_Folder_0.Parent = game:GetService("CoreGui");
        local v28 = v5.createRoot(l_Folder_0);
        v28:render(v26);
        local function v29() --[[ Line: 106 ]] --[[ Name: cleanup ]]
            -- upvalues: v28 (copy), l_Folder_0 (copy)
            v28:unmount();
            l_Folder_0:Destroy();
        end;
        v16 = v29;
        v19.setOnUnmountUI(v29);
        return v29;
    end, 
    close = v17
};