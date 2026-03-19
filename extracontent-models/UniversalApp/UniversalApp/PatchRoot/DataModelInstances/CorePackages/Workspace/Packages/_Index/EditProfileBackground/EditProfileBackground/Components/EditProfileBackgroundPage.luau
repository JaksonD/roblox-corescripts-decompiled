local l_script_FirstAncestor_0 = script:FindFirstAncestor("EditProfileBackground");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local l_useNavigation_0 = require(l_Parent_0.Navigation).useNavigation;
local v4 = require(l_script_FirstAncestor_0.Components.editProfileBackgroundTopBar);
local l_useScreenSize_0 = require(l_Parent_0.RobloxAppHooks).useScreenSize;
local l_useLocalUserId_0 = require(l_Parent_0.RobloxAppHooks).useLocalUserId;
local v7 = require(l_script_FirstAncestor_0.Components.SelectionCarousel);
local v8 = require(l_script_FirstAncestor_0.Components.DisplayBackground);
local v9 = require(l_script_FirstAncestor_0.Networking.ProfileCustomizationNetworking);
local l_useDispatch_0 = require(l_Parent_0.RoactUtils).Hooks.RoactRodux.useDispatch;
local l_useSelector_0 = require(l_Parent_0.RoactUtils).Hooks.RoactRodux.useSelector;
local l_useEffectOnMount_0 = require(l_Parent_0.RoactUtils).Hooks.useEffectOnMount;
local l_View_0 = require(l_Parent_0.Foundation).View;
local v14 = require(l_Parent_0.SocialToast);
local v15 = require(l_script_FirstAncestor_0.Common.ErrorHandling);
local v16 = require(l_script_FirstAncestor_0.Common.Constants);
local v17 = require(l_Parent_0.FocusNavigationUtils);
local l_FocusNavigableSurfaceWrapper_0 = v17.FocusNavigableSurfaceWrapper;
local l_FocusNavigableSurfaceIdentifierEnum_0 = v17.FocusNavigableSurfaceIdentifierEnum;
local l_FocusNavigationEventNameEnum_0 = v17.FocusNavigationEventNameEnum;
local v21 = require(l_Parent_0.InputHandlers);
local v22 = require(l_Parent_0.Cryo);
local v23 = require(l_script_FirstAncestor_0.Analytics);
local l_useAnalytics_0 = v23.useAnalytics;
local l_EventNames_0 = v23.EventNames;
local l_ErrorTypes_0 = v23.ErrorTypes;
local v27 = v16.BACKGROUND_ASSET_IDS[1];
local l_DEFAULT_ERROR_MESSAGES_0 = v15.DEFAULT_ERROR_MESSAGES;
local l_InsertService_0 = game:GetService("InsertService");
local _ = function(v30) --[[ Line: 52 ]] --[[ Name: preloadBackgroundAssets ]]
    -- upvalues: v22 (copy), v16 (copy), v27 (copy), l_InsertService_0 (copy), l_EventNames_0 (copy), l_ErrorTypes_0 (copy)
    task.spawn(function() --[[ Line: 53 ]]
        -- upvalues: v22 (ref), v16 (ref), v27 (ref), l_InsertService_0 (ref), v30 (copy), l_EventNames_0 (ref), l_ErrorTypes_0 (ref)
        local v32 = v22.Dictionary.join(v16.DEFAULT_BACKGROUND_ASSET_IDS, v22.List.filter(v16.BACKGROUND_ASSET_IDS, function(v31) --[[ Line: 57 ]]
            -- upvalues: v27 (ref)
            return v31 ~= v27;
        end));
        for _, v34 in ipairs(v32) do
            local l_status_0, l_result_0 = pcall(function() --[[ Line: 63 ]]
                -- upvalues: l_InsertService_0 (ref), v34 (copy)
                return l_InsertService_0:LoadAsset(v34);
            end);
            if l_status_0 and l_result_0 then
                l_result_0:Destroy();
            else
                v30.fireAnalyticsEvent(l_EventNames_0.EditProfileBackgroundFailure, {
                    errorType = l_ErrorTypes_0.AssetPreloadFailed
                });
            end;
        end;
    end);
