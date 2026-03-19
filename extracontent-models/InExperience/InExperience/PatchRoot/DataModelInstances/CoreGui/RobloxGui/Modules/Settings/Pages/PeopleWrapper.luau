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
local v35 = nil;
local v36, v37 = v16.createSignal(false);
local function v40(v38) --[[ Line: 62 ]] --[[ Name: PeopleFocusRoot ]]
    -- upvalues: l_useRegistryEntry_0 (copy), l_FocusNavigableSurfaceIdentifierEnum_0 (copy), v5 (copy), l_FocusRoot_0 (copy)
    local v39 = l_useRegistryEntry_0(l_FocusNavigableSurfaceIdentifierEnum_0.CentralOverlay) == nil;
    return v5.createElement(l_FocusRoot_0, {
        surfaceIdentifier = l_FocusNavigableSurfaceIdentifierEnum_0.RouterView, 
        isAutoFocusRoot = v39
    }, v38.children);
end;
local function v52() --[[ Line: 75 ]] --[[ Name: createPeoplePage ]]
    -- upvalues: l_CorePackages_0 (copy), v18 (copy), v30 (ref), l_uiblox_0 (copy), v21 (copy), v20 (copy), v9 (copy), v10 (copy), v35 (ref), l_GetFFlagPeoplePageLazyRenderCards_0 (copy), l_FFlagEnablePeopleListLazyRender_0 (copy), v17 (copy), v36 (copy), v5 (copy), l_CoreScriptsRootProvider_0 (copy), l_LocalizationProvider_0 (copy), v40 (copy), v22 (copy), v12 (copy), l_GetFFlagAddPeoplePageCardLayout_0 (copy), v13 (copy), v6 (copy), v8 (copy), v37 (copy), l_SettingsShowSignal_0 (copy)
    local l_PeopleReactView_0 = require(l_CorePackages_0.Workspace.Packages.PeopleReactView).PeopleReactView;
    local v42 = require(l_CorePackages_0.Workspace.Packages.PeopleService);
    local l_v18_NewPage_0 = v18:CreateNewPage();
    l_v18_NewPage_0.TabHeader.Name = v30.PEOPLEPAGE.TAB_HEADER.NAME;
    l_v18_NewPage_0.Page.Name = v30.PEOPLEPAGE.PAGE_ID;
    local v44 = l_uiblox_0[v30.PEOPLEPAGE.TAB_HEADER.ICON];
    l_v18_NewPage_0.TabHeader.TabLabel.Icon.Text = v44.name;
    l_v18_NewPage_0.TabHeader.TabLabel.Icon.FontFace = v21.Font[v44.variant];
    l_v18_NewPage_0.TabHeader.TabLabel.Title.Text = v20:Format(v30.PEOPLEPAGE.TAB_HEADER.TEXT);
    local v45 = v42.getService("SettingsHubService");
    v45.register(l_v18_NewPage_0);
    l_v18_NewPage_0.CreateMenuButtonsContainer = function(_) --[[ Line: 92 ]] --[[ Name: CreateMenuButtonsContainer ]]
        -- upvalues: v45 (copy)
        v45.setShowMenuButtonsContainer(true);
    end;
    if v9 and v10 == 2 then
        l_v18_NewPage_0.UnmountMenuButtonsContainer = function(_) --[[ Line: 97 ]] --[[ Name: UnmountMenuButtonsContainer ]]
            -- upvalues: v45 (copy)
            v45.setShowMenuButtonsContainer(false);
        end;
    end;
    local function v50() --[[ Line: 103 ]] --[[ Name: createReactTree ]]
        -- upvalues: v35 (ref), l_GetFFlagPeoplePageLazyRenderCards_0 (ref), l_FFlagEnablePeopleListLazyRender_0 (ref), l_v18_NewPage_0 (copy), v17 (ref), v36 (ref), v5 (ref), l_CoreScriptsRootProvider_0 (ref), l_LocalizationProvider_0 (ref), v20 (ref), v40 (ref), l_PeopleReactView_0 (copy), v22 (ref), v12 (ref), l_GetFFlagAddPeoplePageCardLayout_0 (ref), v13 (ref), v6 (ref)
        if v35 then
            return;
        else
            local v48 = if not not l_GetFFlagPeoplePageLazyRenderCards_0() or l_FFlagEnablePeopleListLazyRender_0 then l_v18_NewPage_0.Page:FindFirstAncestorWhichIsA("ScrollingFrame") else nil;
            local function v49() --[[ Line: 110 ]]
                -- upvalues: v17 (ref), v36 (ref), v5 (ref), l_CoreScriptsRootProvider_0 (ref), l_LocalizationProvider_0 (ref), v20 (ref), v40 (ref), l_PeopleReactView_0 (ref), v22 (ref), l_GetFFlagPeoplePageLazyRenderCards_0 (ref), l_FFlagEnablePeopleListLazyRender_0 (ref), v48 (copy), v12 (ref), l_GetFFlagAddPeoplePageCardLayout_0 (ref), v13 (ref)
                if v17.useSignalState(v36) then
                    return (v5.createElement(l_CoreScriptsRootProvider_0, {}, {
                        LocalizationProvider = v5.createElement(l_LocalizationProvider_0, {
                            localization = v20
                        }, {
                            FocusRoot = v5.createElement(v40, {}, {
                                PeopleReactView = v5.createElement(l_PeopleReactView_0, {
                                    blockingModalScreen = v22, 
                                    blockingFlags = {}, 
                                    scrollingFrame = if not not l_GetFFlagPeoplePageLazyRenderCards_0() or l_FFlagEnablePeopleListLazyRender_0 then v48 else nil, 
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
            v35 = v6.createRoot(l_v18_NewPage_0.Page);
            if v35 then
                v35:render(v5.createElement(v49));
            end;
            return;
        end;
    end;
    l_v18_NewPage_0.Displayed.Event:Connect(function() --[[ Line: 137 ]]
        -- upvalues: v8 (ref), v36 (ref), v50 (copy), v37 (ref)
        if not v8 or not v36(false) then
            v50();
            v37(true);
        end;
    end);
    if v8 then
        l_SettingsShowSignal_0:connect(function(v51) --[[ Line: 145 ]]
            -- upvalues: v37 (ref)
            if not v51 then
                v37(false);
            end;
        end);
    else
        l_v18_NewPage_0.Hidden.Event:Connect(function() --[[ Line: 151 ]]
            -- upvalues: v37 (ref)
            v37(false);
        end);
    end;
    l_v18_NewPage_0.Page.Size = UDim2.new(1, 0, 0, 0);
    l_v18_NewPage_0.Page.AutomaticSize = Enum.AutomaticSize.Y;
    return l_v18_NewPage_0;
end;
if v7() then
    return (v52());
else
    return require(l_Modules_0.Settings.Pages.Players);
end;