from pathlib import Path

def main():
    zellij = Path('../zellij').resolve()
    config_zellij_dir = Path.home() / '.config' / 'zellij'
    if config_zellij_dir.exists(): config_zellij_dir.unlink()
    config_zellij_dir.symlink_to(zellij)


if __name__ == "__main__":
    main()
