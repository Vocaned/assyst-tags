{if:{tryarg:0}|=||Usage: -t support [-dev] <search query>
Finds Discord Support articles matching a provided search query
Adding a `-dev` flag searches for Developer Support articles instead.
|{js:
(async () => \{
    let search = "{args}".toLowerCase();
{ignore:
    let url = "hammerandchisel";
    if (search.startsWith("-dev ")) {
        url = "discorddevs";
        search = search.substring(5);
    }

    let req = await fetch(`https://${url}.zendesk.com/api/v2/help_center/articles/search?query=${search}`);
    let j = await req.json();

    if (j.results.length < 1) return "No articles found matching provided search query";
    return j.results[0].html_url;
}
\})();
}}