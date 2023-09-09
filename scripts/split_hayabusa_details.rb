def register(p)
    @source = p["source"]   # Details
    @dest = p["dest"]       # Details
end

def filter(event)
    if event.get(@source).nil?
        return [event]
    end

    details = event.get(@source)
    details_split = details.split('¦ ')

    #result = Hash.new()
    #
    #for d in details_split
    #    detail = d.split(': ')
    #    result[detail[0]] = detail[1]
    #end

    for d in details_split
        detail = d.split(': ')
        event.set(detail[0], detail[1]) 
    end

    # event.set(@dest, result)
    return [event]
end