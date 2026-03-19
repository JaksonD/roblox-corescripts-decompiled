local l_Parent_0 = script.Parent.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local v2 = require(l_Parent_1.React);
local v3 = require(l_Parent_1.RoactUtils);
local v4 = require(l_Parent_0.App.FeedContext);
local v5 = require(l_Parent_1.Foundation);
local l_Icon_0 = v5.Icon;
local l_View_0 = v5.View;
local v8 = require(l_Parent_0.Analytics.EventNames);
local v9 = require(l_Parent_0.Hooks.useAnalytics);
local l_useDispatch_0 = v3.Hooks.RoactRodux.useDispatch;
local l_useTokens_0 = v5.Hooks.useTokens;
local v12 = require(l_Parent_0.Thunks.OpenInspectWithAssetIds);
local v13 = UDim2.fromOffset(1, 1);
return function(v14) --[[ Line: 30 ]]
    -- upvalues: v9 (copy), l_useDispatch_0 (copy), l_useTokens_0 (copy), v2 (copy), v4 (copy), l_View_0 (copy), v8 (copy), v12 (copy), l_Icon_0 (copy), v13 (copy)
    local v15 = v9();
    local v16 = l_useDispatch_0();
    local v17 = l_useTokens_0();
    local v18 = v2.useContext(v4);
    return v2.createElement(l_View_0, {
        isDisabled = v18.isZooming, 
        LayoutOrder = v14.layoutOrder, 
        onActivated = function() --[[ Line: 40 ]] --[[ Name: onActivated ]]
            -- upvalues: v15 (copy), v8 (ref), v14 (copy), v16 (copy), v12 (ref)
            v15.fireEvent(v8.ContentFeedInspectCtaPressed, {
                postId = v14.postId
            });
            v16(v12(v14.avatarItemIds));
        end, 
        tag = "radius-medium auto-xy padding-small bg-action-subtle"
    }, {
        InspectIcon = v2.createElement(l_Icon_0, {
            AnchorPoint = Vector2.new(0.5, 0.5), 
            name = "icons/menu/shopOn", 
            Position = UDim2.fromScale(0.5, 0.5), 
            style = v17.Color.ActionEmphasis.Foreground, 
            ZIndex = 2
        }), 
        InspectIconShadow = v2.createElement(l_Icon_0, {
            AnchorPoint = Vector2.new(0.5, 0.5), 
            name = "icons/menu/shopOn", 
            Position = UDim2.fromScale(0.5, 0.5) + v13, 
            style = v17.Color.Common.Shadow, 
            ZIndex = 1
        })
    });
end;