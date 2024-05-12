#" AAGI Palettes (Discrete)
#"
#" \acronym{AAGI} palettes for use in charts and plots based on official
#"   \acronym{AAGI} colours and interpolated to provide more colours for use in
#"   maps and other graphical outputs.  These palettes are intended to be
#"   colour-blind friendly, while still being based on and using official
#"   \acronym{AAGI colours}.
#"
#" @param type	One of \dQuote{seq} (sequential), \dQuote{div} (diverging) or
#"  \dQuote{qual} (qualitative)
#" @param palette	 If a string, will use that named palette. If a number, will
#"   index into the list of palettes of appropriate type
#" @param n Number of different colors in the palette, minimum 3, maximum
#"   depending on palette
#" @param direction	Sets the order of colours in the scale.  If `1`, the default
#"   order is used. If `-1`, the order of colours is reversed.
#"
#" @examples
#" # example code
#"
#"
#" @export

aagi_pal_d <- function(type = c("seq", "div", "qual"),
                       palette = c("TuYl", "BuYl", "TuGn"),
                       n = 3:11,
                       direction = c(-1, 1)) {
  rlang::arg_match(type)
  rlang::arg_match(palette)

  return(switch(
    name,
    TuYl = switch(
      n - 2,
      # 3
      c("#00808b", "#edfeff", "#ffbc42"),
      # 4
      c("#00808b", "#8abec3", "#ffdda2", "#ffbc42"),
      # 5
      c("#00808b", "#8abec3", "#edfeff", "#ffdda2", "#ffbc42"),
      # 6
      c(
        "#00808b",
        "#68a9b0",
        "#abd3d7",
        "#ffe7be",
        "#ffd285",
        "#ffbc42"
      ),
      # 7
      c(
        "#00808b",
        "#68a9b0",
        "#abd3d7",
        "#edfeff",
        "#ffe7be",
        "#ffd285",
        "#ffbc42"
      ),
      # 8
      c(
        "#00808b",
        "#569ea7",
        "#8abec3",
        "#bcdde1",
        "#ffeccb",
        "#ffdda2",
        "#ffcd76",
        "#ffbc42"
      ),
      # 9
      c(
        "#00808b",
        "#569ea7",
        "#8abec3",
        "#bcdde1",
        "#edfeff",
        "#ffeccb",
        "#ffdda2",
        "#ffcd76",
        "#ffbc42"
      ),
      # 10
      c(
        "#00808b",
        "#4b98a1",
        "#76b1b8",
        "#9ecacf",
        "#c6e4e7",
        "#ffefd3",
        "#ffe3b3",
        "#ffd791",
        "#ffca6c",
        "#ffbc42"
      ),
      # 11
      c(
        "#00808b",
        "#4b98a1",
        "#76b1b8",
        "#9ecacf",
        "#c6e4e7",
        "#edfeff",
        "#ffefd3",
        "#ffe3b3",
        "#ffd791",
        "#ffca6c",
        "#ffbc42"
      )
    ),
    BuYl = switch(
      n - 2,
      # 3
      c("#648fd2", "#edf2fa", "#ffbc42"),
      # 4
      c("#648fd2", "#acbfe6", "#ffdda2", "#ffbc42"),
      # 5
      c("#648fd2", "#acbfe6", "#edf2fa", "#ffdda2", "#ffbc42"),
      # 6
      c(
        "#648fd2",
        "#95afe0",
        "#c2d0ed",
        "#ffe7be",
        "#ffd285",
        "#ffbc42"
      ),
      # 7
      c(
        "#648fd2",
        "#95afe0",
        "#c2d0ed",
        "#edf2fa",
        "#ffe7be",
        "#ffd285",
        "#ffbc42"
      ),
      # 8
      c(
        "#648fd2",
        "#8aa7dc",
        "#acbfe6",
        "#cdd8f0",
        "#ffeccb",
        "#ffdda2",
        "#ffcd76",
        "#ffbc42"
      ),
      # 9
      c(
        "#648fd2",
        "#8aa7dc",
        "#acbfe6",
        "#cdd8f0",
        "#edf2fa",
        "#ffeccb",
        "#ffdda2",
        "#ffcd76",
        "#ffbc42"
      ),
      # 10
      c(
        "#648fd2",
        "#83a2da",
        "#9fb5e2",
        "#b9c9ea",
        "#d3ddf2",
        "#ffefd3",
        "#ffe3b3",
        "#ffd791",
        "#ffca6c",
        "#ffbc42"
      ),
      # 11
      c(
        "#648fd2",
        "#83a2da",
        "#9fb5e2",
        "#b9c9ea",
        "#d3ddf2",
        "#edf2fa",
        "#ffefd3",
        "#ffe3b3",
        "#ffd791",
        "#ffca6c",
        "#ffbc42"
      )
    ),
    GnYl = switch(
      n - 2,
      # 3
      c('#54921e', '#f4fcee', '#ffbc42'),
      # 4
      c('#54921e', '#a6c687', '#ffdda2', '#ffbc42'),
      # 5
      c('#54921e', '#a6c687', '#f4fcee', '#ffdda2', '#ffbc42'),
      # 6
      c(
        '#54921e',
        '#8cb566',
        '#c0d8a9',
        '#ffe7be',
        '#ffd285',
        '#ffbc42'
      ),
      # 7
      c(
        '#54921e',
        '#8cb566',
        '#c0d8a9',
        '#f4fcee',
        '#ffe7be',
        '#ffd285',
        '#ffbc42'
      ),
      # 8
      c(
        '#54921e',
        '#7eac55',
        '#a6c687',
        '#cde1ba',
        '#ffeccb',
        '#ffdda2',
        '#ffcd76',
        '#ffbc42'
      ),
      # 9
      c(
        '#54921e',
        '#7eac55',
        '#a6c687',
        '#cde1ba',
        '#f4fcee',
        '#ffeccb',
        '#ffdda2',
        '#ffcd76',
        '#ffbc42'
      ),
      # 10
      c(
        '#54921e',
        '#76a74b',
        '#96bc73',
        '#b6d19b',
        '#d5e6c4',
        '#ffefd3',
        '#ffe3b3',
        '#ffd791',
        '#ffca6c',
        '#ffbc42'
      ),
      # 11
      c(
        '#54921e',
        '#76a74b',
        '#96bc73',
        '#b6d19b',
        '#d5e6c4',
        '#f4fcee',
        '#ffefd3',
        '#ffe3b3',
        '#ffd791',
        '#ffca6c',
        '#ffbc42'
      )
    ),

    TuGn = switch(
      n - 2,
      # 3
      c("#00808b", "#edfeff", "#b6d438"),
      # 4
      c("#00808b", "#8abec3", "#dee99e", "#b6d438"),
      # 5
      c("#00808b", "#8abec3", "#edfeff", "#dee99e", "#b6d438"),
      # 6
      c(
        "#00808b",
        "#68a9b0",
        "#abd3d7",
        "#e9f0bc",
        "#d1e27f",
        "#b6d438"
      ),
      # 7
      c(
        "#00808b",
        "#68a9b0",
        "#abd3d7",
        "#edfeff",
        "#e9f0bc",
        "#d1e27f",
        "#b6d438"
      ),
      # 8
      c(
        "#00808b",
        "#569ea7",
        "#8abec3",
        "#bcdde1",
        "#eef3cc",
        "#dee99e",
        "#cbde6f",
        "#b6d438"
      ),
      # 9
      c(
        "#00808b",
        "#569ea7",
        "#8abec3",
        "#bcdde1",
        "#edfeff",
        "#eef3cc",
        "#dee99e",
        "#cbde6f",
        "#b6d438"
      ),
      # 10
      c(
        "#00808b",
        "#4b98a1",
        "#76b1b8",
        "#9ecacf",
        "#c6e4e7",
        "#f1f6d5",
        "#e5edb0",
        "#d6e58b",
        "#c7dc65",
        "#b6d438"
      ),
      # 11
      c(
        "#00808b",
        "#4b98a1",
        "#76b1b8",
        "#9ecacf",
        "#c6e4e7",
        "#edfeff",
        "#f1f6d5",
        "#e5edb0",
        "#d6e58b",
        "#c7dc65",
        "#b6d438"
      )
    ),
    RdBu = switch(
      n - 2,
      # 3
      c("#8b0b00", "#ffeeed", "#648fd2"),
      # 4
      c("#8b0b00", "#cf8270", "#b4c4e8", "#648fd2"),
      # 5
      c("#8b0b00", "#cf8270", "#ffeeed", "#b4c4e8", "#648fd2")
      # 6
      c(
        "#8b0b00",
        "#ba5f4a",
        "#e1a698",
        "#ccd7f0",
        "#9bb2e1",
        "#648fd2"
      ),
      # 7
      c(
        "#8b0b00",
        "#ba5f4a",
        "#e1a698",
        "#ffeeed",
        "#ccd7f0",
        "#9bb2e1",
        "#648fd2"
      ),
      # 8
      c(
        "#8b0b00",
        "#af4e38",
        "#cf8270",
        "#e9b7ad",
        "#d8e0f3",
        "#b4c4e8",
        "#8ea9dd",
        "#648fd2"
      ),
      # 9
      c(
        "#8b0b00",
        "#af4e38",
        "#cf8270",
        "#e9b7ad",
        "#ffeeed",
        "#d8e0f3",
        "#b4c4e8",
        "#8ea9dd",
        "#648fd2"
      ),
      # 10
      c(
        "#8b0b00",
        "#a8432d",
        "#c36d59",
        "#da9788",
        "#eec2b9",
        "#dfe6f5",
        "#c3cfed",
        "#a5b9e4",
        "#86a4db",
        "#648fd2"
      ),
      # 11
      c(
        "#8b0b00",
        "#a8432d",
        "#c36d59",
        "#da9788",
        "#eec2b9",
        "#ffeeed",
        "#dfe6f5",
        "#c3cfed",
        "#a5b9e4",
        "#86a4db",
        "#648fd2"
      )
    ),
    RdTu = switch(
      n - 2,
      # 3
      c("#8b0b00", "#ffeeed", "#00808b"),
      # 4
      c("#8b0b00", "#cf8270", "#8abec3", "#00808b"),
      # 5
      c("#8b0b00", "#cf8270", "#ffeeed", "#8abec3", "#00808b"),
      # 6
      c(
        "#8b0b00",
        "#ba5f4a",
        "#e1a698",
        "#abd3d7",
        "#68a9b0",
        "#00808b"
      ),
      # 7
      c(
        "#8b0b00",
        "#ba5f4a",
        "#e1a698",
        "#ffeeed",
        "#abd3d7",
        "#68a9b0",
        "#00808b"
      ),
      # 8
      c(
        "#8b0b00",
        "#af4e38",
        "#cf8270",
        "#e9b7ad",
        "#bcdde1",
        "#8abec3",
        "#569ea7",
        "#00808b"
      ),
      # 9
      c(
        "#8b0b00",
        "#af4e38",
        "#cf8270",
        "#e9b7ad",
        "#ffeeed",
        "#bcdde1",
        "#8abec3",
        "#569ea7",
        "#00808b"
      ),
      # 10
      c(
        "#8b0b00",
        "#a8432d",
        "#c36d59",
        "#da9788",
        "#eec2b9",
        "#c6e4e7",
        "#9ecacf",
        "#76b1b8",
        "#4b98a1",
        "#00808b"
      )
      # 11
      c(
        "#8b0b00",
        "#a8432d",
        "#c36d59",
        "#da9788",
        "#eec2b9",
        "#ffeeed",
        "#c6e4e7",
        "#9ecacf",
        "#76b1b8",
        "#4b98a1",
        "#00808b"
      )
    ),
    RdYl = switch(
      n - 2,
      # 3
      c("#8b0b00", "#c66b1e", "#ffbc42"),
      # 4
      c("#8b0b00", "#b35013", "#d9862a", "#ffbc42"),
      # 5
      c("#8b0b00", "#a9420e", "#c66b1e", "#e39330", "#ffbc42"),
      # 6
      c(
        "#8b0b00",
        "#a3390b",
        "#ba5b18",
        "#d27b25",
        "#e89b33",
        "#ffbc42"
      ),
      # 7
      c(
        "#8b0b00",
        "#9f3309",
        "#b35013",
        "#c66b1e",
        "#d9862a",
        "#eca136",
        "#ffbc42"
      ),
      # 8
      c(
        "#8b0b00",
        "#9c2e07",
        "#ad4810",
        "#be5f1a",
        "#ce7623",
        "#df8d2d",
        "#efa537",
        "#ffbc42"
      )
    ),
    TuGnYl = switch(
      n - 2,
      # 3
      c("#00808b", "#82a76b", "#ffbc42"),
      # 4
      c("#00808b", "#669a76", "#9fb35e", "#ffbc42"),
      # 5
      c("#00808b", "#57947c", "#82a76b", "#aeb957", "#ffbc42"),
      # 6
      c(
        "#00808b",
        "#4d907f",
        "#729f72",
        "#93af63",
        "#b8bc52",
        "#ffbc42"
      ),
      # 7
      c(
        "#00808b",
        "#458d81",
        "#669a76",
        "#82a76b",
        "#9fb35e",
        "#c0be4f",
        "#ffbc42"
      ),
      # 8
      c(
        "#00808b",
        "#408b82",
        "#5d9679",
        "#76a270",
        "#8ead65",
        "#a8b75a",
        "#c5bf4d",
        "#ffbc42"
      ),
      # 9
      c(
        "#00808b",
        "#3b8a84",
        "#57947c",
        "#6d9d73",
        "#82a76b",
        "#98b061",
        "#aeb957",
        "#c9c04b",
        "#ffbc42"
      ),
      # 10
      c(
        "#00808b",
        "#378984",
        "#51917d",
        "#669a76",
        "#79a36f",
        "#8cab66",
        "#9fb35e",
        "#b4bb54",
        "#cdc14a",
        "#ffbc42"
      ),
      # 11
      c(
        "#00808b",
        "#348885",
        "#4d907f",
        "#609878",
        "#729f72",
        "#82a76b",
        "#93af63",
        "#a5b65b",
        "#b8bc52",
        "#d0c149",
        "#ffbc42"
      )
    ),
    Turquoise = switch(
      n - 2,
      # 3
      c('#00808b', '#8abec3', '#edfeff'),
      # 4
      c('#00808b', '#68a9b0', '#abd3d7', '#edfeff'),
      # 5
      c('#00808b', '#569ea7', '#8abec3', '#bcdde1', '#edfeff'),
      # 6
      c(
        '#00808b',
        '#4b98a1',
        '#76b1b8',
        '#9ecacf',
        '#c6e4e7',
        '#edfeff'
      ),
      # 7
      c(
        '#00808b',
        '#43949d',
        '#68a9b0',
        '#8abec3',
        '#abd3d7',
        '#cce8eb',
        '#edfeff'
      ),
      # 8
      c(
        '#00808b',
        '#3d919b',
        '#5ea3ab',
        '#7cb5bb',
        '#99c7cc',
        '#b5d9dd',
        '#d1ebee',
        '#edfeff'
      ),
      # 9
      c(
        '#00808b',
        '#388f99',
        '#569ea7',
        '#71aeb5',
        '#8abec3',
        '#a3cdd2',
        '#bcdde1',
        '#d4eef0',
        '#edfeff'
      ),
      # 10
      c(
        '#00808b',
        '#348d97',
        '#509ba4',
        '#68a9b0',
        '#7fb7bd',
        '#95c5ca',
        '#abd3d7',
        '#c1e1e4',
        '#d7eff2',
        '#edfeff'
      ),
      # 11
      c(
        '#00808b',
        '#318c96',
        '#4b98a1',
        '#61a5ac',
        '#76b1b8',
        '#8abec3',
        '#9ecacf',
        '#b2d7db',
        '#c6e4e7',
        '#d9f1f3',
        '#edfeff'
      )
    ),
    BrightGreen = switch(
      n - 2,
      # 3
      c('#b6d438', '#dee99e', '#fdfefa'),
      # 4
      c('#b6d438', '#d1e27f', '#e9f0bc', '#fdfefa'),
      # 5
      c('#b6d438', '#cbde6f', '#dee99e', '#eef3cc', '#fdfefa'),
      # 6
      c(
        '#b6d438',
        '#c7dc65',
        '#d6e58b',
        '#e5edb0',
        '#f1f6d5',
        '#fdfefa'
      ),
      # 7
      c(
        '#b6d438',
        '#c4db5e',
        '#d1e27f',
        '#dee99e',
        '#e9f0bc',
        '#f3f7db',
        '#fdfefa'
      ),
      # 8
      c(
        '#b6d438',
        '#c2da59',
        '#cee075',
        '#d8e690',
        '#e3ecab',
        '#ecf2c5',
        '#f5f8e0',
        '#fdfefa'
      ),
      # 9
      c(
        '#b6d438',
        '#c1d955',
        '#cbde6f',
        '#d5e486',
        '#dee99e',
        '#e6eeb5',
        '#eef3cc',
        '#f6f9e3',
        '#fdfefa'
      ),
      # 10
      c(
        '#b6d438',
        '#c0d952',
        '#c9dd69',
        '#d1e27f',
        '#dae793',
        '#e2eba8',
        '#e9f0bc',
        '#f0f5d1',
        '#f7f9e5',
        '#fdfefa'
      ),
      # 11
      c(
        '#b6d438',
        '#bfd850',
        '#c7dc65',
        '#cfe078',
        '#d6e58b',
        '#dee99e',
        '#e5edb0',
        '#ebf1c3',
        '#f1f6d5',
        '#f7fae7',
        '#fdfefa'
      )
    ),
    Green = switch(
      n - 2,
      # 3
      c('#54921e', '#a6c687', '#f4fcee'),
      # 4
      c('#54921e', '#8cb566', '#c0d8a9', '#f4fcee'),
      # 5
      c('#54921e', '#7eac55', '#a6c687', '#cde1ba', '#f4fcee'),
      # 6
      c(
        '#54921e',
        '#76a74b',
        '#96bc73',
        '#b6d19b',
        '#d5e6c4',
        '#f4fcee'
      ),
      # 7
      c(
        '#54921e',
        '#71a344',
        '#8cb566',
        '#a6c687',
        '#c0d8a9',
        '#daeacb',
        '#f4fcee'
      ),
      # 8
      c(
        '#54921e',
        '#6da13f',
        '#84b05c',
        '#9bbf79',
        '#b1ce95',
        '#c7ddb2',
        '#deedd0',
        '#f4fcee'
      ),
      # 9
      c(
        '#54921e',
        '#6a9f3b',
        '#7eac55',
        '#92b96e',
        '#a6c687',
        '#bad4a0',
        '#cde1ba',
        '#e1eed4',
        '#f4fcee'
      ),
      # 10
      c(
        '#54921e',
        '#679e38',
        '#7aa94f',
        '#8cb566',
        '#9dc07c',
        '#afcc92',
        '#c0d8a9',
        '#d1e4bf',
        '#e3f0d7',
        '#f4fcee'
      ),
      # 11
      c(
        '#54921e',
        '#659c36',
        '#76a74b',
        '#86b15f',
        '#96bc73',
        '#a6c687',
        '#b6d19b',
        '#c5dcaf',
        '#d5e6c4',
        '#e4f1d9',
        '#f4fcee'
      )
    ),
    Monochrome = switch(
      n - 2,
      # 3
      c('#414042', '#999899', '#fbfbfb'),
      # 4
      c('#414042', '#7a797b', '#b8b8b9', '#fbfbfb'),
      # 5
      c('#414042', '#6b6a6c', '#999899', '#c9c8c9', '#fbfbfb'),
      # 6
      c(
        '#414042',
        '#626263',
        '#868587',
        '#acabac',
        '#d3d2d3',
        '#fbfbfb'
      ),
      # 7
      c(
        '#414042',
        '#5d5c5e',
        '#7a797b',
        '#999899',
        '#b8b8b9',
        '#d9d9d9',
        '#fbfbfb'
      ),
      # 8
      c(
        '#414042',
        '#59585a',
        '#727172',
        '#8b8b8c',
        '#a6a6a7',
        '#c2c1c2',
        '#dedede',
        '#fbfbfb'
      ),
      # 9
      c(
        '#414042',
        '#565557',
        '#6b6a6c',
        '#828182',
        '#999899',
        '#b0b0b1',
        '#c9c8c9',
        '#e2e1e2',
        '#fbfbfb'
      )
    ),
    Blue = switch(
      n - 2,
      # 3
      c('#648fd2', '#b4c4e8', '#fcfdfe'),
      # 4
      c('#648fd2', '#9bb2e1', '#ccd7f0', '#fcfdfe'),
      # 5
      c('#648fd2', '#8ea9dd', '#b4c4e8', '#d8e0f3', '#fcfdfe'),
      # 6
      c(
        '#648fd2',
        '#86a4db',
        '#a5b9e4',
        '#c3cfed',
        '#dfe6f5',
        '#fcfdfe'
      ),
      # 7
      c(
        '#648fd2',
        '#81a0da',
        '#9bb2e1',
        '#b4c4e8',
        '#ccd7f0',
        '#e4eaf7',
        '#fcfdfe'
      )
    ),
    BrYl = switch(
      n - 2,
      # 3
      c('#380100', '#965a24', '#ffbc42'),
      # 4
      c('#380100', '#753c1b', '#b87a2e', '#ffbc42'),
      # 5
      c('#380100', '#652d16', '#965a24', '#c98a33', '#ffbc42'),
      # 6
      c(
        '#380100',
        '#5c2513',
        '#82481f',
        '#aa6d2a',
        '#d49436',
        '#ffbc42'
      ),
      # 7
      c(
        '#380100',
        '#551f12',
        '#753c1b',
        '#965a24',
        '#b87a2e',
        '#db9a38',
        '#ffbc42'
      ),
      # 8
      c(
        '#380100',
        '#511b10',
        '#6c3418',
        '#884d20',
        '#a46729',
        '#c28331',
        '#e09f39',
        '#ffbc42'
      )
      # 9
      c(
        '#380100',
        '#4e170f',
        '#652d16',
        '#7d431d',
        '#965a24',
        '#af722c',
        '#c98a33',
        '#e4a33a',
        '#ffbc42'
      ),
      # 10
      c(
        '#380100',
        '#4b150d',
        '#602915',
        '#753c1b',
        '#8b5021',
        '#a16428',
        '#b87a2e',
        '#cf8f35',
        '#e7a53b',
        '#ffbc42'
      ),
      # 11
      c(
        '#380100',
        '#49130c',
        '#5c2513',
        '#6f3619',
        '#82481f',
        '#965a24',
        '#aa6d2a',
        '#bf8030',
        '#d49436',
        '#e9a83c',
        '#ffbc42'
      )
    ),
    Yellow = switch(
      n - 2,
      # 3
      c('#ffbc42', '#ffdda2', '#fffbf3'),
      # 4
      c('#ffbc42', '#ffd285', '#ffe7be', '#fffbf3'),
      # 5
      c('#ffbc42', '#ffcd76', '#ffdda2', '#ffeccb', '#fffbf3'),
      # 6
      c(
        '#ffbc42',
        '#ffca6c',
        '#ffd791',
        '#ffe3b3',
        '#ffefd3',
        '#fffbf3'
      ),
      # 7
      c(
        '#ffbc42',
        '#ffc766',
        '#ffd285',
        '#ffdda2',
        '#ffe7be',
        '#fff1d9',
        '#fffbf3'
      )
    )

  ))
}
