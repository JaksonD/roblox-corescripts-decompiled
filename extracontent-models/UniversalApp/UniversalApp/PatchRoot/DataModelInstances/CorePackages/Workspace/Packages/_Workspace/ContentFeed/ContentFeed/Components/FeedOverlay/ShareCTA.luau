local l_Parent_0 = script.Parent.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local v2 = require(l_Parent_1.React);
local v3 = require(l_Parent_1.RoactUtils);
local v4 = require(l_Parent_1.Foundation);
local l_Icon_0 = v4.Icon;
local l_View_0 = v4.View;
local v7 = require(l_Parent_0.Analytics.EventNames);
local v8 = require(l_Parent_0.App.FeedContext);
local v9 = require(l_Parent_0.Thunks.SharePost);
local v10 = require(l_Parent_0.Hooks.useAnalytics);
local l_useDispatch_0 = v3.Hooks.RoactRodux.useDispatch;
local l_useTokens_0 = v4.Hooks.useTokens;
local v13 = UDim2.fromOffset(1, 1);
return function(v14) --[[ Line: 29 ]]
    -- upvalues: v10 (copy), l_useDispatch_0 (copy), l_useTokens_0 (copy), v2 (copy), v8 (copy), l_View_0 (copy), v7 (copy), v9 (copy), l_Icon_0 (copy), v13 (copy)
    local v15 = v10();
    local v16 = l_useDispatch_0();
    local v17 = l_useTokens_0();
    local v18 = v2.useContext(v8);
    return v2.createElement(l_View_0, {
        isDisabled = v18.isZooming, 
        LayoutOrder = v14.layoutOrder, 
        onActivated = function() --[[ Line: 39 ]] --[[ Name: onActivated ]]
            -- upvalues: v15 (copy), v7 (ref), v14 (copy), v16 (copy), v9 (ref)
            v15.fireEvent(v7.ContentFeedShareCtaPressed, {
                postId = v14.postId
            });
            v16(v9(v14.creatorUserId, v14.postId));
        end, 
        tag = "radius-medium auto-xy padding-small bg-action-subtle"
    }, {
        ShareIcon = v2.createElement(l_Icon_0, {
            AnchorPoint = Vector2.new(0.5, 0.5), 
            name = "icons/actions/shareArrowOn", 
            Position = UDim2.fromScale(0.5, 0.5), 
            style = v17.Color.ActionEmphasis.Foreground, 
            ZIndex = 2
        }), 
        ShareIconShadow = v2.createElement(l_Icon_0, {
            AnchorPoint = Vector2.new(0.5, 0.5), 
            name = "icons/actions/shareArrowOn", 
            Position = UDim2.fromScale(0.5, 0.5) + v13, 
            style = v17.Color.Common.Shadow, 
            ZIndex = 1
        })
    });
end;