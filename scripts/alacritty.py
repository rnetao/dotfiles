from pathlib import Path

def main():
    alacritty_file = Path('../alacritty/alacritty.toml').resolve()
    alacritty_theme = Path('../subgit/alacritty-theme').resolve()
    config_dir = Path.home() / '.config' / 'alacritty'
    config_dir.mkdir(parents=True, exist_ok=True)
    config_theme = config_dir / 'alacritty-theme'
    config_file = config_dir / 'alacritty.toml'
    if config_theme.exists(): config_theme.unlink()
    config_theme.symlink_to(alacritty_theme)
    if config_file.exists(): config_file.unlink()
    config_file.symlink_to(alacritty_file)

if __name__ == "__main__":
    main()
