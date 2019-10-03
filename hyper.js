module.exports = {
  config: {
    backgroundColor: '#000',
    bell: 'SOUND',
    borderColor: '#333',
    copyOnSelect: true,
    css: `
      .tab_active {
        background-color: #303030;
      }
    `,
    cursorAccentColor: '#000',
    cursorBlink: true,
    cursorColor: 'rgba(248,28,229,0.8)',
    cursorShape: 'BLOCK',
    defaultSSHApp: true,
    env: {},
    fontSize: 18,
    fontWeight: 'normal',
    fontWeightBold: 'bold',
    foregroundColor: '#fff',
    padding: '12px 14px',
    scrollback: 10000,
    selectionColor: 'rgba(248,28,229,0.3)',
    shell: '',
    shellArgs: ['--login'],
    showHamburgerMenu: '',
    showWindowControls: '',
    termCSS: '',
    updateChannel: 'stable',
    fontFamily:
      'Monaco, Menlo, "DejaVu Sans Mono", Consolas, "Lucida Console", monospace',
    colors: {
      black: '#000000',
      red: '#C51E14',
      green: '#1DC121',
      yellow: '#C7C329',
      blue: '#0A2FC4',
      magenta: '#C839C5',
      cyan: '#20C5C6',
      white: '#C7C7C7',
      lightBlack: '#686868',
      lightRed: '#FD6F6B',
      lightGreen: '#67F86F',
      lightYellow: '#FFFA72',
      lightBlue: '#6A76FB',
      lightMagenta: '#FD7CFC',
      lightCyan: '#68FDFE',
      lightWhite: '#FFFFFF',
    },
  },

  plugins: ['hyper-search', 'hypercwd', 'hyperterm-tabs'],

  localPlugins: [],
  keymaps: {},
}
