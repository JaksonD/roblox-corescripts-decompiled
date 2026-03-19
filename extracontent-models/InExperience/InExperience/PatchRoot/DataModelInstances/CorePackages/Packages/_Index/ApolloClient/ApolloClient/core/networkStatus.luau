return {
    NetworkStatus = {
        loading = 1, 
        setVariables = 2, 
        fetchMore = 3, 
        refetch = 4, 
        poll = 6, 
        ready = 7, 
        error = 8
    }, 
    isNetworkRequestInFlight = function(v0) --[[ Line: 65 ]] --[[ Name: isNetworkRequestInFlight ]]
        if v0 then
            return v0 < 7;
        else
            return false;
        end;
    end
};