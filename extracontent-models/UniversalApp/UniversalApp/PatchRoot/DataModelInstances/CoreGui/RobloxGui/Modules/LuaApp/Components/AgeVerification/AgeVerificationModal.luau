local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local l_IXPService_0 = game:GetService("IXPService");
local v3 = require(l_CorePackages_0.Packages.t);
local v4 = require(l_CorePackages_0.Packages.Roact);
local v5 = require(l_CorePackages_0.Packages.React);
local v6 = require(l_CorePackages_0.Packages.RoactRodux);
local v7 = require(script.Parent.Parent.ExperienceDetails.ExperienceDetailsExperimentation);
local v8 = require(l_CorePackages_0.Packages.Cryo);
local v9 = require(l_Modules_0.LuaApp.Thunks.NavigateDown);
local v10 = require(l_Modules_0.LuaApp.Thunks.NavigateBack);
local v11 = require(l_Modules_0.LuaApp.Thunks.Games.FetchGameDetailsPageData);
local v12 = require(l_Modules_0.LuaApp.Http.UrlBuilder);
local v13 = require(l_Modules_0.LuaApp.AppPage);
local l_AppUserLayers_0 = require(l_CorePackages_0.Workspace.Packages.ExperimentLayers).AppUserLayers;
local v15 = require(l_Modules_0.LuaApp.getCurrentPage);
local l_withLocalization_0 = require(l_CorePackages_0.Workspace.Packages.Localization).withLocalization;
local l_RoactServices_0 = require(l_CorePackages_0.Workspace.Packages.RoactServices).RoactServices;
local v18 = require(l_Modules_0.LuaApp.Services.AppEventIngestService);
local v19 = require(l_Modules_0.LuaApp.Services.RoactNetworking);
local l_useAppPolicy_0 = require(l_CorePackages_0.Workspace.Packages.UniversalAppPolicy).useAppPolicy;
local l_FFlagLuaAppEdpBackendV2HydrateLegacyIxp_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagLuaAppEdpBackendV2HydrateLegacyIxp;
local v22 = require(l_CorePackages_0.Packages.UIBlox);
local l_PartialPageModal_0 = v22.App.Dialog.Modal.PartialPageModal;
local l_StyledTextLabel_0 = v22.App.Text.StyledTextLabel;
local l_ButtonType_0 = v22.App.Button.Enum.ButtonType;
local l_withStyle_0 = v22.Core.Style.withStyle;
local v27 = v4.PureComponent:extend("AgeVerificationModal");
v27.validateProps = v3.strictInterface({
    universeId = v3.string, 
    pageName = v3.string, 
    screenSize = v3.Vector2, 
    navigateDown = v3.callback, 
    navigateBack = v3.callback, 
    dispatchFetchGameDetailsPageData = v3.callback, 
    eventIngest = v3.table, 
    networking = v3.callback, 
    areWebviewsSupported = v3.boolean, 
    shouldHydrateLegacyIxp = if l_FFlagLuaAppEdpBackendV2HydrateLegacyIxp_0 then v3.optional(v3.boolean) else nil
});
v27.init = function(v28) --[[ Line: 50 ]] --[[ Name: init ]]
    v28.isMounted = false;
    v28.trackDeeplinkClick = function(v29, v30) --[[ Line: 53 ]]
        -- upvalues: v28 (copy)
        local v31 = {
            universeId = v30
        };
        v28.props.eventIngest:setRBXEventStream(v29, "ageVerificationUpsellClick", v31);
    end;
end;
v27.didMount = function(v32) --[[ Line: 63 ]] --[[ Name: didMount ]]
    v32.isMounted = true;
end;
v27.willUnmount = function(v33) --[[ Line: 67 ]] --[[ Name: willUnmount ]]
    -- upvalues: l_FFlagLuaAppEdpBackendV2HydrateLegacyIxp_0 (copy)
    local l_networking_0 = v33.props.networking;
    local l_universeId_0 = v33.props.universeId;
    if l_FFlagLuaAppEdpBackendV2HydrateLegacyIxp_0 then
        v33.props.dispatchFetchGameDetailsPageData(l_networking_0, l_universeId_0, nil, v33.props.shouldHydrateLegacyIxp);
    else
        v33.props.dispatchFetchGameDetailsPageData(l_networking_0, l_universeId_0);
    end;
    v33.isMounted = false;
