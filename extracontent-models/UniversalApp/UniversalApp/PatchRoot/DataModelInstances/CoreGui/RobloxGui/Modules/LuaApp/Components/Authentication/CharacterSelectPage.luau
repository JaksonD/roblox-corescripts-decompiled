local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.Packages.Roact);
local v3 = require(l_CorePackages_0.Packages.RoactRodux);
local v4 = require(l_Modules_0.LuaApp.Services.RoactAnalyticsAuthEvents);
local l_RoactServices_0 = require(l_CorePackages_0.Workspace.Packages.RoactServices).RoactServices;
local v6 = require(l_Modules_0.LuaApp.Services.RoactNetworking);
local v7 = require(l_Modules_0.LuaApp.AppPage);
local v8 = require(l_Modules_0.LuaApp.Thunks.NavigateDown);
local v9 = require(l_Modules_0.Common.memoize);
local v10 = require(l_CorePackages_0.Packages.UIBlox);
local l_withStyle_0 = v10.Style.withStyle;
local v12 = require(l_Modules_0.LuaApp.withLocalization);
local l_SpringAnimatedItem_0 = v10.Utility.SpringAnimatedItem;
local l_LoadingStateContainer_0 = v10.App.Container.LoadingStateContainer;
local l_RetrievalStatus_0 = v10.App.Loading.Enum.RetrievalStatus;
local l_RetrievalStatus_1 = require(l_CorePackages_0.Workspace.Packages.Http).Enum.RetrievalStatus;
local l_FormFactor_0 = require(l_CorePackages_0.Workspace.Packages.FormFactor).Enums.FormFactor;
local v18 = require(l_Modules_0.LuaApp.FitChildren);
local v19 = require(l_Modules_0.LuaApp.Components.Generic.ItemListLayout);
local v20 = require(l_Modules_0.LuaApp.Components.Authentication.AuthBackAndNextButton);
local v21 = require(l_Modules_0.LuaApp.Components.FullscreenPageWithSafeArea);
local v22 = require(l_Modules_0.LuaApp.Components.Authentication.TitleAndParagraph);
local v23 = require(l_Modules_0.LuaApp.Components.Authentication.CharacterSelector);
local v24 = require(l_Modules_0.LuaApp.Thunks.Authentication.FetchSignUpBundles);
local v25 = require(l_Modules_0.LuaApp.Thunks.SetNetworkingErrorToast);
local v26 = require(l_Modules_0.LuaApp.Actions.Authentication.SetSignUpSelectedBundleId);
local v27 = require(l_Modules_0.LuaApp.Thunks.Authentication.SignUpRedirectToLandingPage);
local v28 = require(l_Modules_0.LuaApp.EventStreamConstants);
local v29 = v2.PureComponent:extend("CharacterSelectPage");
v29.init = function(v30) --[[ Line: 72 ]] --[[ Name: init ]]
    -- upvalues: v28 (copy), v2 (copy), v23 (copy)
    v30.state = {
        containerSize = Vector2.new(0, 0), 
        headerSize = Vector2.new(0, 0), 
        selectedBundleId = nil
    };
    v30.isMounted = false;
    v30.updateStateWithNewAbsoluteSize = function(v31, v32) --[[ Line: 86 ]]
        -- upvalues: v30 (copy)
        if v32.X > 0 and v32.Y > 0 then
            spawn(function() --[[ Line: 90 ]]
                -- upvalues: v30 (ref), v31 (copy), v32 (copy)
                if v30.isMounted then
                    v30:setState({
                        [v31] = v32
                    });
                end;
            end);
        end;
    end;
    v30.onAbsoluteSizeChange = function(v33) --[[ Line: 100 ]]
        -- upvalues: v30 (copy)
        v30.updateStateWithNewAbsoluteSize("containerSize", v33.AbsoluteSize);
    end;
    v30.onHeaderAbsoluteSizeChange = function(v34) --[[ Line: 104 ]]
        -- upvalues: v30 (copy)
        v30.updateStateWithNewAbsoluteSize("headerSize", v34.AbsoluteContentSize);
    end;
    v30.onSelectedCharacterChanged = function(v35) --[[ Line: 113 ]]
        -- upvalues: v30 (copy), v28 (ref)
        if v30.state.selectedBundleId ~= v35 then
            local v36 = "bundleId=" .. v35;
            v30.props.authAnalytics.reportAvatarSelectedButtonClicked(v28.Context.SignupAvatarScreen, v36);
            spawn(function() --[[ Line: 122 ]]
                -- upvalues: v30 (ref), v35 (copy)
                if v30.isMounted then
                    v30:setState({
                        selectedBundleId = v35
                    });
                end;
            end);
        end;
    end;
    v30.onContinueButtonActivated = function() --[[ Line: 137 ]]
        -- upvalues: v30 (copy), v28 (ref)
        if v30.state.selectedBundleId ~= nil then
            v30.props.setSignUpSelectedBundleId(v30.state.selectedBundleId);
            v30.props.authAnalytics.reportContinueButtonClicked(v28.Context.SignupAvatarScreen);
            v30.props.goToNextPage();
        end;
    end;
    v30.renderSelectorLoading = function() --[[ Line: 152 ]]
        return nil;
    end;
    v30.renderOnCharacterSelectorLoaded = function() --[[ Line: 156 ]]
        -- upvalues: v30 (copy), v2 (ref), v23 (ref)
        local v37 = v30.state.headerSize.Y + 56;
        local l_bundleIds_0 = v30.props.bundleIds;
        local l_Y_0 = v30.state.headerSize.Y;
        return v2.createElement("Frame", {
            Size = UDim2.new(1, 0, 1, -v37), 
            AnchorPoint = Vector2.new(0.5, 0), 
            Position = UDim2.new(0.5, 0, 0, l_Y_0), 
            BorderSizePixel = 0, 
            BackgroundTransparency = 1
        }, {
            CharacterSelector = v2.createElement(v23, {
                bundleIds = l_bundleIds_0, 
                onSelectedCharacterChanged = v30.onSelectedCharacterChanged
            })
        });
    end;
    v30.props.authAnalytics.reportScreenLoaded(v28.Context.SignupAvatarScreen);
