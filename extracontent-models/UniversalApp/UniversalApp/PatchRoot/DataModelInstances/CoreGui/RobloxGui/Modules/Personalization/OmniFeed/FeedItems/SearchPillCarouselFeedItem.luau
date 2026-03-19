local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Packages.React);
local l_useSelector_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useSelector;
local l_TopicInfosReducer_0 = require(l_CorePackages_0.Workspace.Packages.TopicInfosRodux).TopicInfosReducer;
local l_TopicContentsReducer_0 = require(l_CorePackages_0.Workspace.Packages.TopicContentsRodux).TopicContentsReducer;
local l_OmniFeedProps_0 = require(l_CorePackages_0.Workspace.Packages.DiscoveryMonolith).Modules.Personalization.OmniFeed.OmniFeedProps;
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v7 = require(l_Modules_0.Personalization.Search.SearchPillCarousel);
SearchPillCarouselFeedItem = function(v8) --[[ Line: 30 ]] --[[ Name: SearchPillCarouselFeedItem ]]
    -- upvalues: l_OmniFeedProps_0 (copy), l_useSelector_0 (copy), l_TopicInfosReducer_0 (copy), l_TopicContentsReducer_0 (copy), v1 (copy), v7 (copy)
    local v9 = v8[l_OmniFeedProps_0.key];
    local l_appPage_0 = v9.appPage;
    local v12 = l_useSelector_0(function(v11) --[[ Line: 34 ]]
        -- upvalues: l_appPage_0 (copy)
        return v11.Personalization.OrderedOmniItems[l_appPage_0];
    end);
    local v14 = l_useSelector_0(function(v13) --[[ Line: 37 ]]
        -- upvalues: l_TopicInfosReducer_0 (ref)
        return v13.Personalization[l_TopicInfosReducer_0.key];
    end);
    local v16 = l_useSelector_0(function(v15) --[[ Line: 40 ]]
        -- upvalues: l_TopicContentsReducer_0 (ref)
        return v15.Personalization[l_TopicContentsReducer_0.key];
    end);
    local v17 = v12.allItems[v8.sortIndex];
    if not v17 then
        warn((("no omni item found for index: %*"):format(v8.sortIndex)));
        return nil;
    else
        local l_sortName_0 = v17.treatmentProps.sortName;
        if not l_sortName_0 then
            warn((("no sort name found for index: %*"):format(v8.sortIndex)));
            return nil;
        else
            local v19 = v14[l_sortName_0];
            if not v19 then
                warn((("no topic info found for sort: %*"):format(l_sortName_0)));
                return nil;
            else
                local l_displayName_0 = v19.displayName;
                if not l_displayName_0 then
                    warn((("no display name found for sort: %*"):format(l_sortName_0)));
                    return nil;
                else
                    local v21 = v16[l_sortName_0];
                    if not v21 then
                        warn((("no topic contents found for sort: %*"):format(l_sortName_0)));
                        return nil;
                    else
                        local l_entries_0 = v21.entries;
                        if not l_entries_0 then
                            warn((("no sort entries found for sort: %*"):format(l_sortName_0)));
                            return nil;
                        else
                            return (v1.createElement(v7, {
                                entries = l_entries_0, 
                                headerText = l_displayName_0, 
                                pageContext = l_appPage_0, 
                                sortIndex = v8.sortIndex, 
                                sortName = l_sortName_0, 
                                scrollViewPositionChangedSignal = v9.scrollViewPositionChangedSignal, 
                                verticalScrollingFrameRef = v9.verticalScrollingFrameRef
                            }));
                        end;
                    end;
                end;
            end;
        end;
    end;
end;
return SearchPillCarouselFeedItem;