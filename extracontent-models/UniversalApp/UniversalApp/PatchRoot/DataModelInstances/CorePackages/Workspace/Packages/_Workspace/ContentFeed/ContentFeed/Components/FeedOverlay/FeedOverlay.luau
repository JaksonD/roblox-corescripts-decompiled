local l_Parent_0 = script.Parent.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local v2 = require(l_Parent_1.Foundation);
local v3 = require(l_Parent_1.React);
local v4 = require(l_Parent_1.RoactUtils);
local v5 = require(l_Parent_0.Components.FeedOverlay.CreatorUserInfo);
local v6 = require(l_Parent_0.Components.FeedOverlay.CTASidebar);
local l_Text_0 = v2.Text;
local l_View_0 = v2.View;
local v9 = require(l_Parent_0.Utils.getRelativeTimeLabel);
local l_useEffectOnce_0 = v4.Hooks.useEffectOnce;
local l_useRef_0 = v3.useRef;
local l_useState_0 = v3.useState;
local l_useTokens_0 = v2.Hooks.useTokens;
return function(v14) --[[ Line: 30 ]]
    -- upvalues: l_useTokens_0 (copy), l_useRef_0 (copy), l_useState_0 (copy), l_useEffectOnce_0 (copy), v9 (copy), v3 (copy), l_View_0 (copy), v5 (copy), l_Text_0 (copy), v6 (copy)
    local v15 = l_useTokens_0();
    local v16 = l_useRef_0(nil);
    local v17, v18 = l_useState_0("");
    local v19 = 2 * v15.Padding.XLarge;
    l_useEffectOnce_0(function() --[[ Line: 37 ]]
        -- upvalues: v9 (ref), v14 (copy), v18 (copy)
        local l_UnixTimestampMillis_0 = DateTime.now().UnixTimestampMillis;
        local v21 = v9(v14.uploadedAtTimestamp, l_UnixTimestampMillis_0);
        v18(v21);
    end, {
        v14.uploadedAtTimestamp
    });
    return v3.createElement(l_View_0, {
        LayoutOrder = 1, 
        tag = "size-full-0 bg-action-subtle auto-y"
    }, {
        GradientBackdrop = v3.createElement(l_View_0, {
            ref = v16, 
            tag = "col size-full-0 bg-contrast", 
            ZIndex = 1
        }, {
            UIGradient = v3.createElement("UIGradient", {
                Color = ColorSequence.new({
                    ColorSequenceKeypoint.new(0, v15.Color.OverMedia.OverMedia_0.Color3), 
                    ColorSequenceKeypoint.new(1, v15.Color.OverMedia.OverMedia_0.Color3)
                }), 
                Rotation = 270, 
                Transparency = NumberSequence.new({
                    NumberSequenceKeypoint.new(0, 0.5), 
                    NumberSequenceKeypoint.new(1, 1)
                })
            })
        }), 
        InfoFrame = v3.createElement(l_View_0, {
            tag = "align-x-center align-y-bottom padding-xlarge row position-bottom-center size-full-0 items-end bg-action-subtle anchor-bottom-center auto-y gap-medium", 
            ZIndex = 2
        }, {
            PostInfo = v3.createElement(l_View_0, {
                LayoutOrder = 1, 
                onAbsoluteSizeChanged = function(v22) --[[ Line: 71 ]] --[[ Name: onAbsoluteSizeChanged ]]
                    -- upvalues: v16 (copy), v19 (copy)
                    if v16.current then
                        v16.current.Size = UDim2.new(1, 0, 0, v22.AbsoluteSize.Y + v19);
                    end;
                end, 
                tag = "auto-y bg-action-subtle col align-x-left align-y-top gap-medium grow"
            }, {
                CreatorUserInfo = v3.createElement(v5, {
                    creatorUserId = v14.creatorUserId, 
                    layoutOrder = 1
                }), 
                Caption = if v14.caption and v14.caption ~= "" then v3.createElement(l_Text_0, {
                    LayoutOrder = 2, 
                    tag = "auto-xy text-body-medium content-contrast text-wrap text-align-x-left text-align-y-top", 
                    Text = v14.caption, 
                    ZIndex = 2
                }) else nil, 
                Timestamp = if v17 ~= "" then v3.createElement(l_Text_0, {
                    LayoutOrder = 3, 
                    tag = "auto-xy content-muted text-align-x-left text-align-y-top text-body-small text-wrap", 
                    Text = v17
                }) else nil
            }), 
            CTASidebar = v3.createElement(v6, {
                additionalInfo = v14.additionalInfo, 
                creatorUserId = v14.creatorUserId, 
                layoutOrder = 2, 
                postId = v14.postId
            })
        })
    });
end;