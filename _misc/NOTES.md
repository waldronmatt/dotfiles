# Miscellaneous Notes

## Legacy File Permissions

For enabling files to be written to without giving full control to web visitors:

```bash
find ./ -type d -exec chmod 755 {} +
```

```bash
find ./ type f -exec chmod 644 {} +
```

To enable writing to files:
- Creating: set write on the group for directory
- Updating: set write on the group for the file(s)

Set group owner to web

```bash
chgrp web [file/directory] OR [./]
```

Set write permission to group

```bash
chmod 664 [file/directory] OR [./]
```
