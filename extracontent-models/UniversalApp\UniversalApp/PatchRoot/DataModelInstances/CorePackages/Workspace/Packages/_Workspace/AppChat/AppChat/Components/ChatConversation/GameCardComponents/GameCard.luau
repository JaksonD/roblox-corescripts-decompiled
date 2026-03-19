local l_script_FirstAncestor_0 = script:FindFirstAncestor("AppChat");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.Roact);
local v3 = require(l_Parent_0.UIBlox);
local v4 = require(l_Parent_0.Foundation);
local l_Radius_0 = v4.Enums.Radius;
local l_Skeleton_0 = v4.Skeleton;
local v7 = require(l_script_FirstAncestor_0.Components.ChatConversation.AssetCardComponents.AssetCard);
local v8 = require(script.Parent.PlayButton);
local v9 = require(script.Parent.ViewDetailsButton);
local v10 = v2.PureComponent:extend("GameCard");
v10.defaultProps = {
    isPlayButtonEnabled = true, 
    playText = "Play", 
    viewDetailsText = "View Details", 
    noDescriptionText = "Placeholder: No Description", 
    gameName = nil, 
    gameIcon = nil, 
    gameDescription = nil, 
    contentLoadedCallback = nil, 
    bodyActivated = nil, 
    playabilityStatus = nil, 
    conversationId = nil, 
    universeId = nil, 
    placeId = nil, 
    price = nil, 
    eventStream = nil, 
    playButtonActivated = nil, 
    viewDetailsActivated = nil, 
    viewDetailsEnabled = true
};
v10.makeButtons = function(v11, _) --[[ Line: 64 ]] --[[ Name: makeButtons ]]
    -- upvalues: v2 (copy), l_Skeleton_0 (copy), l_Radius_0 (copy), v8 (copy), v9 (copy)
    if not v11.props.playabilityStatus then
        return;
    else
        local l_isPlayable_0 = v11.props.playabilityStatus.isPlayable;
        if v11.props.isLoading then
            return {
                loading = v2.createElement(l_Skeleton_0, {
                    Size = UDim2.new(1, 0, 0, 32), 
                    radius = l_Radius_0.Small
                })
            };
        elseif v11.props.isPlayButtonEnabled and l_isPlayable_0 == true then
            return {
                playButton = v2.createElement(v8, {
                    placeId = v11.props.placeId, 
                    universeId = v11.props.universeId, 
                    text = v11.props.playText, 
                    conversationId = v11.props.conversationId, 
                    onActivated = function() --[[ Line: 88 ]] --[[ Name: onActivated ]]
                        -- upvalues: v11 (copy)
                        v11.props.onPlayButtonActivated(v11.props);
                    end, 
                    eventStream = v11.props.eventStream
                })
            };
        elseif v11.props.viewDetailsEnabled then
            return {
                viewDetails = v2.createElement(v9, {
                    text = v11.props.viewDetailsText, 
                    onActivated = function() --[[ Line: 100 ]] --[[ Name: onActivated ]]
                        -- upvalues: v11 (copy)
                        v11.props.openDetails(v11.props);
                    end, 
                    eventStream = v11.props.eventStream
                })
            };
        else
            return;
        end;
    end;
end;
v10.render = function(v14) --[[ Line: 110 ]] --[[ Name: render ]]
    -- upvalues: v3 (copy), v2 (copy), v7 (copy)
    return v3.Style.withStyle(function(v15) --[[ Line: 111 ]]
        -- upvalues: v14 (copy), v2 (ref), v7 (ref)
        if v14.props.universeId then
            local v16 = nil;
            if v14.props.gameDescription then
                v16 = v14.props.gameDescription:gsub("%s", " ");
                if v16:gsub("^%s+$", "") == "" then
                    v16 = v14.props.noDescriptionText;
                end;
            end;
            return v2.createElement(v7, {
                isLoading = v14.props.isLoading, 
                cardTitle = v14.props.gameName, 
                cardBodyText = v16, 
                cardIcon = v14.props.gameIcon, 
                contentLoadedCallback = v14.props.contentLoadedCallback, 
                bodyActivated = function() --[[ Line: 131 ]] --[[ Name: bodyActivated ]]
                    -- upvalues: v14 (ref)
                    if v14.props.viewDetailsEnabled then
                        v14.props.openDetails(v14.props);
                    end;
                end
            }, v14:makeButtons(v15));
        else
            return v2.createElement(v7, {
                cardTitle = v14.props.gameName or "", 
                cardBodyText = v14.props.gameDescription or "", 
                cardIcon = v14.props.gameIcon or "", 
                isLoading = true
            }, {
                fill = v2.createElement("Frame", {
                    BackgroundTransparency = 1, 
                    Size = UDim2.new(1, 0, 0, 32)
                })
            });
        end;
    end);
end;
return v10;