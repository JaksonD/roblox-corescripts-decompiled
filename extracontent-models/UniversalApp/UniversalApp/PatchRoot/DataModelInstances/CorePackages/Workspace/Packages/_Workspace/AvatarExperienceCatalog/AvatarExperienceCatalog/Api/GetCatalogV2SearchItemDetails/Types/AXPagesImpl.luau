local _ = require(script.Parent.AXPagesTypes);
return {
    new = function(v1, v2, v3) --[[ Line: 5 ]] --[[ Name: new ]]
        local v4 = {
            _currentPage = v1, 
            _cursor = v2, 
            _fetchNextPage = v3
        };
        local v5 = true;
        if v2 ~= nil then
            v5 = v2 == "";
        end;
        v4.IsFinished = v5;
        v4.GetCurrentPage = function(v6) --[[ Line: 12 ]] --[[ Name: GetCurrentPage ]]
            return v6._currentPage;
        end;
        v4.AdvanceToNextPageAsync = function(v7) --[[ Line: 16 ]] --[[ Name: AdvanceToNextPageAsync ]]
            if v7.IsFinished then
                return;
            else
                local v8 = v7._fetchNextPage(v7._cursor);
                v7._currentPage = v8.data;
                v7._cursor = v8.nextPageCursor;
                local v9 = true;
                if v7._cursor ~= nil then
                    v9 = v7._cursor == "";
                end;
                v7.IsFinished = v9;
                return;
            end;
        end;
        return v4;
    end
};