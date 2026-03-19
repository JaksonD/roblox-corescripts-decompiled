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
local l_ButtonType_0 = v4.App.Button.Enum.ButtonType;
local v14 = require(l_Parent_0.Foundation);
local l_Empty_0 = v14.Empty;
local l_RadioGroup_0 = v14.RadioGroup;
local l_ScrollView_0 = v14.ScrollView;
local l_ScrollBarVisibility_0 = v14.Enums.ScrollBarVisibility;
local function v28(v19, _, v21, v22) --[[ Line: 44 ]] --[[ Name: createChildren ]]
    -- upvalues: v12 (copy), v2 (copy), l_RadioGroup_0 (copy), v11 (copy)
    local v23 = {};
    local v24 = {};
    local v25 = -1;
    for v26, v27 in pairs(v19) do
        if not v12(v27) then
            v25 = v25 + 1;
            v24[v26] = v25;
            table.insert(v23, v2.createElement(l_RadioGroup_0.Item, {
                value = v26, 
                label = v2.createElement(v11, {
                    message = v27, 
                    localizedText = v21, 
                    scrollViewSizeX = v22, 
                    chatLineReportingReworkEnabled = false
                })
            }));
        end;
    end;
    return v23, v24;
end;
return function(v29) --[[ Line: 72 ]] --[[ Name: ChatLineReportSelectionModalOld ]]
    -- upvalues: v2 (copy), l_useLocalization_0 (copy), v8 (copy), v28 (copy), v3 (copy), l_useLayerCollector_0 (copy), l_FFlagChatLineReportingFocusFixesEnabled_0 (copy), v10 (copy), l_ButtonType_0 (copy), v9 (copy), l_Empty_0 (copy), l_ScrollView_0 (copy), l_ScrollBarVisibility_0 (copy), l_RadioGroup_0 (copy)
    local v30, v31 = v2.useState(false);
    local v32 = v2.useRef(nil);
    local v33, v34 = v2.useState(0);
    local v35 = v2.useRef(nil);
    local v36, v37 = v2.useState(0);
    local v38 = v2.useRef(nil);
    local v39 = l_useLocalization_0(v8.ChatLineLocalizationKeys);
    local v40, v41 = v28(v29.messages, v29.setSelectedMessage, v39, v36);
    local v42 = v3.isEmpty(v40);
    local v43 = l_useLayerCollector_0();
    local l_absoluteSize_0 = v43.absoluteSize;
    v2.useEffect(function() --[[ Line: 87 ]]
        -- upvalues: v32 (copy), v34 (copy)
        if v32.current then
            v32.current:GetPropertyChangedSignal("AbsoluteSize"):Connect(function() --[[ Line: 89 ]]
                -- upvalues: v34 (ref), v32 (ref)
                v34(v32.current.AbsoluteSize.Y);
            end);
        end;
    end, {
        v32.current, 
        l_absoluteSize_0
    });
    v2.useEffect(function() --[[ Line: 95 ]]
        -- upvalues: v35 (copy), v37 (copy)
        if v35.current then
            v35.current:GetPropertyChangedSignal("AbsoluteSize"):Connect(function() --[[ Line: 97 ]]
                -- upvalues: v37 (ref), v35 (ref)
                v37(v35.current.AbsoluteSize.X);
            end);
        end;
    end, {
        v35.current, 
        l_absoluteSize_0
    });
    v2.useEffect(function() --[[ Line: 104 ]]
        -- upvalues: v35 (copy), v38 (copy), v8 (ref), l_FFlagChatLineReportingFocusFixesEnabled_0 (ref)
        if v35.current then
            local l_FirstChildWhichIsA_0 = v35.current:FindFirstChildWhichIsA("ScrollingFrame", true);
            if l_FirstChildWhichIsA_0 then
                v38.current = l_FirstChildWhichIsA_0;
                v38.current.CanvasPosition = Vector2.new(0, v8.SelectionModalCanvasPositionTopPadding);
                if l_FFlagChatLineReportingFocusFixesEnabled_0 then
                    v38.current.Selectable = false;
                end;
            end;
        end;
    end, {
        v35.current
    });
    local v46 = v2.useCallback(function() --[[ Line: 118 ]]
        -- upvalues: v31 (copy), v30 (copy)
        v31(not v30);
    end, {
        v30, 
        v31
    });
    return v2.createElement(v10, {
        screenSize = Vector2.new(l_absoluteSize_0.X, l_absoluteSize_0.Y - v43.insets.top), 
        position = UDim2.new(0.5, 0, 0, v43.insets.top + v8.SelectionModalPositionOffset), 
        anchorPoint = Vector2.new(0.5, 0), 
        title = v39.ChatSelectionModalTitle, 
        onCloseClicked = v29.onBack, 
        onInfoClicked = v46, 
        buttonStackProps = {
            buttons = {
                {
                    buttonType = l_ButtonType_0.Secondary, 
                    props = {
                        onActivated = v29.onContinue, 
                        text = v39.ChatSelectionModalButton, 
                        isDisabled = v42 or v29.selectedMessage == nil
                    }
                }
            }
        }
    }, {
        infoView = v2.createElement(v9, {
            visible = v30
        }), 
        messageView = if v42 then v2.createElement(l_Empty_0, {}) else v2.createElement(l_ScrollView_0, {
            Size = UDim2.new(1, 0, 0, (math.min(l_absoluteSize_0.Y - v43.insets.top - v8.SelectionModalScreenSizeOffset, v33 + v8.SelectionModalRadioGroupOffset, if v29.maxContentHeight then v29.maxContentHeight else 1e999))), 
            scroll = {
                AutomaticCanvasSize = Enum.AutomaticSize.Y, 
                CanvasSize = UDim2.new(1, 0, 0, 0), 
                scrollBarVisibility = l_ScrollBarVisibility_0.Always, 
                ScrollingDirection = Enum.ScrollingDirection.Y
            }, 
            ref = v35, 
            LayoutOrder = 1
        }, {
            UIPadding = v2.createElement("UIPadding", {
                PaddingTop = UDim.new(0, 12), 
                PaddingBottom = UDim.new(0, 12)
            }), 
            RadioGroup = v2.createElement(l_RadioGroup_0.Root, {
                onValueChanged = function(v47) --[[ Line: 172 ]] --[[ Name: onValueChanged ]]
                    -- upvalues: v29 (copy), v8 (ref), v41 (copy)
                    v29.setSelectedMessage(v29.messages[v47]);
                    v29.analyticsDispatch({
                        type = v8.AnalyticsActions.SetChatLineSelected, 
                        selected_chat_line_index = v41[v47]
                    });
                end, 
                ref = v32
            }, v40)
        })
    });
end;