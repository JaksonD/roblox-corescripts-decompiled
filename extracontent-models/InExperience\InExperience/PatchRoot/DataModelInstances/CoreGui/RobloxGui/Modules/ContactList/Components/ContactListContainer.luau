local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_SocialService_0 = game:GetService("SocialService");
local v3 = require(l_CorePackages_0.Packages.React);
local l_PeekView_0 = require(l_CorePackages_0.Workspace.Packages.PeekView).PeekView;
local l_PeekViewState_0 = require(l_CorePackages_0.Workspace.Packages.PeekView).PeekViewState;
local l_Signal_0 = require(l_CorePackages_0.Workspace.Packages.AppCommonLib).Signal;
local l_Sounds_0 = require(l_CorePackages_0.Workspace.Packages.SoundManager).Sounds;
local l_SoundGroups_0 = require(l_CorePackages_0.Workspace.Packages.SoundManager).SoundGroups;
local l_SoundManager_0 = require(l_CorePackages_0.Workspace.Packages.SoundManager).SoundManager;
local l_useIsSpatial_0 = require(l_CorePackages_0.Workspace.Packages.Responsive).useIsSpatial;
local l_RobloxGui_0 = l_CoreGui_0:WaitForChild("RobloxGui");
local v12 = require(l_CorePackages_0.Workspace.Packages.RobloxTranslator);
local l_ContactList_0 = l_RobloxGui_0.Modules.ContactList;
local v14 = require(l_ContactList_0.dependencies);
local l_dependencyArray_0 = v14.Hooks.dependencyArray;
local l_useSelector_0 = v14.Hooks.useSelector;
local l_useDispatch_0 = v14.Hooks.useDispatch;
local l_useStyle_0 = v14.UIBlox.Core.Style.useStyle;
local v19 = require(l_ContactList_0.Analytics.useAnalytics);
local v20 = require(l_ContactList_0.Analytics.EventNamesEnum);
local v21 = require(l_ContactList_0.Components.ContactListHeader);
local v22 = require(l_ContactList_0.Components.CallHistory.CallHistoryContainer);
local v23 = require(l_ContactList_0.Components.FriendList.FriendListContainer);
local v24 = require(l_ContactList_0.Components.ContactListSearchBar);
local v25 = require(l_ContactList_0.Actions.SetCurrentPage);
local v26 = require(l_ContactList_0.Actions.SetCurrentTag);
local v27 = require(l_ContactList_0.Actions.OpenOrUpdateDialog);
local v28 = require(l_ContactList_0.Enums.Pages);
local v29 = require(l_ContactList_0.Parent.TopBar.Constants);
local l_LocalPlayer_0 = game:GetService("Players").LocalPlayer;
local l_CurrentCamera_0 = workspace.CurrentCamera;
local v32 = 12 + v29.ApplyDisplayScale(v29.TopBarHeight);
return function() --[[ Line: 63 ]] --[[ Name: ContactListContainer ]]
    -- upvalues: v19 (copy), l_useStyle_0 (copy), l_useDispatch_0 (copy), l_useIsSpatial_0 (copy), v3 (copy), l_CurrentCamera_0 (copy), v32 (copy), l_Signal_0 (copy), l_useSelector_0 (copy), l_SocialService_0 (copy), l_LocalPlayer_0 (copy), v26 (copy), v20 (copy), v28 (copy), v25 (copy), l_SoundManager_0 (copy), l_Sounds_0 (copy), l_SoundGroups_0 (copy), v27 (copy), v12 (copy), l_dependencyArray_0 (copy), l_PeekViewState_0 (copy), v22 (copy), v23 (copy), v21 (copy), v24 (copy), l_PeekView_0 (copy)
    local v33 = v19();
    local l_Theme_0 = l_useStyle_0().Theme;
    local v35 = l_useDispatch_0();
    local v36 = l_useIsSpatial_0();
    local v37 = v3.useRef(nil);
    local v38, v39 = v3.useState(0);
    local v40, v41 = v3.useState(l_CurrentCamera_0.ViewportSize.X < 640);
    local v42, v43 = v3.useState("");
    local v44, v45 = v3.useState(l_CurrentCamera_0.ViewportSize.Y - v32);
    local v46, v47 = v3.useState(nil);
    local v48 = v3.useRef(l_Signal_0.new());
    local v50 = v3.useCallback(function(v49) --[[ Line: 86 ]]
        return v49.Navigation.currentPage;
    end, {});
    local v51 = l_useSelector_0(v50);
    v3.useEffect(function() --[[ Line: 91 ]]
        -- upvalues: l_SocialService_0 (ref), l_LocalPlayer_0 (ref), v36 (copy), v35 (copy), v26 (ref), v33 (copy), v20 (ref), v51 (copy), v28 (ref), v25 (ref), l_SoundManager_0 (ref), l_Sounds_0 (ref), l_SoundGroups_0 (ref), v27 (ref), v12 (ref), v39 (copy), v38 (copy)
        local v54 = l_SocialService_0.PromptIrisInviteRequested:Connect(function(v52, v53) --[[ Line: 93 ]]
            -- upvalues: l_LocalPlayer_0 (ref), v36 (ref), v35 (ref), v26 (ref), v33 (ref), v20 (ref), v51 (ref), v28 (ref), v25 (ref), l_SoundManager_0 (ref), l_Sounds_0 (ref), l_SoundGroups_0 (ref), v27 (ref), v12 (ref), l_SocialService_0 (ref)
            if l_LocalPlayer_0 and l_LocalPlayer_0.UserId == v52.UserId then
                if not v36 then
                    v35(v26(v53));
                    v33.fireEvent(v20.PhoneBookNavigate, {
                        eventTimestampMs = os.time() * 1000, 
                        startingPage = v51, 
                        destinationPage = v28.CallHistory
                    });
                    v35(v25(v28.CallHistory));
                    l_SoundManager_0:PlaySound(l_Sounds_0.Swipe.Name, {
                        Volume = 0.5
                    }, l_SoundGroups_0.Iris);
                    return;
                else
                    v35(v27(v12:FormatByKey("Feature.Call.Error.Label.OhNo"), v12:FormatByKey("Feature.Call.Error.Description.DeviceNotSupported"), function() --[[ Line: 110 ]]
                        -- upvalues: l_SocialService_0 (ref), l_LocalPlayer_0 (ref)
                        l_SocialService_0:InvokeIrisInvitePromptClosed(l_LocalPlayer_0);
                    end));
                end;
            end;
        end);
        local _ = nil;
        local v57 = l_SocialService_0.PhoneBookPromptClosed:Connect(function(v56) --[[ Line: 122 ]]
            -- upvalues: l_LocalPlayer_0 (ref), v33 (ref), v20 (ref), v51 (ref), v35 (ref), v25 (ref), v39 (ref), v38 (ref)
            if l_LocalPlayer_0 and l_LocalPlayer_0.UserId == v56.UserId then
                v33.fireEvent(v20.PhoneBookNavigate, {
                    eventTimestampMs = os.time() * 1000, 
                    startingPage = tostring(v51), 
                    destinationPage = nil
                });
                v35(v25(nil));
                v39(v38 + 1);
            end;
        end);
        return function() --[[ Line: 135 ]]
            -- upvalues: v54 (copy), v57 (copy)
            v54:Disconnect();
            v57:Disconnect();
        end;
    end, l_dependencyArray_0(v38, v51));
    local v58 = v3.useCallback(function() --[[ Line: 141 ]]
        -- upvalues: v40 (copy), v37 (copy), l_SoundManager_0 (ref), l_Sounds_0 (ref), l_SoundGroups_0 (ref), v32 (ref), l_SocialService_0 (ref), l_LocalPlayer_0 (ref), v48 (copy)
        if not v40 and v37.current then
            l_SoundManager_0:PlaySound(l_Sounds_0.Swipe.Name, {
                Volume = 0.5
            }, l_SoundGroups_0.Iris);
            pcall(function() --[[ Line: 144 ]]
                -- upvalues: v37 (ref), v32 (ref), l_SocialService_0 (ref), l_LocalPlayer_0 (ref)
                v37.current:TweenPosition(UDim2.new(0, -376, 0, v32), Enum.EasingDirection.Out, Enum.EasingStyle.Quad, 0.3, true, function() --[[ Line: 151 ]]
                    -- upvalues: l_SocialService_0 (ref), l_LocalPlayer_0 (ref)
                    l_SocialService_0:InvokeIrisInvitePromptClosed(l_LocalPlayer_0);
                end);
            end);
            return;
        else
            if v48 and v48.current then
                v48.current:fire();
            end;
            return;
        end;
    end, {
        v40
    });
    local v60 = v3.useCallback(function(v59) --[[ Line: 163 ]]
        -- upvalues: v43 (copy)
        v43(v59);
    end, {});
    v3.useEffect(function() --[[ Line: 168 ]]
        -- upvalues: l_CurrentCamera_0 (ref), v41 (copy), v45 (copy), v32 (ref)
        local v61 = l_CurrentCamera_0:GetPropertyChangedSignal("ViewportSize"):Connect(function() --[[ Line: 169 ]]
            -- upvalues: l_CurrentCamera_0 (ref), v41 (ref), v45 (ref), v32 (ref)
            if l_CurrentCamera_0.ViewportSize.X < 640 then
                v41(true);
            else
                v41(false);
            end;
            v45(l_CurrentCamera_0.ViewportSize.Y - v32);
        end);
        return function() --[[ Line: 179 ]]
            -- upvalues: v61 (copy)
            v61:Disconnect();
        end;
    end, {});
    v3.useEffect(function() --[[ Line: 184 ]]
        -- upvalues: v51 (copy), v40 (copy), v37 (copy), v32 (ref), v43 (copy)
        if v51 and not v40 and v37.current then
            pcall(function() --[[ Line: 186 ]]
                -- upvalues: v37 (ref), v32 (ref)
                v37.current:TweenPosition(UDim2.new(0, 12, 0, v32), Enum.EasingDirection.In, Enum.EasingStyle.Quad, 0.3, true);
            end);
        end;
        v43("");
    end, {
        v40, 
        v51
    });
    local v64 = v3.useCallback(function(v62, _) --[[ Line: 201 ]]
        -- upvalues: l_PeekViewState_0 (ref), l_LocalPlayer_0 (ref), l_SocialService_0 (ref), l_SoundManager_0 (ref), l_Sounds_0 (ref), l_SoundGroups_0 (ref), v47 (copy)
        if v62 == l_PeekViewState_0.Closed then
            if l_LocalPlayer_0 then
                l_SocialService_0:InvokeIrisInvitePromptClosed(l_LocalPlayer_0);
            end;
            l_SoundManager_0:PlaySound(l_Sounds_0.Swipe.Name, {
                Volume = 0.5
            }, l_SoundGroups_0.Iris);
        end;
        v47(v62);
    end, {});
    local v65 = v3.useCallback(function() --[[ Line: 213 ]]
        -- upvalues: v33 (copy), v20 (ref), v51 (copy), v28 (ref), v35 (copy), v25 (ref), v47 (copy), l_PeekViewState_0 (ref)
        v33.fireEvent(v20.PhoneBookSearchClicked, {
            eventTimestampMs = os.time() * 1000
        });
        if v51 ~= v28.FriendList then
            v33.fireEvent(v20.PhoneBookNavigate, {
                eventTimestampMs = os.time() * 1000, 
                startingPage = v51, 
                destinationPage = v28.FriendList
            });
        end;
        v35(v25(v28.FriendList));
        v47(l_PeekViewState_0.Full);
    end, {
        v51
    });
    local v67 = v3.useMemo(function() --[[ Line: 228 ]]
        -- upvalues: v51 (copy), v28 (ref), v3 (ref), v22 (ref), v58 (copy), v40 (copy), v46 (copy), l_PeekViewState_0 (ref), v42 (copy), v23 (ref), v44 (copy), v32 (ref), l_Theme_0 (copy), v37 (copy), v21 (ref), v24 (ref), v60 (copy), v65 (copy)
        local v66 = nil;
        if v51 == v28.CallHistory then
            v66 = v3.createElement(v22, {
                dismissCallback = v58, 
                isSmallScreen = v40, 
                scrollingEnabled = not v40 or v46 == l_PeekViewState_0.Full, 
                searchText = v42
            });
        elseif v51 == v28.FriendList then
            v66 = v3.createElement(v23, {
                dismissCallback = v58, 
                isSmallScreen = v40, 
                scrollingEnabled = not v40 or v46 == l_PeekViewState_0.Full, 
                searchText = v42
            });
        end;
        return v3.createElement("ImageButton", {
            Size = if v40 then UDim2.new(1, 0, 0, v44 - 25) else UDim2.new(0, 376, 1, -v32), 
            Position = if v40 then UDim2.new(0, 0, 0, 0) else UDim2.new(0, -376, 0, v32), 
            AutoButtonColor = false, 
            BackgroundColor3 = l_Theme_0.BackgroundDefault.Color, 
            BackgroundTransparency = l_Theme_0.BackgroundDefault.Transparency, 
            BorderSizePixel = 0, 
            ref = v37
        }, {
            UICorner = if v40 then nil else v3.createElement("UICorner", {
                CornerRadius = UDim.new(0, 12)
            }), 
            UIPadding = v3.createElement("UIPadding", {
                PaddingTop = UDim.new(0, 8)
            }), 
            Layout = v3.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Vertical, 
                HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                SortOrder = Enum.SortOrder.LayoutOrder, 
                Padding = UDim.new(0, 8)
            }), 
            Header = v3.createElement(v21, {
                currentPage = v51, 
                headerHeight = 36, 
                layoutOrder = 1, 
                dismissCallback = v58
            }), 
            SearchBar = v3.createElement(v24, {
                layoutOrder = 2, 
                onSearchChanged = v60, 
                searchBarHeight = 36, 
                searchText = v42, 
                onFocused = v65
            }), 
            ContentContainer = v3.createElement("Frame", {
                BackgroundTransparency = 1, 
                LayoutOrder = 3, 
                Size = UDim2.new(1, 0, 1, -88)
            }, v66)
        });
    end, l_dependencyArray_0(v44, v51, v58, v46, v40, v42));
    local v68 = {};
    if v40 then
        v68["ContactListContent" .. tostring(v38)] = v3.createElement("Frame", {
            Size = UDim2.new(1, 0, 1, -v32), 
            Position = UDim2.fromOffset(0, v32), 
            BackgroundTransparency = 1
        }, {
            v3.createElement(l_PeekView_0, {
                briefViewContentHeight = UDim.new(0.6, 0), 
                canDragFullViewToBrief = true, 
                closeSignal = v48.current, 
                elasticBehavior = Enum.ElasticBehavior.Never, 
                peekViewState = v46, 
                viewStateChanged = v64
            }, {
                Content = v67
            })
        });
    else
        v68.ContactListContent = v67;
    end;
    if v51 then
        return (v3.createElement("TextButton", {
            Size = UDim2.fromScale(1, 1), 
            BackgroundTransparency = 1, 
            Text = "", 
            [v3.Event.Activated] = function() --[[ Line: 332 ]]
                -- upvalues: v58 (copy)
                v58();
            end
        }, v68));
    else
        return nil;
    end;
end;