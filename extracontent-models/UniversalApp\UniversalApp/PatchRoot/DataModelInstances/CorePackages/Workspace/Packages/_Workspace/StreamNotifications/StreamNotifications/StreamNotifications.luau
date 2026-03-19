local l_CoreGui_0 = game:GetService("CoreGui");
local l_script_FirstAncestor_0 = script:FindFirstAncestor("StreamNotifications");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local l_CurrentCamera_0 = workspace.CurrentCamera;
local v4 = require(l_script_FirstAncestor_0.constants);
local v5 = require(l_Parent_0.React);
local v6 = require(l_Parent_0.ReactRoblox);
local l_useStyle_0 = require(l_Parent_0.UIBlox).Core.Style.useStyle;
local v8 = require(l_Parent_0.FocusNavigationUtils);
local l_FocusNavigableSurfaceWrapper_0 = v8.FocusNavigableSurfaceWrapper;
local l_FocusNavigableSurfaceIdentifierEnum_0 = v8.FocusNavigableSurfaceIdentifierEnum;
local l_FocusNavigationEventNameEnum_0 = v8.FocusNavigationEventNameEnum;
local _ = require(l_Parent_0.ReactFocusNavigation);
local v13 = require(l_Parent_0.InputHandlers);
local l_components_0 = l_script_FirstAncestor_0.components;
local v15 = require(l_components_0.StreamNotificationsHeader);
local v16 = require(l_components_0.StreamNotificationsContent);
local l_EventStream_0 = require(l_script_FirstAncestor_0.analytics.analyticsService).EventStream;
local l_NotificationHelper_0 = require(l_Parent_0.NotificationsCommon).NotificationHelper;
local v19 = require(l_script_FirstAncestor_0.analytics.analyticsConstants);
local l_FFlagLuaAppSupportDeviceSafeInsets_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppSupportDeviceSafeInsets;
local v21 = require(l_script_FirstAncestor_0.StreamNotificationDropdownExperimentation);
return function(v22) --[[ Line: 36 ]]
    -- upvalues: l_useStyle_0 (copy), v21 (copy), v5 (copy), v4 (copy), v15 (copy), v16 (copy), l_CurrentCamera_0 (copy), v13 (copy), l_NotificationHelper_0 (copy), l_EventStream_0 (copy), v19 (copy), v6 (copy), l_FFlagLuaAppSupportDeviceSafeInsets_0 (copy), l_FocusNavigableSurfaceWrapper_0 (copy), l_FocusNavigableSurfaceIdentifierEnum_0 (copy), l_FocusNavigationEventNameEnum_0 (copy), l_CoreGui_0 (copy)
    local v23 = l_useStyle_0();
    if v21.getDropdownEnabled() then
        return v5.createElement("Frame", {
            Size = UDim2.new(0, v4.Dropdown.Width, 0, v4.Dropdown.MaxHeight), 
            BackgroundTransparency = 1, 
            BorderSizePixel = 0, 
            ClipsDescendants = true
        }, {
            UIPadding = v5.createElement("UIPadding", {
                PaddingTop = UDim.new(0, v4.Dropdown.PaddingTop), 
                PaddingBottom = UDim.new(0, v4.Dropdown.PaddingBottom), 
                PaddingLeft = UDim.new(0, v4.Dropdown.HorizontalPadding), 
                PaddingRight = UDim.new(0, v4.Dropdown.HorizontalPadding)
            }), 
            UIListLayout = v5.createElement("UIListLayout", {
                SortOrder = Enum.SortOrder.LayoutOrder, 
                FillDirection = Enum.FillDirection.Vertical, 
                Padding = UDim.new(0, v4.Dropdown.HeaderBodyGap)
            }), 
            Header = v5.createElement(v15, {
                isSmallScreen = false, 
                displayStream = v22.displayStream
            }), 
            StreamNotificationsContent = v5.createElement(v16, {
                showOverlay = function() --[[ Line: 68 ]] --[[ Name: showOverlay ]]

                end, 
                isSmallScreen = false, 
                displayStream = v22.displayStream, 
                setDisplayScreenGuiEnabled = function() --[[ Line: 71 ]] --[[ Name: setDisplayScreenGuiEnabled ]]

                end
            })
        });
    else
        local v24, v25 = v5.useState(l_CurrentCamera_0.ViewportSize.X < v4.Modal.WidthLimit);
        v5.useEffect(function() --[[ Line: 78 ]]
            -- upvalues: l_CurrentCamera_0 (ref), v4 (ref), v25 (copy)
            local v26 = l_CurrentCamera_0:GetPropertyChangedSignal("ViewportSize"):Connect(function() --[[ Line: 79 ]]
                -- upvalues: l_CurrentCamera_0 (ref), v4 (ref), v25 (ref)
                if l_CurrentCamera_0.ViewportSize.X < v4.Modal.WidthLimit then
                    v25(true);
                    return;
                else
                    v25(false);
                    return;
                end;
            end);
            return function() --[[ Line: 86 ]]
                -- upvalues: v26 (copy)
                v26:Disconnect();
            end;
        end, {});
        local v27, v28 = v5.useState(true);
        local v30 = v5.useCallback(function(v29) --[[ Line: 92 ]]
            -- upvalues: v28 (copy)
            v28(v29);
        end);
        local v31, v32 = v5.useState(true);
        local v33 = v5.useRef(nil);
        local v35 = v5.useMemo(function() --[[ Line: 99 ]]
            -- upvalues: v13 (ref), v22 (copy), l_NotificationHelper_0 (ref), l_EventStream_0 (ref), v19 (ref)
            return v13.onRelease(function(v34) --[[ Line: 100 ]]
                -- upvalues: v22 (ref), l_NotificationHelper_0 (ref), l_EventStream_0 (ref), v19 (ref)
                v22.displayStream(false);
                l_NotificationHelper_0.fireEvent(l_EventStream_0, v19.Context.click, v19.EventNames.closeContent, {
                    closeMethod = v19.CloseMethod.focusNavigationBack
                });
                v34:cancel();
            end);
        end, {
            v22.displayStream
        });
        local v36 = {
            TextButtonOverlayBackground = v5.createElement("TextButton", {
                ref = v33, 
                Selectable = false, 
                Size = UDim2.new(1, 0, 1, 0), 
                Position = UDim2.new(0.5, 0, 0.5, 0), 
                AnchorPoint = Vector2.new(0.5, 0.5), 
                BackgroundTransparency = if v27 then v23.Theme.Overlay.Transparency else 1, 
                BackgroundColor3 = v23.Theme.Overlay.Color, 
                AutoButtonColor = false, 
                BorderSizePixel = 0, 
                Text = "", 
                [v5.Event.Activated] = function() --[[ Line: 125 ]]
                    -- upvalues: v22 (copy), l_NotificationHelper_0 (ref), l_EventStream_0 (ref), v19 (ref)
                    v22.displayStream(false);
                    l_NotificationHelper_0.fireEvent(l_EventStream_0, v19.Context.click, v19.EventNames.closeContent, {
                        closeMethod = v19.CloseMethod.backgroundOverlay
                    });
                end
            }, {
                StreamNotificationsFrame = v5.createElement("TextButton", {
                    Size = if v24 then UDim2.new(1, 0, 1, 0) else UDim2.new(0, v4.Modal.Width, 0, v4.Modal.Height), 
                    Position = UDim2.new(0.5, 0, 0.5, 0), 
                    AnchorPoint = Vector2.new(0.5, 0.5), 
                    BackgroundColor3 = v23.Theme.BackgroundDefault.Color, 
                    BackgroundTransparency = v23.Theme.BackgroundDefault.Transparency, 
                    AutoButtonColor = false, 
                    BorderSizePixel = 0, 
                    Text = "", 
                    Selectable = false
                }, {
                    UICorner = v5.createElement("UICorner", {
                        CornerRadius = if not v24 then UDim.new(0, v4.Modal.CornerRadius) else UDim.new(0, 0)
                    }), 
                    Header = v5.createElement(v15, {
                        isSmallScreen = v24, 
                        displayStream = v22.displayStream
                    }), 
                    StreamNotificationsContent = v5.createElement(v16, {
                        showOverlay = v30, 
                        isSmallScreen = v24, 
                        displayStream = v22.displayStream, 
                        setDisplayScreenGuiEnabled = v32
                    })
                })
            })
        };
        return v6.createPortal({
            ScreenGui = v5.createElement("ScreenGui", {
                Enabled = v31, 
                ZIndexBehavior = Enum.ZIndexBehavior.Sibling, 
                DisplayOrder = 10, 
                ScreenInsets = if l_FFlagLuaAppSupportDeviceSafeInsets_0 then Enum.ScreenInsets.None else nil, 
                IgnoreGuiInset = true
            }, {
                v5.createElement(l_FocusNavigableSurfaceWrapper_0, {
                    surfaceIdentifier = l_FocusNavigableSurfaceIdentifierEnum_0.PopUp, 
                    isIsolated = true, 
                    frameProps = {
                        ref = v33
                    }, 
                    customEventHandlers = {
                        [l_FocusNavigationEventNameEnum_0.NavigateBack] = {
                            handler = v35
                        }
                    }
                }, v36)
            })
        }, l_CoreGui_0);
    end;
end;