end;
v29.didMount = function(v40) --[[ Line: 178 ]] --[[ Name: didMount ]]
    -- upvalues: l_RetrievalStatus_1 (copy)
    local l_networking_0 = v40.props.networking;
    local l_fetchSignUpBundles_0 = v40.props.fetchSignUpBundles;
    local l_signUpBundlesFetchStatus_0 = v40.props.signUpBundlesFetchStatus;
    v40.isMounted = true;
    if l_signUpBundlesFetchStatus_0 == l_RetrievalStatus_1.NotStarted or l_signUpBundlesFetchStatus_0 == l_RetrievalStatus_1.Failed then
        l_fetchSignUpBundles_0(l_networking_0);
    end;
end;
v29.didUpdate = function(v44) --[[ Line: 198 ]] --[[ Name: didUpdate ]]
    -- upvalues: l_RetrievalStatus_1 (copy)
    local l_signUpBundlesFetchStatus_1 = v44.props.signUpBundlesFetchStatus;
    local l_setNetworkingErrorToast_0 = v44.props.setNetworkingErrorToast;
    local l_signUpRedirectToLandingPage_0 = v44.props.signUpRedirectToLandingPage;
    if l_signUpBundlesFetchStatus_1 == l_RetrievalStatus_1.Failed then
        l_signUpRedirectToLandingPage_0();
        l_setNetworkingErrorToast_0();
    end;
end;
v29.willUnmount = function(v48) --[[ Line: 214 ]] --[[ Name: willUnmount ]]
    v48.isMounted = false;
