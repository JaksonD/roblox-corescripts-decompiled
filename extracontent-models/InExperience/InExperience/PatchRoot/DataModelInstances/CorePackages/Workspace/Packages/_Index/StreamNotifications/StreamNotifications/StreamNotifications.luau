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
return function(v21) --[[ Line: 34 ]]
    -- upvalues: l_useStyle_0 (copy), v5 (copy), l_CurrentCamera_0 (copy), v4 (copy), v13 (copy), l_NotificationHelper_0 (copy), l_EventStream_0 (copy), v19 (copy), v15 (copy), v16 (copy), v6 (copy), l_FFlagLuaAppSupportDeviceSafeInsets_0 (copy), l_FocusNavigableSurfaceWrapper_0 (copy), l_FocusNavigableSurfaceIdentifierEnum_0 (copy), l_FocusNavigationEventNameEnum_0 (copy), l_CoreGui_0 (copy)
    local v22 = l_useStyle_0();
    local v23, v24 = v5.useState(l_CurrentCamera_0.ViewportSize.X < v4.Modal.WidthLimit);
    v5.useEffect(function() --[[ Line: 39 ]]
        -- upvalues: l_CurrentCamera_0 (ref), v4 (ref), v24 (copy)
        local v25 = l_CurrentCamera_0:GetPropertyChangedSignal("ViewportSize"):Connect(function() --[[ Line: 40 ]]
            -- upvalues: l_CurrentCamera_0 (ref), v4 (ref), v24 (ref)
            if l_CurrentCamera_0.ViewportSize.X < v4.Modal.WidthLimit then
                v24(true);
                return;
            else
                v24(false);
                return;
            end;
        end);
        return function() --[[ Line: 47 ]]
            -- upvalues: v25 (copy)
            v25:Disconnect();
        end;
    end, {});
    local v26, v27 = v5.useState(true);
    local v29 = v5.useCallback(function(v28) --[[ Line: 53 ]]
        -- upvalues: v27 (copy)
        v27(v28);
    end);
    local v30, v31 = v5.useState(true);
    local v32 = v5.useRef(nil);
    local v34 = v5.useMemo(function() --[[ Line: 60 ]]
        -- upvalues: v13 (ref), v21 (copy), l_NotificationHelper_0 (ref), l_EventStream_0 (ref), v19 (ref)
        return v13.onRelease(function(v33) --[[ Line: 61 ]]
            -- upvalues: v21 (ref), l_NotificationHelper_0 (ref), l_EventStream_0 (ref), v19 (ref)
            v21.displayStream(false);
            l_NotificationHelper_0.fireEvent(l_EventStream_0, v19.Context.click, v19.EventNames.closeContent, {
                closeMethod = v19.CloseMethod.focusNavigationBack
            });
            v33:cancel();
        end);
    end, {
        v21.displayStream
    });
    local v35 = {
        TextButtonOverlayBackground = v5.createElement("TextButton", {
            ref = v32, 
            Selectable = false, 
            Size = UDim2.new(1, 0, 1, 0), 
            Position = UDim2.new(0.5, 0, 0.5, 0), 
            AnchorPoint = Vector2.new(0.5, 0.5), 
            BackgroundTransparency = if v26 then v22.Theme.Overlay.Transparency else 1, 
            BackgroundColor3 = v22.Theme.Overlay.Color, 
            AutoButtonColor = false, 
            BorderSizePixel = 0, 
            Text = "", 
            [v5.Event.Activated] = function() --[[ Line: 86 ]]
                -- upvalues: v21 (copy), l_NotificationHelper_0 (ref), l_EventStream_0 (ref), v19 (ref)
                v21.displayStream(false);
                l_NotificationHelper_0.fireEvent(l_EventStream_0, v19.Context.click, v19.EventNames.closeContent, {
                    closeMethod = v19.CloseMethod.backgroundOverlay
                });
            end
        }, {
            StreamNotificationsFrame = v5.createElement("TextButton", {
                Size = if v23 then UDim2.new(1, 0, 1, 0) else UDim2.new(0, v4.Modal.Width, 0, v4.Modal.Height), 
                Position = UDim2.new(0.5, 0, 0.5, 0), 
                AnchorPoint = Vector2.new(0.5, 0.5), 
                BackgroundColor3 = v22.Theme.BackgroundDefault.Color, 
                BackgroundTransparency = v22.Theme.BackgroundDefault.Transparency, 
                AutoButtonColor = false, 
                BorderSizePixel = 0, 
                Text = "", 
                Selectable = false
            }, {
                UICorner = v5.createElement("UICorner", {
                    CornerRadius = if not v23 then UDim.new(0, v4.Modal.CornerRadius) else UDim.new(0, 0)
                }), 
                Header = v5.createElement(v15, {
                    isSmallScreen = v23, 
                    displayStream = v21.displayStream
                }), 
                StreamNotificationsContent = v5.createElement(v16, {
                    showOverlay = v29, 
                    isSmallScreen = v23, 
                    displayStream = v21.displayStream, 
                    setDisplayScreenGuiEnabled = v31
                })
            })
        })
    };
    return v6.createPortal({
        ScreenGui = v5.createElement("ScreenGui", {
            Enabled = v30, 
            ZIndexBehavior = Enum.ZIndexBehavior.Sibling, 
            DisplayOrder = 10, 
            ScreenInsets = if l_FFlagLuaAppSupportDeviceSafeInsets_0 then Enum.ScreenInsets.None else nil, 
            IgnoreGuiInset = true
        }, {
            v5.createElement(l_FocusNavigableSurfaceWrapper_0, {
                surfaceIdentifier = l_FocusNavigableSurfaceIdentifierEnum_0.PopUp, 
                isIsolated = true, 
                frameProps = {
                    ref = v32
                }, 
                customEventHandlers = {
                    [l_FocusNavigationEventNameEnum_0.NavigateBack] = {
                        handler = v34
                    }
                }
            }, v35)
        })
    }, l_CoreGui_0);
end;