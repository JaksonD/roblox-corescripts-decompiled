local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_SocialService_0 = game:GetService("SocialService");
local l_game_EngineFeature_0 = game:GetEngineFeature("DeprecateOldGuiObjectProperties");
local v4 = require(l_CorePackages_0.Packages.React);
local l_PeekView_0 = require(l_CorePackages_0.Workspace.Packages.PeekView).PeekView;
local l_PeekViewState_0 = require(l_CorePackages_0.Workspace.Packages.PeekView).PeekViewState;
local l_Signal_0 = require(l_CorePackages_0.Workspace.Packages.AppCommonLib).Signal;
local l_Sounds_0 = require(l_CorePackages_0.Workspace.Packages.SoundManager).Sounds;
local l_SoundGroups_0 = require(l_CorePackages_0.Workspace.Packages.SoundManager).SoundGroups;
local l_SoundManager_0 = require(l_CorePackages_0.Workspace.Packages.SoundManager).SoundManager;
local l_useIsSpatial_0 = require(l_CorePackages_0.Workspace.Packages.Responsive).useIsSpatial;
local l_RobloxGui_0 = l_CoreGui_0:WaitForChild("RobloxGui");
local v13 = require(l_CorePackages_0.Workspace.Packages.RobloxTranslator);
local l_ContactList_0 = l_RobloxGui_0.Modules.ContactList;
local v15 = require(l_ContactList_0.dependencies);
local l_dependencyArray_0 = v15.Hooks.dependencyArray;
local l_useSelector_0 = v15.Hooks.useSelector;
local l_useDispatch_0 = v15.Hooks.useDispatch;
local l_useStyle_0 = v15.UIBlox.Core.Style.useStyle;
local v20 = require(l_ContactList_0.Analytics.useAnalytics);
local v21 = require(l_ContactList_0.Analytics.EventNamesEnum);
local v22 = require(l_ContactList_0.Components.ContactListHeader);
local v23 = require(l_ContactList_0.Components.CallHistory.CallHistoryContainer);
local v24 = require(l_ContactList_0.Components.FriendList.FriendListContainer);
local v25 = require(l_ContactList_0.Components.ContactListSearchBar);
local v26 = require(l_ContactList_0.Actions.SetCurrentPage);
local v27 = require(l_ContactList_0.Actions.SetCurrentTag);
local v28 = require(l_ContactList_0.Actions.OpenOrUpdateDialog);
local v29 = require(l_ContactList_0.Enums.Pages);
local v30 = require(l_ContactList_0.Parent.TopBar.Constants);
local l_FFlagRemoveDependencyArrayAntipattern_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagRemoveDependencyArrayAntipattern;
local l_LocalPlayer_0 = game:GetService("Players").LocalPlayer;
local l_CurrentCamera_0 = workspace.CurrentCamera;
local v34 = 12 + v30.ApplyDisplayScale(v30.TopBarHeight);
return function() --[[ Line: 68 ]] --[[ Name: ContactListContainer ]]
    -- upvalues: v20 (copy), l_useStyle_0 (copy), l_useDispatch_0 (copy), l_useIsSpatial_0 (copy), v4 (copy), l_CurrentCamera_0 (copy), v34 (copy), l_Signal_0 (copy), l_useSelector_0 (copy), l_SocialService_0 (copy), l_LocalPlayer_0 (copy), v27 (copy), v21 (copy), v29 (copy), v26 (copy), l_SoundManager_0 (copy), l_Sounds_0 (copy), l_SoundGroups_0 (copy), v28 (copy), v13 (copy), l_FFlagRemoveDependencyArrayAntipattern_0 (copy), l_dependencyArray_0 (copy), l_game_EngineFeature_0 (copy), l_PeekViewState_0 (copy), v23 (copy), v24 (copy), v22 (copy), v25 (copy), l_PeekView_0 (copy)
    local v35 = v20();
    local l_Theme_0 = l_useStyle_0().Theme;
    local v37 = l_useDispatch_0();
    local v38 = l_useIsSpatial_0();
    local v39 = v4.useRef(nil);
    local v40, v41 = v4.useState(0);
    local v42, v43 = v4.useState(l_CurrentCamera_0.ViewportSize.X < 640);
    local v44, v45 = v4.useState("");
    local v46, v47 = v4.useState(l_CurrentCamera_0.ViewportSize.Y - v34);
    local v48, v49 = v4.useState(nil);
    local v50 = v4.useRef(l_Signal_0.new());
    local v52 = v4.useCallback(function(v51) --[[ Line: 91 ]]
        return v51.Navigation.currentPage;
    end, {});
    local v53 = l_useSelector_0(v52);
    v4.useEffect(function() --[[ Line: 97 ]]
        -- upvalues: l_SocialService_0 (ref), l_LocalPlayer_0 (ref), v38 (copy), v37 (copy), v27 (ref), v35 (copy), v21 (ref), v53 (copy), v29 (ref), v26 (ref), l_SoundManager_0 (ref), l_Sounds_0 (ref), l_SoundGroups_0 (ref), v28 (ref), v13 (ref), v41 (copy), v40 (copy)
        local v56 = l_SocialService_0.PromptIrisInviteRequested:Connect(function(v54, v55) --[[ Line: 99 ]]
            -- upvalues: l_LocalPlayer_0 (ref), v38 (ref), v37 (ref), v27 (ref), v35 (ref), v21 (ref), v53 (ref), v29 (ref), v26 (ref), l_SoundManager_0 (ref), l_Sounds_0 (ref), l_SoundGroups_0 (ref), v28 (ref), v13 (ref), l_SocialService_0 (ref)
            if l_LocalPlayer_0 and l_LocalPlayer_0.UserId == v54.UserId then
                if not v38 then
                    v37(v27(v55));
                    v35.fireEvent(v21.PhoneBookNavigate, {
                        eventTimestampMs = os.time() * 1000, 
                        startingPage = v53, 
                        destinationPage = v29.CallHistory
                    });
                    v37(v26(v29.CallHistory));
                    l_SoundManager_0:PlaySound(l_Sounds_0.Swipe.Name, {
                        Volume = 0.5
                    }, l_SoundGroups_0.Iris);
                    return;
                else
                    v37(v28(v13:FormatByKey("Feature.Call.Error.Label.OhNo"), v13:FormatByKey("Feature.Call.Error.Description.DeviceNotSupported"), function() --[[ Line: 116 ]]
                        -- upvalues: l_SocialService_0 (ref), l_LocalPlayer_0 (ref)
                        l_SocialService_0:InvokeIrisInvitePromptClosed(l_LocalPlayer_0);
                    end));
                end;
            end;
        end);
        local _ = nil;
        local v59 = l_SocialService_0.PhoneBookPromptClosed:Connect(function(v58) --[[ Line: 128 ]]
            -- upvalues: l_LocalPlayer_0 (ref), v35 (ref), v21 (ref), v53 (ref), v37 (ref), v26 (ref), v41 (ref), v40 (ref)
            if l_LocalPlayer_0 and l_LocalPlayer_0.UserId == v58.UserId then
                v35.fireEvent(v21.PhoneBookNavigate, {
                    eventTimestampMs = os.time() * 1000, 
                    startingPage = tostring(v53), 
                    destinationPage = nil
                });
                v37(v26(nil));
                v41(v40 + 1);
            end;
        end);
        return function() --[[ Line: 141 ]]
            -- upvalues: v56 (copy), v59 (copy)
            v56:Disconnect();
            v59:Disconnect();
        end;
    end, if l_FFlagRemoveDependencyArrayAntipattern_0 then {
        v40, 
        v53
    } else l_dependencyArray_0(v40, v53));
    local v60 = v4.useCallback(function() --[[ Line: 151 ]]
        -- upvalues: v42 (copy), v39 (copy), l_SoundManager_0 (ref), l_Sounds_0 (ref), l_SoundGroups_0 (ref), l_game_EngineFeature_0 (ref), v34 (ref), l_SocialService_0 (ref), l_LocalPlayer_0 (ref), v50 (copy)
        if not v42 and v39.current then
            l_SoundManager_0:PlaySound(l_Sounds_0.Swipe.Name, {
                Volume = 0.5
            }, l_SoundGroups_0.Iris);
            pcall(function() --[[ Line: 154 ]]
                -- upvalues: l_game_EngineFeature_0 (ref), v39 (ref), v34 (ref), l_SocialService_0 (ref), l_LocalPlayer_0 (ref)
                if l_game_EngineFeature_0 then
                    v39.current:TweenPositionInternal(UDim2.new(0, -376, 0, v34), Enum.EasingDirection.Out, Enum.EasingStyle.Quad, 0.3, true, function() --[[ Line: 162 ]]
                        -- upvalues: l_SocialService_0 (ref), l_LocalPlayer_0 (ref)
                        l_SocialService_0:InvokeIrisInvitePromptClosed(l_LocalPlayer_0);
                    end);
                    return;
                else
                    v39.current:TweenPosition(UDim2.new(0, -376, 0, v34), Enum.EasingDirection.Out, Enum.EasingStyle.Quad, 0.3, true, function() --[[ Line: 173 ]]
                        -- upvalues: l_SocialService_0 (ref), l_LocalPlayer_0 (ref)
                        l_SocialService_0:InvokeIrisInvitePromptClosed(l_LocalPlayer_0);
                    end);
                    return;
                end;
            end);
            return;
        else
            if v50 and v50.current then
                v50.current:fire();
            end;
            return;
        end;
    end, {
        v42
    });
    local v62 = v4.useCallback(function(v61) --[[ Line: 186 ]]
        -- upvalues: v45 (copy)
        v45(v61);
    end, {});
    v4.useEffect(function() --[[ Line: 191 ]]
        -- upvalues: l_CurrentCamera_0 (ref), v43 (copy), v47 (copy), v34 (ref)
        local v63 = l_CurrentCamera_0:GetPropertyChangedSignal("ViewportSize"):Connect(function() --[[ Line: 192 ]]
            -- upvalues: l_CurrentCamera_0 (ref), v43 (ref), v47 (ref), v34 (ref)
            if l_CurrentCamera_0.ViewportSize.X < 640 then
                v43(true);
            else
                v43(false);
            end;
            v47(l_CurrentCamera_0.ViewportSize.Y - v34);
        end);
        return function() --[[ Line: 202 ]]
            -- upvalues: v63 (copy)
            v63:Disconnect();
        end;
    end, {});
    v4.useEffect(function() --[[ Line: 207 ]]
        -- upvalues: v53 (copy), v42 (copy), v39 (copy), l_game_EngineFeature_0 (ref), v34 (ref), v45 (copy)
        if v53 and not v42 and v39.current then
            pcall(function() --[[ Line: 209 ]]
                -- upvalues: l_game_EngineFeature_0 (ref), v39 (ref), v34 (ref)
                if l_game_EngineFeature_0 then
                    v39.current:TweenPositionInternal(UDim2.new(0, 12, 0, v34), Enum.EasingDirection.In, Enum.EasingStyle.Quad, 0.3, true);
                    return;
                else
                    v39.current:TweenPosition(UDim2.new(0, 12, 0, v34), Enum.EasingDirection.In, Enum.EasingStyle.Quad, 0.3, true);
                    return;
                end;
            end);
        end;
        v45("");
    end, {
        v42, 
        v53
    });
    local v66 = v4.useCallback(function(v64, _) --[[ Line: 234 ]]
        -- upvalues: l_PeekViewState_0 (ref), l_LocalPlayer_0 (ref), l_SocialService_0 (ref), l_SoundManager_0 (ref), l_Sounds_0 (ref), l_SoundGroups_0 (ref), v49 (copy)
        if v64 == l_PeekViewState_0.Closed then
            if l_LocalPlayer_0 then
                l_SocialService_0:InvokeIrisInvitePromptClosed(l_LocalPlayer_0);
            end;
            l_SoundManager_0:PlaySound(l_Sounds_0.Swipe.Name, {
                Volume = 0.5
            }, l_SoundGroups_0.Iris);
        end;
        v49(v64);
    end, {});
    local v67 = v4.useCallback(function() --[[ Line: 246 ]]
        -- upvalues: v35 (copy), v21 (ref), v53 (copy), v29 (ref), v37 (copy), v26 (ref), v49 (copy), l_PeekViewState_0 (ref)
        v35.fireEvent(v21.PhoneBookSearchClicked, {
            eventTimestampMs = os.time() * 1000
        });
        if v53 ~= v29.FriendList then
            v35.fireEvent(v21.PhoneBookNavigate, {
                eventTimestampMs = os.time() * 1000, 
                startingPage = v53, 
                destinationPage = v29.FriendList
            });
        end;
        v37(v26(v29.FriendList));
        v49(l_PeekViewState_0.Full);
    end, {
        v53
    });
    local v69 = v4.useMemo(function() --[[ Line: 261 ]]
        -- upvalues: v53 (copy), v29 (ref), v4 (ref), v23 (ref), v60 (copy), v42 (copy), v48 (copy), l_PeekViewState_0 (ref), v44 (copy), v24 (ref), v46 (copy), v34 (ref), l_Theme_0 (copy), v39 (copy), v22 (ref), v25 (ref), v62 (copy), v67 (copy)
        local v68 = nil;
        if v53 == v29.CallHistory then
            v68 = v4.createElement(v23, {
                dismissCallback = v60, 
                isSmallScreen = v42, 
                scrollingEnabled = not v42 or v48 == l_PeekViewState_0.Full, 
                searchText = v44
            });
        elseif v53 == v29.FriendList then
            v68 = v4.createElement(v24, {
                dismissCallback = v60, 
                isSmallScreen = v42, 
                scrollingEnabled = not v42 or v48 == l_PeekViewState_0.Full, 
                searchText = v44
            });
        end;
        return v4.createElement("ImageButton", {
            Size = if v42 then UDim2.new(1, 0, 0, v46 - 25) else UDim2.new(0, 376, 1, -v34), 
            Position = if v42 then UDim2.new(0, 0, 0, 0) else UDim2.new(0, -376, 0, v34), 
            AutoButtonColor = false, 
            BackgroundColor3 = l_Theme_0.BackgroundDefault.Color, 
            BackgroundTransparency = l_Theme_0.BackgroundDefault.Transparency, 
            BorderSizePixel = 0, 
            ref = v39
        }, {
            UICorner = if v42 then nil else v4.createElement("UICorner", {
                CornerRadius = UDim.new(0, 12)
            }), 
            UIPadding = v4.createElement("UIPadding", {
                PaddingTop = UDim.new(0, 8)
            }), 
            Layout = v4.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Vertical, 
                HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                SortOrder = Enum.SortOrder.LayoutOrder, 
                Padding = UDim.new(0, 8)
            }), 
            Header = v4.createElement(v22, {
                currentPage = v53, 
                headerHeight = 36, 
                layoutOrder = 1, 
                dismissCallback = v60
            }), 
            SearchBar = v4.createElement(v25, {
                layoutOrder = 2, 
                onSearchChanged = v62, 
                searchBarHeight = 36, 
                searchText = v44, 
                onFocused = v67
            }), 
            ContentContainer = v4.createElement("Frame", {
                BackgroundTransparency = 1, 
                LayoutOrder = 3, 
                Size = UDim2.new(1, 0, 1, -88)
            }, v68)
        });
    end, if l_FFlagRemoveDependencyArrayAntipattern_0 then {
        v46, 
        v53, 
        v60, 
        v48, 
        v42, 
        v44
    } else l_dependencyArray_0(v46, v53, v60, v48, v42, v44));
    local v70 = {};
    if v42 then
        v70["ContactListContent" .. tostring(v40)] = v4.createElement("Frame", {
            Size = UDim2.new(1, 0, 1, -v34), 
            Position = UDim2.fromOffset(0, v34), 
            BackgroundTransparency = 1
        }, {
            v4.createElement(l_PeekView_0, {
                briefViewContentHeight = UDim.new(0.6, 0), 
                canDragFullViewToBrief = true, 
                closeSignal = v50.current, 
                elasticBehavior = Enum.ElasticBehavior.Never, 
                peekViewState = v48, 
                viewStateChanged = v66
            }, {
                Content = v69
            })
        });
    else
        v70.ContactListContent = v69;
    end;
    if v53 then
        return (v4.createElement("TextButton", {
            Size = UDim2.fromScale(1, 1), 
            BackgroundTransparency = 1, 
            Text = "", 
            [v4.Event.Activated] = function() --[[ Line: 374 ]]
                -- upvalues: v60 (copy)
                v60();
            end
        }, v70));
    else
        return nil;
    end;
end;