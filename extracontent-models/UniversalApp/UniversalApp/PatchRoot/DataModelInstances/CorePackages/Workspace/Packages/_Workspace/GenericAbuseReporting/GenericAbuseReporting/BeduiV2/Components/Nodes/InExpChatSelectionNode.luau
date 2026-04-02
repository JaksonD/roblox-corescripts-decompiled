local l_script_FirstAncestor_0 = script:FindFirstAncestor("GenericAbuseReporting");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.Dash);
local v3 = require(l_Parent_0.Foundation);
local v4 = require(l_Parent_0.React);
local l_ButtonVariant_0 = v3.Enums.ButtonVariant;
local l_Dialog_0 = v3.Dialog;
local l_DialogSize_0 = v3.Enums.DialogSize;
local v8 = require(l_script_FirstAncestor_0.BeduiV2.Components.LayoutSlots);
local v9 = require(l_script_FirstAncestor_0.Common.List);
local v10 = require(l_script_FirstAncestor_0.BeduiV2.Utils.scrollToItem);
local _ = require(l_script_FirstAncestor_0.BeduiV2.Utils.Translate.translate);
local l_useArTranslation_0 = require(l_script_FirstAncestor_0.BeduiV2.Utils.Translate.arTranslation).useArTranslation;
local l_useLayoutSlots_0 = v8.useLayoutSlots;
return v4.memo(function(v14) --[[ Line: 44 ]] --[[ Name: InExpChatSelectionNode ]]
    -- upvalues: v4 (copy), l_useArTranslation_0 (copy), l_useLayoutSlots_0 (copy), v10 (copy), v2 (copy), l_Dialog_0 (copy), l_DialogSize_0 (copy), v9 (copy), l_ButtonVariant_0 (copy)
    local v15, v16 = v4.useState(v14.initialValue or nil);
    local l_translateIntoString_0 = l_useArTranslation_0().translateIntoString;
    local v18 = v4.useRef({});
    local l_Body_0 = l_useLayoutSlots_0().Body;
    v4.useEffect(function() --[[ Line: 52 ]]
        -- upvalues: v15 (copy), v18 (copy), v10 (ref)
        if not v15 then
            return;
        else
            local v20 = v18.current[v15];
            if not v20 then
                return;
            else
                local l_v20_FirstAncestorWhichIsA_0 = v20:FindFirstAncestorWhichIsA("ScrollingFrame");
                if not l_v20_FirstAncestorWhichIsA_0 then
                    return;
                else
                    local v22 = false;
                    local v23 = {
                        current = l_v20_FirstAncestorWhichIsA_0.Parent
                    };
                    local v24 = {
                        current = v20
                    };
                    local function _() --[[ Line: 74 ]] --[[ Name: performScroll ]]
                        -- upvalues: v22 (ref), v10 (ref), v23 (copy), v24 (copy)
                        if v22 then
                            return;
                        else
                            v10(v23, v24);
                            return;
                        end;
                    end;
                    if v20.AbsoluteSize.Y > 0 then
                        if not v22 then
                            v10(v23, v24);
                        end;
                    else
                        local v26 = nil;
                        do
                            local l_v26_0 = v26;
                            l_v26_0 = v20:GetPropertyChangedSignal("AbsoluteSize"):Connect(function() --[[ Line: 86 ]]
                                -- upvalues: v20 (copy), l_v26_0 (ref), v22 (ref), v10 (ref), v23 (copy), v24 (copy)
                                if v20.AbsoluteSize.Y > 0 then
                                    l_v26_0:Disconnect();
                                    if v22 then
                                        return;
                                    else
                                        v10(v23, v24);
                                    end;
                                end;
                            end);
                            task.delay(2, function() --[[ Line: 93 ]]
                                -- upvalues: l_v26_0 (ref)
                                if l_v26_0.Connected then
                                    l_v26_0:Disconnect();
                                end;
                            end);
                        end;
                    end;
                    return function() --[[ Line: 100 ]]
                        -- upvalues: v22 (ref)
                        v22 = true;
                    end;
                end;
            end;
        end;
    end, {
        v15
    });
    local v30 = v4.useCallback(function() --[[ Line: 106 ]]
        -- upvalues: v2 (ref), v14 (copy), v15 (copy)
        local v29 = v2.find(v14.items, function(v28) --[[ Line: 107 ]]
            -- upvalues: v15 (ref)
            return v28.id == v15;
        end);
        if v14.onNext then
            v14.onNext(v15, v29);
        end;
    end, {
        v14.items, 
        v14.onNext, 
        v15
    });
    return v4.createElement(v4.Fragment, nil, {
        Content = v4.createElement(l_Body_0), 
        ChatSelectionDialog = v4.createElement(l_Dialog_0.Root, {
            size = l_DialogSize_0.Medium, 
            hasBackdrop = not v14.isStoryMode, 
            disablePortal = v14.isStoryMode and true or false, 
            onClose = v14.goBack
        }, {
            DialogTitle = v4.createElement(l_Dialog_0.Title, {
                text = l_translateIntoString_0(v14.title)
            }), 
            DialogContent = v4.createElement(l_Dialog_0.Content, nil, {
                EmptyText = if #v14.items == 0 then v4.createElement(l_Dialog_0.Text, {
                    Text = "No chat messages"
                }) else nil, 
                ItemList = if #v14.items > 0 then v4.createElement(v9.Root, {
                    tag = "auto-xy col", 
                    value = v15, 
                    onValueChanged = v16
                }, {
                    v2.map(v14.items, function(v31, v32) --[[ Line: 141 ]]
                        -- upvalues: v4 (ref), v9 (ref), l_translateIntoString_0 (copy), v14 (copy), v18 (copy)
                        return v4.createElement(v9.Item, {
                            value = v31.id, 
                            title = l_translateIntoString_0(v31.label), 
                            description = if v31.description then l_translateIntoString_0(v31.description) else nil, 
                            trailingAccessory = "Radio", 
                            hasDivider = v32 ~= #v14.items, 
                            hasMargin = true, 
                            ref = function(v33) --[[ Line: 149 ]] --[[ Name: ref ]]
                                -- upvalues: v18 (ref), v31 (copy)
                                v18.current[v31.id] = v33;
                            end
                        });
                    end)
                }) else nil
            }), 
            DialogActions = v4.createElement(l_Dialog_0.Actions, {
                actions = {
                    {
                        variant = l_ButtonVariant_0.Emphasis, 
                        text = l_translateIntoString_0(v14.nextButtonText), 
                        isLoading = v14.isSubmitting, 
                        isDisabled = v14.isSubmitting or v14.required and v15 == nil, 
                        onActivated = v30
                    }
                }
            })
        })
    });
end);