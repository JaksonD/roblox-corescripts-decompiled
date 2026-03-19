local l_script_FirstAncestor_0 = script:FindFirstAncestor("AppChat");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.Roact);
local v3 = require(l_Parent_0.Cryo);
local v4 = require(script.Parent.Bubble.ChatBubbleContainerAutomaticSize);
local v5 = require(l_script_FirstAncestor_0.Constants);
local l_useScaledValue_0 = require(l_Parent_0.Foundation).Hooks.useScaledValue;
local v7 = require(l_script_FirstAncestor_0.Components.ChatConversation.GameCardComponents.PlaceIdContainer);
local v8 = require(l_script_FirstAncestor_0.Components.ChatConversation.GameCardComponents.GameCardContainer);
local v9 = require(l_script_FirstAncestor_0.Components.ChatConversation.GameCardComponents.ShareLinkContainer);
local v10 = {
    additionalProps = {
        shareLink = nil, 
        placeId = nil, 
        universeId = nil, 
        senderUserId = nil, 
        onDetailsOpened = function() --[[ Line: 24 ]] --[[ Name: onDetailsOpened ]]

        end, 
        openGameDetailsPage = function() --[[ Line: 25 ]] --[[ Name: openGameDetailsPage ]]

        end
    }, 
    hasTail = false, 
    innerPadding = 0, 
    isIncoming = false, 
    isPending = true, 
    isUnfiltered = false, 
    isLastMessageInMessageGroup = false, 
    maxWidth = 0, 
    parentWidth = 0, 
    wideMode = false
};
return function(v11) --[[ Line: 38 ]] --[[ Name: AssetCardTemp ]]
    -- upvalues: v3 (copy), v10 (copy), v9 (copy), v7 (copy), v8 (copy), l_useScaledValue_0 (copy), v5 (copy), v2 (copy), v4 (copy)
    local v12 = v3.Dictionary.union(v10, v11);
    local v13 = v3.Dictionary.union(v10.additionalProps, v12.additionalProps);
    local v14 = nil;
    v14 = if v13.shareLink then v9 else v13.placeId and v7 or v8;
    local l_isPending_0 = v12.isPending;
    local v16 = l_useScaledValue_0(v5.GameCard.THUMBNAIL_WIDTH);
    local v17 = l_useScaledValue_0(v5.GameCard.THUMBNAIL_HEIGHT + v5.GameCard.FOOTER_HEIGHT);
    v13.isStartOfGroup = v12.hasTail;
    v13.isIncoming = v12.isIncoming;
    v13.isUnfiltered = v12.isUnfiltered;
    v13.isPending = v12.isPending;
    v13.isRepliedTo = v12.isRepliedTo;
    return v2.createElement(v4, {
        hasTail = v12.hasTail, 
        isIncoming = v12.isIncoming, 
        isPending = l_isPending_0, 
        isUnfiltered = nil, 
        isAssetCard = true, 
        LayoutOrder = v12.LayoutOrder, 
        padding = 0, 
        isLastMessageInMessageGroup = v12.isLastMessageInMessageGroup or v10.isLastMessageInMessageGroup, 
        [v2.Change.AbsoluteSize] = v12[v2.Change.AbsoluteSize]
    }, {
        AssetCard = v2.createElement("Frame", {
            BackgroundTransparency = 1, 
            Size = UDim2.fromOffset(v16 or 256, v17 or 208), 
            AutomaticSize = Enum.AutomaticSize.XY
        }, {
            Card = v2.createElement(v14, v13)
        })
    });
end;