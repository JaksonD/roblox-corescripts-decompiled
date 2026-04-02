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
local function _(v22) --[[ Line: 36 ]] --[[ Name: calculateDropdownHeight ]]
    -- upvalues: v4 (copy)
    return (math.min(v4.Dropdown.MaxHeight, (math.max(v22 - v4.Dropdown.VerticalMargin, v4.Dropdown.MinHeight))));
end;
return function(v24) --[[ Line: 43 ]]
    -- upvalues: l_useStyle_0 (copy), v21 (copy), v5 (copy), l_CurrentCamera_0 (copy), v4 (copy), v13 (copy), l_NotificationHelper_0 (copy), l_EventStream_0 (copy), v19 (copy), v15 (copy), v16 (copy), v6 (copy), l_FFlagLuaAppSupportDeviceSafeInsets_0 (copy), l_FocusNavigableSurfaceWrapper_0 (copy), l_FocusNavigableSurfaceIdentifierEnum_0 (copy), l_FocusNavigationEventNameEnum_0 (copy), l_CoreGui_0 (copy)
    local v25 = l_useStyle_0();
    local v26 = v21.getDropdownEnabled();
    local l_useState_0 = v5.useState;
    local v28;
    if v26 then
        local l_Y_0 = l_CurrentCamera_0.ViewportSize.Y;
        v28 = math.min(v4.Dropdown.MaxHeight, (math.max(l_Y_0 - v4.Dropdown.VerticalMargin, v4.Dropdown.MinHeight)));
    else
        v28 = 0;
    end;
    l_useState_0, v28 = l_useState_0(v28);
    local v30, v31 = v5.useState(l_CurrentCamera_0.ViewportSize.X < v4.Modal.WidthLimit);
    v5.useEffect(function() --[[ Line: 56 ]]
        -- upvalues: v26 (copy), v28 (copy), l_CurrentCamera_0 (ref), v4 (ref), v31 (copy)
        if v26 then
            local l_v28_0 = v28;
            local l_Y_1 = l_CurrentCamera_0.ViewportSize.Y;
            l_v28_0((math.min(v4.Dropdown.MaxHeight, (math.max(l_Y_1 - v4.Dropdown.VerticalMargin, v4.Dropdown.MinHeight)))));
        end;
        local v36 = l_CurrentCamera_0:GetPropertyChangedSignal("ViewportSize"):Connect(function() --[[ Line: 60 ]]
            -- upvalues: v26 (ref), v28 (ref), l_CurrentCamera_0 (ref), v4 (ref), v31 (ref)
            if v26 then
                local l_v28_1 = v28;
                local l_Y_2 = l_CurrentCamera_0.ViewportSize.Y;
                l_v28_1((math.min(v4.Dropdown.MaxHeight, (math.max(l_Y_2 - v4.Dropdown.VerticalMargin, v4.Dropdown.MinHeight)))));
            end;
            if l_CurrentCamera_0.ViewportSize.X < v4.Modal.WidthLimit then
                v31(true);
                return;
            else
                v31(false);
                return;
            end;
        end);
        return function() --[[ Line: 70 ]]
            -- upvalues: v36 (copy)
            v36:Disconnect();
        end;
    end, {
        v26
    });
    local v37, v38 = v5.useState(true);
    local v40 = v5.useCallback(function(v39) --[[ Line: 76 ]]
        -- upvalues: v38 (copy)
        v38(v39);
    end);
    local v41, v42 = v5.useState(true);
    local v43 = v5.useRef(nil);
    local v45 = v5.useMemo(function() --[[ Line: 83 ]]
        -- upvalues: v13 (ref), v24 (copy), l_NotificationHelper_0 (ref), l_EventStream_0 (ref), v19 (ref)
        return v13.onRelease(function(v44) --[[ Line: 84 ]]
            -- upvalues: v24 (ref), l_NotificationHelper_0 (ref), l_EventStream_0 (ref), v19 (ref)
            v24.displayStream(false);
            l_NotificationHelper_0.fireEvent(l_EventStream_0, v19.Context.click, v19.EventNames.closeContent, {
                closeMethod = v19.CloseMethod.focusNavigationBack
            });
            v44:cancel();
        end);
    end, {
        v24.displayStream
    });
    if v26 then
        return v5.createElement("Frame", {
            Size = UDim2.new(0, v4.Dropdown.Width, 0, l_useState_0), 
            BackgroundTransparency = 1, 
            BorderSizePixel = 0, 
            ClipsDescendants = true
        }, {
            UIPadding = v5.createElement("UIPadding", {
                PaddingTop = UDim.new(0, v4.Dropdown.PaddingTop), 
                PaddingBottom = UDim.new(0, v4.Dropdown.PaddingBottom), 
                PaddingLeft = UDim.new(0, v4.Dropdown.HorizontalPadding), 
                PaddingRight = UDim.new(0, v4.Dropdown.HorizontalPadding - v4.Dropdown.ScrollBarThickness)
            }), 
            UIListLayout = v5.createElement("UIListLayout", {
                SortOrder = Enum.SortOrder.LayoutOrder, 
                FillDirection = Enum.FillDirection.Vertical, 
                Padding = UDim.new(0, v4.Dropdown.HeaderBodyGap)
            }), 
            Header = v5.createElement(v15, {
                isSmallScreen = false, 
                displayStream = v24.displayStream
            }), 
            StreamNotificationsContent = v5.createElement(v16, {
                showOverlay = function() --[[ Line: 126 ]] --[[ Name: showOverlay ]]

                end, 
                isSmallScreen = false, 
                displayStream = v24.displayStream, 
                setDisplayScreenGuiEnabled = function() --[[ Line: 129 ]] --[[ Name: setDisplayScreenGuiEnabled ]]

                end, 
                dropdownHeight = l_useState_0
            })
        });
    else
        local v46 = {
            TextButtonOverlayBackground = v5.createElement("TextButton", {
                ref = v43, 
                Selectable = false, 
                Size = UDim2.new(1, 0, 1, 0), 
                Position = UDim2.new(0.5, 0, 0.5, 0), 
                AnchorPoint = Vector2.new(0.5, 0.5), 
                BackgroundTransparency = if v37 then v25.Theme.Overlay.Transparency else 1, 
                BackgroundColor3 = v25.Theme.Overlay.Color, 
                AutoButtonColor = false, 
                BorderSizePixel = 0, 
                Text = "", 
                [v5.Event.Activated] = function() --[[ Line: 147 ]]
                    -- upvalues: v24 (copy), l_NotificationHelper_0 (ref), l_EventStream_0 (ref), v19 (ref)
                    v24.displayStream(false);
                    l_NotificationHelper_0.fireEvent(l_EventStream_0, v19.Context.click, v19.EventNames.closeContent, {
                        closeMethod = v19.CloseMethod.backgroundOverlay
                    });
                end
            }, {
                StreamNotificationsFrame = v5.createElement("TextButton", {
                    Size = if v30 then UDim2.new(1, 0, 1, 0) else UDim2.new(0, v4.Modal.Width, 0, v4.Modal.Height), 
                    Position = UDim2.new(0.5, 0, 0.5, 0), 
                    AnchorPoint = Vector2.new(0.5, 0.5), 
                    BackgroundColor3 = v25.Theme.BackgroundDefault.Color, 
                    BackgroundTransparency = v25.Theme.BackgroundDefault.Transparency, 
                    AutoButtonColor = false, 
                    BorderSizePixel = 0, 
                    Text = "", 
                    Selectable = false
                }, {
                    UICorner = v5.createElement("UICorner", {
                        CornerRadius = if not v30 then UDim.new(0, v4.Modal.CornerRadius) else UDim.new(0, 0)
                    }), 
                    Header = v5.createElement(v15, {
                        isSmallScreen = v30, 
                        displayStream = v24.displayStream
                    }), 
                    StreamNotificationsContent = v5.createElement(v16, {
                        showOverlay = v40, 
                        isSmallScreen = v30, 
                        displayStream = v24.displayStream, 
                        setDisplayScreenGuiEnabled = v42
                    })
                })
            })
        };
        return v6.createPortal({
            ScreenGui = v5.createElement("ScreenGui", {
                Enabled = v41, 
                ZIndexBehavior = Enum.ZIndexBehavior.Sibling, 
                DisplayOrder = 10, 
                ScreenInsets = if l_FFlagLuaAppSupportDeviceSafeInsets_0 then Enum.ScreenInsets.None else nil, 
                IgnoreGuiInset = true
            }, {
                v5.createElement(l_FocusNavigableSurfaceWrapper_0, {
                    surfaceIdentifier = l_FocusNavigableSurfaceIdentifierEnum_0.PopUp, 
                    isIsolated = true, 
                    frameProps = {
                        ref = v43
                    }, 
                    customEventHandlers = {
                        [l_FocusNavigationEventNameEnum_0.NavigateBack] = {
                            handler = v45
                        }
                    }
                }, v46)
            })
        }, l_CoreGui_0);
    end;
end;