end;
v27.render = function(v36) --[[ Line: 81 ]] --[[ Name: render ]]
    -- upvalues: l_withStyle_0 (copy), l_withLocalization_0 (copy), l_ButtonType_0 (copy), v13 (copy), v12 (copy), v4 (copy), l_PartialPageModal_0 (copy), l_StyledTextLabel_0 (copy)
    return l_withStyle_0(function(v37) --[[ Line: 82 ]]
        -- upvalues: l_withLocalization_0 (ref), l_ButtonType_0 (ref), v36 (copy), v13 (ref), v12 (ref), v4 (ref), l_PartialPageModal_0 (ref), l_StyledTextLabel_0 (ref)
        return l_withLocalization_0({
            title = "Feature.AgeVerificationUpsell.Modal.Title", 
            message = "Feature.AgeVerificationUpsell.Modal.ContentText", 
            buttonCancel = "Feature.AgeVerificationUpsell.Button.Cancel", 
            buttonSettings = "Feature.AgeVerificationUpsell.Button.Settings"
        })(function(v38) --[[ Line: 88 ]]
            -- upvalues: l_ButtonType_0 (ref), v36 (ref), v13 (ref), v12 (ref), v4 (ref), l_PartialPageModal_0 (ref), l_StyledTextLabel_0 (ref), v37 (copy)
            local v39 = {
                {
                    buttonType = l_ButtonType_0.Secondary, 
                    props = {
                        isDisabled = false, 
                        onActivated = v36.props.navigateBack, 
                        text = v38.buttonCancel
                    }
                }
            };
            if v36.props.areWebviewsSupported then
                table.insert(v39, {
                    buttonType = l_ButtonType_0.PrimarySystem, 
                    props = {
                        isDisabled = false, 
                        onActivated = function() --[[ Line: 104 ]] --[[ Name: onActivated ]]
                            -- upvalues: v36 (ref), v13 (ref), v12 (ref), v38 (copy)
                            if v36.isMounted then
                                v36.trackDeeplinkClick(v36.props.pageName, v36.props.universeId);
                                v36.props.navigateDown({
                                    name = v13.GenericWebPage, 
                                    detail = v12.static.settings.account(), 
                                    extraProps = {
                                        title = v38.buttonSettings
                                    }
                                });
                            end;
                        end, 
                        text = v38.buttonSettings
                    }
                });
            end;
            local v40 = v4.createElement(l_PartialPageModal_0, {
                title = v38.title, 
                screenSize = v36.props.screenSize, 
                buttonStackProps = {
                    forcedFillDirection = Enum.FillDirection.Horizontal, 
                    buttonHeight = 48, 
                    buttons = v39
                }
            }, {
                ViewFrame = v4.createElement("Frame", {
                    AutomaticSize = Enum.AutomaticSize.XY, 
                    BackgroundTransparency = 1
                }, {
                    UIPadding = v4.createElement("UIPadding", {
                        PaddingTop = UDim.new(0, 24), 
                        PaddingBottom = UDim.new(0, 24)
                    }), 
                    Text = v4.createElement(l_StyledTextLabel_0, {
                        fontStyle = v37.Font.Body, 
                        colorStyle = v37.Theme.TextEmphasis, 
                        size = UDim2.new(1, 0, 0, 0), 
                        fluidSizing = false, 
                        textXAlignment = Enum.TextXAlignment.Left, 
                        textYAlignment = Enum.TextYAlignment.Center, 
                        automaticSize = Enum.AutomaticSize.Y, 
                        text = v38.message
                    })
                })
            });
            return v4.createElement("ImageButton", {
                AutoButtonColor = false, 
                Size = UDim2.new(1, 0, 1, 0), 
                ImageTransparency = 1, 
                BackgroundColor3 = Color3.new(0, 0, 0), 
                BackgroundTransparency = 1, 
                BorderSizePixel = 0
            }, {
                Overlay = v4.createElement("Frame", {
                    Size = UDim2.new(1, 0, 1, 0), 
                    BorderSizePixel = 0, 
                    BackgroundTransparency = 1
                }, {
                    Content = v40
                })
            });
        end);
    end);
end;
v27 = l_RoactServices_0.connect({
    eventIngest = v18, 
    networking = v19
})(v27);
v27 = v6.connect(function(v41, _) --[[ Line: 176 ]]
    -- upvalues: v15 (copy)
    return {
        screenSize = v41.ScreenSize, 
        pageName = v15(v41)
    };
end, function(v43) --[[ Line: 181 ]]
    -- upvalues: v9 (copy), v10 (copy), v11 (copy), l_FFlagLuaAppEdpBackendV2HydrateLegacyIxp_0 (copy)
    return {
        navigateDown = function(v44) --[[ Line: 183 ]] --[[ Name: navigateDown ]]
            -- upvalues: v43 (copy), v9 (ref)
            return v43(v9(v44));
        end, 
        navigateBack = function() --[[ Line: 186 ]] --[[ Name: navigateBack ]]
            -- upvalues: v43 (copy), v10 (ref)
            return v43(v10());
        end, 
        dispatchFetchGameDetailsPageData = function(v45, v46, v47, v48) --[[ Line: 189 ]] --[[ Name: dispatchFetchGameDetailsPageData ]]
            -- upvalues: v43 (copy), v11 (ref), l_FFlagLuaAppEdpBackendV2HydrateLegacyIxp_0 (ref)
            return v43(v11(v45, v46, v47, if l_FFlagLuaAppEdpBackendV2HydrateLegacyIxp_0 then v48 else nil));
        end
    };
end)(v27);
if l_FFlagLuaAppEdpBackendV2HydrateLegacyIxp_0 then
    local l_v27_0 = v27;
    local l_l_v27_0_0 = l_v27_0 --[[ copy: 28 -> 29 ]];
    v27 = function(v51) --[[ Line: 204 ]]
        -- upvalues: v7 (copy), v5 (copy), l_IXPService_0 (copy), l_AppUserLayers_0 (copy), v4 (copy), l_l_v27_0_0 (copy), v8 (copy)
        local v52 = v7.getShouldHydrateLegacy();
        v5.useEffect(function() --[[ Line: 207 ]]
            -- upvalues: l_IXPService_0 (ref), l_AppUserLayers_0 (ref)
            l_IXPService_0:LogUserLayerExposure(l_AppUserLayers_0.ExperienceDetailsPageExposureLayer);
        end, {});
        return v4.createElement(l_l_v27_0_0, v8.Dictionary.join(v51, {
            shouldHydrateLegacyIxp = v52
        }));
    end;
end;
local l_v27_1 = v27;
return function(v54) --[[ Line: 222 ]]
    -- upvalues: l_useAppPolicy_0 (copy), v8 (copy), v4 (copy), l_v27_1 (copy)
    local v56 = l_useAppPolicy_0(function(v55) --[[ Line: 223 ]]
        return v55.getWebViewSupport();
    end);
    local v57 = v8.Dictionary.join(v54, {
        areWebviewsSupported = v56
    });
    return v4.createElement(l_v27_1, v57);
end;