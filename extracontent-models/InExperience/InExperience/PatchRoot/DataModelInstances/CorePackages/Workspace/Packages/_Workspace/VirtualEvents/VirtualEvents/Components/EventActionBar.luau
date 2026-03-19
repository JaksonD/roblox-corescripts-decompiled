local l_script_FirstAncestor_0 = script:FindFirstAncestor("VirtualEvents");
local v1 = require(l_script_FirstAncestor_0.Parent.React);
local v2 = require(l_script_FirstAncestor_0.Parent.Foundation);
local v3 = require(l_script_FirstAncestor_0.Parent.UIBlox);
local v4 = require(l_script_FirstAncestor_0.Parent.GamePlayButton);
local l_RoactNetworking_0 = require(l_script_FirstAncestor_0.Parent.RoactServiceTags).RoactNetworking;
local l_useRoactService_0 = require(l_script_FirstAncestor_0.Parent.RobloxAppHooks).useRoactService;
local _ = require(l_script_FirstAncestor_0.Parent.VirtualEventsState);
local v8 = require(l_script_FirstAncestor_0.Hooks.useExperienceSubtitle);
local l_View_0 = v2.View;
local l_Button_0 = v2.Button;
local l_ButtonSize_0 = v2.Enums.ButtonSize;
local l_ButtonVariant_0 = v2.Enums.ButtonVariant;
local l_FillBehavior_0 = v2.Enums.FillBehavior;
local l_Text_0 = v2.Text;
local l_useTokens_0 = v2.Hooks.useTokens;
local l_Images_0 = v3.App.ImageSet.Images;
local l_ImageSetLabel_0 = v3.Core.ImageSet.ImageSetLabel;
local l_usePlayButtonState_0 = v4.usePlayButtonState;
local l_PlayButtonStates_0 = v4.PlayButtonStates;
return function(v20) --[[ Line: 43 ]] --[[ Name: EventActionBar ]]
    -- upvalues: l_useTokens_0 (copy), v8 (copy), l_useRoactService_0 (copy), l_RoactNetworking_0 (copy), l_usePlayButtonState_0 (copy), l_PlayButtonStates_0 (copy), v1 (copy), l_Text_0 (copy), l_View_0 (copy), l_Button_0 (copy), l_ButtonVariant_0 (copy), l_FillBehavior_0 (copy), l_ButtonSize_0 (copy), l_ImageSetLabel_0 (copy), l_Images_0 (copy)
    local v21 = l_useTokens_0();
    local v22 = if v20.universeId then v8(v20.universeId) else nil;
    local v23 = l_useRoactService_0(l_RoactNetworking_0);
    local v24 = l_usePlayButtonState_0(v23, v20.universeId or "");
    local v25 = true;
    if v24.playButtonState ~= l_PlayButtonStates_0.Playable then
        v25 = v24.playButtonState == l_PlayButtonStates_0.PlayableWithParty;
    end;
    return v1.createElement("Frame", {
        BackgroundTransparency = 1, 
        Size = UDim2.new(1, 0, 0, 0), 
        AutomaticSize = Enum.AutomaticSize.Y
    }, {
        Layout = v1.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Vertical, 
            SortOrder = Enum.SortOrder.LayoutOrder, 
            Padding = UDim.new(0, 16)
        }), 
        UpperContainer = v1.createElement("Frame", {
            Size = UDim2.new(1, 0, 0, 40), 
            BackgroundTransparency = 1, 
            LayoutOrder = 1
        }, {
            Layout = v1.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Horizontal, 
                SortOrder = Enum.SortOrder.LayoutOrder, 
                Padding = UDim.new(0, 12)
            }), 
            ExperienceThumbnail = v1.createElement("ImageButton", {
                Active = true, 
                Size = UDim2.fromOffset(40, 40), 
                BorderSizePixel = 0, 
                Image = ("rbxthumb://type=GameIcon&id=%s&w=150&h=150"):format(v20.universeId), 
                [v1.Event.Activated] = v20.onExperienceTileActivated
            }, {
                UICorner = v1.createElement("UICorner", {
                    CornerRadius = UDim.new(0, 8)
                })
            }), 
            EventInfo = v1.createElement("Frame", {
                Size = UDim2.new(1, -52, 1, 0), 
                BackgroundTransparency = 1, 
                LayoutOrder = 2
            }, {
                Layout = v1.createElement("UIListLayout", {
                    SortOrder = Enum.SortOrder.LayoutOrder, 
                    FillDirection = Enum.FillDirection.Vertical
                }), 
                ExperienceName = v1.createElement(l_Text_0, {
                    LayoutOrder = 1, 
                    Size = UDim2.fromScale(1, v22 and 0.5 or 1), 
                    Text = v20.experienceName, 
                    textStyle = v21.Color.Content.Emphasis, 
                    fontStyle = v21.Typography.TitleLarge, 
                    TextXAlignment = Enum.TextXAlignment.Left, 
                    TextTruncate = Enum.TextTruncate.SplitWord, 
                    TextWrapped = false
                }), 
                ExperienceSubtitle = if v22 then v1.createElement(l_Text_0, {
                    LayoutOrder = 2, 
                    Size = UDim2.fromScale(1, 0.5), 
                    Text = v22, 
                    textStyle = v21.Color.Content.Default, 
                    fontStyle = v21.Typography.BodyLarge, 
                    TextXAlignment = Enum.TextXAlignment.Left, 
                    TextTruncate = Enum.TextTruncate.None, 
                    TextWrapped = false
                }) else nil
            })
        }), 
        LowerContianer = if v20.ctaProps.button then v1.createElement(l_View_0, {
            LayoutOrder = 2, 
            size = UDim2.new(1, 0, 0, 40), 
            tag = {
                ["row gap-small wrap auto-y size-full-0"] = true, 
                ["fill-x"] = true
            }
        }, {
            CTAButton = v1.createElement(l_Button_0, {
                text = v20.ctaProps.button.text, 
                variant = l_ButtonVariant_0[v20.ctaProps.button.variant], 
                onActivated = if v25 then v20.ctaProps.button.onActivated else function() --[[ Line: 132 ]]

                end, 
                fillBehavior = l_FillBehavior_0.Fill, 
                size = l_ButtonSize_0.Medium, 
                isDisabled = not v25
            }), 
            ShareButtonWrapper = if v20.ctaProps.icon then v1.createElement("Frame", {
                Size = UDim2.fromOffset(40, 40), 
                BackgroundTransparency = 1
            }, {
                ShareButton = v1.createElement(l_Button_0, {
                    variant = l_ButtonVariant_0.Standard, 
                    onActivated = if v25 then v20.ctaProps.icon.onActivated else function() --[[ Line: 144 ]]

                    end, 
                    fillBehavior = l_FillBehavior_0.Fill, 
                    size = l_ButtonSize_0.Medium, 
                    isDisabled = not v25
                }), 
                ShareIcon = v1.createElement(l_ImageSetLabel_0, {
                    ZIndex = 2, 
                    Size = UDim2.fromOffset(32, 32), 
                    Image = l_Images_0[v20.ctaProps.icon.icon], 
                    BackgroundTransparency = 1, 
                    Position = UDim2.fromOffset(4, 4)
                })
            }) else nil
        }) else nil
    });
end;