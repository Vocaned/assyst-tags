{js:
    let key = "{args}";
    {ignore:
    var h, k = 0, c1 = 0xcc9e2d51, c2 = 0x1b873593;

    for (var i = 0; i < key.length - (key.length % 4); i = i + 4) {
        k = ((key.charCodeAt(i) & 0xff)) | ((key.charCodeAt(i + 1) & 0xff) << 8) | ((key.charCodeAt(i + 2) & 0xff) << 16) | ((key.charCodeAt(i + 3) & 0xff) << 24);
        k = ((k & 0xffff) * c1) + ((((k >>> 16) * c1) & 0xffff) << 16);
        k = (k << 15) | (k >>> 17);
        k = ((k & 0xffff) * c2) + ((((k >>> 16) * c2) & 0xffff) << 16);
        h ^= k;
        h = (h << 13) | (h >>> 19);
        h = ((h & 0xffff) * 5) + ((((h >>> 16) * 5) & 0xffff) << 16) + 0xe6546b64;
    }

    k = 0;
    switch (key.length % 4) {
        case 3: k ^= (key.charCodeAt(i + 2) & 0xff) << 16;
        case 2: k ^= (key.charCodeAt(i + 1) & 0xff) << 8;
        case 1:
            k ^= (key.charCodeAt(i) & 0xff);
            k = ((k & 0xffff) * c1) + ((((k >>> 16) * c1) & 0xffff) << 16);
            k = (k << 15) | (k >>> 17);
            k = ((k & 0xffff) * c2) + ((((k >>> 16) * c2) & 0xffff) << 16);
            h ^= k;
    }
    h ^= key.length;

    h ^= h >>> 16; h = ((h & 0xffff) * 0x85ebca6b) + ((((h >>> 16) * 0x85ebca6b) & 0xffff) << 16);
    h ^= h >>> 13; h = ((h & 0xffff) * 0xc2b2ae35) + ((((h >>> 16) * 0xc2b2ae35) & 0xffff) << 16);
    h ^= h >>> 16;
    (h >>> 0) % 1e4
}}