end;
return function(v38) --[[ Line: 84 ]] --[[ Name: EditProfileBackgroundPage ]]
    -- upvalues: l_useScreenSize_0 (copy), l_useLocalUserId_0 (copy), l_useDispatch_0 (copy), v14 (copy), l_useAnalytics_0 (copy), l_useSelector_0 (copy), l_useEffectOnMount_0 (copy), l_EventNames_0 (copy), v22 (copy), v16 (copy), v27 (copy), l_InsertService_0 (copy), l_ErrorTypes_0 (copy), v2 (copy), l_useNavigation_0 (copy), v9 (copy), l_DEFAULT_ERROR_MESSAGES_0 (copy), l_FocusNavigableSurfaceWrapper_0 (copy), l_FocusNavigableSurfaceIdentifierEnum_0 (copy), l_FocusNavigationEventNameEnum_0 (copy), v21 (copy), l_View_0 (copy), v4 (copy), v8 (copy), v7 (copy)
    local v39 = l_useScreenSize_0();
    local v40 = l_useLocalUserId_0();
    local v41 = l_useDispatch_0();
    local v42 = v14.useOpenToast();
    local v43 = l_useAnalytics_0();
    local v45 = l_useSelector_0(function(v44) --[[ Line: 92 ]]
        if v44.GlobalGuiInset then
            return v44.GlobalGuiInset.bottom + 5;
        else
            return 0;
        end;
    end);
    l_useEffectOnMount_0(function() --[[ Line: 96 ]]
        -- upvalues: v43 (copy), l_EventNames_0 (ref), v22 (ref), v16 (ref), v27 (ref), l_InsertService_0 (ref), l_ErrorTypes_0 (ref)
        v43.fireAnalyticsEvent(l_EventNames_0.EditProfileBackgroundOpened);
        local v46 = tick();
        local l_v43_0 = v43;
        task.spawn(function() --[[ Line: 53 ]]
            -- upvalues: v22 (ref), v16 (ref), v27 (ref), l_InsertService_0 (ref), l_v43_0 (copy), l_EventNames_0 (ref), l_ErrorTypes_0 (ref)
            local v49 = v22.Dictionary.join(v16.DEFAULT_BACKGROUND_ASSET_IDS, v22.List.filter(v16.BACKGROUND_ASSET_IDS, function(v48) --[[ Line: 57 ]]
                -- upvalues: v27 (ref)
                return v48 ~= v27;
            end));
            for _, v51 in ipairs(v49) do
                local l_status_1, l_result_1 = pcall(function() --[[ Line: 63 ]]
                    -- upvalues: l_InsertService_0 (ref), v51 (copy)
                    return l_InsertService_0:LoadAsset(v51);
                end);
                if l_status_1 and l_result_1 then
                    l_result_1:Destroy();
                else
                    l_v43_0.fireAnalyticsEvent(l_EventNames_0.EditProfileBackgroundFailure, {
                        errorType = l_ErrorTypes_0.AssetPreloadFailed
                    });
                end;
            end;
        end);
        local v54 = tick() - v46;
        v43.fireAnalyticsEvent(l_EventNames_0.EditProfileBackgroundLoadingStage, {
            statValue = v54, 
            status = "loaded"
        });
    end);
    local v55 = if v38.profileBackgroundData and v38.profileBackgroundData.assetId then v38.profileBackgroundData.assetId else v27;
    local v56, v57 = v2.useState(nil);
    local v58 = v56 or v55;
    local v66 = v2.useMemo(function() --[[ Line: 121 ]]
        -- upvalues: v39 (copy), v45 (copy)
        local v59 = math.min(640, v39.X);
        local v60 = v59 >= 540 and 8 or 4;
        local v61 = math.ceil(8 / v60);
        local v62 = (v59 - 32 - (v60 - 1) * 16) / v60;
        local v63 = v61 * v62 + (v61 + 1) * 16;
        local v64 = v39.Y - 48 - 40 - 24 - v45;
        local v65 = v64 - v63;
        return {
            width = v59, 
            buttonSize = v62, 
            carouselHeight = v63, 
            contentAreaHeight = v64, 
            displayBackgroundHeight = v65, 
            buttonsPerRow = v60, 
            numRows = v61
        };
    end, {
        v39, 
        v45
    });
    local v67 = l_useNavigation_0();
    local function v68() --[[ Line: 143 ]] --[[ Name: onClose ]]
        -- upvalues: v38 (copy), v67 (copy)
        if v38.onBackgroundChanged then
            v38.onBackgroundChanged();
        end;
        v67.goBack();
    end;
    local function v73(v69) --[[ Line: 151 ]] --[[ Name: onBackgroundSelected ]]
        -- upvalues: v43 (copy), l_EventNames_0 (ref), v57 (copy), v40 (copy), v41 (copy), v9 (ref), v38 (copy), l_ErrorTypes_0 (ref), v42 (copy), l_DEFAULT_ERROR_MESSAGES_0 (ref)
        v43.fireAnalyticsEvent(l_EventNames_0.BackgroundSelected, {
            backgroundId = v69
        });
        v57(v69);
        task.spawn(function() --[[ Line: 158 ]]
            -- upvalues: v40 (ref), v69 (copy), v41 (ref), v9 (ref), v38 (ref), v43 (ref), l_EventNames_0 (ref), l_ErrorTypes_0 (ref), v42 (ref), l_DEFAULT_ERROR_MESSAGES_0 (ref)
            local v70 = {
                profileEntity = {
                    id = tostring(v40), 
                    type = "User"
                }, 
                customizedComponents = {
                    profileBackground = {
                        assetId = v69
                    }
                }
            };
            v41(v9.UpdateProfileCustomization.API(v70)):andThen(function(_) --[[ Line: 172 ]]
                -- upvalues: v38 (ref)
                if v38.onBackgroundChanged then
                    v38.onBackgroundChanged();
                end;
            end):catch(function(v72) --[[ Line: 177 ]]
                -- upvalues: v43 (ref), l_EventNames_0 (ref), l_ErrorTypes_0 (ref), v42 (ref), l_DEFAULT_ERROR_MESSAGES_0 (ref)
                v43.fireAnalyticsEvent(l_EventNames_0.EditProfileBackgroundFailure, {
                    errorType = l_ErrorTypes_0.BackgroundSaveFailed, 
                    errorCode = tostring(v72 and v72.StatusCode or "unknown")
                });
                v42({
                    toastTitle = l_DEFAULT_ERROR_MESSAGES_0.SAVE_BACKGROUND, 
                    iconImage = {
                        Image = "icons/actions/error"
                    }
                });
            end);
        end);
    end;
    return v2.createElement(l_FocusNavigableSurfaceWrapper_0, {
        surfaceIdentifier = l_FocusNavigableSurfaceIdentifierEnum_0.PopUp, 
        isIsolated = true, 
        customEventHandlers = {
            [l_FocusNavigationEventNameEnum_0.NavigateBack] = {
                handler = v21.onRelease(function(v74) --[[ Line: 197 ]]
                    -- upvalues: v38 (copy), v67 (copy)
                    if v38.onBackgroundChanged then
                        v38.onBackgroundChanged();
                    end;
                    v67.goBack();
                    v74:cancel();
                end)
            }
        }
    }, {
        v2.createElement(l_View_0, {
            tag = "size-full bg-surface-0 anchor-top-right position-top-right"
        }, {
            SizeConstraint = v2.createElement("UISizeConstraint", {
                MaxSize = Vector2.new(640, 1e999)
            }), 
            Layout = v2.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Vertical, 
                HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                SortOrder = Enum.SortOrder.LayoutOrder, 
                Padding = UDim.new(0, 24)
            }), 
            TopPadding = v2.createElement(l_View_0, {
                tag = "size-full-500"
            }), 
            TopBar = v2.createElement(v4, {
                layoutOrder = 1, 
                onClose = v68
            }), 
            ContentArea = v2.createElement(l_View_0, {
                Size = UDim2.new(1, 0, 0, v66.contentAreaHeight), 
                LayoutOrder = 2
            }, {
                Layout = v2.createElement("UIListLayout", {
                    FillDirection = Enum.FillDirection.Vertical, 
                    HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                    SortOrder = Enum.SortOrder.LayoutOrder, 
                    Padding = UDim.new(0, 0)
                }), 
                BackgroundDisplay = v2.createElement(v8, {
                    LayoutOrder = 1, 
                    height = v66.displayBackgroundHeight, 
                    currentBackgroundId = v58, 
                    userId = tonumber(v40), 
                    analytics = v43
                }), 
                SelectionCarousel = v2.createElement(v7, {
                    LayoutOrder = 2, 
                    height = v66.carouselHeight, 
                    width = v66.width, 
                    buttonSize = v66.buttonSize, 
                    buttonsPerRow = v66.buttonsPerRow, 
                    numRows = v66.numRows, 
                    onBackgroundSelected = v73, 
                    currentBackgroundId = v58
                })
            })
        })
    });
end;