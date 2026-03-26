local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_LocalizationService_0 = game:GetService("LocalizationService");
local l_RobloxGui_0 = l_CoreGui_0:WaitForChild("RobloxGui");
local l_Modules_0 = l_RobloxGui_0.Modules;
local v5 = require(l_CorePackages_0.Packages.React);
local v6 = require(l_CorePackages_0.Packages.ReactRoblox);
local v7 = require(l_Modules_0.Settings.Flags.FFlagRefactorPeoplePage);
local v8 = game:DefineFastFlag("RenderPeoplePageOnTabSwitch", false);
local v9 = require(l_Modules_0.Settings.Flags.FFlagRelocateMobileMenuButtons);
local v10 = require(l_Modules_0.Settings.Flags.FIntRelocateMobileMenuButtonsVariant);
local l_Chrome_0 = l_RobloxGui_0.Modules.Chrome;
local v12 = require(l_CorePackages_0.Workspace.Packages.Chrome).Enabled();
local v13 = if v12 then require(l_Chrome_0.ChromeShared.Service.LocalStore) else nil;
local l_Localization_0 = require(l_CorePackages_0.Workspace.Packages.InExperienceLocales).Localization;
local l_LocalizationProvider_0 = require(l_CorePackages_0.Workspace.Packages.Localization).LocalizationProvider;
local v16 = require(l_CorePackages_0.Packages.Signals);
local v17 = require(l_CorePackages_0.Packages.SignalsReact);
local v18 = require(l_Modules_0.Settings.SettingsPageFactory);
local l_SettingsShowSignal_0 = require(l_CorePackages_0.Workspace.Packages.CoreScriptsCommon).SettingsShowSignal;
local v20 = l_Localization_0.new(l_LocalizationService_0.RobloxLocaleId);
local v21 = require(l_CorePackages_0.Packages.BuilderIcons);
local v22 = require(l_Modules_0.Settings.Components.Blocking.BlockingModalScreen);
local l_uiblox_0 = v21.Migration.uiblox;
local v24 = require(l_CorePackages_0.Workspace.Packages.PeopleService);
local v25 = require(l_CorePackages_0.Workspace.Packages.FocusNavigationUtils);
local l_FocusRoot_0 = v25.FocusRoot;
local l_FocusNavigableSurfaceIdentifierEnum_0 = v25.FocusNavigableSurfaceIdentifierEnum;
local l_CoreScriptsRootProvider_0 = require(l_CorePackages_0.Workspace.Packages.CoreScriptsRoactCommon).CoreScriptsRootProvider;
local l_useRegistryEntry_0 = v25.FocusNavigableSurfaceRegistry.useRegistryEntry;
local v30 = nil;
if v7() then
    v30 = require(l_CorePackages_0.Workspace.Packages.PeopleReactView).Constants;
end;
local v31 = v24.getService("Flags");
local l_GetFFlagAddPeoplePageCardLayout_0 = v31.GetFFlagAddPeoplePageCardLayout;
local l_GetFFlagPeoplePageLazyRenderCards_0 = v31.GetFFlagPeoplePageLazyRenderCards;
local l_FFlagEnablePeopleListLazyRender_0 = v31.FFlagEnablePeopleListLazyRender;
local l_FFlagPeopleCardsEnableVirtualizedGrid_0 = v31.FFlagPeopleCardsEnableVirtualizedGrid;
local v36 = nil;
local v37, v38 = v16.createSignal(false);
local function v41(v39) --[[ Line: 63 ]] --[[ Name: PeopleFocusRoot ]]
    -- upvalues: l_useRegistryEntry_0 (copy), l_FocusNavigableSurfaceIdentifierEnum_0 (copy), v5 (copy), l_FocusRoot_0 (copy)
    local v40 = l_useRegistryEntry_0(l_FocusNavigableSurfaceIdentifierEnum_0.CentralOverlay) == nil;
    return v5.createElement(l_FocusRoot_0, {
        surfaceIdentifier = l_FocusNavigableSurfaceIdentifierEnum_0.RouterView, 
        isAutoFocusRoot = v40
    }, v39.children);
