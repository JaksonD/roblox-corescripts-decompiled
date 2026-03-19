local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Packages.Roact);
local v2 = require(l_CorePackages_0.Packages.t);
local v3 = require(l_CorePackages_0.Packages.UIBlox);
local l_LoadingStateContainer_0 = v3.App.Container.LoadingStateContainer;
local l_RetrievalStatus_0 = v3.App.Loading.Enum.RetrievalStatus;
local l_FreeFlowCarousel_0 = v3.App.Container.Carousel.FreeFlowCarousel;
local l_GAME_CAROUSEL_PADDING_0 = require(l_CorePackages_0.Workspace.Packages.DiscoveryTypes).Constants.GAME_CAROUSEL_PADDING;
local v8 = v1.PureComponent:extend("LoadableCarousel");
v8.validateProps = v2.strictInterface({
    fetchingStatus = v2.string, 
    itemList = v2.array(v2.any), 
    renderItem = v2.callback, 
    identifier = v2.optional(v2.callback), 
    headerText = v2.optional(v2.string), 
    onSeeAll = v2.optional(v2.callback), 
    itemSize = v2.optional(v2.Vector2), 
    itemPadding = v2.optional(v2.number), 
    carouselMargin = v2.optional(v2.number), 
    innerPadding = v2.optional(v2.number), 
    layoutOrder = v2.optional(v2.integer), 
    loadNext = v2.optional(v2.callback), 
    onRetry = v2.optional(v2.callback)
});
v8.defaultProps = {
    carouselMargin = l_GAME_CAROUSEL_PADDING_0
};
v8.init = function(v9) --[[ Line: 65 ]] --[[ Name: init ]]
    v9.renderOnLoading = function() --[[ Line: 66 ]]
        return nil;
    end;
end;
v8.render = function(v10) --[[ Line: 71 ]] --[[ Name: render ]]
    -- upvalues: v1 (copy), l_FreeFlowCarousel_0 (copy), l_LoadingStateContainer_0 (copy), l_RetrievalStatus_0 (copy)
    local v11 = v1.createElement(l_FreeFlowCarousel_0, {
        identifier = v10.props.identifier, 
        headerText = v10.props.headerText, 
        onSeeAll = v10.props.onSeeAll, 
        itemList = v10.props.itemList, 
        renderItem = v10.props.renderItem, 
        itemSize = v10.props.itemSize, 
        itemPadding = v10.props.itemPadding, 
        carouselMargin = v10.props.carouselMargin, 
        innerPadding = v10.props.innerPadding, 
        layoutOrder = v10.props.layoutOrder, 
        loadNext = v10.props.loadNext
    });
    return v1.createElement(l_LoadingStateContainer_0, {
        dataStatus = l_RetrievalStatus_0.fromRawValue(v10.props.fetchingStatus), 
        onRetry = v10.props.onRetry, 
        renderOnLoading = v10.renderOnLoading, 
        renderOnLoaded = function() --[[ Line: 90 ]] --[[ Name: renderOnLoaded ]]
            -- upvalues: v11 (copy)
            return v11;
        end
    });
end;
return v8;