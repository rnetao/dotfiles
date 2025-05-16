from pathlib import Path

def main():
    tmux_file = Path('../subgit/oh-my-tmux/.tmux.conf').resolve()
    tmux_local_file = Path('../tmux/.tmux.conf.local').resolve()
    # tmux_plugins = Path('../tmux/plugins').resolve()
    config_dir = Path.home() / '.config' / 'tmux'
    config_dir.mkdir(parents=True, exist_ok=True)
    config_file = config_dir / 'tmux.conf'
    config_local_file = config_dir / 'tmux.conf.local'
    # config_plugins = config_dir / 'plugins'
    if config_file.exists(): config_file.unlink()
    config_file.symlink_to(tmux_file)
    if config_local_file.exists(): config_local_file.unlink()
    config_local_file.symlink_to(tmux_local_file)
    # if config_plugins.exists(): config_plugins.unlink()
    # config_plugins.symlink_to(tmux_plugins)

if __name__ == "__main__":
    main()