end;
v29.render = function(v49) --[[ Line: 218 ]] --[[ Name: render ]]
    -- upvalues: l_FormFactor_0 (copy), l_withStyle_0 (copy), v12 (copy), v2 (copy), v21 (copy), l_SpringAnimatedItem_0 (copy), v19 (copy), v18 (copy), v22 (copy), v20 (copy), l_RetrievalStatus_1 (copy), l_LoadingStateContainer_0 (copy), l_RetrievalStatus_0 (copy)
    local l_formFactor_0 = v49.props.formFactor;
    local l_signUpBundlesFetchStatus_2 = v49.props.signUpBundlesFetchStatus;
    local l_X_0 = v49.state.containerSize.X;
    local l_selectedBundleId_0 = v49.state.selectedBundleId;
    local l_X_1 = v49.state.headerSize.X;
    local v55 = l_formFactor_0 == l_FormFactor_0.WIDE;
    local v56 = 10;
    local v57 = 20;
    local v58 = 5;
    local v59 = 20;
    if v55 then
        v56 = 90;
        v57 = 90;
        v58 = 25;
        v59 = math.max(20, l_X_0 * 0.525 - 400);
    end;
    return l_withStyle_0(function(v60) --[[ Line: 240 ]]
        -- upvalues: v12 (ref), v2 (ref), v21 (ref), l_SpringAnimatedItem_0 (ref), l_selectedBundleId_0 (copy), v49 (copy), v56 (ref), v57 (ref), v59 (ref), v19 (ref), v18 (ref), v58 (ref), v22 (ref), l_X_1 (copy), v55 (copy), v20 (ref), l_signUpBundlesFetchStatus_2 (copy), l_RetrievalStatus_1 (ref), l_LoadingStateContainer_0 (ref), l_RetrievalStatus_0 (ref)
        return v12({
            continueText = "Authentication.SignUp.Label.Continue"
        })(function(v61) --[[ Line: 243 ]]
            -- upvalues: v2 (ref), v21 (ref), v60 (copy), l_SpringAnimatedItem_0 (ref), l_selectedBundleId_0 (ref), v49 (ref), v56 (ref), v57 (ref), v59 (ref), v19 (ref), v18 (ref), v58 (ref), v22 (ref), l_X_1 (ref), v55 (ref), v20 (ref), l_signUpBundlesFetchStatus_2 (ref), l_RetrievalStatus_1 (ref), l_LoadingStateContainer_0 (ref), l_RetrievalStatus_0 (ref)
            return v2.createElement(v21, {
                BackgroundColor3 = v60.Theme.BackgroundDefault.Color, 
                BackgroundTransparency = v60.Theme.BackgroundDefault.Transparency, 
                includeStatusBar = true, 
                renderFullscreenBackground = function() --[[ Line: 248 ]] --[[ Name: renderFullscreenBackground ]]
                    -- upvalues: v2 (ref)
                    return v2.createElement("ImageLabel", {
                        Image = "rbxasset://textures/ui/LuaApp/graphic/Auth/gradient_bg.jpg", 
                        Size = UDim2.new(1, 0, 1, 0), 
                        BorderSizePixel = 0
                    });
                end
            }, {
                FocusVignette = v2.createElement(l_SpringAnimatedItem_0.AnimatedImageLabel, {
                    regularProps = {
                        Image = "rbxasset://textures/ui/LuaApp/graphic/Auth/Vignette.png", 
                        Size = UDim2.new(1, 0, 1, 0), 
                        BorderSizePixel = 0, 
                        BackgroundTransparency = 1, 
                        ZIndex = 2
                    }, 
                    animatedValues = {
                        imageTransparency = l_selectedBundleId_0 and 0.5 or 1
                    }, 
                    mapValuesToProps = function(v62) --[[ Line: 267 ]] --[[ Name: mapValuesToProps ]]
                        return {
                            ImageTransparency = v62.imageTransparency
                        };
                    end, 
                    springOptions = {
                        frequency = 3
                    }
                }), 
                Contents = v2.createElement("Frame", {
                    Size = UDim2.new(1, 0, 1, 0), 
                    BorderSizePixel = 0, 
                    BackgroundTransparency = 1, 
                    [v2.Change.AbsoluteSize] = v49.onAbsoluteSizeChange, 
                    ZIndex = 3
                }, {
                    Padding = v2.createElement("UIPadding", {
                        PaddingTop = UDim.new(0, v56), 
                        PaddingBottom = UDim.new(0, v57)
                    }), 
                    SidePaddedHeaderAndFooter = v2.createElement("Frame", {
                        Size = UDim2.new(1, 0, 1, 0), 
                        BorderSizePixel = 0, 
                        BackgroundTransparency = 1
                    }, {
                        Padding = v2.createElement("UIPadding", {
                            PaddingLeft = UDim.new(0, v59), 
                            PaddingRight = UDim.new(0, v59)
                        }), 
                        Header = v2.createElement(v19, {
                            size = UDim2.new(1, 0, 0, 0), 
                            fitAxis = v18.FitAxis.Height, 
                            Padding = UDim.new(0, v58), 
                            [v2.Change.AbsoluteContentSize] = v49.onHeaderAbsoluteSizeChange, 
                            renderItemList = {
                                v2.createElement(v22, {
                                    titleTextKey = "Authentication.SignUp.Heading.SelectStartingAvatar", 
                                    width = l_X_1, 
                                    maxTitleHeight = 45, 
                                    maxParagraphHeight = 0
                                })
                            }
                        }), 
                        Footer = v2.createElement("Frame", {
                            Size = UDim2.new(1, 0, 0, 56), 
                            AnchorPoint = Vector2.new(0.5, 1), 
                            Position = UDim2.new(0.5, 0, 1, 0), 
                            BorderSizePixel = 0, 
                            BackgroundTransparency = 1
                        }, {
                            SizeConstraint = v55 and v2.createElement("UISizeConstraint", {
                                MaxSize = Vector2.new(360, 1e999)
                            }), 
                            AuthBackAndNextButton = v2.createElement(v20, {
                                size = UDim2.new(1, 0, 0, 36), 
                                anchorPoint = Vector2.new(0.5, 1), 
                                position = UDim2.new(0.5, 0, 1, 0), 
                                nextButtonText = v61.continueText, 
                                nextButtonIsDisabled = not l_selectedBundleId_0, 
                                nextButtonIsLoading = l_signUpBundlesFetchStatus_2 == l_RetrievalStatus_1.Fetching, 
                                nextButtonOnActivated = v49.onContinueButtonActivated
                            })
                        })
                    })
                }), 
                CharacterSelectorAreaWrapper = v2.createElement("Frame", {
                    Size = UDim2.new(1, 0, 1, 0), 
                    BorderSizePixel = 0, 
                    BackgroundTransparency = 1, 
                    ZIndex = 1
                }, {
                    Padding = v2.createElement("UIPadding", {
                        PaddingTop = UDim.new(0, v56), 
                        PaddingBottom = UDim.new(0, v57)
                    }), 
                    CharacterSelectorArea = v2.createElement(l_LoadingStateContainer_0, {
                        dataStatus = l_RetrievalStatus_0.fromRawValue(l_signUpBundlesFetchStatus_2), 
                        renderOnLoaded = v49.renderOnCharacterSelectorLoaded, 
                        renderOnFailed = v49.renderSelectorLoading
                    })
                })
            });
        end);
    end);
