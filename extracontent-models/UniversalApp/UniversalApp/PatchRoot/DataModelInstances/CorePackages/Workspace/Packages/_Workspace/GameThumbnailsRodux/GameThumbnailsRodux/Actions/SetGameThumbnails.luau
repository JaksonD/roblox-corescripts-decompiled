local l_Parent_0 = script:FindFirstAncestor("GameThumbnailsRodux").Parent;
return require(l_Parent_0.Rodux).makeActionCreator(script.Name, function(v1) --[[ Line: 21 ]]
    assert(type(v1) == "table", string.format("SetGameThumbnails action expects thumbnailsTable to be a table, was %s", (type(v1))));
    return {
        thumbnails = v1
    };
end);