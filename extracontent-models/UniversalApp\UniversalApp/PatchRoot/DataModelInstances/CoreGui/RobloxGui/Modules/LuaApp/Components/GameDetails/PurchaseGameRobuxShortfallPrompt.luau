local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v2 = require(l_Modules_0.Common.Roact);
local v3 = require(l_Modules_0.Common.RoactRodux);
local v4 = require(l_Modules_0.LuaApp.Services.RoactNetworking);
local v5 = require(l_Modules_0.Common.Functional);
local l_RoactServices_0 = require(l_CorePackages_0.Workspace.Packages.RoactServices).RoactServices;
local l_AppGuiService_0 = require(l_CorePackages_0.Workspace.Packages.RoactServiceTags).AppGuiService;
local v8 = require(l_Modules_0.LuaApp.Services.RoactLocalization);
local v9 = require(l_Modules_0.LuaApp.Components.AlertWindow);
local v10 = require(l_Modules_0.LuaApp.Thunks.CloseCentralOverlay);
local v11 = require(l_Modules_0.LuaApp.withLocalization);
local v12 = require(l_Modules_0.LuaApp.ThemeContext_DEPRECATED);
local v13 = require(l_Modules_0.LuaApp.Thunks.Economy.OpenPurchaseRobuxPage);
local v14 = require(l_Modules_0.LuaApp.Flags.GetFFlagLuaAppUseWithLocalization);
local v15 = v2.PureComponent:extend("PurchaseGameRobuxShortfallPrompt");
v15.init = function(v16) --[[ Line: 20 ]] --[[ Name: init ]]
    v16.buyRobux = function() --[[ Line: 21 ]]
        -- upvalues: v16 (copy)
        v16.props.closePrompt();
        v16.props.openPurchaseRobuxPage(v16.props.networking);
    end;
end;
v15.didMount = function(v17) --[[ Line: 28 ]] --[[ Name: didMount ]]
    -- upvalues: v5 (copy)
    local l_pageFilter_0 = v17.props.pageFilter;
    local l_currentPage_0 = v17.props.currentPage;
    local l_closePrompt_0 = v17.props.closePrompt;
    if l_pageFilter_0 and not v5.Find(l_pageFilter_0, l_currentPage_0) then
        l_closePrompt_0();
    end;
end;
v15.render = function(v21) --[[ Line: 38 ]] --[[ Name: render ]]
    -- upvalues: v2 (copy), v12 (copy), v9 (copy), v14 (copy), v11 (copy)
    local l_theme_0 = v21.props.theme;
    local l_containerWidth_0 = v21.props.containerWidth;
    local l_robuxShortfall_0 = v21.props.robuxShortfall;
    local l_closePrompt_1 = v21.props.closePrompt;
    local l_localization_0 = v21.props.localization;
    local l_gameName_0 = v21.props.gameName;
    local function v29(v28) --[[ Line: 46 ]]
        -- upvalues: v2 (ref), v12 (ref), l_theme_0 (copy), v9 (ref), l_containerWidth_0 (copy), v21 (copy), l_closePrompt_1 (copy)
        return v2.createElement(v12.Provider, {
            value = l_theme_0
        }, {
            AlertWindow = v2.createElement(v9, {
                containerWidth = l_containerWidth_0, 
                titleText = v28.titleText, 
                titleFont = l_theme_0.GameDetails.Text.BoldFont, 
                messageText = v28.messageText, 
                messageFont = l_theme_0.GameDetails.Text.Font, 
                buttonFont = l_theme_0.GameDetails.Text.Font, 
                confirmButtonText = v28.confirmButtonText, 
                onConfirm = v21.buyRobux, 
                hasCancelButton = true, 
                onCancel = l_closePrompt_1
            })
        });
    end;
    if v14() then
        return v11({
            titleText = "Feature.GameDetails.Heading.PurchaseGame", 
            messageText = {
                "Feature.GameDetails.Message.BuyMoreRobuxToPurchaseGameV2"; 
                gameName = l_gameName_0, 
                shortfallPrice = l_robuxShortfall_0
            }, 
            confirmButtonText = "Feature.GameDetails.Action.BuyRobux"
        })(v29);
    else
        return v29({
            titleText = l_localization_0:Format("Feature.GameDetails.Heading.PurchaseGame"), 
            messageText = l_localization_0:Format("Feature.GameDetails.Message.BuyMoreRobuxToPurchaseGameV2", {
                gameName = l_gameName_0, 
                shortfallPrice = l_robuxShortfall_0
            }), 
            confirmButtonText = l_localization_0:Format("Feature.GameDetails.Action.BuyRobux")
        });
    end;
end;
v15 = v3.connect(function(v30, _) --[[ Line: 85 ]]
    local v32 = v30.Navigation.history[#v30.Navigation.history];
    return {
        currentPage = v32[#v32].name
    };
end, function(v33) --[[ Line: 90 ]]
    -- upvalues: v10 (copy), v13 (copy)
    return {
        closePrompt = function() --[[ Line: 92 ]] --[[ Name: closePrompt ]]
            -- upvalues: v33 (copy), v10 (ref)
            v33(v10());
        end, 
        openPurchaseRobuxPage = function(v34) --[[ Line: 95 ]] --[[ Name: openPurchaseRobuxPage ]]
            -- upvalues: v33 (copy), v13 (ref)
            return v33(v13(nil, v34));
        end
    };
end)(v15);
return (l_RoactServices_0.connect({
    localization = v8, 
    guiService = l_AppGuiService_0, 
    networking = v4
})(v15));