end;
local v68 = v9(function(v63, v64) --[[ Line: 353 ]]
    -- upvalues: l_RetrievalStatus_1 (copy)
    local v65 = {};
    if v64 == l_RetrievalStatus_1.Done then
        for _, v67 in ipairs(v63) do
            table.insert(v65, v67.bundleId);
        end;
    end;
    return v65;
end);
v29 = v3.connect(function(v69, _) --[[ Line: 365 ]]
    -- upvalues: v24 (copy), v68 (copy)
    local l_SignUpBundles_0 = v69.SignUpInfo.SignUpBundles;
    local v72 = v24.GetFetchingStatus(v69);
    local v73 = v68(l_SignUpBundles_0, v72);
    return {
        formFactor = v69.FormFactor, 
        signUpBundlesFetchStatus = v72, 
        bundleIds = v73
    };
end, function(v74) --[[ Line: 376 ]]
    -- upvalues: v24 (copy), v27 (copy), v25 (copy), v26 (copy), v8 (copy), v7 (copy)
    return {
        fetchSignUpBundles = function(v75) --[[ Line: 378 ]] --[[ Name: fetchSignUpBundles ]]
            -- upvalues: v74 (copy), v24 (ref)
            return v74(v24.Fetch(v75));
        end, 
        signUpRedirectToLandingPage = function() --[[ Line: 381 ]] --[[ Name: signUpRedirectToLandingPage ]]
            -- upvalues: v74 (copy), v27 (ref)
            v74(v27());
        end, 
        setNetworkingErrorToast = function(_) --[[ Line: 384 ]] --[[ Name: setNetworkingErrorToast ]]
            -- upvalues: v74 (copy), v25 (ref)
            v74(v25({
                HttpError = Enum.HttpError.OK
            }));
        end, 
        setSignUpSelectedBundleId = function(v77) --[[ Line: 387 ]] --[[ Name: setSignUpSelectedBundleId ]]
            -- upvalues: v74 (copy), v26 (ref)
            v74(v26(v77));
        end, 
        goToNextPage = function() --[[ Line: 390 ]] --[[ Name: goToNextPage ]]
            -- upvalues: v74 (copy), v8 (ref), v7 (ref)
            v74(v8({
                name = v7.UsernameSelectionPage
            }));
        end
    };
end)(v29);
return (l_RoactServices_0.connect({
    networking = v6, 
    authAnalytics = v4
})(v29));