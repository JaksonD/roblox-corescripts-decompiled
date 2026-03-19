local l_AdService_0 = game:GetService("AdService");
local l_CoreGui_0 = game:GetService("CoreGui");
local l_LocalizationService_0 = game:GetService("LocalizationService");
local l_Parent_0 = script.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local v5 = require(l_Parent_1.React);
local v6 = require(l_Parent_1.ReactRoblox);
local v7 = require(l_Parent_1.InExperienceLocales);
local v8 = require(l_Parent_1.Localization);
local v9 = require(l_Parent_1.Foundation);
local v10 = require(l_Parent_1.Roact);
local v11 = require(l_Parent_0.DisclosureButtonListenerComponent);
local v12 = require(l_Parent_0.AdsInteractivityControls);
local l_LocalizationProvider_0 = v8.LocalizationProvider;
local l_FoundationProvider_0 = v9.FoundationProvider;
local v15 = game:DefineFastFlag("AdsInteractivityControlsFixStyleLink", false);
local v16 = game:GetEngineFeature("ImmersiveBrandedAds") and game:DefineFastFlag("EnableLuaAppImmersiveBrandedAds2", false);
local function v21() --[[ Line: 24 ]] --[[ Name: initializeImmersiveAds ]]
    -- upvalues: l_CoreGui_0 (copy), l_AdService_0 (copy), v10 (copy), v12 (copy), v15 (copy)
    local l_Folder_0 = Instance.new("Folder");
    l_Folder_0.Name = "AdGuiInteractivityControls";
    l_Folder_0.Parent = l_CoreGui_0;
    local v18 = {};
    l_AdService_0.adGuiRegisterUI:Connect(function(v19) --[[ Line: 32 ]]
        -- upvalues: v18 (copy), v10 (ref), v12 (ref), v15 (ref), l_Folder_0 (copy)
        if not v19:IsA("AdGui") then
            return;
        elseif v18[v19] then
            return;
        else
            local v20 = v10.createElement(v12, {
                adGui = v19
            });
            if v15 then
                v20 = v10.createElement("Folder", nil, v20);
            end;
            v18[v19] = v10.mount(v20, l_Folder_0, "AdsInteractivityControls");
            v19.Destroying:Connect(function() --[[ Line: 48 ]]
                -- upvalues: v10 (ref), v18 (ref), v19 (copy)
                v10.unmount(v18[v19]);
                v18[v19] = nil;
            end);
            return;
        end;
    end);
    l_AdService_0:SetAdGuiInteractivityHandlerInitialized();
end;
if not v16 then
    return v21;
else
    local function v23() --[[ Line: 61 ]] --[[ Name: initializeImmersiveBrandedAds ]]
        -- upvalues: l_CoreGui_0 (copy), v6 (copy), v5 (copy), l_LocalizationProvider_0 (copy), v7 (copy), l_LocalizationService_0 (copy), l_FoundationProvider_0 (copy), v9 (copy), v11 (copy)
        local l_ScreenGui_0 = Instance.new("ScreenGui");
        l_ScreenGui_0.Name = "ImmersiveBrandedAds";
        l_ScreenGui_0.ResetOnSpawn = false;
        l_ScreenGui_0.IgnoreGuiInset = true;
        l_ScreenGui_0.Parent = l_CoreGui_0;
        v6.createRoot(l_ScreenGui_0):render({
            localizationProvider = v5.createElement(l_LocalizationProvider_0, {
                localization = v7.Localization.new(l_LocalizationService_0.RobloxLocaleId)
            }, {
                foundationProvider = v5.createElement(l_FoundationProvider_0, {
                    theme = v9.Enums.Theme.Dark
                }, {
                    disclosureButtonListener = v5.createElement(v11)
                })
            })
        });
    end;
    return function() --[[ Line: 81 ]]
        -- upvalues: v21 (copy), v23 (copy)
        v21();
        v23();
    end;
end;