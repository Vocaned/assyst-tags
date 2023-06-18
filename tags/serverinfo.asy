{if:{tryarg:0}|=||Usage: -t serverinfo <ids>
ids is a list of a maximum of 5 space separated server IDs.|
    {if:{tryarg:5}|=||{js:
        let res = {download:https://w.fam.rip/a/serverinfo?servers={args}};
        {ignore:
        if ("query_id" in res && res.query_id) {
            `${res.summary}\n\nFull API response: https://w.fam.rip/a/serverinfo?query=${res.query_id}`
        } else {
            `${res.summary}`
        }}
    }|Only 5 server IDs can be checked at once. Blame Discord ratelimits.}
}