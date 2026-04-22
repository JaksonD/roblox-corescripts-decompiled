local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_FFlagUseNavigationSelectors_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagUseNavigationSelectors;
local l_Selectors_0 = require(l_CorePackages_0.Workspace.Packages.NavigationRodux).Selectors;
local v4 = require(l_Modules_0.Common.Roact);
local v5 = require(l_Modules_0.Common.RoactRodux);
local v6 = require(l_Modules_0.LuaApp.Services.RoactNetworking);
local v7 = require(l_Modules_0.Common.Functional);
local l_RoactServices_0 = require(l_CorePackages_0.Workspace.Packages.RoactServices).RoactServices;
local l_AppGuiService_0 = require(l_CorePackages_0.Workspace.Packages.RoactServiceTags).AppGuiService;
local v10 = require(l_Modules_0.LuaApp.Services.RoactLocalization);
local v11 = require(l_Modules_0.LuaApp.Components.AlertWindow);
local v12 = require(l_Modules_0.LuaApp.Thunks.CloseCentralOverlay);
local v13 = require(l_Modules_0.LuaApp.withLocalization);
local v14 = require(l_Modules_0.LuaApp.ThemeContext_DEPRECATED);
local v15 = require(l_Modules_0.LuaApp.Thunks.Economy.OpenPurchaseRobuxPage);
local v16 = require(l_Modules_0.LuaApp.Flags.GetFFlagLuaAppUseWithLocalization);
local v17 = v4.PureComponent:extend("PurchaseGameRobuxShortfallPrompt");
v17.init = function(v18) --[[ Line: 22 ]] --[[ Name: init ]]
    v18.buyRobux = function() --[[ Line: 23 ]]
        -- upvalues: v18 (copy)
        v18.props.closePrompt();
        v18.props.openPurchaseRobuxPage(v18.props.networking);
    end;
end;
v17.didMount = function(v19) --[[ Line: 30 ]] --[[ Name: didMount ]]
    -- upvalues: v7 (copy)
    local l_pageFilter_0 = v19.props.pageFilter;
    local l_currentPage_0 = v19.props.currentPage;
    local l_closePrompt_0 = v19.props.closePrompt;
    if l_pageFilter_0 and not v7.Find(l_pageFilter_0, l_currentPage_0) then
        l_closePrompt_0();
    end;
end;
v17.render = function(v23) --[[ Line: 40 ]] --[[ Name: render ]]
    -- upvalues: v4 (copy), v14 (copy), v11 (copy), v16 (copy), v13 (copy)
    local l_theme_0 = v23.props.theme;
    local l_containerWidth_0 = v23.props.containerWidth;
    local l_robuxShortfall_0 = v23.props.robuxShortfall;
    local l_closePrompt_1 = v23.props.closePrompt;
    local l_localization_0 = v23.props.localization;
    local l_gameName_0 = v23.props.gameName;
    local function v31(v30) --[[ Line: 48 ]]
        -- upvalues: v4 (ref), v14 (ref), l_theme_0 (copy), v11 (ref), l_containerWidth_0 (copy), v23 (copy), l_closePrompt_1 (copy)
        return v4.createElement(v14.Provider, {
            value = l_theme_0
        }, {
            AlertWindow = v4.createElement(v11, {
                containerWidth = l_containerWidth_0, 
                titleText = v30.titleText, 
                titleFont = l_theme_0.GameDetails.Text.BoldFont, 
                messageText = v30.messageText, 
                messageFont = l_theme_0.GameDetails.Text.Font, 
                buttonFont = l_theme_0.GameDetails.Text.Font, 
                confirmButtonText = v30.confirmButtonText, 
                onConfirm = v23.buyRobux, 
                hasCancelButton = true, 
                onCancel = l_closePrompt_1
            })
        });
    end;
    if v16() then
        return v13({
            titleText = "Feature.GameDetails.Heading.PurchaseGame", 
            messageText = {
                "Feature.GameDetails.Message.BuyMoreRobuxToPurchaseGameV2"; 
                gameName = l_gameName_0, 
                shortfallPrice = l_robuxShortfall_0
            }, 
            confirmButtonText = "Feature.GameDetails.Action.BuyRobux"
        })(v31);
    else
        return v31({
            titleText = l_localization_0:Format("Feature.GameDetails.Heading.PurchaseGame"), 
            messageText = l_localization_0:Format("Feature.GameDetails.Message.BuyMoreRobuxToPurchaseGameV2", {
                gameName = l_gameName_0, 
                shortfallPrice = l_robuxShortfall_0
            }), 
            confirmButtonText = l_localization_0:Format("Feature.GameDetails.Action.BuyRobux")
        });
    end;
end;
v17 = v5.connect(function(v32, _) --[[ Line: 87 ]]
    -- upvalues: l_FFlagUseNavigationSelectors_0 (copy), l_Selectors_0 (copy)
    local v34 = if l_FFlagUseNavigationSelectors_0 then l_Selectors_0.selectCurrentLegacyRoute(v32) else v32.Navigation.history[#v32.Navigation.history];
    return {
        currentPage = v34[#v34].name
    };
end, function(v35) --[[ Line: 94 ]]
    -- upvalues: v12 (copy), v15 (copy)
    return {
        closePrompt = function() --[[ Line: 96 ]] --[[ Name: closePrompt ]]
            -- upvalues: v35 (copy), v12 (ref)
            v35(v12());
        end, 
        openPurchaseRobuxPage = function(v36) --[[ Line: 99 ]] --[[ Name: openPurchaseRobuxPage ]]
            -- upvalues: v35 (copy), v15 (ref)
            return v35(v15(nil, v36));
        end
    };
end)(v17);
return (l_RoactServices_0.connect({
    localization = v10, 
    guiService = l_AppGuiService_0, 
    networking = v6
})(v17));