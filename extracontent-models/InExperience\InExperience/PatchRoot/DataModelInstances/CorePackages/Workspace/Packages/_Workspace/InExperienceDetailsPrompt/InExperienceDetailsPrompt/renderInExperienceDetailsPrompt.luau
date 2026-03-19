local l_CoreGui_0 = game:GetService("CoreGui");
local l_LocalizationService_0 = game:GetService("LocalizationService");
local l_script_FirstAncestor_0 = script:FindFirstAncestor("InExperienceDetailsPrompt");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local l_Provider_0 = require(l_Parent_0.FocusNavigationUtils).FocusNavigableSurfaceRegistry.Provider;
local v5 = require(l_Parent_0.Foundation);
local l_FoundationProvider_0 = v5.FoundationProvider;
local l_LocalizationProvider_0 = require(l_Parent_0.Localization).LocalizationProvider;
local l_Localization_0 = require(l_Parent_0.InExperienceLocales).Localization;
local v9 = require(l_Parent_0.React);
local v10 = require(l_Parent_0.ReactFocusNavigation);
local v11 = require(l_Parent_0.ReactRoblox);
local v12 = require(l_script_FirstAncestor_0.InExperienceDetailsPromptApp);
local l_FFlagLuaAppIedpOverlayAndNavigationFix_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppIedpOverlayAndNavigationFix;
local v14 = game:DefineFastInt("InExperienceDetailsPromptDisplayOrder", -1);
local function _() --[[ Line: 23 ]] --[[ Name: createFocusNavigationService ]]
    -- upvalues: v10 (copy)
    return v10.FocusNavigationService.new(v10.EngineInterface.CoreGui);
end;
return function() --[[ Line: 27 ]] --[[ Name: renderInExperienceDetailsPrompt ]]
    -- upvalues: l_FFlagLuaAppIedpOverlayAndNavigationFix_0 (copy), l_CoreGui_0 (copy), v14 (copy), v10 (copy), v9 (copy), l_LocalizationProvider_0 (copy), l_Localization_0 (copy), l_LocalizationService_0 (copy), l_FoundationProvider_0 (copy), v5 (copy), l_Provider_0 (copy), v12 (copy), v11 (copy)
    local l_Folder_0 = Instance.new("Folder");
    l_Folder_0.Name = l_FFlagLuaAppIedpOverlayAndNavigationFix_0 and "InExperienceDetailsPromptApp" or "InExperienceDetailsPrompt";
    l_Folder_0.Parent = l_CoreGui_0;
    local v17 = nil;
    if l_FFlagLuaAppIedpOverlayAndNavigationFix_0 then
        v17 = Instance.new("ScreenGui");
        v17.Parent = l_Folder_0;
        v17.Name = "InExperienceDetailsPromptOverlay";
        v17.DisplayOrder = v14;
        v17.ZIndexBehavior = Enum.ZIndexBehavior.Sibling;
        v17.Enabled = true;
        v17.ScreenInsets = Enum.ScreenInsets.CoreUISafeInsets;
        v17.SafeAreaCompatibility = Enum.SafeAreaCompatibility.None;
        v17.ClipToDeviceSafeArea = false;
    end;
    local v18 = v10.FocusNavigationService.new(v10.EngineInterface.CoreGui);
    local v19 = v9.createElement(l_LocalizationProvider_0, {
        localization = l_Localization_0.new(l_LocalizationService_0.RobloxLocaleId)
    }, {
        FoundationProvider = v9.createElement(l_FoundationProvider_0, {
            theme = v5.Enums.Theme.Dark, 
            overlayGui = if l_FFlagLuaAppIedpOverlayAndNavigationFix_0 then v17 else nil
        }, {
            FocusNavigationProvider = v9.createElement(v10.FocusNavigationContext.Provider, {
                value = v18
            }, {
                FocusNavigationRegistryProvider = v9.createElement(l_Provider_0, nil, {
                    InExperienceDetailsPromptApp = v9.createElement(v12)
                })
            })
        })
    });
    local v20 = v11.createRoot(if l_FFlagLuaAppIedpOverlayAndNavigationFix_0 then v17 else l_Folder_0);
    v20:render(v19);
    return v20;
end;