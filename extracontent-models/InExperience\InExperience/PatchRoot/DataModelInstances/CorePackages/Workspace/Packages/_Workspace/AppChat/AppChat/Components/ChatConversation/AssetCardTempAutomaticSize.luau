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
local v10 = require(l_script_FirstAncestor_0.Flags.FFlagAppChatEnableNewGameCardUI);
local v11 = {
    additionalProps = {
        shareLink = nil, 
        placeId = nil, 
        universeId = nil, 
        senderUserId = nil, 
        onDetailsOpened = function() --[[ Line: 28 ]] --[[ Name: onDetailsOpened ]]

        end, 
        openGameDetailsPage = function() --[[ Line: 29 ]] --[[ Name: openGameDetailsPage ]]

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
return function(v12) --[[ Line: 42 ]] --[[ Name: AssetCardTemp ]]
    -- upvalues: v3 (copy), v11 (copy), v9 (copy), v7 (copy), v8 (copy), v10 (copy), l_useScaledValue_0 (copy), v5 (copy), v2 (copy), v4 (copy)
    local v13 = v3.Dictionary.union(v11, v12);
    local v14 = v3.Dictionary.union(v11.additionalProps, v13.additionalProps);
    local v15 = nil;
    v15 = if v14.shareLink then v9 else v14.placeId and v7 or v8;
    local l_parentWidth_0 = v13.parentWidth;
    local l_wideMode_0 = v13.wideMode;
    local l_isPending_0 = v13.isPending;
    local v19 = nil;
    local v20 = nil;
    if v10 then
        v19 = l_useScaledValue_0(v5.GameCard.THUMBNAIL_WIDTH);
        v20 = l_useScaledValue_0(v5.GameCard.THUMBNAIL_HEIGHT + v5.GameCard.FOOTER_HEIGHT);
    end;
    if v10 then
        v14.isStartOfGroup = v13.hasTail;
        v14.isIncoming = v13.isIncoming;
        v14.isUnfiltered = v13.isUnfiltered;
        v14.isPending = v13.isPending;
        v14.isRepliedTo = v13.isRepliedTo;
    end;
    return v2.createElement(v4, {
        hasTail = v13.hasTail, 
        isIncoming = v13.isIncoming, 
        isPending = l_isPending_0, 
        isUnfiltered = if v10 then nil else v13.isUnfiltered, 
        isAssetCard = true, 
        LayoutOrder = v13.LayoutOrder, 
        padding = v10 and 0 or v13.innerPadding, 
        isLastMessageInMessageGroup = v13.isLastMessageInMessageGroup or v11.isLastMessageInMessageGroup, 
        [v2.Change.AbsoluteSize] = v13[v2.Change.AbsoluteSize]
    }, {
        AssetCard = v2.createElement("Frame", {
            BackgroundTransparency = 1, 
            Size = if v10 then UDim2.fromOffset(v19 or 256, v20 or 208) else UDim2.fromOffset(l_parentWidth_0 - (l_wideMode_0 and 224 or 108), 0), 
            AutomaticSize = Enum.AutomaticSize.XY
        }, {
            Card = v2.createElement(v15, v14)
        })
    });
end;