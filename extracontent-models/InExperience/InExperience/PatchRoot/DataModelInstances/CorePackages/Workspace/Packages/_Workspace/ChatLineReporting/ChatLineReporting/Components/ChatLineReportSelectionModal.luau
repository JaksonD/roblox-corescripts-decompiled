local l_script_FirstAncestor_0 = script:FindFirstAncestor("ChatLineReporting");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_Parent_0.Cryo);
local v4 = require(l_Parent_0.UIBlox);
local l_useLayerCollector_0 = v4.Core.Layout.LayerCollector.useLayerCollector;
local l_useLocalization_0 = require(l_Parent_0.Localization).Hooks.useLocalization;
local l_FFlagChatLineReportingFocusFixesEnabled_0 = require(l_Parent_0.SharedFlags).FFlagChatLineReportingFocusFixesEnabled;
local v8 = require(l_script_FirstAncestor_0.Common.Constants);
local v9 = require(l_script_FirstAncestor_0.Components.ChatLineReportInfo);
local v10 = require(l_script_FirstAncestor_0.Components.ChatLineReportModalWindow);
local v11 = require(l_script_FirstAncestor_0.Components.ChatLineReportSelectableLine);
local v12 = require(l_script_FirstAncestor_0.Common.isSystemMessage);
local v13 = require(l_script_FirstAncestor_0.Enums.ChatLineSelectionMode);
local l_ButtonType_0 = v4.App.Button.Enum.ButtonType;
local v15 = require(l_Parent_0.Foundation);
local l_Empty_0 = v15.Empty;
local l_RadioGroup_0 = v15.RadioGroup;
local l_ScrollView_0 = v15.ScrollView;
local l_ScrollBarVisibility_0 = v15.Enums.ScrollBarVisibility;
local l_View_0 = v15.View;
return v2.memo(function(v21) --[[ Line: 46 ]] --[[ Name: ChatLineReportSelectionModal ]]
    -- upvalues: v13 (copy), v2 (copy), l_useLocalization_0 (copy), v8 (copy), v3 (copy), v12 (copy), l_useLayerCollector_0 (copy), l_FFlagChatLineReportingFocusFixesEnabled_0 (copy), v10 (copy), l_ButtonType_0 (copy), v9 (copy), l_View_0 (copy), l_Empty_0 (copy), l_ScrollView_0 (copy), l_ScrollBarVisibility_0 (copy), l_RadioGroup_0 (copy), v11 (copy)
    local v22 = v21.mode or v13.Radio;
    local v23, v24 = v2.useState(false);
    local v25 = v2.useRef(nil);
    local v26, v27 = v2.useState(0);
    local v28 = v2.useRef(nil);
    local v29 = l_useLocalization_0(v8.ChatLineLocalizationKeys);
    local v31 = v2.useMemo(function() --[[ Line: 54 ]]
        -- upvalues: v3 (ref), v21 (copy), v12 (ref)
        return v3.List.filter(v21.messages, function(v30) --[[ Line: 55 ]]
            -- upvalues: v12 (ref)
            return not v12(v30);
        end);
    end, {
        v21.messages
    });
    local v32 = v3.isEmpty(v31);
    local v33 = l_useLayerCollector_0();
    local l_absoluteSize_0 = v33.absoluteSize;
    v2.useEffect(function() --[[ Line: 64 ]]
        -- upvalues: v25 (copy), v27 (copy)
        if v25.current then
            v25.current:GetPropertyChangedSignal("AbsoluteSize"):Connect(function() --[[ Line: 66 ]]
                -- upvalues: v27 (ref), v25 (ref)
                v27(v25.current.AbsoluteSize.Y);
            end);
        end;
    end, {
        v25.current, 
        l_absoluteSize_0
    });
    v2.useEffect(function() --[[ Line: 73 ]]
        -- upvalues: v28 (copy), v8 (ref), l_FFlagChatLineReportingFocusFixesEnabled_0 (ref)
        if v28.current then
            local l_FirstChildWhichIsA_0 = v28.current:FindFirstChildWhichIsA("ScrollingFrame", true);
            if l_FirstChildWhichIsA_0 then
                l_FirstChildWhichIsA_0.CanvasPosition = Vector2.new(0, v8.SelectionModalCanvasPositionTopPadding);
                if l_FFlagChatLineReportingFocusFixesEnabled_0 then
                    l_FirstChildWhichIsA_0.Selectable = false;
                end;
            end;
        end;
    end, {
        v28.current
    });
    local v37 = v2.useCallback(function() --[[ Line: 85 ]]
        -- upvalues: v24 (copy)
        v24(function(v36) --[[ Line: 86 ]]
            return not v36;
        end);
    end, {});
    local v39 = v2.useCallback(function(v38) --[[ Line: 91 ]]
        -- upvalues: v21 (copy), v31 (copy), v8 (ref)
        if v21.setSelectedMessage then
            v21.setSelectedMessage(v31[v38]);
        end;
        v21.analyticsDispatch({
            type = v8.AnalyticsActions.SetChatLineSelected, 
            selected_chat_line_index = v38
        });
    end, {
        v21.setSelectedMessage, 
        v21.analyticsDispatch
    });
    local l_createElement_0 = v2.createElement;
    local l_v10_0 = v10;
    local v42 = {
        screenSize = Vector2.new(l_absoluteSize_0.X, l_absoluteSize_0.Y - v33.insets.top), 
        position = if v21.isCentered then UDim2.fromScale(0.5, 0.5) else UDim2.new(0.5, 0, 0, v33.insets.top + v8.SelectionModalPositionOffset), 
        anchorPoint = if v21.isCentered then Vector2.new(0.5, 0.5) else Vector2.new(0.5, 0), 
        title = v29.ChatSelectionModalTitle, 
        onCloseClicked = v21.onBack, 
        onInfoClicked = v37, 
        buttonStackProps = if v22 == v13.Radio then {
            buttons = {
                {
                    buttonType = l_ButtonType_0.Secondary, 
                    props = {
                        onActivated = v21.onContinue, 
                        text = v29.ChatSelectionModalButton, 
                        isDisabled = v32 or v21.selectedMessage == nil
                    }
                }
            }
        } else nil
    };
    local v43 = {
        infoView = v2.createElement(v9, {
            visible = v23
        })
    };
    local v44;
    if v32 then
        v44 = v2.createElement(l_View_0, {
            tag = "margin-medium auto-xy"
        }, v2.createElement(l_Empty_0, {
            text = v29.ChatSelectionModalNoMessages
        }));
    else
        v44 = v2.createElement;
        local l_l_ScrollView_0_0 = l_ScrollView_0;
        local v46 = {
            Size = UDim2.new(1, 0, 0, (math.min(l_absoluteSize_0.Y - v33.insets.top - v8.SelectionModalScreenSizeOffset, v26, if v21.maxContentHeight then v21.maxContentHeight else 1e999))), 
            scroll = {
                AutomaticCanvasSize = Enum.AutomaticSize.Y, 
                CanvasSize = UDim2.new(1, 0, 0, 0), 
                scrollBarVisibility = l_ScrollBarVisibility_0.Always, 
                ScrollingDirection = Enum.ScrollingDirection.Y, 
                VerticalScrollBarInset = Enum.ScrollBarInset.ScrollBar
            }, 
            ref = v28, 
            LayoutOrder = 1
        };
        local l_createElement_1 = v2.createElement;
        local l_l_View_0_0 = l_View_0;
        local v49 = {
            Size = UDim2.new(1, 0, 0, 0), 
            tag = "col auto-y padding-y-medium", 
            ref = v25
        };
        local v50 = {};
        local v51 = false;
        if v22 == v13.Radio then
            v51 = v2.createElement(l_RadioGroup_0.Root, {
                onValueChanged = v39
            }, v3.List.map(v31, function(v52, v53) --[[ Line: 172 ]]
                -- upvalues: v2 (ref), l_RadioGroup_0 (ref), v11 (ref), v29 (copy)
                return v2.createElement(l_RadioGroup_0.Item, {
                    key = v52.messageId, 
                    value = v53, 
                    label = v2.createElement(v11, {
                        tag = "shrink", 
                        message = v52, 
                        localizedText = v29, 
                        adjustForRadioGroup = true, 
                        scrollViewSizeX = 0, 
                        chatLineReportingReworkEnabled = true
                    })
                });
            end));
        end;
        v50.RadioList = v51;
        v51 = false;
        if v22 == v13.Direct then
            v51 = v2.createElement(l_View_0, {
                tag = "col size-full-0 auto-y padding-right-medium"
            }, v3.List.map(v31, function(v54, v55) --[[ Line: 192 ]]
                -- upvalues: v2 (ref), l_View_0 (ref), v21 (copy), v8 (ref), v11 (ref), v29 (copy)
                return v2.createElement(l_View_0, {
                    key = v54.messageId, 
                    tag = "size-full-0 auto-y padding-small radius-medium", 
                    onActivated = function() --[[ Line: 198 ]] --[[ Name: onActivated ]]
                        -- upvalues: v21 (ref), v54 (copy), v8 (ref), v55 (copy)
                        if v21.setSelectedMessage then
                            v21.setSelectedMessage(v54);
                        end;
                        v21.analyticsDispatch({
                            type = v8.AnalyticsActions.SetChatLineSelected, 
                            selected_chat_line_index = v55
                        });
                        v21.onContinue(v54);
                    end
                }, v2.createElement(v11, {
                    message = v54, 
                    localizedText = v29, 
                    scrollViewSizeX = 0, 
                    chatLineReportingReworkEnabled = true
                }));
            end));
        end;
        v50.DirectList = v51;
        v44 = v44(l_l_ScrollView_0_0, v46, l_createElement_1(l_l_View_0_0, v49, v50));
    end;
    v43.messageView = v44;
    return l_createElement_0(l_v10_0, v42, v43);
end);