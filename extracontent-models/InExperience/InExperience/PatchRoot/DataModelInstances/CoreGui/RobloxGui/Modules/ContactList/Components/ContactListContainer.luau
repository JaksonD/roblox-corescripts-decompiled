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
local l_LocalPlayer_0 = game:GetService("Players").LocalPlayer;
local l_CurrentCamera_0 = workspace.CurrentCamera;
local v33 = 12 + v30.ApplyDisplayScale(v30.TopBarHeight);
return function() --[[ Line: 65 ]] --[[ Name: ContactListContainer ]]
    -- upvalues: v20 (copy), l_useStyle_0 (copy), l_useDispatch_0 (copy), l_useIsSpatial_0 (copy), v4 (copy), l_CurrentCamera_0 (copy), v33 (copy), l_Signal_0 (copy), l_useSelector_0 (copy), l_SocialService_0 (copy), l_LocalPlayer_0 (copy), v27 (copy), v21 (copy), v29 (copy), v26 (copy), l_SoundManager_0 (copy), l_Sounds_0 (copy), l_SoundGroups_0 (copy), v28 (copy), v13 (copy), l_dependencyArray_0 (copy), l_game_EngineFeature_0 (copy), l_PeekViewState_0 (copy), v23 (copy), v24 (copy), v22 (copy), v25 (copy), l_PeekView_0 (copy)
    local v34 = v20();
    local l_Theme_0 = l_useStyle_0().Theme;
    local v36 = l_useDispatch_0();
    local v37 = l_useIsSpatial_0();
    local v38 = v4.useRef(nil);
    local v39, v40 = v4.useState(0);
    local v41, v42 = v4.useState(l_CurrentCamera_0.ViewportSize.X < 640);
    local v43, v44 = v4.useState("");
    local v45, v46 = v4.useState(l_CurrentCamera_0.ViewportSize.Y - v33);
    local v47, v48 = v4.useState(nil);
    local v49 = v4.useRef(l_Signal_0.new());
    local v51 = v4.useCallback(function(v50) --[[ Line: 88 ]]
        return v50.Navigation.currentPage;
    end, {});
    local v52 = l_useSelector_0(v51);
    v4.useEffect(function() --[[ Line: 93 ]]
        -- upvalues: l_SocialService_0 (ref), l_LocalPlayer_0 (ref), v37 (copy), v36 (copy), v27 (ref), v34 (copy), v21 (ref), v52 (copy), v29 (ref), v26 (ref), l_SoundManager_0 (ref), l_Sounds_0 (ref), l_SoundGroups_0 (ref), v28 (ref), v13 (ref), v40 (copy), v39 (copy)
        local v55 = l_SocialService_0.PromptIrisInviteRequested:Connect(function(v53, v54) --[[ Line: 95 ]]
            -- upvalues: l_LocalPlayer_0 (ref), v37 (ref), v36 (ref), v27 (ref), v34 (ref), v21 (ref), v52 (ref), v29 (ref), v26 (ref), l_SoundManager_0 (ref), l_Sounds_0 (ref), l_SoundGroups_0 (ref), v28 (ref), v13 (ref), l_SocialService_0 (ref)
            if l_LocalPlayer_0 and l_LocalPlayer_0.UserId == v53.UserId then
                if not v37 then
                    v36(v27(v54));
                    v34.fireEvent(v21.PhoneBookNavigate, {
                        eventTimestampMs = os.time() * 1000, 
                        startingPage = v52, 
                        destinationPage = v29.CallHistory
                    });
                    v36(v26(v29.CallHistory));
                    l_SoundManager_0:PlaySound(l_Sounds_0.Swipe.Name, {
                        Volume = 0.5
                    }, l_SoundGroups_0.Iris);
                    return;
                else
                    v36(v28(v13:FormatByKey("Feature.Call.Error.Label.OhNo"), v13:FormatByKey("Feature.Call.Error.Description.DeviceNotSupported"), function() --[[ Line: 112 ]]
                        -- upvalues: l_SocialService_0 (ref), l_LocalPlayer_0 (ref)
                        l_SocialService_0:InvokeIrisInvitePromptClosed(l_LocalPlayer_0);
                    end));
                end;
            end;
        end);
        local _ = nil;
        local v58 = l_SocialService_0.PhoneBookPromptClosed:Connect(function(v57) --[[ Line: 124 ]]
            -- upvalues: l_LocalPlayer_0 (ref), v34 (ref), v21 (ref), v52 (ref), v36 (ref), v26 (ref), v40 (ref), v39 (ref)
            if l_LocalPlayer_0 and l_LocalPlayer_0.UserId == v57.UserId then
                v34.fireEvent(v21.PhoneBookNavigate, {
                    eventTimestampMs = os.time() * 1000, 
                    startingPage = tostring(v52), 
                    destinationPage = nil
                });
                v36(v26(nil));
                v40(v39 + 1);
            end;
        end);
        return function() --[[ Line: 137 ]]
            -- upvalues: v55 (copy), v58 (copy)
            v55:Disconnect();
            v58:Disconnect();
        end;
    end, l_dependencyArray_0(v39, v52));
    local v59 = v4.useCallback(function() --[[ Line: 143 ]]
        -- upvalues: v41 (copy), v38 (copy), l_SoundManager_0 (ref), l_Sounds_0 (ref), l_SoundGroups_0 (ref), l_game_EngineFeature_0 (ref), v33 (ref), l_SocialService_0 (ref), l_LocalPlayer_0 (ref), v49 (copy)
        if not v41 and v38.current then
            l_SoundManager_0:PlaySound(l_Sounds_0.Swipe.Name, {
                Volume = 0.5
            }, l_SoundGroups_0.Iris);
            pcall(function() --[[ Line: 146 ]]
                -- upvalues: l_game_EngineFeature_0 (ref), v38 (ref), v33 (ref), l_SocialService_0 (ref), l_LocalPlayer_0 (ref)
                if l_game_EngineFeature_0 then
                    v38.current:TweenPositionInternal(UDim2.new(0, -376, 0, v33), Enum.EasingDirection.Out, Enum.EasingStyle.Quad, 0.3, true, function() --[[ Line: 154 ]]
                        -- upvalues: l_SocialService_0 (ref), l_LocalPlayer_0 (ref)
                        l_SocialService_0:InvokeIrisInvitePromptClosed(l_LocalPlayer_0);
                    end);
                    return;
                else
                    v38.current:TweenPosition(UDim2.new(0, -376, 0, v33), Enum.EasingDirection.Out, Enum.EasingStyle.Quad, 0.3, true, function() --[[ Line: 165 ]]
                        -- upvalues: l_SocialService_0 (ref), l_LocalPlayer_0 (ref)
                        l_SocialService_0:InvokeIrisInvitePromptClosed(l_LocalPlayer_0);
                    end);
                    return;
                end;
            end);
            return;
        else
            if v49 and v49.current then
                v49.current:fire();
            end;
            return;
        end;
    end, {
        v41
    });
    local v61 = v4.useCallback(function(v60) --[[ Line: 178 ]]
        -- upvalues: v44 (copy)
        v44(v60);
    end, {});
    v4.useEffect(function() --[[ Line: 183 ]]
        -- upvalues: l_CurrentCamera_0 (ref), v42 (copy), v46 (copy), v33 (ref)
        local v62 = l_CurrentCamera_0:GetPropertyChangedSignal("ViewportSize"):Connect(function() --[[ Line: 184 ]]
            -- upvalues: l_CurrentCamera_0 (ref), v42 (ref), v46 (ref), v33 (ref)
            if l_CurrentCamera_0.ViewportSize.X < 640 then
                v42(true);
            else
                v42(false);
            end;
            v46(l_CurrentCamera_0.ViewportSize.Y - v33);
        end);
        return function() --[[ Line: 194 ]]
            -- upvalues: v62 (copy)
            v62:Disconnect();
        end;
    end, {});
    v4.useEffect(function() --[[ Line: 199 ]]
        -- upvalues: v52 (copy), v41 (copy), v38 (copy), l_game_EngineFeature_0 (ref), v33 (ref), v44 (copy)
        if v52 and not v41 and v38.current then
            pcall(function() --[[ Line: 201 ]]
                -- upvalues: l_game_EngineFeature_0 (ref), v38 (ref), v33 (ref)
                if l_game_EngineFeature_0 then
                    v38.current:TweenPositionInternal(UDim2.new(0, 12, 0, v33), Enum.EasingDirection.In, Enum.EasingStyle.Quad, 0.3, true);
                    return;
                else
                    v38.current:TweenPosition(UDim2.new(0, 12, 0, v33), Enum.EasingDirection.In, Enum.EasingStyle.Quad, 0.3, true);
                    return;
                end;
            end);
        end;
        v44("");
    end, {
        v41, 
        v52
    });
    local v65 = v4.useCallback(function(v63, _) --[[ Line: 226 ]]
        -- upvalues: l_PeekViewState_0 (ref), l_LocalPlayer_0 (ref), l_SocialService_0 (ref), l_SoundManager_0 (ref), l_Sounds_0 (ref), l_SoundGroups_0 (ref), v48 (copy)
        if v63 == l_PeekViewState_0.Closed then
            if l_LocalPlayer_0 then
                l_SocialService_0:InvokeIrisInvitePromptClosed(l_LocalPlayer_0);
            end;
            l_SoundManager_0:PlaySound(l_Sounds_0.Swipe.Name, {
                Volume = 0.5
            }, l_SoundGroups_0.Iris);
        end;
        v48(v63);
    end, {});
    local v66 = v4.useCallback(function() --[[ Line: 238 ]]
        -- upvalues: v34 (copy), v21 (ref), v52 (copy), v29 (ref), v36 (copy), v26 (ref), v48 (copy), l_PeekViewState_0 (ref)
        v34.fireEvent(v21.PhoneBookSearchClicked, {
            eventTimestampMs = os.time() * 1000
        });
        if v52 ~= v29.FriendList then
            v34.fireEvent(v21.PhoneBookNavigate, {
                eventTimestampMs = os.time() * 1000, 
                startingPage = v52, 
                destinationPage = v29.FriendList
            });
        end;
        v36(v26(v29.FriendList));
        v48(l_PeekViewState_0.Full);
    end, {
        v52
    });
    local v68 = v4.useMemo(function() --[[ Line: 253 ]]
        -- upvalues: v52 (copy), v29 (ref), v4 (ref), v23 (ref), v59 (copy), v41 (copy), v47 (copy), l_PeekViewState_0 (ref), v43 (copy), v24 (ref), v45 (copy), v33 (ref), l_Theme_0 (copy), v38 (copy), v22 (ref), v25 (ref), v61 (copy), v66 (copy)
        local v67 = nil;
        if v52 == v29.CallHistory then
            v67 = v4.createElement(v23, {
                dismissCallback = v59, 
                isSmallScreen = v41, 
                scrollingEnabled = not v41 or v47 == l_PeekViewState_0.Full, 
                searchText = v43
            });
        elseif v52 == v29.FriendList then
            v67 = v4.createElement(v24, {
                dismissCallback = v59, 
                isSmallScreen = v41, 
                scrollingEnabled = not v41 or v47 == l_PeekViewState_0.Full, 
                searchText = v43
            });
        end;
        return v4.createElement("ImageButton", {
            Size = if v41 then UDim2.new(1, 0, 0, v45 - 25) else UDim2.new(0, 376, 1, -v33), 
            Position = if v41 then UDim2.new(0, 0, 0, 0) else UDim2.new(0, -376, 0, v33), 
            AutoButtonColor = false, 
            BackgroundColor3 = l_Theme_0.BackgroundDefault.Color, 
            BackgroundTransparency = l_Theme_0.BackgroundDefault.Transparency, 
            BorderSizePixel = 0, 
            ref = v38
        }, {
            UICorner = if v41 then nil else v4.createElement("UICorner", {
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
                currentPage = v52, 
                headerHeight = 36, 
                layoutOrder = 1, 
                dismissCallback = v59
            }), 
            SearchBar = v4.createElement(v25, {
                layoutOrder = 2, 
                onSearchChanged = v61, 
                searchBarHeight = 36, 
                searchText = v43, 
                onFocused = v66
            }), 
            ContentContainer = v4.createElement("Frame", {
                BackgroundTransparency = 1, 
                LayoutOrder = 3, 
                Size = UDim2.new(1, 0, 1, -88)
            }, v67)
        });
    end, l_dependencyArray_0(v45, v52, v59, v47, v41, v43));
    local v69 = {};
    if v41 then
        v69["ContactListContent" .. tostring(v39)] = v4.createElement("Frame", {
            Size = UDim2.new(1, 0, 1, -v33), 
            Position = UDim2.fromOffset(0, v33), 
            BackgroundTransparency = 1
        }, {
            v4.createElement(l_PeekView_0, {
                briefViewContentHeight = UDim.new(0.6, 0), 
                canDragFullViewToBrief = true, 
                closeSignal = v49.current, 
                elasticBehavior = Enum.ElasticBehavior.Never, 
                peekViewState = v47, 
                viewStateChanged = v65
            }, {
                Content = v68
            })
        });
    else
        v69.ContactListContent = v68;
    end;
    if v52 then
        return (v4.createElement("TextButton", {
            Size = UDim2.fromScale(1, 1), 
            BackgroundTransparency = 1, 
            Text = "", 
            [v4.Event.Activated] = function() --[[ Line: 357 ]]
                -- upvalues: v59 (copy)
                v59();
            end
        }, v69));
    else
        return nil;
    end;
end;