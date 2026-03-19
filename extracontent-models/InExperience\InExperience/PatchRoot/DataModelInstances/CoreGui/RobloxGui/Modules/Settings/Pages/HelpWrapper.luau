local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_RobloxGui_0 = l_CoreGui_0:WaitForChild("RobloxGui");
local l_LocalizationService_0 = game:GetService("LocalizationService");
local l_Modules_0 = l_RobloxGui_0.Modules;
local v5 = require(l_CorePackages_0.Workspace.Packages.HelpPage);
local l_HelpReactView_0 = v5.HelpReactView;
local v7 = require(l_Modules_0.Settings.SettingsPageFactory);
local v8 = require(l_CorePackages_0.Workspace.Packages.InExperienceLocales).Localization.new(l_LocalizationService_0.RobloxLocaleId);
local l_LocalizationProvider_0 = require(l_CorePackages_0.Workspace.Packages.Localization).LocalizationProvider;
local v10 = require(l_CorePackages_0.Packages.React);
local v11 = require(l_CorePackages_0.Packages.ReactRoblox);
local v12 = require(l_CorePackages_0.Packages.Foundation);
local l_FoundationProvider_0 = v12.FoundationProvider;
local v14 = require(l_CorePackages_0.Packages.BuilderIcons);
local l_uiblox_0 = v14.Migration.uiblox;
local v16 = require(l_CorePackages_0.Packages.Signals);
local v17 = require(l_CorePackages_0.Packages.SignalsReact);
local l_FFlagRefactorHelpPage_0 = v5.Flags.FFlagRefactorHelpPage;
local _ = nil;
local v20 = nil;
local v21 = nil;
if l_FFlagRefactorHelpPage_0 then
    v21 = require(l_Modules_0.Settings.Integrations).Utils;
    v20 = v5.Constants;
end;
local v22 = nil;
local v23, v24 = v16.createSignal(false);
local function v30() --[[ Line: 45 ]] --[[ Name: createHelpPage ]]
    -- upvalues: v7 (copy), v20 (ref), l_uiblox_0 (copy), v14 (copy), v8 (copy), v22 (ref), v17 (copy), v23 (copy), v10 (copy), l_FoundationProvider_0 (copy), v12 (copy), v21 (ref), l_LocalizationProvider_0 (copy), l_HelpReactView_0 (copy), v11 (copy), v24 (copy)
    local l_v7_NewPage_0 = v7:CreateNewPage();
    l_v7_NewPage_0.TabHeader.Name = v20.HELP_PAGE.TAB_HEADER.NAME;
    local v26 = l_uiblox_0[v20.HELP_PAGE.TAB_HEADER.ICON];
    l_v7_NewPage_0.TabHeader.TabLabel.Icon.Text = v26.name;
    l_v7_NewPage_0.TabHeader.TabLabel.Icon.FontFace = v14.Font[v26.variant];
    l_v7_NewPage_0.TabHeader.TabLabel.Title.Text = v8:Format(v20.HELP_PAGE.TAB_HEADER.TEXT);
    l_v7_NewPage_0.Page:ClearAllChildren();
    local function _() --[[ Line: 58 ]] --[[ Name: createReactTree ]]
        -- upvalues: v22 (ref), v17 (ref), v23 (ref), v10 (ref), l_FoundationProvider_0 (ref), v12 (ref), v21 (ref), l_LocalizationProvider_0 (ref), v8 (ref), l_HelpReactView_0 (ref), v11 (ref), l_v7_NewPage_0 (copy)
        if v22 then
            return;
        else
            local function v27() --[[ Line: 63 ]]
                -- upvalues: v17 (ref), v23 (ref), v10 (ref), l_FoundationProvider_0 (ref), v12 (ref), v21 (ref), l_LocalizationProvider_0 (ref), v8 (ref), l_HelpReactView_0 (ref)
                if v17.useSignalState(v23) then
                    return (v10.createElement(l_FoundationProvider_0, {
                        theme = v12.Enums.Theme.Dark, 
                        device = v21.getDeviceType()
                    }, {
                        Child = v10.createElement(l_LocalizationProvider_0, {
                            localization = v8
                        }, {
                            Root = v10.createElement(l_HelpReactView_0)
                        })
                    }));
                else
                    return nil;
                end;
            end;
            v22 = v11.createRoot(l_v7_NewPage_0.Page);
            if v22 then
                v22:render(v10.createElement(v27));
            end;
            return;
        end;
    end;
    l_v7_NewPage_0.Displayed.Event:Connect(function() --[[ Line: 86 ]]
        -- upvalues: v22 (ref), v17 (ref), v23 (ref), v10 (ref), l_FoundationProvider_0 (ref), v12 (ref), v21 (ref), l_LocalizationProvider_0 (ref), v8 (ref), l_HelpReactView_0 (ref), v11 (ref), l_v7_NewPage_0 (copy), v24 (ref)
        if not v22 then
            local function v29() --[[ Line: 63 ]]
                -- upvalues: v17 (ref), v23 (ref), v10 (ref), l_FoundationProvider_0 (ref), v12 (ref), v21 (ref), l_LocalizationProvider_0 (ref), v8 (ref), l_HelpReactView_0 (ref)
                if v17.useSignalState(v23) then
                    return (v10.createElement(l_FoundationProvider_0, {
                        theme = v12.Enums.Theme.Dark, 
                        device = v21.getDeviceType()
                    }, {
                        Child = v10.createElement(l_LocalizationProvider_0, {
                            localization = v8
                        }, {
                            Root = v10.createElement(l_HelpReactView_0)
                        })
                    }));
                else
                    return nil;
                end;
            end;
            v22 = v11.createRoot(l_v7_NewPage_0.Page);
            if v22 then
                v22:render(v10.createElement(v29));
            end;
        end;
        v24(true);
        if l_v7_NewPage_0.HubRef.VersionContainer then
            l_v7_NewPage_0.HubRef.VersionContainer.Visible = true;
        end;
    end);
    l_v7_NewPage_0.Hidden.Event:Connect(function() --[[ Line: 95 ]]
        -- upvalues: v24 (ref), l_v7_NewPage_0 (copy)
        v24(false);
        if l_v7_NewPage_0.HubRef.VersionContainer then
            l_v7_NewPage_0.HubRef.VersionContainer.Visible = false;
        end;
    end);
    l_v7_NewPage_0.Page.Size = UDim2.fromScale(1, 0);
    l_v7_NewPage_0.Page.AutomaticSize = Enum.AutomaticSize.Y;
    return l_v7_NewPage_0;
end;
if l_FFlagRefactorHelpPage_0 then
    return (v30());
else
    return require(l_Modules_0.Settings.Pages.Help);
end;