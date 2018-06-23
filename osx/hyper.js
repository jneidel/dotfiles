// Not activly being used

module.exports = {
  config: {
    updateChannel: 'stable',
    fontSize: 12,
    fontFamily: 'Roboto Mono for Powerline, Menlo',
    cursorColor: 'rgba(248,28,229,0.5)',
    cursorShape: 'BLOCK',
    cursorBlink: false,
    foregroundColor: '#eff0eb',
    backgroundColor: '#282a36',
    borderColor: '#333',

    // custom css to embed in the main window
    css: '',

    // custom css to embed in the terminal window
    termCSS: '',

    // set to `true` (without backticks) if you're using a Linux setup that doesn't show native menus
    // default: `false` on Linux, `true` on Windows (ignored on macOS)
    showHamburgerMenu: '',

    // set to `false` if you want to hide the minimize, maximize and close buttons
    // additionally, set to `'left'` if you want them on the left, like in Ubuntu
    // default: `true` on windows and Linux (ignored on macOS)
    showWindowControls: '',

    // custom padding (css format, i.e.: `top right bottom left`)
    padding: '12px 14px',

    // the full list. if you're going to provide the full color palette,
    // including the 6 x 6 color cubes and the grayscale map, just provide
    // an array here instead of a color map object
    colors: {
      black: '#000000',
      red: '#ff5c57',
      green: '#5af78e',
      yellow: '#f3f99d',
      blue: '#57c7ff',
      magenta: '#ff6ac1',
      cyan: '#444F5A',
      white: '#f1f1f0',
      lightBlack: '#686868',
      lightRed: '#ff5c57',
      lightGreen: '#5af78e',
      lightYellow: '#f3f99d',
      lightBlue: '#57c7ff',
      lightMagenta: '#ff6ac1',
      lightCyan: '#9aedfe',
      lightWhite: '#ff5c57'
    },
    bell: false,

    // if true, selected text will automatically be copied to the clipboard
    copyOnSelect: false,

    // if true, on right click selected text will be copied or pasted if no
    // selection is present (true by default on Windows)
    // quickEdit: true

    // for advanced config flags please refer to https://hyper.is/#cfg
    hypernpm: {
      1: "start",
      2: "test",
    }
  },

  // a list of plugins to fetch and install from npm
  // format: [@org/]project[#version]
  // examples:
  //   `hyperpower`
  //   `@company/project`
  //   `project#1.0.1`
  plugins: [
    //"an-old-hype",
    //"hyper-snazzy",
    "hyperterm-dibdabs",
    "hyperlinks",
    "hypernpm",
    "hyperterm-paste",
    "hyper-quit",
    "hyperfullscreen",
    "hyper-hide-title",
    //"hyper-final-say",
  ],

  // in development, you can create a directory under
  // `~/.hyper_plugins/local/` and include it here
  // to load it and avoid it being `npm install`ed
  localPlugins: [],

  keymaps: {
    // Example
    // 'window:devtools': 'cmd+alt+o',
  }
};
