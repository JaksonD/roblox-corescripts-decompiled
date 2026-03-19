local l_Parent_0 = script:FindFirstAncestor("LoginV2").Parent;
local l_HttpService_0 = game:GetService("HttpService");
local l_AccountService_0 = game:GetService("AccountService");
local l_game_EngineFeature_0 = game:GetEngineFeature("MagicLogin");
local v4 = require(l_Parent_0.React);
local v5 = require(script.Parent.Constants);
local v6 = require(l_Parent_0.UIBlox);
local v7 = require(l_Parent_0.Foundation);
local l_Button_0 = v7.Button;
local l_View_0 = v7.View;
local l_PeekView_0 = require(l_Parent_0.PeekView).PeekView;
local l_PeekViewState_0 = require(l_Parent_0.PeekView).PeekViewState;
local l_Text_0 = v7.Text;
local l_ButtonVariant_0 = v7.Enums.ButtonVariant;
local l_InputSize_0 = v7.Enums.InputSize;
local l_useDispatch_0 = require(l_Parent_0.RoactUtils).Hooks.RoactRodux.useDispatch;
local v16 = require(l_Parent_0.Dash);
local l_ScrollingListTable_0 = v6.App.Table.ScrollingListTable;
local l_Cell_0 = v6.App.Table.Cell;
local l_useStyle_0 = v6.Core.Style.useStyle;
local l_SetCentralOverlay_0 = require(l_Parent_0.CentralOverlay).Actions.SetCentralOverlay;
local l_CentralOverlayType_0 = require(l_Parent_0.RobloxAppEnums).CentralOverlayType;
local l_Logger_0 = require(l_Parent_0.Loggers).Logger;
local l_useState_0 = v4.useState;
local l_useEffect_0 = v4.useEffect;
local function v30(v25, v26) --[[ Line: 46 ]] --[[ Name: addDevice ]]
    local v27 = {};
    for v28, v29 in ipairs(v25) do
        v27[v28] = {
            endpointId = v29.endpointId, 
            endpointName = v29.endpointName, 
            endpointType = v29.endpointType
        };
    end;
    table.insert(v27, {
        endpointId = v26.endpointId, 
        endpointName = v26.endpointName, 
        endpointType = v26.endpointType
    });
    return v27;
end;
local function v36(v31, v32) --[[ Line: 67 ]] --[[ Name: removeDevice ]]
    local v33 = {};
    for _, v35 in ipairs(v31) do
        if v32 ~= v35.endpointId then
            table.insert(v33, {
                endpointId = v35.endpointId, 
                endpointName = v35.endpointName, 
                endpointType = v35.endpointType
            });
        end;
    end;
    return v33;
