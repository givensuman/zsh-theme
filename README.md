### a tidy lil zsh theme

_As seen on [Awesome](https://github.com/unixorn/awesome-zsh-plugins)!_ (formerly `appa-zsh-theme`)

It's based on the [refined](https://github.com/ohmyzsh/ohmyzsh/blob/master/themes/refined.zsh-theme) theme built into the Oh-My-Zsh framework. I can't find that theme's author, but they did most of the work. This theme is also, by the transitive property, based off of the [Pure](https://github.com/sindresorhus/pure) theme by Sindre Sorhus and the [nicoulaj](https://github.com/ohmyzsh/ohmyzsh/blob/master/themes/nicoulaj.zsh-theme) theme by Julien Nicoulaud. It's zsh themes all the way down, baby.

Adds version control, virtual environment, and command execution time information to your prompt. Requires a patched [Nerd Font](https://github.com/ryanoasis/nerd-fonts) for proper icon rendering.

![zsh-theme](https://github.com/user-attachments/assets/39861b58-ade3-4cb5-b556-c9af9c5c619d)

The screenshot above uses the [Hack Nerd Font](https://github.com/ryanoasis/nerd-fonts/tree/master/patched-fonts/Hack), and the [Catppuccin](https://github.com/catppuccin/alacritty) Alacritty theme. The [fast-syntax-highlighting](https://github.com/zdharma-continuum/fast-syntax-highlighting) plugin is also being featured.

### Installing

To install this, just source the theme file in your `~/.zshrc`

```shell
source /path/to/_givensuman.zsh-theme
```

or, use your favorite plugin manager:

#### Oh-My-Zsh

Run the following command

```shell
git clone https://github.com/givensuman/zsh-theme
cp zsh-theme/_givensuman.zsh-theme ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/themes
```

and add `ZSH_THEME="_givensuman"` to your `~/.zshrc`

#### zplug

Add the following to your `~/.zshrc`

```shell
zplug 'givensuman/zsh-theme', as:theme
```

#### zinit

Add the following to your `~/.zshrc`

```shell
zinit ice depth "1"
zinit light givensuman/zsh-theme
```

### Customizing

You can change the prompt icon and color by modifying `ZSH_THEME_PROMPT_COLOR` and `ZSH_THEME_PROMPT_ICON` environment variables, such as adding this to your `~/.zshrc`

```shell
export ZSH_THEME_PROMPT_COLOR="yellow"
export ZSH_THEME_PROMPT_ICON="$"
```

### License

You know the drill, do whatever you want with this.

