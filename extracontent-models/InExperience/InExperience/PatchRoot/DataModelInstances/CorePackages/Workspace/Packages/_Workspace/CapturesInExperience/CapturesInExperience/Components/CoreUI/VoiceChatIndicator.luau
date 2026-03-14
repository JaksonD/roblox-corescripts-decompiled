local l_Parent_0 = script.Parent.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local v2 = require(l_Parent_1.React);
local v3 = require(l_Parent_1.RoactUtils);
local l_default_0 = require(l_Parent_1.VoiceChatCore).CoreVoiceManager.default;
local v5 = require(l_Parent_1.Foundation);
local v6 = require(l_Parent_1.Localization);
local l_ControlState_0 = v5.Enums.ControlState;
local l_Icon_0 = v5.Icon;
local l_Popover_0 = v5.Popover;
local l_PopoverAlign_0 = v5.Enums.PopoverAlign;
local l_Text_0 = v5.Text;
local l_View_0 = v5.View;
local l_useLocalization_0 = v6.Hooks.useLocalization;
local l_useScaledValue_0 = v5.Hooks.useScaledValue;
local l_useSelector_0 = v3.Hooks.RoactRodux.useSelector;
local l_useTokens_0 = v5.Hooks.useTokens;
local v17 = require(l_Parent_0.Enums.CaptureTriggerType);
local v18 = require(l_Parent_0.Constants);
return function(v19) --[[ Line: 33 ]]
    -- upvalues: l_useLocalization_0 (copy), l_useScaledValue_0 (copy), l_useTokens_0 (copy), v2 (copy), l_useSelector_0 (copy), v18 (copy), l_ControlState_0 (copy), l_default_0 (copy), v17 (copy), l_View_0 (copy), l_Popover_0 (copy), l_Icon_0 (copy), v5 (copy), l_PopoverAlign_0 (copy), l_Text_0 (copy)
    local v20 = l_useLocalization_0({
        voiceChatMutedLabel = "Feature.Captures.Label.VideoCaptureVoiceChatMutedTooltip", 
        voiceChatMutedTitle = "Feature.Captures.Title.VideoCaptureVoiceChatMutedTooltip"
    });
    local v21 = l_useScaledValue_0(320);
    local v22 = l_useTokens_0();
    local v23, v24 = v2.useState(false);
    local v26 = l_useSelector_0(function(v25) --[[ Line: 43 ]]
        -- upvalues: v18 (ref)
        return v25[v18.RoduxKey].IsVideoCaptureActive.triggerType;
    end);
    local v28 = v2.useCallback(function(v27) --[[ Line: 47 ]]
        -- upvalues: l_ControlState_0 (ref), v24 (copy), v23 (copy)
        if v27 == l_ControlState_0.Pressed then
            v24(not v23);
        end;
    end, {
        v23
    });
    local v29 = v2.useCallback(function() --[[ Line: 53 ]]
        -- upvalues: v24 (copy)
        v24(false);
    end, {});
    if not l_default_0:UserVoiceEnabled() or not l_default_0:IsInitialized() then
        return nil;
    elseif v26 ~= v17.UserCapture and v26 ~= v17.DeveloperCapture then
        return nil;
    elseif game:GetEngineFeature("ReenableMomentsVoice") then
        return nil;
    else
        return v2.createElement(l_View_0, {
            LayoutOrder = v19.layoutOrder, 
            onStateChanged = v28, 
            tag = "anchor-center-center clip position-center-center radius-circle size-700-700"
        }, {
            Popover = v2.createElement(l_Popover_0.Root, {
                isOpen = v23
            }, {
                Anchor = v2.createElement(l_Popover_0.Anchor, {
                    AnchorPoint = Vector2.new(0.5, 0.5), 
                    Position = UDim2.fromScale(0.5, 0.5)
                }, {
                    DeafenIcon = v2.createElement(l_Icon_0, {
                        name = "icons/controls/headphoneDeafen_small", 
                        size = v5.Enums.IconSize.Small, 
                        style = v22.Color.Content.Emphasis
                    })
                }), 
                Content = v2.createElement(l_Popover_0.Content, {
                    align = l_PopoverAlign_0.Center, 
                    hasArrow = false, 
                    onPressedOutside = v29, 
                    side = {
                        offset = v22.Size.Size_500, 
                        position = v19.popoverSide
                    }
                }, {
                    Tooltip = v2.createElement(l_View_0, {
                        sizeConstraint = {
                            MaxSize = Vector2.new(v21, 1e999)
                        }, 
                        tag = "auto-xy col gap-xsmall padding-y-small padding-x-medium"
                    }, {
                        Title = v2.createElement(l_Text_0, {
                            tag = "size-full-0 auto-y text-truncate-end text-align-x-left text-title-small", 
                            Text = v20.voiceChatMutedTitle
                        }), 
                        Subtitle = v2.createElement(l_Text_0, {
                            tag = "size-full-0 auto-y text-wrap text-align-x-left text-body-small", 
                            Text = v20.voiceChatMutedLabel
                        })
                    })
                })
            })
        });
    end;
end;