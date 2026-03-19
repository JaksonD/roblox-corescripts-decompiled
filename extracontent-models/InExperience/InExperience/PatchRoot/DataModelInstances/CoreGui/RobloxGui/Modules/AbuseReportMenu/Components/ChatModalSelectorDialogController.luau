local l_script_FirstAncestor_0 = script:FindFirstAncestor("AbuseReportMenu");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_CoreGui_0 = game:GetService("CoreGui");
local l_LocalizationService_0 = game:GetService("LocalizationService");
local v4 = require(l_CorePackages_0.Workspace.Packages.ExpChatShared);
local l_Localization_0 = require(l_CorePackages_0.Workspace.Packages.InExperienceLocales).Localization;
local l_LocalizationProvider_0 = require(l_CorePackages_0.Workspace.Packages.Localization).LocalizationProvider;
local v7 = require(l_CorePackages_0.Packages.Roact);
local v8 = require(l_CorePackages_0.Packages.RoactRodux);
local v9 = require(l_CorePackages_0.Workspace.Packages.Style);
local l_LayerCollectorProvider_0 = require(l_CorePackages_0.Packages.UIBlox).Core.Layout.LayerCollector.LayerCollectorProvider;
local l_StyleProviderWithDefaultTheme_0 = v9.StyleProviderWithDefaultTheme;
local v12 = require(l_script_FirstAncestor_0.Components.Constants);
local v13 = require(l_script_FirstAncestor_0.Components.ChatModalSelectorDialog);
local _ = require(l_script_FirstAncestor_0.Components.Types);
local v15 = require(l_script_FirstAncestor_0.Flags.FFlagHideShortcutsOnReportDropdown);
local l_isInExperienceUIVREnabled_0 = require(l_CorePackages_0.Workspace.Packages.SharedExperimentDefinition).isInExperienceUIVREnabled;
local v17 = nil;
local v18 = nil;
local v19 = nil;
if l_isInExperienceUIVREnabled_0 then
    v17 = require(l_CorePackages_0.Workspace.Packages.AppCommonLib).isSpatial;
    local v20 = require(l_CorePackages_0.Workspace.Packages.VrSpatialUi);
    v18 = v20.UIManager;
    v19 = v20.Constants.PanelType;
end;
local v21 = {
    modalSelectorHandle = nil, 
    modalSelectorFrame = nil, 
    modalSelectorScreenGui = nil
};
return {
    mountModalSelector = function(v22, v23, v24) --[[ Line: 71 ]] --[[ Name: mountModalSelector ]]
        -- upvalues: l_isInExperienceUIVREnabled_0 (copy), v17 (ref), v18 (ref), v19 (ref), v21 (copy), l_CoreGui_0 (copy), v12 (copy), v15 (copy), v7 (copy), l_LayerCollectorProvider_0 (copy), l_LocalizationProvider_0 (copy), l_Localization_0 (copy), l_LocalizationService_0 (copy), v8 (copy), v4 (copy), l_StyleProviderWithDefaultTheme_0 (copy), v13 (copy)
        if l_isInExperienceUIVREnabled_0 and v17() then
            local v25 = v18.getInstance():getPanelObject(v19.MoreMenu);
            local l_Frame_0 = Instance.new("Frame");
            l_Frame_0.BackgroundTransparency = 1;
            l_Frame_0.Position = UDim2.new(0, 0, 0, 0);
            l_Frame_0.Size = UDim2.new(1, 0, 1, 0);
            l_Frame_0.ZIndex = 10;
            l_Frame_0.Parent = v25;
            v21.modalSelectorFrame = l_Frame_0;
        elseif not v21.modalSelectorScreenGui then
            local l_ScreenGui_0 = Instance.new("ScreenGui");
            l_ScreenGui_0.Name = "ModalSelectorDialogGui";
            l_ScreenGui_0.DisplayOrder = 7;
            l_ScreenGui_0.Enabled = true;
            l_ScreenGui_0.ZIndexBehavior = Enum.ZIndexBehavior.Sibling;
            l_ScreenGui_0.Parent = l_CoreGui_0:FindFirstChild(v12.AbuseReportMenuPlaceholderFrame, true);
            l_ScreenGui_0.ScreenInsets = Enum.ScreenInsets.DeviceSafeInsets;
            v21.modalSelectorScreenGui = l_ScreenGui_0;
            local l_Frame_1 = Instance.new("Frame");
            l_Frame_1.BackgroundTransparency = 1;
            l_Frame_1.Position = UDim2.new(0, 0, 0, 0);
            l_Frame_1.Size = UDim2.new(1, 0, 1, 0);
            l_Frame_1.Parent = v21.modalSelectorScreenGui;
            v21.modalSelectorFrame = l_Frame_1;
        end;
        if v15 and v23 ~= nil then
            v23();
        end;
        local v29 = v7.createElement(l_LayerCollectorProvider_0, {}, v7.createElement(l_LocalizationProvider_0, {
            localization = l_Localization_0.new(l_LocalizationService_0.RobloxLocaleId)
        }, {
            StoreProvider = v7.createElement(v8.StoreProvider, {
                store = v4.context.store
            }, {
                StyleProviderWithDefaultTheme = v7.createElement(l_StyleProviderWithDefaultTheme_0, {
                    withDarkTheme = true
                }, {
                    ChatModalSelectorDialog = v7.createElement(v13, {
                        isShown = true, 
                        onClose = v22, 
                        onSelect = v24
                    })
                })
            })
        }));
        v21.modalSelectorHandle = v7.mount(v29, v21.modalSelectorFrame, "ChatModalSelectorDialog");
    end, 
    unmountModalSelector = function() --[[ Line: 43 ]] --[[ Name: unmountModalSelector ]]
        -- upvalues: v21 (copy), v7 (copy), l_isInExperienceUIVREnabled_0 (copy)
        if v21.modalSelectorHandle ~= nil then
            v7.unmount(v21.modalSelectorHandle);
            v21.modalSelectorHandle = nil;
        end;
        if l_isInExperienceUIVREnabled_0 then
            if v21.modalSelectorFrame ~= nil then
                v21.modalSelectorFrame.Parent = nil;
                v21.modalSelectorFrame = nil;
            end;
            if v21.modalSelectorScreenGui ~= nil then
                v21.modalSelectorScreenGui = nil;
                return;
            end;
        elseif v21.modalSelectorScreenGui ~= nil then
            v21.modalSelectorFrame.Parent = nil;
            v21.modalSelectorFrame = nil;
            v21.modalSelectorScreenGui = nil;
        end;
    end
};