end;
local function v53() --[[ Line: 76 ]] --[[ Name: createPeoplePage ]]
    -- upvalues: l_CorePackages_0 (copy), v18 (copy), v30 (ref), l_uiblox_0 (copy), v21 (copy), v20 (copy), v9 (copy), v10 (copy), v36 (ref), l_GetFFlagPeoplePageLazyRenderCards_0 (copy), l_FFlagEnablePeopleListLazyRender_0 (copy), l_FFlagPeopleCardsEnableVirtualizedGrid_0 (copy), v17 (copy), v37 (copy), v5 (copy), l_CoreScriptsRootProvider_0 (copy), l_LocalizationProvider_0 (copy), v41 (copy), v22 (copy), v12 (copy), l_GetFFlagAddPeoplePageCardLayout_0 (copy), v13 (copy), v6 (copy), v8 (copy), v38 (copy), l_SettingsShowSignal_0 (copy)
    local l_PeopleReactView_0 = require(l_CorePackages_0.Workspace.Packages.PeopleReactView).PeopleReactView;
    local v43 = require(l_CorePackages_0.Workspace.Packages.PeopleService);
    local l_v18_NewPage_0 = v18:CreateNewPage();
    l_v18_NewPage_0.TabHeader.Name = v30.PEOPLEPAGE.TAB_HEADER.NAME;
    l_v18_NewPage_0.Page.Name = v30.PEOPLEPAGE.PAGE_ID;
    local v45 = l_uiblox_0[v30.PEOPLEPAGE.TAB_HEADER.ICON];
    l_v18_NewPage_0.TabHeader.TabLabel.Icon.Text = v45.name;
    l_v18_NewPage_0.TabHeader.TabLabel.Icon.FontFace = v21.Font[v45.variant];
    l_v18_NewPage_0.TabHeader.TabLabel.Title.Text = v20:Format(v30.PEOPLEPAGE.TAB_HEADER.TEXT);
    local v46 = v43.getService("SettingsHubService");
    v46.register(l_v18_NewPage_0);
    l_v18_NewPage_0.CreateMenuButtonsContainer = function(_) --[[ Line: 93 ]] --[[ Name: CreateMenuButtonsContainer ]]
        -- upvalues: v46 (copy)
        v46.setShowMenuButtonsContainer(true);
    end;
    if v9 and v10 == 2 then
        l_v18_NewPage_0.UnmountMenuButtonsContainer = function(_) --[[ Line: 98 ]] --[[ Name: UnmountMenuButtonsContainer ]]
            -- upvalues: v46 (copy)
            v46.setShowMenuButtonsContainer(false);
        end;
    end;
    local function v51() --[[ Line: 104 ]] --[[ Name: createReactTree ]]
        -- upvalues: v36 (ref), l_GetFFlagPeoplePageLazyRenderCards_0 (ref), l_FFlagEnablePeopleListLazyRender_0 (ref), l_FFlagPeopleCardsEnableVirtualizedGrid_0 (ref), l_v18_NewPage_0 (copy), v17 (ref), v37 (ref), v5 (ref), l_CoreScriptsRootProvider_0 (ref), l_LocalizationProvider_0 (ref), v20 (ref), v41 (ref), l_PeopleReactView_0 (copy), v22 (ref), v12 (ref), l_GetFFlagAddPeoplePageCardLayout_0 (ref), v13 (ref), v6 (ref)
        if v36 then
            return;
        else
            local v49 = if not not l_GetFFlagPeoplePageLazyRenderCards_0() or l_FFlagEnablePeopleListLazyRender_0 or l_FFlagPeopleCardsEnableVirtualizedGrid_0 then l_v18_NewPage_0.Page:FindFirstAncestorWhichIsA("ScrollingFrame") else nil;
            local function v50() --[[ Line: 111 ]]
                -- upvalues: v17 (ref), v37 (ref), v5 (ref), l_CoreScriptsRootProvider_0 (ref), l_LocalizationProvider_0 (ref), v20 (ref), v41 (ref), l_PeopleReactView_0 (ref), v22 (ref), l_GetFFlagPeoplePageLazyRenderCards_0 (ref), l_FFlagEnablePeopleListLazyRender_0 (ref), l_FFlagPeopleCardsEnableVirtualizedGrid_0 (ref), v49 (copy), v12 (ref), l_GetFFlagAddPeoplePageCardLayout_0 (ref), v13 (ref)
                if v17.useSignalState(v37) then
                    return (v5.createElement(l_CoreScriptsRootProvider_0, {}, {
                        LocalizationProvider = v5.createElement(l_LocalizationProvider_0, {
                            localization = v20
                        }, {
                            FocusRoot = v5.createElement(v41, {}, {
                                PeopleReactView = v5.createElement(l_PeopleReactView_0, {
                                    blockingModalScreen = v22, 
                                    blockingFlags = {}, 
                                    scrollingFrame = if not not l_GetFFlagPeoplePageLazyRenderCards_0() or l_FFlagEnablePeopleListLazyRender_0 or l_FFlagPeopleCardsEnableVirtualizedGrid_0 then v49 else nil, 
                                    chromeEnabled = v12, 
                                    getUniversesExposedTo = if l_GetFFlagAddPeoplePageCardLayout_0() and v13 then v13.getUniversesExposedTo else nil, 
                                    addUniverseToExposureList = if l_GetFFlagAddPeoplePageCardLayout_0() and v13 then v13.addUniverseToExposureList else nil
                                })
                            })
                        })
                    }));
                else
                    return nil;
                end;
            end;
            v36 = v6.createRoot(l_v18_NewPage_0.Page);
            if v36 then
                v36:render(v5.createElement(v50));
            end;
            return;
        end;
    end;
    l_v18_NewPage_0.Displayed.Event:Connect(function() --[[ Line: 138 ]]
        -- upvalues: v8 (ref), v37 (ref), v51 (copy), v38 (ref)
        if not v8 or not v37(false) then
            v51();
            v38(true);
        end;
    end);
    if v8 then
        l_SettingsShowSignal_0:connect(function(v52) --[[ Line: 146 ]]
            -- upvalues: v38 (ref)
            if not v52 then
                v38(false);
            end;
        end);
    else
        l_v18_NewPage_0.Hidden.Event:Connect(function() --[[ Line: 152 ]]
            -- upvalues: v38 (ref)
            v38(false);
        end);
    end;
    l_v18_NewPage_0.Page.Size = UDim2.new(1, 0, 0, 0);
    l_v18_NewPage_0.Page.AutomaticSize = Enum.AutomaticSize.Y;
    return l_v18_NewPage_0;
end;
if v7() then
    return (v53());
else
    return require(l_Modules_0.Settings.Pages.Players);
end;