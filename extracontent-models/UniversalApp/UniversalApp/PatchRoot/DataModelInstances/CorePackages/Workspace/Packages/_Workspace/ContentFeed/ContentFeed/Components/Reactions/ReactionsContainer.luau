local l_Parent_0 = script.Parent.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local v2 = require(l_Parent_1.Foundation);
local v3 = require(l_Parent_1.LuaSocialLibrariesDeps);
local v4 = require(l_Parent_1.React);
local v5 = require(l_Parent_0.Components.Reactions.ReactCTA);
local l_ReactionIconMappings_0 = require(l_Parent_0.Constants).ReactionIconMappings;
local v7 = require(l_Parent_0.Components.Reactions.ReactionPicker);
local v8 = require(l_Parent_1.RoactUtils);
local l_Popover_0 = v2.Popover;
local l_PopoverAlign_0 = v2.Enums.PopoverAlign;
local l_PopoverSide_0 = v2.Enums.PopoverSide;
local l_getDeepValue_0 = v3.SocialLibraries.config({}).Dictionary.getDeepValue;
local l_useSelector_0 = v8.Hooks.RoactRodux.useSelector;
return function(v14) --[[ Line: 27 ]] --[[ Name: ReactionsContainer ]]
    -- upvalues: l_useSelector_0 (copy), l_getDeepValue_0 (copy), v4 (copy), l_Popover_0 (copy), v5 (copy), l_ReactionIconMappings_0 (copy), l_PopoverSide_0 (copy), l_PopoverAlign_0 (copy), v7 (copy)
    local v17 = l_useSelector_0(function(v15) --[[ Line: 28 ]]
        -- upvalues: l_getDeepValue_0 (ref), v14 (copy)
        local v16 = l_getDeepValue_0(v15, "ContentSharing.byUserId." .. v14.creatorUserId .. ".reactionsByPostId");
        if not v16 or not v16[v14.postId] then
            return nil;
        else
            return v16[v14.postId].viewerUserReactedToEmoteId;
        end;
    end);
    local v18, v19 = v4.useState(false);
    local v21 = v4.useCallback(function(_) --[[ Line: 39 ]]
        -- upvalues: v19 (copy)
        v19(false);
    end, {
        v19
    });
    local v22 = v4.useCallback(function() --[[ Line: 44 ]]

    end, {});
    return v4.createElement(l_Popover_0.Root, {
        LayoutOrder = v14.layoutOrder, 
        isOpen = v18
    }, {
        Anchor = v4.createElement(l_Popover_0.Anchor, {}, {
            ReactCTA = v4.createElement(v5, {
                onShortPress = v22, 
                onLongPress = function() --[[ Line: 55 ]] --[[ Name: onLongPress ]]
                    -- upvalues: v19 (copy)
                    v19(true);
                end, 
                activeReaction = if v17 then l_ReactionIconMappings_0[v17] else nil
            })
        }), 
        Content = v4.createElement(l_Popover_0.Content, {
            side = {
                position = l_PopoverSide_0.Top, 
                offset = 20
            }, 
            align = l_PopoverAlign_0.End, 
            onPressedOutside = function() --[[ Line: 69 ]] --[[ Name: onPressedOutside ]]
                -- upvalues: v19 (copy)
                v19(false);
            end, 
            hasArrow = false
        }, {
            ReactionPicker = v4.createElement(v7, {
                reactToContent = v21
            })
        })
    });
end;