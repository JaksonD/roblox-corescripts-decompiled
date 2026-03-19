local l_Parent_0 = script.Parent.Parent;
local l_MessageBus_0 = require(l_Parent_0.MessageBus).MessageBus;
local v2 = require(l_Parent_0.t);
local _ = require(script.Parent.ExternalContentSharingProtocolTypes);
local _ = require(l_Parent_0.MessageBus);
local v5 = v2.strictInterface({
    text = v2.string, 
    context = v2.optional(v2.string)
});
local v6 = v2.strictInterface({
    url = v2.string, 
    context = v2.optional(v2.string)
});
local v7 = v2.strictInterface({
    context = v2.optional(v2.string), 
    image = v2.string, 
    shareSheetTitle = v2.optional(v2.string), 
    url = v2.optional(v2.string)
});
local v8 = v2.strictInterface({
    context = v2.optional(v2.string), 
    shareSheetTitle = v2.optional(v2.string), 
    url = v2.optional(v2.string), 
    video = v2.string
});
local v9 = v2.strictInterface({
    text = v2.string, 
    context = v2.optional(v2.string)
});
local v10 = {
    EXTERNAL_CONTENT_SHARING_SHARE_TEXT_DESCRIPTOR = {
        mid = l_MessageBus_0.getMessageId("ExternalContentSharing", "shareText"), 
        validateParams = v5
    }, 
    EXTERNAL_CONTENT_SHARING_SHARE_URL_DESCRIPTOR = {
        mid = l_MessageBus_0.getMessageId("ExternalContentSharing", "shareUrl"), 
        validateParams = v6
    }, 
    EXTERNAL_CONTENT_SHARING_SHARE_IMAGE_DESCRIPTOR = {
        mid = l_MessageBus_0.getMessageId("ExternalContentSharing", "shareImage"), 
        validateParams = v7
    }, 
    EXTERNAL_CONTENT_SHARING_SHARE_VIDEO_DESCRIPTOR = {
        mid = l_MessageBus_0.getMessageId("ExternalContentSharing", "shareVideo"), 
        validateParams = v8
    }, 
    EXTERNAL_CONTENT_SHARING_SET_CLIPBOARD_TEXT_DESCRIPTOR = {
        mid = l_MessageBus_0.getMessageId("ExternalContentSharing", "setClipboardText"), 
        validateParams = v9
    }
};
v10.__index = v10;
v10.new = function(v11) --[[ Line: 82 ]] --[[ Name: new ]]
    -- upvalues: l_MessageBus_0 (copy), v10 (copy)
    return (setmetatable({
        messageBus = v11 or l_MessageBus_0
    }, v10));
end;
v10.shareText = function(v12, v13) --[[ Line: 90 ]] --[[ Name: shareText ]]
    v12.messageBus.publish(v12.EXTERNAL_CONTENT_SHARING_SHARE_TEXT_DESCRIPTOR, v13);
end;
v10.shareUrl = function(v14, v15) --[[ Line: 94 ]] --[[ Name: shareUrl ]]
    v14.messageBus.publish(v14.EXTERNAL_CONTENT_SHARING_SHARE_URL_DESCRIPTOR, v15);
end;
v10.shareImage = function(v16, v17) --[[ Line: 101 ]] --[[ Name: shareImage ]]
    v16.messageBus.publish(v16.EXTERNAL_CONTENT_SHARING_SHARE_IMAGE_DESCRIPTOR, v17);
end;
v10.shareVideo = function(v18, v19) --[[ Line: 105 ]] --[[ Name: shareVideo ]]
    v18.messageBus.publish(v18.EXTERNAL_CONTENT_SHARING_SHARE_VIDEO_DESCRIPTOR, v19);
end;
v10.setClipboardText = function(v20, v21) --[[ Line: 109 ]] --[[ Name: setClipboardText ]]
    v20.messageBus.publish(v20.EXTERNAL_CONTENT_SHARING_SET_CLIPBOARD_TEXT_DESCRIPTOR, v21);
end;
v10.default = v10.new();
return v10;