end;
return function(v37) --[[ Line: 84 ]] --[[ Name: DeviceSelectorPeekView ]]
    -- upvalues: l_useDispatch_0 (copy), l_useState_0 (copy), l_PeekViewState_0 (copy), l_useStyle_0 (copy), v4 (copy), l_useEffect_0 (copy), l_AccountService_0 (copy), l_game_EngineFeature_0 (copy), l_HttpService_0 (copy), v5 (copy), v30 (copy), v36 (copy), l_Logger_0 (copy), l_SetCentralOverlay_0 (copy), l_CentralOverlayType_0 (copy), l_Cell_0 (copy), l_View_0 (copy), l_Text_0 (copy), l_Button_0 (copy), l_ButtonVariant_0 (copy), l_InputSize_0 (copy), l_PeekView_0 (copy), l_ScrollingListTable_0 (copy), v16 (copy)
    local v38 = l_useDispatch_0();
    local v39, v40 = l_useState_0(l_PeekViewState_0.Full);
    local v41 = l_useStyle_0();
    local v42 = nil;
    local v43, v44 = v4.useState({});
    l_useEffect_0(function() --[[ Line: 96 ]]
        -- upvalues: l_AccountService_0 (ref), l_game_EngineFeature_0 (ref), v42 (ref), l_HttpService_0 (ref), v5 (ref), v44 (copy), v30 (ref), v36 (ref), l_Logger_0 (ref)
        if l_AccountService_0 and l_game_EngineFeature_0 then
            v42 = l_AccountService_0.MagicLoginEvent:Connect(function(v45) --[[ Line: 98 ]]
                -- upvalues: l_HttpService_0 (ref), v5 (ref), v44 (ref), v30 (ref), v36 (ref), l_Logger_0 (ref)
                local l_status_0, l_result_0 = pcall(l_HttpService_0.JSONDecode, l_HttpService_0, v45);
                if l_status_0 then
                    if l_result_0.magicLoginActionKey == v5.ENDPOINT_FOUND then
                        v44(function(v48) --[[ Line: 102 ]]
                            -- upvalues: v30 (ref), l_result_0 (copy)
                            return (v30(v48, {
                                endpointId = l_result_0.endpointId, 
                                endpointName = l_result_0.endpointName, 
                                endpointType = l_result_0.endpointType
                            }));
                        end);
                        return;
                    elseif l_result_0.magicLoginActionKey == v5.ENDPOINT_LOST then
                        v44(function(v49) --[[ Line: 110 ]]
                            -- upvalues: v36 (ref), l_result_0 (copy)
                            return (v36(v49, l_result_0.endpointId));
                        end);
                        return;
                    elseif l_result_0.magicLoginActionKey == v5.CLEAR_DEVICE_LIST then
                        v44({});
                        return;
                    end;
                else
                    l_Logger_0:warning("Magic login Failed to parse JSON data from string: " .. v45);
                end;
            end);
            l_AccountService_0:MagicLogin(v5.START_DISCOVERY);
        end;
        return function() --[[ Line: 123 ]]
            -- upvalues: l_AccountService_0 (ref), l_game_EngineFeature_0 (ref), v42 (ref), v5 (ref)
            if l_AccountService_0 and l_game_EngineFeature_0 then
                if v42 then
                    v42:Disconnect();
                end;
                l_AccountService_0:MagicLogin(v5.STOP_DISCOVERY);
            end;
        end;
    end, {});
    local function v51(v50) --[[ Line: 133 ]] --[[ Name: peekHeaderPositionYChange ]]
        -- upvalues: v40 (copy), l_PeekViewState_0 (ref)
        if v50 < 10 then
            v40(l_PeekViewState_0.Closed);
        end;
    end;
    local function v54(v52, _) --[[ Line: 139 ]]
        -- upvalues: v40 (copy), l_PeekViewState_0 (ref), v37 (copy), v38 (copy)
        v40(v52);
        if (v52 == l_PeekViewState_0.Closed or v52 == l_PeekViewState_0.Hidden) and v37.closeCentralOverlayThunk then
            v38(v37.closeCentralOverlayThunk());
        end;
    end;
    local function _(v55) --[[ Line: 148 ]] --[[ Name: onAccountSelection ]]
        -- upvalues: v38 (copy), l_SetCentralOverlay_0 (ref), l_CentralOverlayType_0 (ref), v37 (copy)
        v38(l_SetCentralOverlay_0(l_CentralOverlayType_0.MagicLoginRequestPopup, {
            endpointId = v55.endpointId, 
            endpointName = v55.endpointName, 
            endpointType = v55.endpointType, 
            launchApp = v37.launchApp
        }));
    end;
    local function v59(v57) --[[ Line: 157 ]] --[[ Name: createDeviceSelectionCell ]]
        -- upvalues: v4 (ref), l_Cell_0 (ref), l_View_0 (ref), l_Text_0 (ref), l_Button_0 (ref), l_ButtonVariant_0 (ref), v38 (copy), l_SetCentralOverlay_0 (ref), l_CentralOverlayType_0 (ref), v37 (copy), l_InputSize_0 (ref), v41 (copy)
        return v4.createElement(l_Cell_0, {
            size = UDim2.new(1, 0, 0, 60), 
            head = v4.createElement(l_View_0, {
                tag = "col gap-xxsmall auto-xy"
            }, {
                nameText = v4.createElement(l_Text_0, {
                    Text = v57.endpointName or "Unknown", 
                    tag = "auto-xy text-title-medium text-wrap text-align-x-left", 
                    LayoutOrder = 0
                }), 
                endpointTypeText = v4.createElement(l_Text_0, {
                    Text = v57.endpointType or "Unknown", 
                    tag = "auto-xy text-body-medium text-wrap text-align-x-left", 
                    LayoutOrder = 1
                })
            }), 
            tail = v4.createElement(l_Button_0, {
                text = "Request", 
                variant = l_ButtonVariant_0.Standard, 
                onActivated = function() --[[ Line: 177 ]] --[[ Name: onActivated ]]
                    -- upvalues: v57 (copy), v38 (ref), l_SetCentralOverlay_0 (ref), l_CentralOverlayType_0 (ref), v37 (ref)
                    local l_v57_0 = v57;
                    v38(l_SetCentralOverlay_0(l_CentralOverlayType_0.MagicLoginRequestPopup, {
                        endpointId = l_v57_0.endpointId, 
                        endpointName = l_v57_0.endpointName, 
                        endpointType = l_v57_0.endpointType, 
                        launchApp = v37.launchApp
                    }));
                end, 
                isDisabled = false, 
                size = l_InputSize_0.Small, 
                width = UDim.new(0, 80), 
                LayoutOrder = 0
            }), 
            background = v4.createElement("Frame", {
                Size = UDim2.fromScale(1, 1), 
                BackgroundColor3 = v41.Theme.BackgroundUIDefault.Color, 
                BackgroundTransparency = 1, 
                BorderColor3 = v41.Theme.BackgroundUIDefault.Color
            }), 
            onActivated = nil, 
            horizontalPadding = 0
        });
    end;
    return v4.createElement(l_View_0, {
        tag = "size-full bg-action-alert"
    }, {
        PeekView = v4.createElement(l_PeekView_0, {
            hasScrim = true, 
            briefViewContentHeight = UDim.new(0, 270), 
            superBriefViewContentHeight = UDim.new(0, 40), 
            peekHeaderClose = false, 
            style = v41, 
            canDragFullViewToBrief = true, 
            stateOnMount = l_PeekViewState_0.Brief, 
            mountAnimation = true, 
            returnToFullView = true, 
            peekHeaderPositionYChange = v51, 
            thumbstickScrollEnabled = true, 
            showDraggerInClosedState = true, 
            viewStateChanged = v54, 
            peekViewState = v39, 
            isScrollingEnabled = true, 
            showDropShadow = true
        }, {
            PeekViewContent = v4.createElement(l_View_0, {
                tag = "col gap-small auto-y size-full-0 padding-xxlarge"
            }, {
                TitleText = v4.createElement(l_Text_0, {
                    Text = "Nearby Devices", 
                    tag = "auto-xy text-heading-medium text-wrap text-align-x-left", 
                    LayoutOrder = 0
                }), 
                Body = v4.createElement(l_View_0, {
                    tag = "size-full", 
                    LayoutOrder = 1
                }, {
                    VisibilityText = v4.createElement(l_Text_0, {
                        Text = "", 
                        tag = "size-full text-body"
                    }), 
                    DeviceList = v4.createElement(l_ScrollingListTable_0, {
                        cells = v16.map(v43, v59)
                    })
                })
            })
        })
    });
end;