local l_CoreGui_0 = game:GetService("CoreGui");
local l_LocalizationService_0 = game:GetService("LocalizationService");
local l_script_FirstAncestor_0 = script:FindFirstAncestor("UserRelationshipModals");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local l_Provider_0 = require(l_Parent_0.FocusNavigationUtils).FocusNavigableSurfaceRegistry.Provider;
local v5 = require(l_Parent_0.Foundation);
local l_FoundationProvider_0 = v5.FoundationProvider;
local l_LocalizationProvider_0 = require(l_Parent_0.Localization).LocalizationProvider;
local l_Localization_0 = require(l_Parent_0.InExperienceLocales).Localization;
local v9 = require(l_Parent_0.React);
local v10 = require(l_Parent_0.ReactFocusNavigation);
local v11 = require(l_Parent_0.ReactRoblox);
local v12 = require(l_Parent_0.Rodux);
local v13 = require(l_Parent_0.RoactRodux);
local v14 = require(l_script_FirstAncestor_0.Rodux.installReducer);
local v15 = require(l_script_FirstAncestor_0.Rodux.RODUX_KEY);
local function v16() --[[ Line: 23 ]] --[[ Name: createRoduxStore ]]
    -- upvalues: v12 (copy), v15 (copy), v14 (copy)
    return v12.Store.new(v12.combineReducers({
        [v15] = v14()
    }), nil, {
        v12.thunkMiddleware
    });
end;
return function(v17, v18) --[[ Line: 33 ]]
    -- upvalues: l_CoreGui_0 (copy), v10 (copy), v9 (copy), l_LocalizationProvider_0 (copy), l_Localization_0 (copy), l_LocalizationService_0 (copy), l_FoundationProvider_0 (copy), v5 (copy), l_Provider_0 (copy), v13 (copy), v16 (copy), v11 (copy)
    if l_CoreGui_0:FindFirstChild("UserRelationshipModal") then
        return;
    else
        local l_Folder_0 = Instance.new("Folder");
        l_Folder_0.Name = "UserRelationshipModal";
        l_Folder_0.Parent = l_CoreGui_0;
        local l_ScreenGui_0 = Instance.new("ScreenGui");
        l_ScreenGui_0.Parent = l_Folder_0;
        l_ScreenGui_0.Name = "UserRelationshipModalOverlay";
        l_ScreenGui_0.DisplayOrder = 1;
        l_ScreenGui_0.ZIndexBehavior = Enum.ZIndexBehavior.Sibling;
        l_ScreenGui_0.Enabled = true;
        l_ScreenGui_0.ScreenInsets = Enum.ScreenInsets.CoreUISafeInsets;
        l_ScreenGui_0.SafeAreaCompatibility = Enum.SafeAreaCompatibility.None;
        l_ScreenGui_0.ClipToDeviceSafeArea = false;
        local v21 = table.clone(v18);
        v21.onClose = function() --[[ Line: 52 ]]
            -- upvalues: l_Folder_0 (copy)
            l_Folder_0:Destroy();
        end;
        local v22 = v10.FocusNavigationService.new(v10.EngineInterface.CoreGui);
        local v23 = v9.createElement(l_LocalizationProvider_0, {
            localization = l_Localization_0.new(l_LocalizationService_0.RobloxLocaleId)
        }, {
            FoundationProvider = v9.createElement(l_FoundationProvider_0, {
                theme = v5.Enums.Theme.Dark, 
                overlayGui = l_ScreenGui_0
            }, {
                FocusNavigationProvider = v9.createElement(v10.FocusNavigationContext.Provider, {
                    value = v22
                }, {
                    FocusNavigationRegistryProvider = v9.createElement(l_Provider_0, nil, {
                        StoreProvider = v9.createElement(v13.StoreProvider, {
                            store = v16()
                        }, {
                            UserRelationshipModal = v9.createElement(v17, v21, {})
                        })
                    })
                })
            })
        });
        v11.createRoot(l_ScreenGui_0):render(v23);
        return;
    end;
end;