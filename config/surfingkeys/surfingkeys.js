// an example to create a new mapping `ctrl-y`
api.mapkey('<ctrl-y>', 'Show me the money', function() {
    Front.showPopup('a well-known phrase uttered by characters in the 1996 film Jerry Maguire (Escape to close).');
});

// Disable for certain domains.
settings.blocklistPattern = /((docs|mail).google|udemy).com/i

// an example to replace `T` with `gt`, click `Default mappings` to see how `T` works.
api.map('gt', 'T');

api.map('p', '<Alt-i>')
api.map(';p', ';s')
api.map('ZZ', ':wq')


// Unmap search engine shortcuts.
api.unmap('sg')
api.unmap('sd')
api.unmap('sb')
api.unmap('se')
api.unmap('sw')
api.unmap('ss')
api.unmap('sh')
api.unmap('sy')

settings.scrollStepSize = 200;

api.Hints.setCharacters('asdfgwertzxcvb'); // for right hand

// an example to remove mapkey `Ctrl-i`
// api.unmap('<ctrl-i>');

api.Hints.style('font-family: "Helvetica Neue", Helvetica, Arial, sans-serif; font-size: 12px;');

// set theme
settings.theme = `
.sk_theme {
    font-family: Input Sans Condensed, Charcoal, sans-serif;
    font-size: 10pt;
    background: #24272e;
    color: #abb2bf;
}
.sk_theme tbody {
    color: #fff;
}
.sk_theme input {
    color: #d0d0d0;
}
.sk_theme .url {
    color: #61afef;
}
.sk_theme .annotation {
    color: #56b6c2;
}
.sk_theme .omnibar_highlight {
    color: #528bff;
}
.sk_theme .omnibar_timestamp {
    color: #e5c07b;
}
.sk_theme .omnibar_visitcount {
    color: #98c379;
}
.sk_theme #sk_omnibarSearchResult ul li:nth-child(odd) {
    background: #303030;
}
.sk_theme #sk_omnibarSearchResult ul li.focused {
    background: #3e4452;
}
#sk_status, #sk_find {
    font-size: 20pt;
}`;
// click `Save` button to make above settings to take effect.</ctrl-i></ctrl-y>
