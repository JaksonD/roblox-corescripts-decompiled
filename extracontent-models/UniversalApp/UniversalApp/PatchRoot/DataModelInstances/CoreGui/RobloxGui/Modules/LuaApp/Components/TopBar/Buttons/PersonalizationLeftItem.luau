local l_CorePackages_0 = game:GetService("CorePackages");
local l_FFlagUseNavigationSelectors_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagUseNavigationSelectors;
local l_Selectors_0 = require(l_CorePackages_0.Workspace.Packages.NavigationRodux).Selectors;
local v3 = require(l_CorePackages_0.Packages.RoactRodux);
local v4 = require(l_CorePackages_0.Packages.React);
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v6 = require(l_Modules_0.LuaApp.Components.TopBar.Buttons.ProfileLeftHeader);
local v7 = require(l_Modules_0.LuaApp.Components.TopBar.Buttons.makeBackButton);
local v8 = require(l_Modules_0.LuaApp.Components.TopBar.Utils.shouldShowProfileInHeaderBar);
local v9 = require(l_Modules_0.LuaApp.Flags.FFlagEnableFlyoutSidePanel);
local l_FFlagEnableHomeRobloxLogo_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagEnableHomeRobloxLogo;
local v11 = nil;
local v12 = nil;
local v13 = nil;
if v9 or l_FFlagEnableHomeRobloxLogo_0 then
    v12 = require(l_CorePackages_0.Workspace.Packages.SharedExperimentDefinition).FlyoutSidePanelIXP;
    local v14 = require(l_CorePackages_0.Workspace.Packages.FlyoutSidePanel);
    v11 = v14.Components.FlyoutLeftHeader;
    v13 = v14.Utils.shouldShowLeftHeader;
end;
local v15 = v4.Component:extend("PersonalizationLeftItem");
v15.init = function(v16, _) --[[ Line: 47 ]] --[[ Name: init ]]
    -- upvalues: v7 (copy)
    v16.backButton = v7(nil);
end;
local function _(v18) --[[ Line: 51 ]] --[[ Name: shouldShowAvatarHeader ]]
    -- upvalues: v9 (copy), l_FFlagEnableHomeRobloxLogo_0 (copy), v13 (ref), v8 (copy)
    local l_name_0 = v18.currentRoute[1].name;
    local l_name_1 = v18.currentRoute[#v18.currentRoute].name;
    if v9 or l_FFlagEnableHomeRobloxLogo_0 then
        local l_routeName_0 = v18.routeName;
        return v13(l_routeName_0, l_name_1, v18.isSearching);
    else
        return v8(l_name_0, l_name_1, v18.formFactor, v18.isSearching);
    end;
end;
v15.didMount = function(v23) --[[ Line: 63 ]] --[[ Name: didMount ]]
    -- upvalues: v9 (copy), l_FFlagEnableHomeRobloxLogo_0 (copy), v13 (ref), v8 (copy)
    if v9 or l_FFlagEnableHomeRobloxLogo_0 then
        local l_props_0 = v23.props;
        local l_name_2 = l_props_0.currentRoute[1].name;
        local l_name_3 = l_props_0.currentRoute[#l_props_0.currentRoute].name;
        local v27;
        if v9 or l_FFlagEnableHomeRobloxLogo_0 then
            local l_routeName_1 = l_props_0.routeName;
            v27 = v13(l_routeName_1, l_name_3, l_props_0.isSearching);
        else
            v27 = v8(l_name_2, l_name_3, l_props_0.formFactor, l_props_0.isSearching);
        end;
        if v27 then
            v23.props.setVisible(v27);
        end;
    end;
end;
v15.didUpdate = function(v29, v30) --[[ Line: 74 ]] --[[ Name: didUpdate ]]
    -- upvalues: v9 (copy), l_FFlagEnableHomeRobloxLogo_0 (copy), v13 (ref), v8 (copy)
    local l_name_4 = v30.currentRoute[1].name;
    local l_name_5 = v30.currentRoute[#v30.currentRoute].name;
    local v33;
    if v9 or l_FFlagEnableHomeRobloxLogo_0 then
        local l_routeName_2 = v30.routeName;
        v33 = v13(l_routeName_2, l_name_5, v30.isSearching);
    else
        v33 = v8(l_name_4, l_name_5, v30.formFactor, v30.isSearching);
    end;
    l_name_5 = v29.props;
    local l_name_6 = l_name_5.currentRoute[1].name;
    local l_name_7 = l_name_5.currentRoute[#l_name_5.currentRoute].name;
    if v9 or l_FFlagEnableHomeRobloxLogo_0 then
        local l_routeName_3 = l_name_5.routeName;
        l_name_4 = v13(l_routeName_3, l_name_7, l_name_5.isSearching);
    else
        l_name_4 = v8(l_name_6, l_name_7, l_name_5.formFactor, l_name_5.isSearching);
    end;
    if v33 ~= l_name_4 then
        v29.props.setVisible(l_name_4);
    end;
end;
v15.render = function(v38) --[[ Line: 83 ]] --[[ Name: render ]]
    -- upvalues: v9 (copy), l_FFlagEnableHomeRobloxLogo_0 (copy), v13 (ref), v8 (copy), v4 (copy), v11 (ref), v12 (ref), v6 (copy)
    local l_props_1 = v38.props;
    local l_name_8 = l_props_1.currentRoute[1].name;
    local l_name_9 = l_props_1.currentRoute[#l_props_1.currentRoute].name;
    local v42;
    if v9 or l_FFlagEnableHomeRobloxLogo_0 then
        local l_routeName_4 = l_props_1.routeName;
        v42 = v13(l_routeName_4, l_name_9, l_props_1.isSearching);
    else
        v42 = v8(l_name_8, l_name_9, l_props_1.formFactor, l_props_1.isSearching);
    end;
    if v42 then
        if v9 or l_FFlagEnableHomeRobloxLogo_0 then
            return v4.createElement(v11, {
                formFactor = v38.props.formFactor, 
                titleText = v38.props.titleText, 
                buttonRef = v38.props.buttonRef, 
                routeName = v38.props.routeName, 
                isFlyoutEntrypointEnabled = if l_FFlagEnableHomeRobloxLogo_0 then v12.isFlyoutSidePanelEnabled() else nil, 
                isRobloxLogoEnabled = l_FFlagEnableHomeRobloxLogo_0 and true or v12.isRobloxLogoEnabled(), 
                isAlternateEntryPointEnabled = v12.isAlternateEntryPointEnabled()
            });
        else
            return v4.createElement(v6, {
                formFactor = v38.props.formFactor, 
                titleText = v38.props.titleText, 
                buttonRef = v38.props.buttonRef
            });
        end;
    else
        return v4.createElement(v38.backButton, {
            formFactor = v38.props.formFactor, 
            isCompactView = v38.props.isCompactView, 
            isSearching = v38.props.isSearching, 
            isSecondary = v38.props.isSecondary, 
            cancelSearch = v38.props.cancelSearch, 
            activateSearch = v38.props.activateSearch, 
            setVisible = v38.props.setVisible, 
            buttonRef = v38.props.buttonRef
        });
    end;
end;
return (v3.connect(function(v44, _) --[[ Line: 119 ]]
    -- upvalues: l_FFlagUseNavigationSelectors_0 (copy), l_Selectors_0 (copy)
    return {
        currentRoute = if l_FFlagUseNavigationSelectors_0 then l_Selectors_0.selectCurrentLegacyRoute(v44) else v44.Navigation.history[#v44.Navigation.history]
    };
end)(v15));