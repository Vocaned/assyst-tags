```{if:{tryarg:0}|~||Usage: -t changelog [platform] (version) (locale)
Valid versions can be obtained by running the command without a version set.
Locale defaults to en-US.

Valid platforms:
0 - Desktop
1 - Mobile|{js:
async function run() \{
    let req = await fetch("https://cdn.discordapp.com/changelogs/config_{tryarg:0}.json");
    let ids = await req.json()
    let v = Object.values(ids).map(x => x.min_version);
    let id;
    if (v.length > 1) \{
    if (!v.includes({tryarg:1})) return "Valid versions for platform {tryarg:0}: " + v.join(", ");

    id = Object.entries(ids).find(x => x[1].min_version == "{tryarg:1}")[0];
    \} else \{
    id = Object.keys(ids)[0];
    \}

    let locale = "{tryarg:2}";
    if (!locale.length) locale = "en-US";
    let url = `https://cdn.discordapp.com/changelogs/{tryarg:0}/$\{id\}/$\{locale\}.json`
    let reqc = await fetch(url);
    let changelog = await reqc.json()
    let out = `$\{url\}\n\n$\{changelog["content"]\}`;

    if (out.length > 1980) return out.substring(0, 1970) + "... (continues)";
    return out;
\}

run();
}}```