local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Packages.InGameMenuDependencies);
local l_Roact_0 = v1.Roact;
local l_RoactRodux_0 = v1.RoactRodux;
local l_Parent_0 = script.Parent.Parent;
local v5 = require(l_Parent_0.InGameMenuPolicy);
local v6 = require(script.Parent.ViewportOverlay);
local v7 = require(script.Parent.SideNavigation);
local v8 = require(script.Parent.LeaveGameDialog);
local v9 = require(script.Parent.PageContainer);
local v10 = require(script.Parent.RespawnDialog);
local v11 = require(script.Parent.ReportPage.ReportDialog);
local v12 = require(script.Parent.ReportPage.ReportSentDialog);
local v13 = require(script.Parent.ControlsPage.ControlLayoutSetter);
local v14 = require(script.Parent.Connection);
local v15 = require(script.Parent.EducationalPopup);
local v16 = require(script.Parent.MenuIconTooltip);
local v17 = require(script.Parent.FullscreenTitleBar);
local l_Flags_0 = l_Parent_0.Flags;
local v19 = require(l_Flags_0.FFlagLuaMenuPerfImprovements);
local v20 = require(l_Parent_0.Resources.Constants);
local v25 = v5.connect(function(v21, _) --[[ Line: 75 ]]
    return {
        enableFullscreenTitleBar = v21.enableFullscreenTitleBar(), 
        isEducationalPopupEnabled = v21.enableEducationalPopup()
    };
end)(function(v23) --[[ Line: 32 ]] --[[ Name: App ]]
    -- upvalues: l_Roact_0 (copy), v17 (copy), v20 (copy), v19 (copy), v6 (copy), v7 (copy), v8 (copy), v9 (copy), v10 (copy), v11 (copy), v12 (copy), v13 (copy), v14 (copy), v15 (copy), v16 (copy)
    local v24 = nil;
    if v23.enableFullscreenTitleBar then
        v24 = l_Roact_0.createElement(v17, {
            displayOrder = v20.DisplayOrder.FullscreenTitleBar
        });
    end;
    if v19 then
        return l_Roact_0.createFragment({
            Content = v23.isMenuOpen and l_Roact_0.createFragment({
                Overlay = l_Roact_0.createElement(v6), 
                SideNavigation = l_Roact_0.createElement(v7), 
                LeaveGameDialog = l_Roact_0.createElement(v8), 
                PageContainer = l_Roact_0.createElement(v9), 
                RespawnDialog = l_Roact_0.createElement(v10), 
                ReportDialog = l_Roact_0.createElement(v11), 
                ReportSentDialog = l_Roact_0.createElement(v12), 
                ControlLayoutSetter = l_Roact_0.createElement(v13)
            }) or nil, 
            Connection = l_Roact_0.createElement(v14), 
            EducationalPopup = v23.isEducationalPopupEnabled and l_Roact_0.createElement(v15) or nil, 
            MenuIconTooltip = v23.isEducationalPopupEnabled and l_Roact_0.createElement(v16) or nil, 
            FullscreenTitleBar = v24
        });
    else
        return l_Roact_0.createFragment({
            Overlay = l_Roact_0.createElement(v6), 
            SideNavigation = l_Roact_0.createElement(v7), 
            LeaveGameDialog = l_Roact_0.createElement(v8), 
            PageContainer = l_Roact_0.createElement(v9), 
            RespawnDialog = l_Roact_0.createElement(v10), 
            ReportDialog = l_Roact_0.createElement(v11), 
            ReportSentDialog = l_Roact_0.createElement(v12), 
            ControlLayoutSetter = l_Roact_0.createElement(v13), 
            Connection = l_Roact_0.createElement(v14), 
            EducationalPopup = v23.isEducationalPopupEnabled and l_Roact_0.createElement(v15) or nil, 
            MenuIconTooltip = v23.isEducationalPopupEnabled and l_Roact_0.createElement(v16) or nil, 
            FullscreenTitleBar = v24
        });
    end;
end);
return l_RoactRodux_0.connect(function(v26, _) --[[ Line: 82 ]] --[[ Name: mapStateToProps ]]
    return {
        isMenuOpen = v26.isMenuOpen
    };
end, nil)(v25);