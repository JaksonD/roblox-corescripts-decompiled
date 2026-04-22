local l_script_FirstAncestor_0 = script:FindFirstAncestor("TrustedContacts");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_Parent_0.RoactNavigation);
local v4 = require(script.Parent.TrustedFriendsModalNavigator);
local v5 = require(script.Parent.useExternalNavigationSetUp);
local l_FFlagTCModalUpdateButtons_0 = require(l_Parent_0.SharedFlags).FFlagTCModalUpdateButtons;
local _ = require(l_script_FirstAncestor_0.Common.Types);
local function v14(v8) --[[ Line: 21 ]] --[[ Name: TrustedFriendsModalEntry ]]
    -- upvalues: v2 (copy), v3 (copy), v4 (copy), v5 (copy), l_FFlagTCModalUpdateButtons_0 (copy)
    local l_navigation_0 = v8.navigation;
    local v10 = v2.useMemo(function() --[[ Line: 24 ]]
        -- upvalues: v3 (ref), v4 (ref)
        return v3.createAppContainer(v4);
    end, {});
    local v11 = if l_navigation_0 then l_navigation_0.getParam("props") else v8;
    local v12 = if l_navigation_0 then v4 else v10;
    local v13 = v5({
        navigation = l_navigation_0, 
        onClosed = v11.onClosed
    });
    return v2.createElement(v12, {
        navigation = l_navigation_0, 
        screenProps = {
            modalProps = {
                userId = v11.userId, 
                source = v11.source, 
                isVerticallyConstrained = v11.isVerticallyConstrained, 
                onRequestAccepted = v11.onRequestAccepted, 
                onRequestSent = v11.onRequestSent, 
                onAcknowledged = v11.onAcknowledged, 
                onRemovedTrustedConnection = if l_FFlagTCModalUpdateButtons_0 then nil else v11.onRemovedTrustedConnection, 
                modalVariantOverride = v11.modalVariantOverride, 
                tokens = v11.tokens, 
                sentFromQrCode = v11.sentFromQrCode, 
                onClosed = nil
            }, 
            externalNavigation = v13
        }
    });
end;
local v15 = v2.PureComponent:extend("classWrapper");
v15.render = function(v16) --[[ Line: 64 ]] --[[ Name: render ]]
    -- upvalues: v2 (copy), v14 (copy)
    return v2.createElement(v14, v16.props);
end;
v15.router = v4.router;
return v15;