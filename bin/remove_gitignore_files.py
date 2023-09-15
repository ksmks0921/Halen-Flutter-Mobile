import os


with open('.gitignore') as file:
    for line in file:
        if line.startswith('#') or line.startswith('!') or line.startswith('\n'):
            continue
        else:
            if line.startswith('**'):
                line = line.strip().lstrip('**/')
            else:
                line = line.strip()
            os.system(f"git rm --cached {line} -r")