local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_HttpService_0 = game:GetService("HttpService");
local v3 = require(l_Modules_0.LuaApp.Components.FullscreenPageWithSafeArea);
local v4 = require(l_Modules_0.LuaApp.Components.Authentication.CustomizedInviteLandingPageBackground);
local v5 = require(l_CorePackages_0.Packages.React);
local l_useRoactService_0 = require(l_CorePackages_0.Workspace.Packages.RobloxAppHooks).useRoactService;
local l_RoactNetworking_0 = require(l_CorePackages_0.Workspace.Packages.RoactServiceTags).RoactNetworking;
local l_getSafeAreaSize_0 = require(l_CorePackages_0.Workspace.Packages.InputUi).getSafeAreaSize;
local l_useLocalization_0 = require(l_CorePackages_0.Workspace.Packages.Localization).Hooks.useLocalization;
local v10 = require(l_CorePackages_0.Workspace.Packages.AuthCommon);
local l_FetchGameMedia_0 = v10.Thunks.FetchGameMedia;
local l_GetUserById_0 = v10.Thunks.GetUserById;
local v13 = require(l_CorePackages_0.Packages.Foundation);
local l_Text_0 = v13.Text;
local l_useTokens_0 = v13.Hooks.useTokens;
local l_LandingPageConstants_0 = require(l_CorePackages_0.Workspace.Packages.LandingPage).Constants.LandingPageConstants;
local l_Common_0 = l_LandingPageConstants_0.Common;
local l_CustomizedLandingPage_0 = l_LandingPageConstants_0.CustomizedLandingPage;
local l_getStandardSizeAvatarHeadShotRbxthumb_0 = require(l_CorePackages_0.Workspace.Packages.UserLib).Utils.getStandardSizeAvatarHeadShotRbxthumb;
local v20 = require(l_CorePackages_0.Packages.UIBlox);
local l_LoadableImage_0 = v20.App.Loading.LoadableImage;
local l_Colors_0 = v20.App.Style.Colors;
local v23 = require(l_CorePackages_0.Workspace.Packages.AuthAnalytics);
local l_EventStreamConstants_0 = v23.EventStreamConstants;
local l_authClientError_0 = v23.Events.authClientError;
local l_authPageload_0 = v23.Events.authPageload;
local l_authTimingUtil_0 = v23.authTimingUtil;
local l_GetGameNameAndDescription_0 = require(l_CorePackages_0.Workspace.Packages.GameDetailRodux).GetGameNameAndDescription;
local l_GameMediaImageType_0 = require(l_CorePackages_0.Workspace.Packages.DiscoveryTypes).GameMediaImageType;
local l_FFlagLuaEnableLandingPageTTIMeasurements_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagLuaEnableLandingPageTTIMeasurements;
local v31 = game:DefineFastFlag("EnableFoundationLogoInCustomizedInviteLandingPage", false);
return function(v32) --[[ Line: 63 ]] --[[ Name: CustomizedInviteLandingPageLayout ]]
    -- upvalues: l_useRoactService_0 (copy), l_RoactNetworking_0 (copy), v5 (copy), l_GetGameNameAndDescription_0 (copy), l_authClientError_0 (copy), l_EventStreamConstants_0 (copy), l_GetUserById_0 (copy), l_Common_0 (copy), l_FetchGameMedia_0 (copy), l_GameMediaImageType_0 (copy), l_LandingPageConstants_0 (copy), l_getSafeAreaSize_0 (copy), l_useLocalization_0 (copy), l_useTokens_0 (copy), v31 (copy), v13 (copy), l_CustomizedLandingPage_0 (copy), l_Colors_0 (copy), l_LoadableImage_0 (copy), l_Text_0 (copy), l_getStandardSizeAvatarHeadShotRbxthumb_0 (copy), l_FFlagLuaEnableLandingPageTTIMeasurements_0 (copy), l_authTimingUtil_0 (copy), l_authPageload_0 (copy), l_HttpService_0 (copy), v3 (copy), v4 (copy)
    local v33 = l_useRoactService_0(l_RoactNetworking_0);
    local v34, v35 = v5.useState(0);
    local v36, v37 = v5.useState(nil);
    local v38, v39 = v5.useState(nil);
    local v40, v41 = v5.useState(nil);
    local v42 = if v32.deepLinkData.universeId and v32.deepLinkData.universeId ~= 0 then tostring(v32.deepLinkData.universeId) else nil;
    local v43 = if v32.deepLinkData.inviterId then tostring(v32.deepLinkData.inviterId) else nil;
    local function v45(v44) --[[ Line: 76 ]]
        -- upvalues: v34 (copy), v35 (copy)
        if v34 ~= v44.AbsoluteSize.Y then
            v35(v44.AbsoluteSize.Y);
        end;
    end;
    local function v50() --[[ Line: 82 ]]
        -- upvalues: v42 (copy), l_GetGameNameAndDescription_0 (ref), v33 (copy), v39 (copy), l_authClientError_0 (ref), l_EventStreamConstants_0 (ref), v43 (copy), l_GetUserById_0 (ref), v41 (copy)
        if v42 then
            l_GetGameNameAndDescription_0(v33, v42):andThen(function(v46) --[[ Line: 85 ]]
                -- upvalues: v39 (ref)
                v39(v46.Name);
            end):catch(function(_) --[[ Line: 87 ]]
                -- upvalues: l_authClientError_0 (ref), l_EventStreamConstants_0 (ref), v42 (ref)
                l_authClientError_0(l_EventStreamConstants_0.Context.LandingScreenCustomizedInvite, l_EventStreamConstants_0.State.FetchGameInfoError, nil, v42);
            end);
        end;
        if v43 then
            l_GetUserById_0(v33, v43):andThen(function(v48) --[[ Line: 98 ]]
                -- upvalues: v41 (ref)
                v41(v48.displayName);
            end):catch(function(_) --[[ Line: 100 ]]
                -- upvalues: l_authClientError_0 (ref), l_EventStreamConstants_0 (ref), v43 (ref)
                l_authClientError_0(l_EventStreamConstants_0.Context.LandingScreenCustomizedInvite, l_EventStreamConstants_0.State.FetchUserInfoError, nil, v43);
            end);
        end;
    end;
    local function v52(v51) --[[ Line: 111 ]]
        -- upvalues: l_Common_0 (ref)
        return string.format(l_Common_0.IMAGE_ASSET_URL_TEMPLATE, v51);
    end;
    local function v56() --[[ Line: 115 ]]
        -- upvalues: v36 (copy), v52 (copy), v32 (copy), l_Common_0 (ref)
        if v36 then
            return v52(v36);
        else
            if (not v32.deepLinkData.universeId or v32.deepLinkData.universeId == 0) and v32.deepLinkData.genre then
                local l_GenreBackgrounds_0 = l_Common_0.GenreBackgrounds;
                local l_genre_0 = v32.deepLinkData.genre;
                local v55 = ({
                    ["trending-in-rpg"] = "RPG", 
                    ["trending-in-simulation"] = "Simulation", 
                    ["trending-in-shooter"] = "Shooter", 
                    ["trending-in-sports-and-racing"] = "SportsAndRacing"
                })[l_genre_0];
                if v55 and l_GenreBackgrounds_0[v55] then
                    return l_GenreBackgrounds_0[v55].IMAGE;
                end;
            end;
            return l_Common_0.DefaultBackground.IMAGE;
        end;
    end;
    v5.useEffect(function() --[[ Line: 142 ]]
        -- upvalues: v42 (copy), l_FetchGameMedia_0 (ref), v33 (copy), l_GameMediaImageType_0 (ref), v37 (copy), l_authClientError_0 (ref), l_EventStreamConstants_0 (ref), v50 (copy)
        if v42 then
            l_FetchGameMedia_0(v33, v42):andThen(function(v57) --[[ Line: 145 ]]
                -- upvalues: l_GameMediaImageType_0 (ref), v37 (ref)
                for _, v59 in ipairs(v57) do
                    if v59.assetTypeId == l_GameMediaImageType_0.Image then
                        v37(v59.imageId);
                        return;
                    end;
                end;
            end):catch(function(_) --[[ Line: 152 ]]
                -- upvalues: l_authClientError_0 (ref), l_EventStreamConstants_0 (ref), v42 (ref)
                l_authClientError_0(l_EventStreamConstants_0.Context.LandingScreenCustomizedInvite, l_EventStreamConstants_0.State.FetchGameMediaError, nil, v42);
            end);
        end;
        v50();
    end, {});
    local l_ContentFocusedStyle_0 = l_LandingPageConstants_0.ContentProps.ContentFocusedStyle;
    local v62 = l_getSafeAreaSize_0(v32.screenSize, v32.globalGuiInset).Y.Offset - v32.statusBarHeight;
    local v63 = v62 * l_ContentFocusedStyle_0.BodyPositionYScale;
    local v64 = v62 * l_ContentFocusedStyle_0.LogoPositionYScale;
    local v65 = l_useLocalization_0({
        invitedBy = if v40 then {
            "Feature.Landing.Label.InvitedBy"; 
            name = v40
        } else nil
    });
    local v66 = l_useTokens_0();
    local v67 = {
        Logo = if v31 then v5.createElement(v13.Image, {
            Position = UDim2.new(0.5, 0, 0, v64), 
            BackgroundTransparency = 1, 
            ScaleType = Enum.ScaleType.Fit, 
            AnchorPoint = Vector2.new(0.5, 0.5), 
            Size = UDim2.new(0.7, 0, 0.7, 0), 
            Image = l_Common_0.RobloxLogo.IMAGE, 
            sizeConstraint = {
                MaxSize = Vector2.new(l_Common_0.RobloxLogo.MAX_WIDTH_SMALL, l_Common_0.RobloxLogo.MAX_WIDTH_SMALL / l_Common_0.RobloxLogo.ASPECT_RATIO)
            }, 
            aspectRatio = l_Common_0.RobloxLogo.ASPECT_RATIO, 
            ZIndex = 1
        }) else v5.createElement("ImageLabel", {
            Position = UDim2.new(0.5, 0, 0, v64), 
            BackgroundTransparency = 1, 
            AnchorPoint = Vector2.new(0.5, 0.5), 
            Size = UDim2.new(0.7, 0, 0.7, 0), 
            Image = l_Common_0.RobloxLogo.IMAGE, 
            ZIndex = 1
        }, {
            UISizeConstraint = v5.createElement("UISizeConstraint", {
                MaxSize = Vector2.new(l_Common_0.RobloxLogo.MAX_WIDTH_SMALL, l_Common_0.RobloxLogo.MAX_WIDTH_SMALL / l_Common_0.RobloxLogo.ASPECT_RATIO)
            }), 
            UIAspectRatioConstraint = v5.createElement("UIAspectRatioConstraint", {
                AspectRatio = l_Common_0.RobloxLogo.ASPECT_RATIO, 
                AspectType = Enum.AspectType.FitWithinMaxSize
            })
        }), 
        ContentContainer = v5.createElement("Frame", {
            Position = UDim2.new(0.5, 0, 0, v63), 
            Size = UDim2.new(1, 0, 1, -v63), 
            AnchorPoint = Vector2.new(0.5, 0), 
            BackgroundTransparency = 1, 
            ZIndex = 2
        }, {
            UIListLayout = v5.createElement("UIListLayout", {
                SortOrder = Enum.SortOrder.LayoutOrder, 
                FillDirection = Enum.FillDirection.Vertical, 
                HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                VerticalAlignment = Enum.VerticalAlignment.Bottom
            }), 
            GameIconFrame = if v42 then v5.createElement("Frame", {
                Size = UDim2.fromOffset(l_CustomizedLandingPage_0.GameIcon.SIZE, l_CustomizedLandingPage_0.GameIcon.SIZE), 
                BorderSizePixel = 0, 
                BackgroundColor3 = l_Colors_0.White, 
                LayoutOrder = 1
            }, {
                UICorner = v5.createElement("UICorner", {
                    CornerRadius = UDim.new(l_CustomizedLandingPage_0.GameIcon.CORNER_RADIUS, 0)
                }), 
                UIListLayout = v5.createElement("UIListLayout", {
                    Padding = UDim.new(0, 10), 
                    SortOrder = Enum.SortOrder.LayoutOrder, 
                    FillDirection = Enum.FillDirection.Vertical, 
                    HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                    VerticalAlignment = Enum.VerticalAlignment.Center
                }), 
                GameIcon = v5.createElement(l_LoadableImage_0, {
                    Size = UDim2.fromOffset(l_CustomizedLandingPage_0.GameIcon.SIZE - l_CustomizedLandingPage_0.GameIcon.PADDING, l_CustomizedLandingPage_0.GameIcon.SIZE - l_CustomizedLandingPage_0.GameIcon.PADDING), 
                    BackgroundTransparency = 1, 
                    Image = string.format(l_CustomizedLandingPage_0.GameIcon.IMAGE_URI_TEMPLATE, v42), 
                    useShimmerAnimationWhileLoading = true, 
                    showFailedStateWhenLoadingFailed = true, 
                    cornerRadius = UDim.new(l_CustomizedLandingPage_0.GameIcon.CORNER_RADIUS, 0), 
                    shouldHandleReloads = true, 
                    LayoutOrder = 1
                })
            }) else nil, 
            GameIconPadding = if v42 then v5.createElement("Frame", {
                Size = UDim2.new(1, 0, 0, 20), 
                BackgroundTransparency = 1, 
                LayoutOrder = 2
            }) else nil, 
            GameTitleText = if v42 and v38 then v5.createElement(l_Text_0, {
                Text = v38, 
                textStyle = v66.Color.Content.Emphasis, 
                fontStyle = v66.Typography.HeadingMedium, 
                Size = UDim2.new(1, -40, 0, 0), 
                AutomaticSize = Enum.AutomaticSize.Y, 
                TextWrapped = true, 
                TextXAlignment = Enum.TextXAlignment.Center, 
                TextYAlignment = Enum.TextYAlignment.Bottom, 
                LayoutOrder = 3
            }) else nil, 
            GameTitlePadding = if v42 then v5.createElement("Frame", {
                Size = UDim2.new(1, 0, 0, 6), 
                BackgroundTransparency = 1, 
                LayoutOrder = 4
            }) else nil, 
            InviterTextFrame = if v40 and v32.deepLinkData.inviterId then v5.createElement("Frame", {
                Size = UDim2.new(1, 0, 0, 0), 
                AutomaticSize = Enum.AutomaticSize.Y, 
                BackgroundTransparency = 1, 
                LayoutOrder = 5
            }, {
                HorizontalLayout = v5.createElement("UIListLayout", {
                    Padding = UDim.new(0, 8), 
                    SortOrder = Enum.SortOrder.LayoutOrder, 
                    FillDirection = Enum.FillDirection.Horizontal, 
                    HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                    VerticalAlignment = Enum.VerticalAlignment.Center
                }), 
                InviterThumbnail = v5.createElement(l_LoadableImage_0, {
                    LayoutOrder = 1, 
                    Size = UDim2.new(0, 24, 0, 24), 
                    Image = l_getStandardSizeAvatarHeadShotRbxthumb_0((tostring(v32.deepLinkData.inviterId))), 
                    useShimmerAnimationWhileLoading = true, 
                    cornerRadius = UDim.new(0.5, 0), 
                    shouldHandleReloads = true
                }), 
                InviterText = v5.createElement(l_Text_0, {
                    LayoutOrder = 2, 
                    Text = v65.invitedBy, 
                    textStyle = v66.Color.Content.Default, 
                    fontStyle = v66.Typography.BodyMedium, 
                    AutomaticSize = Enum.AutomaticSize.XY, 
                    TextWrapped = true, 
                    TextXAlignment = Enum.TextXAlignment.Center
                })
            }) else nil, 
            InviterTextPadding = v5.createElement("Frame", {
                Size = UDim2.new(1, 0, 0, 40), 
                BackgroundTransparency = 1, 
                LayoutOrder = 6
            }), 
            Content = v5.createElement("Frame", {
                Position = l_ContentFocusedStyle_0.Position, 
                Size = UDim2.new(1, 0, 0, 0), 
                AutomaticSize = Enum.AutomaticSize.Y, 
                AnchorPoint = l_ContentFocusedStyle_0.AnchorPoint, 
                BackgroundTransparency = 1, 
                LayoutOrder = 7, 
                [v5.Change.AbsoluteSize] = v45
            }, {
                v32.children
            })
        })
    };
    if l_FFlagLuaEnableLandingPageTTIMeasurements_0 then
        local v68 = l_authTimingUtil_0.landingPageLoadFinish();
        if v68 then
            local v69 = {
                variant = l_EventStreamConstants_0.Context.LandingScreenCustomizedInvite, 
                timing = v68
            };
            l_authPageload_0(l_EventStreamConstants_0.Context.LandingPageRender, l_HttpService_0:JSONEncode(v69));
        end;
    end;
    return v5.createElement(v3, {
        includeStatusBar = true, 
        buttonRef = v32.containerRef, 
        renderFullscreenBackground = function(_) --[[ Line: 360 ]] --[[ Name: renderFullscreenBackground ]]
            -- upvalues: v5 (ref), v4 (ref), v56 (copy)
            return v5.createElement(v4, {
                backgroundImage = v56()
            });
        end
    }, {
        Contents = v5.createElement("Frame", {
            BorderSizePixel = 0, 
            BackgroundTransparency = 1, 
            Size = UDim2.new(1, 0, 1, 0), 
            ZIndex = 2
        }, {
            v67
        })
    });
end;