local l_CoreGui_0 = game:GetService("CoreGui");
local l_LocalizationService_0 = game:GetService("LocalizationService");
local l_Parent_0 = script:FindFirstAncestor("InExperienceOverlay").Parent;
local v3 = require(l_Parent_0.CoreGuiCommon);
local v4 = require(l_Parent_0.Foundation);
local l_Localization_0 = require(l_Parent_0.InExperienceLocales).Localization;
local v6 = require(l_Parent_0.Localization);
local v7 = require(l_Parent_0.React);
local v8 = require(l_Parent_0.ReactRoblox);
local v9 = require(l_Parent_0.Songbird);
local l_Components_0 = v3.Components;
local l_View_0 = v4.View;
return function() --[[ Line: 21 ]] --[[ Name: renderInExperienceOverlay ]]
    -- upvalues: l_CoreGui_0 (copy), v7 (copy), v4 (copy), v6 (copy), l_Localization_0 (copy), l_LocalizationService_0 (copy), l_View_0 (copy), l_Components_0 (copy), v9 (copy), v8 (copy)
    local l_ScreenGui_0 = Instance.new("ScreenGui");
    l_ScreenGui_0.Name = "InExperienceOverlay";
    l_ScreenGui_0.DisplayOrder = 6;
    l_ScreenGui_0.IgnoreGuiInset = true;
    l_ScreenGui_0.ZIndexBehavior = Enum.ZIndexBehavior.Sibling;
    l_ScreenGui_0.ClipToDeviceSafeArea = false;
    l_ScreenGui_0.ScreenInsets = Enum.ScreenInsets.None;
    l_ScreenGui_0.SafeAreaCompatibility = Enum.SafeAreaCompatibility.None;
    l_ScreenGui_0.Parent = l_CoreGui_0;
    local v13 = v7.createElement(v4.FoundationProvider, {
        theme = v4.Enums.Theme.Dark
    }, {
        LocalizationProvider = v7.createElement(v6.LocalizationProvider, {
            localization = l_Localization_0.new(l_LocalizationService_0.RobloxLocaleId)
        }, {
            Popups = v7.createElement(l_View_0, {
                tag = "size-full"
            }, {
                HeadsetDisconnectDialog = v7.createElement(l_Components_0.HeadsetDisconnectDialog), 
                HurtOverlay = v7.createElement(l_Components_0.HurtOverlay)
            }), 
            Binders = v7.createElement(v7.Fragment, {}, {
                SongbirdDebugAudio = v7.createElement(v9.DebugAudioEmitters)
            })
        })
    });
    local v14 = v8.createRoot(l_ScreenGui_0);
    v14:render(v13);
    return v14;
end;