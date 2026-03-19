local l_Parent_0 = script:FindFirstAncestor("AppTopBanner").Parent;
return require(l_Parent_0.Rodux).makeActionCreator(script.Name, function(v1, v2, v3, v4, v5) --[[ Line: 7 ]]
    return {
        expanded = v1, 
        appTopBannerType = v2, 
        appTopBannerContentProps = v3, 
        onAppTopBannerClick = v4, 
        appTopBannerContentHeight = v5
    };
end);